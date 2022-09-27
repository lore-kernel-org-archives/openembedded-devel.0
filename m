Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63FAC54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:10:02 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.8816.1664269794742374509
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=y/t20vn0;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664269793; i=@fujitsu.com;
	bh=O3xg4YXma4XbF7BzF8JJVfKmduaOj//MkBHLYifCvGg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=y/t20vn0IYvab1QOwjidkYsZsOE68gmZ61YowONsbCMiGutQNdUZCcAVYksrYUuWk
	 fxPxA/zEk9xgYKd7FWXR6uy7DUuxuQEcBIe+KJmKtllvyfGCPuYTeWXPx/ig8ksM3Q
	 RrXc7OC3gVFRlpV3sfNW0Nn1V0FXo9WxnHYZ4IVQyU/4Xv0yQDKaTRlp6c85dx2L8F
	 3xXrAkRaglc0sjrnp70H100QQw+V6yvf6Sez3rEak3XB5g4ppYfGVaq77WteloRHf7
	 lo6si74R2APD3aFnJq4o1Jpr44CeendfJUWAf6pIPl36DCFSsJxpm0kUJjLFCH4l86
	 NxJtCe5qqfpzg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORpPtgr1G
  ywZ+PahYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bauZ/ZC/5zVmy4foS9gfEKRxcjF4eQwENG
  iU9TXjBCOFeYJDo6V7JBOHsYJa49/ACU4eRgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8e9
  i5GDg5hAR+JziOmIGEWAVWJtSvOgrXyCjhKXP25F8yWEFCQmPLwPVgrp4CTxIe73cwgrUJANX
  0tCRDlghInZz5hgZguIXHwxQtmiFZFidmXm1kg7AqJxumHmCBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYrZKKMtMzSnITM3N0DQ0MdA0NTXWNjXXNTfQSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yor
  c5NzUvTyUks2MQJDOKVY0WsH46sVP/UOMUpyMCmJ8tovMkoW4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMEruRsoJ1iUmp5akZaZA4wnmLQEB4+SCO+6JUBp3uKCxNzizHSI1ClGXY6ZX9sOMAux5O
  XnpUqJ85puASoSACnKKM2DGwGL7UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlN9wBN4cn
  MK4Hb9AroCCagI+z49EGOKElESEk1MHlvW9ux4Vr/4lmxX56cjGi/LPlPPeUy8/rHJdKzOy8/
  FxbR+9rwb8r6+gLmBTuPx55+onJz85r9M5YdS+jMubdUf/u0WYLiL/3Pe/z31T6z4YdMcMakh
  0GXrsy7VBT/7ejhdOZcRfdX/BoRVW+C9pckKZ40/bXuQ8DvRqF5vXy7TVMY/F+538jnX+u4qz
  EqZUnSMU7TJGutxg6PE1y7lvemXml8/WLbQuMn4ss+ZLS/Ent0NMFD/ETfxSlMeXV/uT4frci
  RSTdbtqfZIvSK/N49Uyqtp+YcbNnzQpjN+sjBvZbHVu9K4zz+xd/7wq/q+3Ncmo/p/WwpFL2c
  +euH2PT6Rk+vjk27oib0LtcsPaKjxFKckWioxVxUnAgAU4cDj2gDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-571.messagelabs.com!1664269792!492298!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6747 invoked from network); 27 Sep 2022 09:09:52 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 09:09:52 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 54AE81AE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:09:52 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 49C551AB
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:09:52 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 10:09:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio: upgrade 1.49.0 -> 1.49.1
Date: Tue, 27 Sep 2022 17:09:37 +0800
Message-ID: <1664269780-2655-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664269780-2655-1-git-send-email-wangmy@fujitsu.com>
References: <1664269780-2655-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 09:10:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98980

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-grpcio_1.49.0.bb => python3-grpcio_1.49.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.49.0.bb => python3-grpcio_1.49.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.49.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.49.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.49.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.49.1.bb
index c3266e5d20..8efcfdc375 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.49.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.49.1.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://mips_bigendian.patch \
                                 file://abseil-ppc-fixes.patch;patchdir=third_party/abseil-cpp \
 "
-SRC_URI[sha256sum] = "90ec337f36db26fbc70a4c032bcbabb2008f950f4194e99385118a12688fdf92"
+SRC_URI[sha256sum] = "d4725fc9ec8e8822906ae26bb26f5546891aa7fbc3443de970cc556d43a5c99f"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.25.1


