Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A5ACAC584
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8063.1756890233999112732
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q9PEBFdw;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890235; x=1788426235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KHxZQTtylCxqYSX6Rji+a/Ji+arpZGZ6Slyaxz5aiVQ=;
  b=Q9PEBFdwzVku3lCtygiZH/yV5P8i/oB30izu1ZPNh+y/QEc6QWdHzUFx
   Xs80KK77v+MdwWEV9h4lo4ySRQFUxgzrvg3Jbw5yuy2KF3w+mkBy+zaUA
   GlIQyrT46CFotXvvFN/R00X30Fs7OB1yD7OomxSN7s1S4i1CEDK+xO1R+
   qw9v8wtZnnV2g4/OFsjrm4EStaJhrR+4Pa54erUCLIlMHXkcNP6qjOmuB
   FPAibB5qQh9fntCwnreJ2wRuTq8jte2t20sZElXbQEdLcsoRatQpvx2ct
   j52rBF909zpaDv1XJmjO9SbeYEV7mAlt75qH51ejmyzi2AmErNo0xUFJt
   g==;
X-CSE-ConnectionGUID: qCj7g2E5RfiR4AHk8h4xhA==
X-CSE-MsgGUID: V2i2ZbcKTI6JkL1XNnFy8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="190432412"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="190432412"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:54 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 3A9021C000BF
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:54 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id E9BD61150725
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:53 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id CD1D18212E9
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C92931A0071;
	Wed,  3 Sep 2025 17:03:48 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/56] python3-matplotlib: upgrade 3.10.5 -> 3.10.6
Date: Wed,  3 Sep 2025 17:02:59 +0800
Message-ID: <20250903090317.2002-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119234

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-matplotlib_3.10.5.bb => python3-matplotlib_3.10.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.10.5.bb => python3-matplotlib_3.10.6.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.5.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.6.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.10.5.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.10.6.bb
index 6c4d496c02..578a6b9945 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.5.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.6.bb
@@ -22,7 +22,7 @@ SRC_URI += "file://run-ptest \
             file://0001-Do-not-download-external-dependency-tarballs-via-mes.patch \
             file://0001-Change-types-for-width-height-to-match-definitions-i.patch \
             "
-SRC_URI[sha256sum] = "352ed6ccfb7998a00881692f38b4ca083c691d3e275b4145423704c34c909076"
+SRC_URI[sha256sum] = "ec01b645840dd1996df21ee37f208cd8ba57644779fa20464010638013d3203c"
 
 inherit pypi pkgconfig python3targetconfig meson ptest-python-pytest
 
-- 
2.43.0


