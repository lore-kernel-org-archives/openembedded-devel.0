Received: from [72.14.220.155] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1MmUnt-0006Db-HC
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Sep 2009 17:46:24 +0200
Received: by fg-out-1718.google.com with SMTP id d23so544568fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Sep 2009 08:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=DzyoX/LCEng8TV6P1rbaG0ZpVexhx2t2dO5X0kgjccI=;
	b=M9qhquBakK5FyHfIkmC+w3OK5StIfn3A0j9mvGNddsXF1lZ+NikUDOZkz/t2iKPRBG
	d8ANmVZBM/s6k+M5wOmEr4gBCi+4pZ6PZtLA/yN0p0b44dG6wZLDLbrX0g4fkBMxfg5R
	nc/SvEk1OEZjK4nwuJl5YMSSKQmN9x/4V0ogg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=XPC5zOdMJ7H9js0qW7ro0dWslMkgxRAVHlh1cOzDIJia2HlYh6MZTcQ0Z30+17iDuM
	ObOMQvGtTaTpboofaDvsyQrQufuIGhgMZZO5IU3+9Vo7JayHSndwU6Ut13VJv1uS9HUV
	TdBtYeI6sp2y/MJ+gkB60aZLTTCz+7ipgixOU=
Received: by 10.86.251.6 with SMTP id y6mr3286413fgh.24.1252770353333;
	Sat, 12 Sep 2009 08:45:53 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id d4sm1698937fga.5.2009.09.12.08.45.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 12 Sep 2009 08:45:51 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Sep 2009 17:45:47 +0200
Message-Id: <1252770347-2632-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <koen@openembedded.org>, Steve Sakoman <steve@sakoman.com>
Subject: [STABLE][PATCH] ebtables: fix GNU_HASH error
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
X-List-Received-Date: Sat, 12 Sep 2009 15:46:24 -0000

From: Steve Sakoman <steve@sakoman.com>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/ebtables/ebtables_2.0.6.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/ebtables/ebtables_2.0.6.bb b/recipes/ebtables/ebtables_2.0.6.bb
index 33ad2b9..c4fc1c3 100644
--- a/recipes/ebtables/ebtables_2.0.6.bb
+++ b/recipes/ebtables/ebtables_2.0.6.bb
@@ -4,6 +4,8 @@ LICENSE = "GPL"
 SECTION = "console/network"
 PR = "r2"
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
            file://gcc34.patch;patch=1 \
            file://gcc4.patch;patch=1 \
-- 
1.6.1



