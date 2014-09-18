Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo02.lge.com (lgeamrelo02.lge.com [156.147.1.126])
	by mail.openembedded.org (Postfix) with ESMTP id C37EA60CFC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Sep 2014 04:45:33 +0000 (UTC)
Received: from unknown (HELO CHBae0915) (10.177.232.191)
	by 156.147.1.126 with ESMTP; 18 Sep 2014 13:45:19 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: "Changhyeok Bae" <changhyeok.bae@lge.com>
To: <openembedded-devel@lists.openembedded.org>
References: <1410923404-1311-1-git-send-email-b40869@freescale.com>
	<029101cfd250$bedbdb90$3c9392b0$@lge.com>
In-Reply-To: <029101cfd250$bedbdb90$3c9392b0$@lge.com>
Date: Thu, 18 Sep 2014 13:45:50 +0900
Message-ID: <004d01cfd2fb$6cc81570$46584050$@lge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQE7OaggyDHZ98GjKzYBxZothUc2GgKc9DJBnRqbz7A=
Subject: Re: [meta-networking][PATCH V3] pimd: add recipe for pimd-2.1.8
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
X-List-Received-Date: Thu, 18 Sep 2014 04:45:36 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: ko

Also there is no install stage

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Changhyeok Bae
Sent: Wednesday, September 17, 2014 5:24 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-networking][PATCH V3] pimd: add recipe for
pimd-2.1.8

The sha256sum is wrong. Please recheck.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
YangHaibo
Sent: Wednesday, September 17, 2014 12:10 PM
To: openembedded-devel@lists.openembedded.org
Cc: YangHaibo
Subject: [oe] [meta-networking][PATCH V3] pimd: add recipe for pimd-2.1.8

Signed-off-by: YangHaibo <b40869@freescale.com>
---
 meta-networking/recipes-support/pimd/pimd_2.1.8.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-networking/recipes-support/pimd/pimd_2.1.8.bb

diff --git a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
new file mode 100644
index 0000000..7c03dd6
--- /dev/null
+++ b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
@@ -0,0 +1,10 @@
+SUMMARY = "pimd is a lightweight stand-alone PIM-SM v2 multicast 
+routing
daemon."
+HOMEPAGE = "http://troglobit.com/pimd.html"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=94f108f91fab720d62425770b70dd790"
+
+SRC_URI = "ftp://troglobit.com/pimd/${BP}.tar.bz2"
+SRC_URI[md5sum] = "a12448bc7c9bfcebf51a13ebf1ffa962"
+SRC_URI[sha256sum] =
"3379436c16caccdef9b40a49fbdfdbb45aad8ecb05870834490b8fb080126009"
+
+CFLAGS_prepend = "-I ${S}/include "
--
1.9.2

--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


