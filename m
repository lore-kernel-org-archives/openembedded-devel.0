Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5D2CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:11:08 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.129.1778645460751305073
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MwfCQIfz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645460; x=1810181460;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6OBjoMWH9y8maRzvqi3Tz3FUB4A2RsAaVuq46VMgAkw=;
  b=MwfCQIfzSnBwHVf0TIgW/ohvYfHlBAbptoN5h+eW6mkDhCWlaEVC0wtZ
   iBpaFRpy+UVOKd7O3IAfHXIR0ii8T57zGJmiyt4M3suOghJDMKnaSxOw+
   t+xsp3CbuWiojO9zx9pYMMqkLyC2DUNQ73GCRhs0u05pkplR1CKUxuC2R
   Mp8EwQJWfbtyuVCrsRLFZOFLGovJ0p4MEXGWAYpI+vHoxsb+Ed1DQptjN
   hr9k4lq2Qefa9Tc/0YlRFFekaz19i7pxrILCf9xGnyNzfTYTgvOXQBVhh
   emfe+UXVRFckf/mOk9VbYIpY4Md1/ELjOi//l/y8PoCY0T+vHLOS/TBBN
   w==;
X-CSE-ConnectionGUID: CpIwt5ckS3WBg9Dse8GkCw==
X-CSE-MsgGUID: Uj06lZjWTKSe+CrIOaLMmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240265618"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240265618"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:10:59 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2AEDA1002BAD
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:29 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id DA24EC041DA
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7B643140008D;
	Wed, 13 May 2026 04:10:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/56] python3-fsspec: upgrade 2026.3.0 -> 2026.4.0
Date: Wed, 13 May 2026 12:05:23 +0800
Message-ID: <20260513040555.377-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126914

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fsspec_2026.3.0.bb => python3-fsspec_2026.4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fsspec_2026.3.0.bb => python3-fsspec_2026.4.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2026.3.0.bb b/meta-python/recipes-devtools/python/python3-fsspec_2026.4.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-fsspec_2026.3.0.bb
rename to meta-python/recipes-devtools/python/python3-fsspec_2026.4.0.bb
index 4b81c6040f..794d7d9be5 100644
--- a/meta-python/recipes-devtools/python/python3-fsspec_2026.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2026.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/fsspec/filesystem_spec"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b38a11bf4dcdfc66307f8515ce1fbaa6"
 
-SRC_URI[sha256sum] = "1ee6a0e28677557f8c2f994e3eea77db6392b4de9cd1f5d7a9e87a0ae9d01b41"
+SRC_URI[sha256sum] = "301d8ac70ae90ef3ad05dcf94d6c3754a097f9b5fe4667d2787aa359ec7df7e4"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


