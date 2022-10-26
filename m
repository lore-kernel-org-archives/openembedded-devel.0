Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48806C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 11:51:43 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.6631.1666785100627160756
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Oct 2022 04:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=tqstBYGx;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=K8WamxzM2FNqycqcVMQK5sdY9hc7rJLYJl4F0B70OfQ=; b=tqstBYGxvbobOvshFf1VLCHhOa
	VYvK2k/rT13QOVJfvXjHtZqNlMV82GaPlSqphXTR6Pw9gtSUW4WVcDvzsCjil2lH36ZE3QocbOse2
	CQbO/fKpmCbaODKSmbB8fK0gAWMN9v3Q5u2NXSCMx/S+ljx/lvMGSkh1kB7Ab8mE6cU5eKgIxXYk4
	scOuJ66WmvKTJV1vYHN5yb9/nazsS3oncQekX8mfhCchQMXxQwMVvKrTs+IjH9gl3YVHiOPhTIJ8d
	CNRvVF6C9jF43kMKpvjBbp1/38RI1cwu5SKXJtsAt4aTqnKBwol/Zx7MDBX6hoAxzIG7lFHNVlRQV
	5FN0+ndQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:60144 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1onexb-0002xU-W2;
	Wed, 26 Oct 2022 14:51:39 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-pint: Upgrade 0.19.2 -> 0.20
Date: Wed, 26 Oct 2022 14:51:24 +0300
Message-Id: <20221026115124.289505-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221026115124.289505-1-leon.anavi@konsulko.com>
References: <20221026115124.289505-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Oct 2022 11:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99313

Upgrade to release 0.20:

- Reorganized code into facets
  Each facet encapsulate a Pint functionality
- The definition parser is now completely appart, making it easy to
  try other formats
- Extra requires for optional packages are now explicit in
  setup.cfg
- Parse both Greek mu and micro Unicode points without error
- Added angular frequency documentation page
- Move ASV benchmarks to dedicated folder
- Implement `numpy.broadcast_arrays`
- An ndim attribute has been added to Quantity and DataFrame has
  been added to upcast types for pint-pandas compatibility
- Fix a recursion error that would be raised when passing
  quantities to `cond` and `x`
- Update test_non_int tests for pytest
- Create NaN-value quantities of appropriate non-int-type
- New documentation format and organization
- Better support for pandas and dask

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pint_0.19.2.bb => python3-pint_0.20.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.19.2.bb => python3-pint_0.20.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.19.2.bb b/meta-python/recipes-devtools/python/python3-pint_0.20.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pint_0.19.2.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.20.bb
index 06337edb6..fc25eeed4 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.19.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.20.bb
@@ -10,7 +10,7 @@ PYPI_PACKAGE := "Pint"
 
 inherit pypi ptest python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e1d4989ff510b378dad64f91711e7bdabe5ca78d75b06a18569ac454678c4baf"
+SRC_URI[sha256sum] = "4035f6d1431913afd86a056959e35d342399b0ab7d6f8cad1f0f6058dc83fad8"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.30.2


