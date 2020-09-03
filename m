Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.14621.1599141529673268653
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2020 06:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 083Dwl5x001424
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Sep 2020 06:58:48 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Thu, 3 Sep 2020
 06:58:25 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH 1/1] luajit: advance SRCREV to fix two CVE's
Date: Thu, 3 Sep 2020 06:58:25 -0700
Message-ID: <20200903135825.71432-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Fix CVE-2020-15890 and CVE-2020-24372.

Also change PV format because the reference to 2.1.0-beta3
was already far behind the SRCREV.  Now, base PV on the branch
name and date of SRCREV commit.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-devtools/luajit/luajit_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index cc9039416..820722195 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -3,13 +3,15 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d739bb9250a55c124a545b588fd76771"
 HOMEPAGE = "http://luajit.org"
 
-PV = "2.1.0~beta3"
-SRCREV = "0ad60ccbc3768fa8e3e726858adf261950edbc22"
 SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
            file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
            file://clang.patch \
            "
 
+# Set PV to the branch and date associated with SRCREV.
+PV = "v2.1-200809"
+SRCREV = "94d4abcca966df2cc423e821bcacd04898f73117"
+
 S = "${WORKDIR}/git"
 
 inherit pkgconfig binconfig siteinfo
-- 
2.17.1

