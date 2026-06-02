Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E96CD6E68
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:44 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21221.1780394912976876901
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HMS+3h06;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394922; x=1811930922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yupUASTw3yXE3Id+SIrZkUihxe0YeZSH3vnBOsoRJKs=;
  b=HMS+3h06FjjQsDh77XA0bzXzrD48mQWSOC1iKkc1QmUaqBYP5Bao1wfZ
   48cMr1kOxwA+VYgC7EPdyIh5zqlKkQDeOWSgQHE5JYhwGzNP6vED4gOvV
   pHohwqX1M1KuEQQn8pXh+hA1aFzR6yIWOCMw4m+5Oz5qglqQICnvAfo1M
   FzeTa8ZL+oJc7RRyreM+uGkd6mZe3432Bro1WA8KNDA+rVdDkZEq29nmf
   S2N8NPxj3HqUIPfFTehqGeJXaslxdYu10E/A6yIJ4XDnAJVT3iO9pBgCX
   KwW5E1XLZGaX0nJr3wDcUDNnd1D2h3ngA8UddRVJtW26q5E9Zsj3DVurc
   w==;
X-CSE-ConnectionGUID: 2Kf2VVX0RKC8sVVNkQtmoQ==
X-CSE-MsgGUID: WmCeY5QYQxKjIRhMwTu4ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="242743071"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="242743071"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:42 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1DBBC42A335
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:41 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C240810214D4
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id D73AE1800587;
	Tue,  2 Jun 2026 10:08:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/38] python3-platformdirs: upgrade 4.9.6 -> 4.10.0
Date: Tue,  2 Jun 2026 18:07:38 +0800
Message-ID: <20260602100755.2117-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127344

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on3-platformdirs_4.9.6.bb => python3-platformdirs_4.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.9.6.bb => python3-platformdirs_4.10.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.9.6.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.10.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.9.6.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.10.0.bb
index 6ca4a09bde..84c423fdab 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.9.6.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/platformdirs/platformdirs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a"
 
-SRC_URI[sha256sum] = "3bfa75b0ad0db84096ae777218481852c0ebc6c727b3168c1b9e0118e458cf0a"
+SRC_URI[sha256sum] = "31e761a6a0ca04faf7353ea759bdba55652be214725111e5aac52dfa29d4bef7"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


