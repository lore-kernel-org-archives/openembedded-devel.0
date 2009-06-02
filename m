Received: from [209.85.219.220] (helo=mail-ew0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1MBTbM-00079L-VQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jun 2009 15:00:25 +0200
Received: by ewy20 with SMTP id 20so8736768ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jun 2009 05:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=N+WjB01B6eCBdDU207pjzgtIwJ1cdrkXZwLzZC0Cq5Q=;
	b=NK9Y2ZJ5kQTV04ucpSnUrqdV4J9rhLEvvRNbS7r02MX2i0iFsok5VzQI1hUFUnyCiz
	WQbegObm8f8WooyieZuWqtwqw0sKOh3iZS2RCEItgblWM14QypV0voNOYkFi7iXBxzfg
	wRizZtem7so9Qw9eY5nbqTiFbzABlUJYDlHqQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=BXcPn6asE+Im5oNr2aUbksUcFWBsbWkKqzhk3J6wEIPWsdo6GVYEwYu1G9jbRUISRl
	joXJYfWnB7aSDTqBd4EWHAWbtk8xJLJ+LzqxL4gaTANPmu2o0xC0yvH2FemW0B/eRpn3
	b3ZQ5C5PvKTalcb4tBBJ+r6KLjorV8u57Xqd8=
Received: by 10.216.49.211 with SMTP id x61mr2179401web.222.1243947087764;
	Tue, 02 Jun 2009 05:51:27 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id p10sm15836496gvf.4.2009.06.02.05.51.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 02 Jun 2009 05:51:27 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Jun 2009 14:51:24 +0200
Message-Id: <1243947084-813-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] Angstrom 2009.X: set version to 'stable'
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
X-List-Received-Date: Tue, 02 Jun 2009 13:00:25 -0000

From: Koen Kooi <koen@openembedded.org>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 conf/distro/angstrom-2008.1.conf     |    2 +-
 recipes/angstrom/angstrom-version.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index 5c7d0c4..203e01d 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -16,7 +16,7 @@
 # org.openembedded.angstrom-2007.12-stable branch
 
 #DISTRO_VERSION = "2009.X"
-DISTRO_VERSION = "2009.X-test-${DATE}"
+DISTRO_VERSION = "2009.X-stable"
 DISTRO_REVISION = "1"
 DISTRO_PR = ".1"
 
diff --git a/recipes/angstrom/angstrom-version.bb b/recipes/angstrom/angstrom-version.bb
index 6f1043c..4902ae7 100644
--- a/recipes/angstrom/angstrom-version.bb
+++ b/recipes/angstrom/angstrom-version.bb
@@ -2,7 +2,7 @@ LICENSE = "MIT"
 
 PV = "${DISTRO_VERSION}"
 PR = "r2"
-PE = "1"
+PE = "2"
 
 PACKAGES = "${PN}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.6.1



