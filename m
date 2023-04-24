Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9FBC7618E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:33:19 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.43270.1682307188849356631
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Cul4lRaC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682307187; i=@fujitsu.com;
	bh=ckXPw+MUi1SFPOa83P4EDDOFcCjwHJorORj9vyS3Kfo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Cul4lRaCoNbK3DXddvdLrgbfzQZvKI/FuZ8GptJL6ct8nPAc2wimKxxmLqhOia53W
	 kg3N+E4XYzjcZDxhqXgYZDebkCC3B5Gp8ZTNFBvszmhoEuBIv0oeWqbENrG/CmIZdn
	 vubdUR627hEURVRu94kV5mXAS6FginGwngT69MFm3h1QioasItTVTLyuqIY6KBtXZN
	 buXkB1Yg/4J5kG29GH7Ouk9f8rau8LL/ujehBBs2G4KPqWjH9NfNLPO+V+zlmGH+sv
	 mVrQHNp2VrO1bUCntkrZuPqmTrN5HfmrmF4Pfx81HKP88Oa83ZR4v0E4vMrrqlMGAK
	 RSFy1gqO/4Igw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpFv0wzX
  F4NYPE4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNt6jnGgh/sFVOe/mFpYFzE3sXIxSEk8JBR
  omfBRkYI5yqTxKn5O5ggnL2MEhc+32bpYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAWuLeyf2MIDaLgKrE+9n3mUBsXgEnie0XJ4HFJQQUJKY8fA/WyyngLHFl51qgGg6gZU
  4Skzq0IcoFJU7OfMICMV5C4uCLF8wQrYoSsy83s0DYlRKtH35B2WoSV89tYp7AKDgLSfssJO0
  LGJlWMZoWpxaVpRbpmuklFWWmZ5TkJmbm6CVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek
  6OWllmxiBIZuSjHL2x2Mn3b+1TvEKMnBpCTKu2SDS4oQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  d6iT64pQoJFqempFWmZOcA4gklLcPAoifAu+wKU5i0uSMwtzkyHSJ1iVJQS57X9DpQQAElklO
  bBtcFi9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV7JD0BTeDLzSuCmvwJazAS0eBe3C8j
  ikkSElFQD094ZImyufyvFDy+5bpfFy/1r78RVzxVi1qq5NU/I1utO/PjK4NedU+95ezX0OFR7
  v/WWnuo+d+m4+hTdwtgMa6dMyUcPFv/Yx3rc8d8B9b45TmzH01kFeVu48m5f6DpU+HjHsqsuR
  V8Yp2brcIvfC1n94dl115br/S3dn8LLv7cZt5iy5jYpT1QOvW9TUSrPNPWrvOj7Dx1vn62QOq
  39LXt56cJZy2f//Bs6fbObw5pnvx2TeZiMz10O/FKyvXmvyLXa1WaPfFPeH03eyPrrjw/Phxn
  Ll5rkdi/Z9V+qZ/s+g6/Wy15vv5iqvVNywsbbpROml+wX+bjVz0P1t4R+8ZvtE9+5HC5Z3Xvq
  B5fT1x1KLMUZiYZazEXFiQBIAMKqWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1682307186!484934!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 731 invoked from network); 24 Apr 2023 03:33:06 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:33:06 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 744F61B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:33:06 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 68C771AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:33:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:33:05 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] sip: upgrade 6.7.8 -> 6.7.9
Date: Mon, 24 Apr 2023 11:32:41 +0800
Message-ID: <1682307162-12043-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682307162-12043-1-git-send-email-wangmy@fujitsu.com>
References: <1682307162-12043-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102177

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.7.8.bb => sip_6.7.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.7.8.bb => sip_6.7.9.bb} (83%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.7.8.bb b/meta-oe/recipes-devtools/sip/sip_6.7.9.bb
similarity index 83%
rename from meta-oe/recipes-devtools/sip/sip_6.7.8.bb
rename to meta-oe/recipes-devtools/sip/sip_6.7.9.bb
index 01000f59c..f6c2457bc 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.7.8.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.7.9.bb
@@ -11,6 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 inherit pypi setuptools3 python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "7e7186a36818c9d325c82e59ac5b049d9022c2d5783942c38d49497ac8a94c8f"
+SRC_URI[sha256sum] = "35d51fc10f599d3696abb50f29d068ad04763df7b77808c76b74597660f99b17"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


