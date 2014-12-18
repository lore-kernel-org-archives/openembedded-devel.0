Return-Path: <bill.pittman@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id C388F72858
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 16:21:09 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBIGLAdZ032424 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 10:21:10 -0600
Received: from sarcasm.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014121810211005-1273021 ;
	Thu, 18 Dec 2014 10:21:10 -0600 
From: Bill Pittman <bill.pittman@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Dec 2014 10:21:00 -0600
Message-Id: <1418919660-22187-1-git-send-email-bill.pittman@ni.com>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/18/2014 10:21:10 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/18/2014 10:21:10 AM,
	Serialize complete at 12/18/2014 10:21:10 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2014-12-18_06:2014-12-18, 2014-12-18,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH] packagekit: Change recipe to use native mkdir
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
X-List-Received-Date: Thu, 18 Dec 2014 16:21:21 -0000

For redhat type systems, the recipe tries to use a version of mkdir from
sysroots, however mkdir does not exist and the build fails.  Ubuntu systems
work because the sed command in the recipe specifically replaces the
/usr/bin/mkdir path and ubuntu systems use /bin/mkdir.

Signed-off-by: Bill Pittman <bill.pittman@ni.com>
---
 meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
index 96cc468..59b0a43 100644
--- a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
+++ b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
@@ -41,7 +41,6 @@ EXTRA_OECONF = "--with-security-framework=dummy \
 do_configure_append() {
     for i in $(find . -name Makefile) ; do
         sed -i -e s:${STAGING_DIR_NATIVE}::g \
-               -e s:${bindir}/mkdir:${STAGING_BINDIR_NATIVE}/mkdir:g \
                -e s:/usr/bin/intltool-merge:${STAGING_BINDIR_NATIVE}/intltool-merge:g \
                $i
     done
-- 
1.9.1


