Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDZEF-0000vz-TO
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 13:11:03 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so2241062wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 03:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=BXCyyyocNmpedEFXosVqNsI/aNF5Q1xbWZTbqS8qhu4=;
	b=RDE8X7MYS+ZdMFtwBimn+mFvmWHjyW+tuAbfXQjT47m7+L7+Lury89CbTPaf4QsShJ
	pk5td5HsQwJeOWcuyXENeMRpxRNV0TnS5+zB0pGgjLtAiNi9KXH6YtFhzXf9UzE/HbhG
	4RTOQzDXjcWND72Hj17owmKiay3tklezH0oSMNSEecAZaPo1BYfgKpXLyfjn912MvFRh
	DP7Dk9OMRnI8BNLWKi4jjU9lUYdnJ1iUMMZzny1PMFiAd7H9xQXn9wobMhI/WwwtHQLj
	dApNUTXQwZtkhDLWnyZxR/MAEW0PV3FqVHrxa1EQOm6HOvOyCF2W9asH/Y3R0huafjV0
	Ufvw==
Received: by 10.216.214.85 with SMTP id b63mr1122325wep.201.1347879507468;
	Mon, 17 Sep 2012 03:58:27 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id cl8sm17277618wib.10.2012.09.17.03.58.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 03:58:26 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2012 12:58:09 +0200
Message-Id: <1347879491-2425-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
References: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmMrOY5KLoQZ4JbOfAlayahgSFDR5sInOLxDDlWF03P83TKY5VO1Zr4dXh75qqwNytSEURQ
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [for-denzil][systemd update 4/6] meta-systemd: systemd-systemctl-native: Also add support for WantedBy=*.service
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

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Right now there was only WantedBy=*.target, which prevented some services from beeing installed,
  which prevent them from running at boot.

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../systemd/systemd-systemctl-native.bb            |    2 +-
 .../systemd/systemd-systemctl-native/systemctl     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb b/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
index 25ddbda..5940584 100644
--- a/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Wrapper to enable of systemd services"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r5"
+PR = "r6"
 
 inherit native
 
diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
index 196e729..6b8832b 100755
--- a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
@@ -81,7 +81,7 @@ for service in $services; do
 	wanted_by=$(grep WantedBy $ROOT/$service_file \
 		        | sed 's,WantedBy=,,g' \
 		        | tr ',' '\n' \
-		        | grep '\.target$')
+		        | grep '\(\.target$\)\|\(\.service$\)')
 
 	for r in $wanted_by; do
 		echo "WantedBy=$r found in $service"
-- 
1.7.7.6



