Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web10.3674.1624514726696184205
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 23:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=zKPTLHaP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624514723; i=@fujitsu.com;
	bh=0RVYciw2R9pDrsFJgTFtt8/iW4bB560SyPgGW1KBcSw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=zKPTLHaP6UnEk6CzEO8IyPtmUXWSK+r8l0VWnyOU8ENgGnyMH0TCYumyWQf2CuKV0
	 FacIuE5CzWbLTrO9qVdyJKw6N9o2QuwfhtZaCp7Lwwk0Tz0LdJe2GXgg29OAaZwzvD
	 VuG/yEKHYHgU5u1usLdIn6vGOt0zq5P1jjX0mCJvRDjqCFkXFzc3A/40Hfszj30egY
	 vIWcbszw2HudoZs/M3jZ+FYNbjrN0bJyU33mpWxot0B1pL06BS3Pjmf+ZiM+uG7dz/
	 arEiP8Khn4hqd893h3S0vNA+wu179KQcFalT5rMRiWW1uKyJu7uch/EsZaNdaQjYSg
	 JWXk6qDtIfObw==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 62/0C-19780-3A024D06; Thu, 24 Jun 2021 06:05:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+EI0V2scCX
  B4PNeZouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNN6xy2gtscFVO3fWZqYPzF3sXIxSEkMJtJ
  YuXymUwQzglGidsNG1i6GDk52AR0JDpedIPZIgL6Ektn72EGsYUFHCUWbtjHDmKzCKhKrDvcy
  wRi8wq4S6x59gDMlhBQkJjy8D0zRFxQ4uTMJ2BzmAUkJA6+eMEMUaMosX3nGRYIu0JixoxtbB
  MYeWYhaZmFpGUBI9MqRsukosz0jJLcxMwcXUMDA11DQ2NdA10jUyO9xCrdRL3UUt3k1LySokS
  grF5iebFecWVuck6KXl5qySZGYCilFDL82cG4+s0HvUOMkhxMSqK89/mvJAjxJeWnVGYkFmfE
  F5XmpBYfYpTh4FCS4FUABqeQYFFqempFWmYOMKxh0hIcPEoivJKyQGne4oLE3OLMdIjUKUZFK
  XFeSZA+AZBERmkeXBssli4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEublAJnCk5lXAjf9Fd
  BiJqDFCr8vgiwuSURISTUwlda5qbz0dDa+mRfWnuJ69wrnDZctHbnR4om/XCQsfXUX3/438bv
  c792ssa57v069ILFamt9Z9MUV5Y3Hdq5bFDvR+88B04Z5ll9U0ubuazM48+pcy75n7zRui23/
  9pjv3ZWZ+w5vO93Oo/38o/1+PsPECdeOzf69d/O1WTLnrn9OdRRiKa13zEyyCU6drNU7f+Ylm
  zW7kpkmSv9gyb641j9j1hbuhwtj7hgL/6huElIW++hq8PKESEzyb9M6+8hiVl6PXdesZglaiP
  ZFec7Y8Pundl/XHIbcFc3ypxm2fPs/o2Yb78WMx001AWo1v5e9zO1Y9cjO8cXOFU1RaQ9v7/z
  277XWbtbrnLf5761bM0GJpTgj0VCLuag4EQAUQPM4IAMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-226.messagelabs.com!1624514722!98218!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31623 invoked from network); 24 Jun 2021 06:05:22 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jun 2021 06:05:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15O65H1V004029
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 07:05:22 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 24 Jun 2021 07:05:16 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] function2: upgrade 4.1.0 -> 4.2.0
Date: Thu, 24 Jun 2021 14:05:09 +0800
Message-ID: <1624514709-14468-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../function2/{function2_4.1.0.bb => function2_4.2.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/function2/{function2_4.1.0.bb => function2_4.2.0.bb} (92%)

diff --git a/meta-oe/recipes-support/function2/function2_4.1.0.bb b/meta-oe/recipes-support/function2/function2_4.2.0.bb
similarity index 92%
rename from meta-oe/recipes-support/function2/function2_4.1.0.bb
rename to meta-oe/recipes-support/function2/function2_4.2.0.bb
index 56dc30acdc..14b9883373 100644
--- a/meta-oe/recipes-support/function2/function2_4.1.0.bb
+++ b/meta-oe/recipes-support/function2/function2_4.2.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Provides improved implementations of std::function."
 HOMEPAGE = "https://naios.github.io/function2"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
-SRCREV = "3a0746bf5f601dfed05330aefcb6854354fce07d"
+SRCREV = "02ca99831de59c7c3a4b834789260253cace0ced"
 PV .= "+git${SRCPV}"
 
 SRC_URI += "gitsm://github.com/Naios/function2"
-- 
2.25.1

