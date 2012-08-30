Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T710m-00056H-J3
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2012 11:26:04 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so696521bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2012 02:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=dhHulxekPnC5/eBF0K1KszTwo8W0v2RPeLucwuKIw3o=;
	b=m5GUsxDkZk1DRJjhbdLA2UeQBPCsd5fdm1X5sB8elxaE7rcJiy1AFy+udJ1iP9qx4Z
	+aSC79yP3nh8kGUZv+cR0K+mZvaCa7eSXaS4RuIXe2WttkwAr/AL4M5US5LFbrJWs9yJ
	zR10ZneMeoT90MRJOgSIMIHHt1NqziQI6jWPsy6JbL7M2v0SFYHh9zKf78ui1VgyezLz
	hnJqKGXNIQvYuv9qxLVqw9ytm1tMCGc5l3+RPm3zuQ0G6H8ZeHbMyoxcvfdZ/AabW6NM
	5njZE5mVssWPx4YJgQkaVG4S0Z9lmJS5QSIqXFcO8Mey7m5Dnnf6lA6NlV1RkAZjem+Z
	42zw==
Received: by 10.204.157.10 with SMTP id z10mr2399319bkw.63.1346318031594;
	Thu, 30 Aug 2012 02:13:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j9sm632717bkv.0.2012.08.30.02.13.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 02:13:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Aug 2012 11:13:33 +0200
Message-Id: <f0bb19138107f35c3c8bbc30ea01003bc028ff7e.1346317656.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346317656.git.Martin.Jansa@gmail.com>
References: <]>
 <cover.1346317656.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346317656.git.Martin.Jansa@gmail.com>
References: <cover.1346317656.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/5] meta-systemd: systemd-systemctl-native: Also add support for WantedBy=*.service
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
X-List-Received-Date: Thu, 30 Aug 2012 09:26:04 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Right now there was only WantedBy=*.target, which prevented some services from beeing installed,
  which prevent them from running at boot.

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb        | 2 +-
 meta-systemd/recipes-core/systemd/systemd-systemctl-native/systemctl | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb b/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb
index 25ddbda..5940584 100644
--- a/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Wrapper to enable of systemd services"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r5"
+PR = "r6"
 
 inherit native
 
diff --git a/meta-systemd/recipes-core/systemd/systemd-systemctl-native/systemctl b/meta-systemd/recipes-core/systemd/systemd-systemctl-native/systemctl
index 5c21e7f..d71c7ed 100755
--- a/meta-systemd/recipes-core/systemd/systemd-systemctl-native/systemctl
+++ b/meta-systemd/recipes-core/systemd/systemd-systemctl-native/systemctl
@@ -81,7 +81,7 @@ for service in $services; do
 	wanted_by=$(grep WantedBy $ROOT/$service_file \
 		        | sed 's,WantedBy=,,g' \
 		        | tr ',' '\n' \
-		        | grep '\.target$')
+		        | grep '\(\.target$\)\|\(\.service$\)')
 
 	for r in $wanted_by; do
 		echo "WantedBy=$r found in $service"
-- 
1.7.12



