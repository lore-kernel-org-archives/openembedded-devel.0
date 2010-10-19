Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P87eH-0001Ww-T9
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 10:34:23 +0200
Received: by mail-fx0-f47.google.com with SMTP id 6so1460528fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 01:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=RJy9VRWJ0goiFT03Svny09JfxgsOlYBBPiNvxHRF0eU=;
	b=rSm7Zzd3bt9xLRDsXYOnBIrH3/BpcJqzchOkrb37+2jAtWEhu4xl8/0wxhpyMmW2UK
	6spm1ZdlOIgyygm/0f0uVy7XOow9WlkMddV+CihY5OQekbsED/jWIIQP6P4BgFFAgp+H
	Q65k2KKBZ7UxSntsDoOdP3jf9gTVBSGgzfQzM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=SQls7oH9eVysTCJwpQezve2FxgBZ3DJkwdziYA1mF/JWGSZgP/8d48vwHrz50KG3ro
	Q8i5DpeqgQgVHDdIkv21+ptUO6SK07yCeIpOlcFzIGzG0B/SmLV4v+HuX9KwJLcKqvbG
	h1jUF7byUCpj/uwDIrG6081VQV7AkFdtwuEbc=
Received: by 10.103.239.3 with SMTP id q3mr2426619mur.88.1287477229951;
	Tue, 19 Oct 2010 01:33:49 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id d17sm3406137fav.29.2010.10.19.01.33.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Oct 2010 01:33:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 10:33:18 +0200
Message-Id: <1287477207-27752-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
References: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 04/13] angstrom/build-feeds: remove openmoko targets
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
X-List-Received-Date: Tue, 19 Oct 2010 08:34:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 contrib/angstrom/build-feeds.sh |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/contrib/angstrom/build-feeds.sh b/contrib/angstrom/build-feeds.sh
index e28d810..89df1ed 100755
--- a/contrib/angstrom/build-feeds.sh
+++ b/contrib/angstrom/build-feeds.sh
@@ -269,7 +269,6 @@ do
                       openbox \
                       opencv \
                       opencv-samples \
-                      openmoko-browser2 \
                       openredalert \
                       openvpn \
                       opie-notes \
@@ -337,8 +336,6 @@ do
                       systray \
                       task-beagleboard-demo \
                       task-gpe-pim \
-                      task-openmoko-feed \
-                      task-openmoko-games \
                       task-opie-apps \
                       task-opie-games \
                       task-proper-tools \
@@ -439,7 +436,6 @@ do
             BUILD_CLEAN="qmake-native qmake2-native qt-x11-free python python-native python-pygtk gnome-icon-theme"
         BUILD_TARGETS="task-base task-boot \
                        task-opie task-opie-all \
-                       task-openmoko-base task-openmoko-debug task-openmoko-examples task-openmoko-linux task-openmoko-native-sdk task-openmoko-net task-openmoko-phone task-openmoko-pim task-openmoko-ui \
                        angstrom-x11-base-depends angstrom-gpe-task-settings \
                        xserver-xorg-conf \ 
                        "
-- 
1.7.3.1



