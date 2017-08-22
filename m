Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7E11E71AD1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 08:13:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7M8DwvU001535
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 01:13:58 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 22 Aug 2017 01:13:57 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Aug 2017 16:13:17 +0800
Message-ID: <20170822081317.27712-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-perl][PATCH] adduser: use get_perl_version instead of PERLVERSION
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Aug 2017 08:13:57 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Immediate expansion for PERLVERSION(in perl-version.bbclass)
is too early, it will result in 'None' before perl is built,
then the module file is installed incorrectly:

$ rpm -ql adduser|grep Common
/usr/lib/perl/None/Debian/AdduserCommon.pm

So use get_perl_version directly instead of PERLVERSION.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-perl/recipes-perl/adduser/adduser_3.115.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/adduser/adduser_3.115.bb b/meta-perl/recipes-perl/adduser/adduser_3.115.bb
index 81068d600..c21186231 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.115.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.115.bb
@@ -22,8 +22,7 @@ do_install() {
     install -m 0755 ${S}/adduser ${D}${sbindir}
     install -m 0755 ${S}/deluser ${D}${sbindir}
 
-    install -d ${D}${libdir}/perl/${PERLVERSION}/Debian
-    install -m 0644 ${S}/AdduserCommon.pm ${D}${libdir}/perl/${PERLVERSION}/Debian
+    install -D -m 0644 ${S}/AdduserCommon.pm ${D}${libdir}/perl/${@get_perl_version(d)}/Debian/AdduserCommon.pm
     sed -i -e "s/VERSION/${PV}/" ${D}${sbindir}/*
 
     install -d ${D}/${sysconfdir}
-- 
2.11.0


