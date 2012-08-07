Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Systf-0004pi-9M
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2012 01:09:07 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so2909481wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 15:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ZbKjp0opnoMBXKP8V7usN01OMh0VeU6h8mfHNfqMrwA=;
	b=MI28pqz4Buxrodqd6l8PVJqv4uH/upRYmJReZfLGrT5ENYyJRppoDgH9mp8GNEerVO
	i7gNGIkgnyL9NNQT1VG61FUEgbDdTCABUZ7VpzSlog+rEp5s4xPtUViGwJMociI5xwEt
	Gs9rpGdydqHV4Nxt9rfgLJHxWyq6h2pyQE0vuyXKv5g60gvLeTB1cmPJKjdqZpanGAzO
	GN6HpS8J3f+YEATgSlw3PkgzIRryiVT2YlPg0JgnbIFOrUjTHANM9yG0PUbNz0IZ+YQI
	lSGuYCb9S5d1frjYzqElxE6iMDzpt0mM02i9/qW6HMz/DH1QpGo0QdCdqxfojtQjva2w
	9uRw==
Received: by 10.216.153.139 with SMTP id f11mr8533986wek.16.1344380243184;
	Tue, 07 Aug 2012 15:57:23 -0700 (PDT)
Received: from localhost.localdomain (p5B0A309E.dip.t-dialin.net.
	[91.10.48.158])
	by mx.google.com with ESMTPS id l6sm1882009wiz.4.2012.08.07.15.57.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 15:57:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Aug 2012 01:04:24 +0200
Message-Id: <1344380665-3759-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344380665-3759-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344380665-3759-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-systemd 1/2] systemd-systemctl-native: handle ALIAS tag
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2012 23:09:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../systemd/systemd-systemctl-native.bb            |    2 +-
 .../systemd/systemd-systemctl-native/systemctl     |   17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb b/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb
index 5f23e98..25ddbda 100644
--- a/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Wrapper to enable of systemd services"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r4"
+PR = "r5"
 
 inherit native
 
diff --git a/meta-systemd/recipes-core/systemd/systemd-systemctl-native/systemctl b/meta-systemd/recipes-core/systemd/systemd-systemctl-native/systemctl
index a5bd770..5c21e7f 100755
--- a/meta-systemd/recipes-core/systemd/systemd-systemctl-native/systemctl
+++ b/meta-systemd/recipes-core/systemd/systemd-systemctl-native/systemctl
@@ -96,6 +96,23 @@ for service in $services; do
 		fi
 	done
 
+	# create the required symbolic 'Alias' links
+	alias=$(grep Alias $ROOT/$service_file \
+		        | sed 's,Alias=,,g' \
+		        | tr ',' '\n' \
+		        | grep '\.service$')
+
+	for r in $alias; do
+		if [ "$action" = "enable" ]; then
+			mkdir -p $ROOT/etc/systemd/system
+			ln -s $service_file $ROOT/etc/systemd/system/$r
+			echo "Enabled $service for $alias."
+		else
+			rm -f $ROOT/etc/systemd/system/$r
+			echo "Disabled $service for $alias."
+		fi
+	done
+
 	# call us for the other required scripts
 	also=$(grep Also $ROOT/$service_file \
 		   | sed 's,Also=,,g' \
-- 
1.7.4.4



