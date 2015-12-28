Return-Path: <jose.alarcon@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
	[67.231.149.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1C2E26AC3C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2015 10:18:59 +0000 (UTC)
Received: from pps.filterd (m0047962.ppops.net [127.0.0.1])
	by m0047962.ppops.net-00176a03. (8.15.0.59/8.15.0.59) with SMTP id
	tBS97S6r045643 for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2015 04:07:42 -0500
Received: from cinmlip10.e2k.ad.ge.com ([12.71.149.1])
	by m0047962.ppops.net-00176a03. with ESMTP id 2031xag0f4-16
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2015 04:07:42 -0500
Received: from alpmlip01.e2k.ad.ge.com ([3.159.17.48])
	by cinmlip10.e2k.ad.ge.com with ESMTP/TLS/RC4-SHA;
	28 Dec 2015 04:07:34 -0500
Received: from unknown (HELO clipsmtp.clients.em.health.ge.com) ([3.187.7.87])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 28 Dec 2015 04:07:32 -0500
Received: from ubuntu.localdomain (unknown [3.187.18.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by clipsmtp.clients.em.health.ge.com (Postfix) with ESMTPSA id
	3801510B2542; Mon, 28 Dec 2015 11:02:52 +0200 (EET)
From: Jose Alarcon <jose.alarcon@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Dec 2015 11:07:12 +0200
Message-Id: <94958f0e637e5e5625b8cf178ee1cf64d6c008af.1450702572.git.jose.alarcon@ge.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450702572.git.jose.alarcon@ge.com>
References: <cover.1450702572.git.jose.alarcon@ge.com>
In-Reply-To: <cover.1450702572.git.jose.alarcon@ge.com>
References: <cover.1450702572.git.jose.alarcon@ge.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-12-28_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1507310008
	definitions=main-1512280175
Subject: [contrib][PATCH 2/3] contrib: add missing common OE variables
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
X-List-Received-Date: Mon, 28 Dec 2015 10:19:02 -0000

Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
---
 contrib/oe-stylize.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index a2fcde1..7bb310d 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -121,6 +121,7 @@ OE_vars = [
     'CONFFILES',
     'CONFLICTS',
     'CORE_EXTRA_D',
+    'CORE_IMAGE_EXTRA_INSTALL',
     'CORE_PACKAGES_D',
     'CORE_PACKAGES_RD',
     'CPPFLAGS',
@@ -141,6 +142,7 @@ OE_vars = [
     'INITSCRIPT_PACKAGES',
     'INITSCRIPT_NAME',
     'INITSCRIPT_PARAMS',
+    'INSANE_SKIP',
     'PACKAGE_INSTALL',
     'KERNEL_IMAGETYPE',
     'KERNEL_IMAGEDEST',
@@ -199,6 +201,8 @@ OE_vars = [
     'UBOOT_MACHINE',
     'UCLIBC_BASE',
     'UCLIBC_PATCHES',
+    'USERADD_PACKAGES',
+    'USERADD_PARAM',
     'VIRTUAL_NAME',
     'XORG_PN',
     'XSERVER',
-- 
2.5.0


