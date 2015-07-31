Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id C81FA76579
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 14:23:03 +0000 (UTC)
Received: by ykdu72 with SMTP id u72so60253291ykd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 07:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=e7uOimFhYJC0eyfNeu5fYHG5zmVcBHk2QKeJl5zA1v4=;
	b=hnf2QxVg1BDIUCReeNZwLYtttNEfZ6BiilnZu4kdJMAw8S/fILcrennZHltRalPVfQ
	Nl3Ngl0dVsERI/GiDtkJrRS2EUAIJVu7ltUouCVprt/YLFcVHFtWfxnCXDAogQRObvsK
	1qOdWLzmYqb5GBGge8u7/Y7R4KnYi26DXY2O7aqjJMo3Qpo0s+gfGZTIqiKR2eUBz+2N
	mFNkps0fz4XpgNHjssMNttlDZoo8qr+QMCTA6d0MXGazYEgmUx8qewgiLhjyQJFRgtSH
	e3RZMnbE6tCh46F5e4TmFflVX1W3i4No0RI4H4sq/LXWpILI1gCxsayeoARnqJQmOTNB
	MMDg==
X-Received: by 10.170.47.197 with SMTP id 188mr3498333ykp.62.1438352583699;
	Fri, 31 Jul 2015 07:23:03 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id i6sm4151060ywd.47.2015.07.31.07.23.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jul 2015 07:23:02 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Jul 2015 07:22:08 -0700
Message-Id: <1438352528-4758-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [=meta-oe][meta-perl][PATCH] libmodule-pluggable-perl: Update to 5.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jul 2015 14:23:03 -0000

* Convert from Module::Build to ExtUtils::MakeMaker
* Temporarily use github repository until change is merged upstream

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 ...dule-pluggable-perl_5.1.bb => libmodule-pluggable-perl_5.2.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-perl/recipes-perl/libmodule/{libmodule-pluggable-perl_5.1.bb => libmodule-pluggable-perl_5.2.bb} (82%)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.1.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
similarity index 82%
rename from meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.1.bb
rename to meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
index b916918..76cac50 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.1.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
@@ -17,13 +17,13 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=322;endline=325;md5=086450ce010f6fda25db0b38fcc41086"
 
 SRCNAME = "Module-Pluggable"
-SRC_URI = "${CPAN_MIRROR}/authors/id/S/SI/SIMONW/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "1b71ed7a67ad8c048d1499540bc892ba"
-SRC_URI[sha256sum] = "e2dc354043bb16f1f3df8c4bb26070b26e594819f218cf8b8ac19e79c720916f"
+SRC_URI = "https://github.com/moto-timo/${SRCNAME}/archive/${PV}.tar.gz"
+SRC_URI[md5sum] = "e32475d6ff5843f738cedacd3b7a2cdb"
+SRC_URI[sha256sum] = "58c62292eea6d06959eba1b97598650813211265403242d57efb2f605c96059f"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit cpan_build
+inherit cpan
 
 RDEPENDS_${PN} = " perl-module-base \
 		   perl-module-deprecate \
-- 
2.1.0


