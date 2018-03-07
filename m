Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9B7216FF80
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 16:12:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w27GCOfG027584
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 7 Mar 2018 08:12:24 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 7 Mar 2018 08:11:50 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 Mar 2018 11:12:18 -0500
Message-ID: <1520439138-15577-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] gnulib: use deltask instead of noexec
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
X-List-Received-Date: Wed, 07 Mar 2018 16:12:23 -0000
Content-Type: text/plain

When building an image which included 'netcf' I saw the following
warning which is followed by a python backtrace:

  WARNING: cube-dom0-0.6-r0 do_rootfs: \
  Manifest .../manifest-x86_64_x86_64-nativesdk-gnulib.package_write_rpm \
  not found in genericx86_64 core2-64 x86_64 allarch x86_64_x86_64-nativesdk \
  (variant '')?

From this we find that the 'gnulib' package would fail the manifest
crosscheck for the 'package_write_rpm' task. By switching from
'noexec' to 'deltask' for this task (and its "siblings") we completely
remove the task and thus there is not crosscheck to fail.

NOTE that there is a pending merge which will change the backtrace for
a proper ERROR: [package_manager.py: Print offending package instead
of non-sense trace]

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb b/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
index b505ac1..b72ffa9 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
@@ -29,8 +29,8 @@ do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 do_package[noexec] = "1"
 do_packagedata[noexec] = "1"
-do_package_write_ipk[noexec] = "1"
-do_package_write_deb[noexec] = "1"
-do_package_write_rpm[noexec] = "1"
+deltask package_write_ipk
+deltask package_write_deb
+deltask package_write_rpm
 
 BBCLASSEXTEND = "native"
-- 
2.7.4


