Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo01.lge.com (lgeamrelo01.lge.com [156.147.1.125])
	by mail.openembedded.org (Postfix) with ESMTP id 0117B714D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Sep 2014 04:45:58 +0000 (UTC)
Received: from unknown (HELO CHBae0915) (10.177.232.191)
	by 156.147.1.125 with ESMTP; 18 Sep 2014 13:45:58 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: "Changhyeok Bae" <changhyeok.bae@lge.com>
To: <openembedded-devel@lists.openembedded.org>
References: <1410923622-13103-1-git-send-email-b40869@freescale.com>
In-Reply-To: <1410923622-13103-1-git-send-email-b40869@freescale.com>
Date: Thu, 18 Sep 2014 13:46:17 +0900
Message-ID: <004e01cfd2fb$7bbc8390$73358ab0$@lge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQM8H7JJ9VOVfuKX1SYAA/3CNDeorpktt4vw
Subject: Re: [meta-networking][PATCH] pimd: add recipe for ssmping-0.9.1
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
X-List-Received-Date: Thu, 18 Sep 2014 04:46:06 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: ko

there is no install stage

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
YangHaibo
Sent: Wednesday, September 17, 2014 12:14 PM
To: openembedded-devel@lists.openembedded.org
Cc: YangHaibo
Subject: [oe] [meta-networking][PATCH] pimd: add recipe for ssmping-0.9.1

Signed-off-by: YangHaibo <b40869@freescale.com>
---
 meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb

diff --git a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
new file mode 100644
index 0000000..ec56024
--- /dev/null
+++ b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "ssmping is a tool for checking whether one can receive SSM from
a given host"
+HOMEPAGE = "http://www.venaas.no/multicast/ssmping/"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM =
"file://asmping.c;beginline=2;endline=11;md5=1ca8d1a1ca931e5cfe604ebf20a78b7
1"
+
+SRC_URI = "http://www.venaas.no/multicast/ssmping/${BP}.tar.gz"
+SRC_URI[md5sum] = "ad8e3d13f6d72918f73be7e7975d7fad"
+SRC_URI[sha256sum] =
"22103a37eaa28489169a0927bc01e0596c3485fc4d29fc8456c07fd2c70fca6d"
+
+CFLAGS_prepend = "-D_GNU_SOURCE "
-- 
1.9.2

-- 
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


