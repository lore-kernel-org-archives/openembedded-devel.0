Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8F3C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 08:13:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13773.1669104782063252647
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Nov 2022 00:13:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kJIpIT7e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=832539e990=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM81NCq022619
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 00:13:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=FhwqOiYk0XjNRt8C+0le5aDDejlHupD7B+LQXUv1ejI=;
 b=kJIpIT7exZtsMGMv+hQsYOreYmPA2C7aSamI5YnYASLS7b4EU1MTMYI4adtGHuKQ55PQ
 S6CP7B88fVGLnjqB15B86icXquYFOs2xTjLx3hmLh2tMRhripGgEBijkpoOJ+CJ9jU2K
 rAkMAV42dq9HzVh4M+ZLFWKJoNoQv6+f3S2p2esRqZN1YDFplB8Uz8rbzDvdc/ZpONw7
 5JCLYeCY4e9WBgZdUBOtrQztD99Yzj9D2AzNEitNN0z/mPZpHd2+YgTPXKzLHd6YsIdX
 E099DuL3ueXLZrWXlsqkXEw2H/npnE7683Q6YQEF9QhEKGCDPXAxcIM6lVJ1c1GL9STf Xw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxua6a834-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 00:13:01 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 22 Nov 2022 00:13:00 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 22 Nov 2022 00:13:00 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] linuxptp: fix do_compile error
Date: Tue, 22 Nov 2022 16:12:59 +0800
Message-ID: <20221122081259.2445243-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: QJpUYqLRwRMCz1WFp3zUJ7WxCo2MNiwf
X-Proofpoint-GUID: QJpUYqLRwRMCz1WFp3zUJ7WxCo2MNiwf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_04,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 clxscore=1011 impostorscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 08:13:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99682

From: Changqing Li <changqing.li@windriver.com>

with make 4.4, linuxptp do_compile will failed with error:
In file included from clock.c:35:
missing.h:61:9: error: redeclaration of enumerator 'HWTSTAMP_TX_ONESTEP_P2P'
   61 |         HWTSTAMP_TX_ONESTEP_P2P = 3,
      |         ^~~~~~~~~~~~~~~~~~~~~~~
In file included from clock.c:21:
/buildarea2/WRLCD_Regression/Rerun/build_dir/11201532-build_scp_world_Feature_Test/qemux86-64-standard-std-OE/build/tmp-glibc/work/core2-64-wrs-linux/linuxptp/3.1.1-r0/recipe-sysroot/usr/include/linux/net_tstamp.h:128:9: note: previous definition of 'HWTSTAMP_TX_ONESTEP_P2P' with type 'enum hwtstamp_tx_types'
  128 |         HWTSTAMP_TX_ONESTEP_P2P,
      |

Following change of make 4.4 changes behavior of shell function:
* WARNING: Backward-incompatibility!
  Previously makefile variables marked as export were not exported to commands
  started by the $(shell ...) function.  Now, all exported variables are
  exported to $(shell ...).

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ditional-assignment-for-KBUILD_OUTPU.patch | 42 +++++++++++++++++++
 .../linuxptp/linuxptp_3.1.1.bb                |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch
new file mode 100644
index 0000000000..fb51906521
--- /dev/null
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch
@@ -0,0 +1,42 @@
+From dfd38cb29c0768692f886d3ab9158bd2b3132582 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 22 Nov 2022 15:20:48 +0800
+Subject: [PATCH] makefile: use conditional assignment for KBUILD_OUTPUT
+
+Refer [1],from make 4.4, all variables that are marked as export will
+also be passed to the shell started by the shell function. use "=" will
+make KBUILD_OUTPUT always empty for shell function, use "?=" to make
+"export KBUILD_OUTPUT" in enrironment can work.
+
+[snip of 4.4 NEWS]
+* WARNING: Backward-incompatibility!
+   Previously makefile variables marked as export were not exported to commands
+   started by the $(shell ...) function.  Now, all exported variables are
+   exported to $(shell ...).
+[snip]
+
+[1] https://git.savannah.gnu.org/cgit/make.git/tree/NEWS?h=4.4&id=ed493f6c9116cc217b99c2cfa6a95f15803235a2#n74
+
+Upstream-Status: Submitted [linuxptp-devel@lists.sourceforge.net]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/makefile b/makefile
+index 529d8a0..3db60fa 100644
+--- a/makefile
++++ b/makefile
+@@ -15,7 +15,7 @@
+ # with this program; if not, write to the Free Software Foundation, Inc.,
+ # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+ 
+-KBUILD_OUTPUT =
++KBUILD_OUTPUT ?=
+ 
+ DEBUG	=
+ CC	?= $(CROSS_COMPILE)gcc
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
index bb4871e14f..5903cb38ca 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v3.1/linuxptp-${PV}.tg
            file://build-Allow-CC-and-prefix-to-be-overriden.patch \
            file://Use-cross-cpp-in-incdefs.patch \
            file://0001-include-string.h-for-strncpy.patch \
+           file://0001-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/linuxptp/files/"
-- 
2.25.1


