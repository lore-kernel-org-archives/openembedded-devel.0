Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9266CC7618D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:07:50 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.8970.1678889270072216315
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VT2j9efO;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889268; i=@fujitsu.com;
	bh=CbKVmh8IKSlgvrgX79GpBo+0ShQYOq0jwByAM4yxyx0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VT2j9efOn5Zcj/yzaOktiF7CielKZF7yutunfXThqgpnxsuFTbrxSkNiPCbR70ef2
	 qAVlf+6e7D1VboCkSO5t6+FPPXXqweBAhLD9dY6UjsuLnzfnG0/WJqFJqaMSYXXaTq
	 33mn134I3moOP9U84iS6D0r8/6av8cIUIyl/f6BGjewQEUhQrHopWN0LBWHsii2uuA
	 /PZwSfP+NYpqJmt/QPU0+emH2x79snt00uMvZ+ORR+KvEHYk7jWvyw/7uYokSKAw7x
	 bpWwwgiJD3qyDu0zWPJHusQihhyPHTOMopfp3mR197Y25NO/som+sQzpkpqhXnE4sS
	 KJRaR0UDRtf+w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORpGt8UTD
  F4PQHHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP+J46CVTwV17tOszYwTuPuYuTiEBJ4yCjx
  9+18dgjnCpPE7sO3GSGcPYwSR662M3UxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPU
  DcHh7CAn8SMRxIgYRYBVYnZr1+CtfIKOEkc3TCJEcSWEFCQmPLwPTNIOaeAs0TDNWuQsBBQye
  W7DewQ5YISJ2c+YYGYLiFx8MULZohWRYnZl5tZIOwKicbph5ggbDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGM2KU4vKUot0TfWSijLTM0pyEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5Nz
  UvTyUks2MQIDN6U4mWEHY2ffX71DjJIcTEqivH/WCKQI8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uD9d0YwRUiwKDU9tSItMwcYRTBpCQ4eJRHe1PNAad7igsTc4sx0iNQpRkUpcd6/IAkBkERGaR
  5cGyxyLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5l0Gsp0nM68EbvoroMVMQIt55wmALC5
  JREhJNTCxcZfVnetPTPFXy5to7t742aBNdUJ6/Zp15vP7vWYb7P9y+V3t3/l3J7B+m5CQM2l6
  Y/M/53nem89HcemwiP5wZTJg/yEvEe6de04j58L3yOf7ts17c3bv/1dbJwlbvuG9brRyZVDFj
  sJvoR8KCw/O3cxgvkV4wdb0P1ufOsYZSsZPyd9knuSx63WHxerKdbp7zR90eF9ju9P9dcXVs1
  pzfnWe8atNlIifZ/b8WKr0+lW7Jul3X5ew0inaVhCeei9XiOnV8dtZ6dnz1zTZmFa/+nH88P4
  FvPPFRCz0vXb8P/hIfxLXrFf9UiprWp5ZCMWyHk120i7Wul95sG/WRfkzJ/e7LFBs453dbxZ9
  I/2dEktxRqKhFnNRcSIAni8T1FcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-745.messagelabs.com!1678889267!1444879!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20813 invoked from network); 15 Mar 2023 14:07:47 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:07:47 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 225DA1B0
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:07:47 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 174101AD
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:07:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:07:38 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 1.10.5 -> 1.10.6
Date: Wed, 15 Mar 2023 22:07:17 +0800
Message-ID: <1678889238-20738-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889238-20738-1-git-send-email-wangmy@fujitsu.com>
References: <1678889238-20738-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101552

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Implement logic to support creating validators from non standard callables by
  using defaults to identify them and unwrapping functools.partial and
  functools.partialmethod when checking the signature
- Fix mypy plugin for v1.1.1, and fix dataclass_transform decorator for pydantic dataclasses
- Raise ValidationError, not ConfigError, when a discriminator value is unhashable

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydantic_1.10.5.bb => python3-pydantic_1.10.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_1.10.5.bb => python3-pydantic_1.10.6.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_1.10.5.bb b/meta-python/recipes-devtools/python/python3-pydantic_1.10.6.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pydantic_1.10.5.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_1.10.6.bb
index 77e94a9bb..c888f4a5d 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_1.10.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_1.10.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c02ea30650b91528657db64baea1757"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9e337ac83686645a46db0e825acceea8e02fca4062483f40e9ae178e8bd1103a"
+SRC_URI[sha256sum] = "cf95adb0d1671fc38d8c43dd921ad5814a735e7d9b4d9e437c088002863854fd"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-typing-extensions \
-- 
2.34.1


