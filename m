Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDZEG-0000wU-IC
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 13:11:04 +0200
Received: by weyr6 with SMTP id r6so3890703wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 03:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=033TNCZiZ2hVi9EV+/tWVsiNDgD3N2QQ2mNUmQ6i3kQ=;
	b=mmOilfa9J883sxIzDd7/KgAb+D3IxWj8pBK1tGRHVYVUOT6u/E+oUwix04W6cs7Isb
	QrK7xxbjfpBdb/8Mz9L8vIBh7FifY7+9xAxpgW8sjr/aHTlLT/HeGgw//qFIiGnXRYJC
	Ay9gN17osIjjz9blp4rpG2vaYmr8imJZAicW7G1tZEYu2uEgIJYXh/m63RwibougqDnh
	4HZ7ZgP4pxKfE7mmE5GHx3qwhR/Y3NhiPyiZmianvIPTjCxaM6e/6rfyo9eQ0QALZMlp
	0dZRI5MqDFHwm6RVg4S1X3Zwc3cl+9Q5xUMD+LNkM1l61gCsPRfQllI3ceDhUf2oifQP
	sVNw==
Received: by 10.216.242.196 with SMTP id i46mr5593257wer.123.1347879505978;
	Mon, 17 Sep 2012 03:58:25 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id cl8sm17277618wib.10.2012.09.17.03.58.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 03:58:25 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2012 12:58:08 +0200
Message-Id: <1347879491-2425-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
References: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQlSx/PKhNZEHaoo0Z3D+H6ZYB+Fg+Hu22Rl+aJRCq3YL4trKrNRybiAjO9DO2moUlRHZVqn
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [for-denzil][systemd update 3/6] systemd-systemctl-native: handle ALIAS tag
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
X-List-Received-Date: Mon, 17 Sep 2012 11:11:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../systemd/systemd-systemctl-native.bb            |    2 +-
 .../systemd/systemd-systemctl-native/systemctl     |   17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb b/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
index 5f23e98..25ddbda 100644
--- a/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Wrapper to enable of systemd services"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r4"
+PR = "r5"
 
 inherit native
 
diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
index f74adf6..196e729 100755
--- a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
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
1.7.7.6



