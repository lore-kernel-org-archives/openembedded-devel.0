Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C087CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:10:48 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.122.1778645439237272746
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Yf8nZYde;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645439; x=1810181439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8JsM7yHtd90ccCzokW2fDB4oXxH+Erhz/PKW5Geavt4=;
  b=Yf8nZYdenRwXV28J9Vdiq/L2JBUc8Qd1LxXZkhao8KrkdEMbbpjcfiWk
   xkTjpTqTpd95lpv2tX+u0iUhWK0H4tdTxNkq1xRdEhQl4cc63OkYRohOW
   HeY5aaxQNVBihAmlL69uM8QwcbKkS6CeLYWtxWv4eTJvvZ9W0Q0Rc/+iQ
   0FEz1XEu0qGiTXJDAOgCTSpJU8zMwxq963aZF0oDqtO6JN0oF86qM2ZiB
   eqqiKwI/fVeiJDY9t6OwDjOSATsTveG/lBAtmPlUi0yshM/Y5Vmn8guDR
   XXS3JgheobZKt4JB+nd6VRtd5jd1baQpbN1/0qtqgZ/nhPYxFemdmTxHq
   w==;
X-CSE-ConnectionGUID: FDCjgoPFQASJowFMmcTKzw==
X-CSE-MsgGUID: EUZYq45LSaCA857nz7cIGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240206604"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240206604"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:10:37 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B332D42A31E
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:37 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 5DD171009E19
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id D4B78140008F;
	Wed, 13 May 2026 04:10:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/56] python3-gunicorn: upgrade 25.3.0 -> 26.0.0
Date: Wed, 13 May 2026 12:05:27 +0800
Message-ID: <20260513040555.377-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126911

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gunicorn_25.3.0.bb => python3-gunicorn_26.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gunicorn_25.3.0.bb => python3-gunicorn_26.0.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_25.3.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_26.0.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-gunicorn_25.3.0.bb
rename to meta-python/recipes-devtools/python/python3-gunicorn_26.0.0.bb
index cf41feae70..449c9685ca 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_25.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_26.0.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "WSGI HTTP Server for UNIX"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dc9171ccd8fcbd7827c850148b3ca98"
 
-SRC_URI[sha256sum] = "f74e1b2f9f76f6cd1ca01198968bd2dd65830edc24b6e8e4d78de8320e2fe889"
+SRC_URI[sha256sum] = "ca9346f85e3a4aeeb64d491045c16b9a35647abd37ea15efe53080eb8b090baf"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.43.0


