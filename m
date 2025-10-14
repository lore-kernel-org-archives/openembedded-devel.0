Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB815CCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:21:18 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.11124.1760433666119887066
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DH94NQO/;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433668; x=1791969668;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rQn/sji0hmxKhoTC/VpqFDe7wym6RlZjGcyA0WUXcqc=;
  b=DH94NQO/huEYWIYfkTIxCqFHdfyOoZtch/qVXhfhT+uysgrhbnRFBl6R
   CFC3zA20CaU4J7HnS3C8Hkf0wdbZNkSQko7zlV8Jl1T/ZAOI5t4FCY0wO
   8Ea4js8YwUllZ+bfEm8VyDP/jbgSFiR3aMTT7YTpnzkqKxWHvnOvcigLB
   WwZNlFmfzUbumVQCrXQnoQEzOTvPFxkfJuhhAT7zQXN1OT5+07ucM1QpD
   AcDZDG/b9LrYXHQWNwqucflnn5cZiuwM7DMWdOLay70ryHucRwMswt/SN
   c76SnLdQSS9v3yicXlRlh9w5lGfuFfBCeUGPmEIceNbt1gSDen8I4sLWu
   A==;
X-CSE-ConnectionGUID: GBhJ8IUST9KKjYt0dBH1eA==
X-CSE-MsgGUID: J2Ua6TptTK25Bc0j6Gs03Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="203831887"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="203831887"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:21:08 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 434801C1C710
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:08 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id E7E40C0033B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 59643101BB76;
	Tue, 14 Oct 2025 09:21:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/44] python3-sqlalchemy: upgrade 2.0.43 -> 2.0.44
Date: Tue, 14 Oct 2025 17:19:20 +0800
Message-ID: <20251014091927.493-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120594

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.43.bb => python3-sqlalchemy_2.0.44.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.43.bb => python3-sqlalchemy_2.0.44.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.43.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.44.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.43.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.44.bb
index 692bbd7712..5bbd79a93a 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.43.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.44.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=061025f14213ac2818ff353223d6eca6"
 
-SRC_URI[sha256sum] = "788bfcef6787a7764169cfe9859fe425bf44559619e1d9f56f5bddf2ebf6f417"
+SRC_URI[sha256sum] = "0ae7454e1ab1d780aee69fd2aae7d6b8670a581d8847f2d1e0f7ddfbf47e5a22"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


