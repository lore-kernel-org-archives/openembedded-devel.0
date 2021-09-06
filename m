Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web12.16631.1630891072079924738
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 18:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PI6LDsj0;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630891070; i=@fujitsu.com;
	bh=yjiP93gnLirGZ3zNegoy7ZYY+IIUzZ3OxhGlvuKrNio=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PI6LDsj0cO6cP2xm1KBhxzShVikxwaTjddjIS+Mx2iNAwjYuLw9B2PhOViupQQc2H
	 h7GfMa0NQLDjYHm7hTyVo6P7QImOasxfmrxxCQ4qkXvNaOp+q+fvlHf9CoYL+5FNE1
	 iOTFIYva7dNmtQ/H1sALlJcGSUJAJB5e0QxreKt+BlaBRFH+N98ogPh5EOvDOLQ2EY
	 mZIrLpdltbaF0ovxuRi3qVM2oCCfwghSDA2zXrxjUlrNxehVgwOaDnJx3L1vL/D9Sd
	 2V5P7JqCGZvPQwCGH71uyQA6Smu4mWQ3fgPoQiUI2sXoXsEykjkLVWjECXx44j/nde
	 rSPXY8nofp7xA==
Received: from [100.113.3.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id FD/C3-32481-D3C65316; Mon, 06 Sep 2021 01:17:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI1bXNMU0
  0+PlOxOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzXi/cyNjwVHBik376xoY7/F3MXJxCAnMYpJ4
  9/UiexcjJ5BznFFi5msjEJtNQEei40U3C4gtIqAvsXT2HmYQW1ggQeL3ymawOIuAisS1PV2MI
  DavgLvEtf5DTCC2hICCxJSH75kh4oISJ2c+AatnFpCQOPjiBTNEjaLE9p1nWCDsConXhy8xT2
  DkmYWkZRaSlgWMTKsYLZOKMtMzSnITM3N0DQ0MdA0NjXWBpLGBXmKVbqJeaqlucmpeSVEiUFY
  vsbxYr7gyNzknRS8vtWQTIzCMUgoZmnYwvnv1Qe8QoyQHk5Ior4adaaIQX1J+SmVGYnFGfFFp
  TmrxIUYZDg4lCd6oLKCcYFFqempFWmYOMKRh0hIcPEoivPwgad7igsTc4sx0iNQpRkUpcd6LI
  AkBkERGaR5cGyyOLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5m2NB5rCk5lXAjf9FdBiJq
  DFbQ9NQBaXJCKkpBqYHmkb3V8g3fSjvuWK8JWI5XUhW/5eCgjOWzjv2Yv0M0WVnCkq4nEvJ79
  MuZC+fR0r09m7OmtuMom/W5a6081mR8SxQ91B3F51l56e37i99KkC1yajooB3rucnvy6y1y9x
  KLV8P33rS44+xQ8uEs88lqUqXlX6cNigUaM0Ne6xSa7m+sbqJ6d8VEIkps6wzptZyPGn5ta0L
  mnxTxUSi950h0oyVEz+fuTrv9ZXi/kevInM/Fg95cpFE7nTV16Klko3PX8w+d4h8Yd3N9htWM
  BZ8IXHamFkyzfmv/Hr256csHgjvKrcinHGvTv7J87U3H+mLexbWuQn67CKDNPfL85usZh1OEz
  s+r2osq6eaeX3TyuxFGckGmoxFxUnAgAGxvllHgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-226.messagelabs.com!1630891069!193291!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29568 invoked from network); 6 Sep 2021 01:17:49 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-6.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Sep 2021 01:17:49 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1861HmbM022559
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Sep 2021 02:17:48 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 6 Sep 2021 02:17:47 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-python] [PATCH] python3-cryptography-vectors: upgrade 3.4.7 -> 3.4.8
Date: Mon, 6 Sep 2021 09:17:40 +0800
Message-ID: <1630891060-61201-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

From: Wang Mingyu <wangmy@fujitsu.com>

Changed the version scheme. This will result in us incrementing the major version more frequently, but does not change our existing backwards compatibility policy.
BACKWARDS INCOMPATIBLE: The X.509 certificate parser no longer allows negative serial numbers. RFC 5280 has always prohibited these.
BACKWARDS INCOMPATIBLE: Invalid ASN.1 found during certificate parsing will raise an error on initial parse rather than when the invalid field is accessed.
BACKWARDS INCOMPATIBLE: Values passed to the X.509 PEM parser must be a single PEM payload and will error on extraneous data.
Added support for OpenSSL 3.0.0 as a compilation target.
Added support for SM3 and SM4, when using OpenSSL 1.1.1. These algorithms are provided for compatibility in regions where they may be required, and are not generally recommended.
We now ship manylinux_2_24 wheels, in addition to our manylinux2010 and manylinux2014 wheels.
Added rfc4514_attribute_name attribute to x509.NameAttribute,

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...y-vectors_3.4.7.bb => python3-cryptography-vectors_3.4.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.4.7.bb => python3-cryptography-vectors_3.4.8.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.7.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.8.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.7.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.8.bb
index 565e223bfc..2fb48f3cf7 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.8.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 | BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
 
-SRC_URI[sha256sum] = "a7ac3aaa57514687696ad65f833e5e39b6fa3c5d41de2b8c938346ee119204c2"
+SRC_URI[sha256sum] = "4c84410257993d3de058b44b777a49e1da2ae35ebea2970a360c7e3aa0f580f2"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.25.1

