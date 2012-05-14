Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1STvnA-0001kB-WC
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 15:58:29 +0200
Received: by vbbfr13 with SMTP id fr13so5262674vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 06:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=cpTVEyDq9mKhdOAUvKYSJQw6hQNOMdERISwoKYcQvKA=;
	b=SByzXQywpNuS8WWB1wgcJZ+s2wrjCODg8n0vTsBmmkoaFKV8MGLtU7WEDg540nM8+R
	iyfbWE1f0uIzLT/9Z+Da99r6MxskSXNdN9867sTzgE0yJM+M4bMz2uEXMEn+D9S8pSio
	eWcOy2jj1XMg3OAU1EYr8zldVBfV9MAfjJqg/sWeHX0fPxQ6n9VJr6IooZ3jSeg5Up6L
	Uche0HnhNSslYY1HullpBonpBFygYGwQoljxPS4FNUx/J8SCRabZiPgttM9HX4q5PtZx
	FTuCAgGHr9KEfs8IRuAGS6jQg7nTaNnk6LAymEMzkTXARGPQTxzumNyKZvMPjMtREKF+
	XVdQ==
Received: by 10.52.89.226 with SMTP id br2mr1081447vdb.83.1337003309759;
	Mon, 14 May 2012 06:48:29 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id dc7sm21867612vdc.6.2012.05.14.06.48.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 May 2012 06:48:28 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 May 2012 10:48:23 -0300
Message-Id: <2992b9e4d0ad49610137a76273ad1ea44cfb5e86.1337003295.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1337003295.git.otavio@ossystems.com.br>
References: <cover.1337003295.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 1/1] systemd-systemctl-native: fixed systemctl wrapper's `disable' action
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
X-List-Received-Date: Mon, 14 May 2012 13:58:30 -0000

From: Mario Domenech Goulart <mario@ossystems.com.br>

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 .../systemd/systemd-systemctl-native/systemctl     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
index c4a0a3f..6e7a05d 100755
--- a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
@@ -68,8 +68,8 @@ for service in $services; do
 			ln -s $service_file $ROOT/etc/systemd/system/$r.wants
 			echo "Enabled $service for $wanted_by."
 		else
-			rm -f $ROOT/etc/systemd/system/$r.wants/$service_file
-			rmdirs -p $ROOT/etc/systemd/system/$r.wants
+			rm -f $ROOT/etc/systemd/system/$r.wants/$service
+			rmdir --ignore-fail-on-non-empty -p $ROOT/etc/systemd/system/$r.wants
 			echo "Disabled $service for $wanted_by."
 		fi
 	done
-- 
1.7.2.5



