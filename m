Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27ABFC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 07:23:26 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.16757.1666596196590253709
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Oct 2022 00:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=d75Q2UwH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666596194; i=@fujitsu.com;
	bh=wUOjzPRgmNYbaCvFtSe3HRXvTeTNE5Udt/dTeGtm6TQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=d75Q2UwH1dFmyDn8p4UrKTytuJYmv9W1yhYNBxdtGJ+Z2Tleg/4BEQeE0NzDmx5ry
	 chissvlkvQV2Tjqt14Gtgivgnyc6Y/w5usjb5pZBkq1SQRjk8P85dx86GZv6WIhgCk
	 vRpW0lY+S3SjxQQnWsHgJsyUnEHxtPgYlFSM9Qb1JJwO2t1V9yNYEggGTOjW8J0Bk8
	 1T2ST7kzWwNEMPuvBigu/qwEtXfaj2luu7sZMPG+fi3nKEdkV6ArjXzQAPujVre1Bs
	 lWhRFnJ9CmK+xkE50ZPiZ2sgNU7pr0r6wunaSAqf+g2N3tHv2FD2GJjDibCYTj4TLY
	 MBta41WdYm+IA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MxSTfJNiz
  Z4MUXZouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP+4S/sBc85K2ZfPMLewDiBs4uRi0NI4Amj
  xKQdJxghnOtMEl8OzGSGcPYwSqxbcJCli5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBf4lJb36AxVkEVCV6d58H6+UVcJJYd3g1WFxCQEFiysP3zBBxQYmTM5+wQMyRkDj44g
  VUjaLE7MvNLBB2hcSsWW1MELaaxNVzm5gnMPLPQtI+C0n7AkamVYzmxalFZalFukYGeklFmek
  ZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgQGZUpyUuIOxb9kf
  vUOMkhxMSqK8DOJhyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeGu0gHKCRanpqRVpmTnA6IBJS
  3DwKInwzjICSvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy9VSpw3zAaoSACkKKM0D24ELFIvMc
  pKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmPWYJNIUnM68EbtMroCOYgI64tCII5IiSRISUVAN
  TUFzAvpnFJlt4/VxE3ov8412d/8hRXnqj7a4nD0ryWW6zGp/xm7G0t8qr7UxZ14x3tQqvhVt2
  +EQ6Nh0PPRPY29paYm1kfrOkuID70+pnTOcM/GeujoxwCAnK91zyJMBX/OeyfW0cDK8z9uV86
  C7drSaxstY562Ohxsnl/MWvz19+ZvpX4sT22Xe+bq033b/U7G1qwdUjqxyVBfeYaC0LOapYfE
  qfbYf/J6kz/FPSXV59KdF5MFWqi3PllOgCQeY7PvW+KWuNf7r4zdi1bYrj+e13NG68fet9bnu
  19KV3i3Z+nzVdW+3FrrC4Ku7H078oh7/z+GgffvltlYPfT7tXTlxTRd+sfOJaxrh8yt37SizF
  GYmGWsxFxYkAJDYr308DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-728.messagelabs.com!1666596193!199171!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19330 invoked from network); 24 Oct 2022 07:23:14 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 07:23:14 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 84DBA1000D2
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 08:23:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7793C1000E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 08:23:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 08:23:11 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pywbemtools: upgrade 1.0.0 -> 1.0.1
Date: Mon, 24 Oct 2022 15:22:56 +0800
Message-ID: <1666596176-29954-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99291

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pywbemtools_1.0.0.bb => python3-pywbemtools_1.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_1.0.0.bb => python3-pywbemtools_1.0.1.bb} (92%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.0.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.1.bb
similarity index 92%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.0.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.1.bb
index 3a9f0ad6fd..ea9d6528d4 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.0.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[sha256sum] = "0af7e067e0c0ba32cc19c2c2dc67875c591b806c4b49480ebe46e37bfb399684"
+SRC_URI[sha256sum] = "3fd2fec6a11992afb8a34c0181b76c8d36c6fae1b79d83fb4542ce08e0fb4127"
 
 inherit pypi setuptools3
 
-- 
2.25.1


