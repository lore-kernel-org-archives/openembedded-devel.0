Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38892C433FE
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 05:55:10 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web11.8628.1632981309383600258
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 22:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=yzQulD7g;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632981306; i=@fujitsu.com;
	bh=d2q358hVebbA09idpKq+JJyWYL5alcJNUBTN17rcLmc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=yzQulD7gigQYRo5xcU9XE8L6TxgfDREb2jDKdAgfbBRIz09DNgEh3OPdGxAvwb44X
	 fLfMijmeEPEgF7rCj8yNQeqpD24l+nG9AHuSf0o5FYPVCzbuhXfClrza+fzf+2NXlo
	 VdHkm9KyELzi628iKEFDPHijPHXIP6DTpUAepUKXomw0ShtSwFjpNYQkX653CRK8bj
	 ufq/3EA5yevqExzjqJGCGjWhbafr7YiWkg+fZJC1wFGm/WMxht1tIM2y2pF1qnsrQZ
	 CmcDb+5VfgOKDK4FV+dWxBJxtQX+qLAQca2VlR3klIgEncArDj5nfXvwJmXl7JK/0P
	 zoqsypIPBvMiw==
Received: from [100.112.199.201] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 54/F1-25352-A3155516;
 Thu, 30 Sep 2021 05:55:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MRqmsVGJp
  osO2KoMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHz+232gi7eive/X7M3MJ7j7mLk4hASmM0k
  cXl6NzOEs4dR4kfberYuRk4ONgFdiXOP17KD2CIC+hJLZ+9hBrGFBewlJuyfxApiswioSmw++
  AgszivgIfF94hlGEFtCQEFiysP3UHFBiZMzn7CA2MxA9d1HnjJB2PISzVtnA9VwANUrSsyeLg
  /RWiHx+vAl5gmMvLOQdM9C0j0LSfcCRuZVjBZJRZnpGSW5iZk5uoYGBrqGhka6hpYWuobGBnq
  JVbpJeqmluuWpxSW6hnqJ5cV6xZW5yTkpenmpJZsYgWGXUnCsaQfjydcf9A4xSnIwKYnyKvqE
  JgrxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4BX3B8oJFqWmp1akZeYAYwAmLcHBoyTCu90PKM1bX
  JCYW5yZDpE6xagoJc4r4Q2UEABJZJTmwbXB4u4So6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJW
  HeDpDtPJl5JXDTXwEtZgJanNUeArK4JBEhJdXAJHv1rPa7Q78MJ3eLf7DYEhqzKmBN6fJqfsH
  yGd//ZYjfDCvk4lktafZMarq4mIXJg6NyX1NMzmqfPs/NzOO84+Ta5YZ1u0qeZ1uFnVoUd+BX
  pJlsS+L0E4ofJmY90JSoWJDDf+3Ooy5PqbnfPl64uiaHLy1qhc2rlWwar2rkBMvq5v73j5riJ
  PP21iKndZWezo5PDd799DHaN/t4hSpjXxwPS+3ETIk9qSUHGcOiXW1DBOdOXXVWas6Sm0d49J
  Pye2aee1XfoG+yf/kf3oPZla8+efVucxOW+PPrK+u5B9+YourWhR2vMTkRcvP+tpXSItcdM3+
  eWsUgvSZt/kXx6YGubhV7bl0s2XaLZ9aGq0osxRmJhlrMRcWJAGum1jA2AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-291.messagelabs.com!1632981305!103079!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24253 invoked from network); 30 Sep 2021 05:55:06 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-15.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Sep 2021 05:55:06 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18U5t5jv012358
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Sep 2021 06:55:05 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 30 Sep 2021 06:55:04 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] cmark: upgrade 0.30.1 -> 0.30.2
Date: Thu, 30 Sep 2021 22:54:57 +0800
Message-ID: <1633013697-14584-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Sep 2021 05:55:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93179

Fix parsing of emphasis before links (#424, Nick Wellnhofer).
Fixes a regression introduced with commit ed0a4bf.

Update to Unicode 14.0 (data-man).

Add ~ to safe href character set (#394, frogtile).

Update CMakeLists.txt (Saleem Abdulrasool). Bump the minimum required
CMake to 3.7. Imperatively define output name for static library.

Fix install paths in libcmark.pc (Sebasti=C3=A1n Mancilla).
CMAKE_INSTALL_<dir> can be relative or absolute path, so it is wrong to
prefix CMAKE_INSTALL_PREFIX because if CMAKE_INSTALL_<dir> is set to an
absolute path it will result in a malformed path with two absolute paths
joined together. Instead, use CMAKE_INSTALL_FULL_<dir> from
GNUInstallDirs.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-support/cmark/{cmark_0.30.1.bb =3D> cmark_0.30.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/cmark/{cmark_0.30.1.bb =3D> cmark_0.30.2.bb} (88%)

diff --git a/meta-oe/recipes-support/cmark/cmark_0.30.1.bb b/meta-oe/recipes-support/cmark/cmark_0.30.2.bb
similarity index 88%
rename from meta-oe/recipes-support/cmark/cmark_0.30.1.bb
rename to meta-oe/recipes-support/cmark/cmark_0.30.2.bb
index e2db8aa762..6669c6e500 100644
--- a/meta-oe/recipes-support/cmark/cmark_0.30.1.bb
+++ b/meta-oe/recipes-support/cmark/cmark_0.30.2.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D81f9cae6293cc0345a9144b78152ab62"
 
 SRC_URI =3D "git://github.com/commonmark/cmark.git"
-SRCREV =3D "977b128291c0cf6c5053cdcf2ac72e627f09c105"
+SRCREV =3D "a8da5a2f252b96eca60ae8bada1a9ba059a38401"
 S =3D "${WORKDIR}/git"
 
 inherit cmake lib_package
-- 
2.25.1


