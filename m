Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD23C83F3B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:41:24 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.15847.1752648076684075096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Zx8lGnaF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752648079; x=1784184079;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2SSEdy7wffN//a0J2Y73RPqMiwreUJDPPlLzQtT4RK0=;
  b=Zx8lGnaFF/PRAxlFUwfHl8qtnTR/2wdLud/9w7tdnZ4E1aTbApMOIWGz
   9AFJVldFy0HdALdlDkK6iW9jTuYQj0/e/vADPtpv2PZJ5UVx60fa85rYP
   vzFVzOnKYzG1E5mM6urkIbWcZa5kkV40tV7gcdhFionhTBpZHN06DfPXm
   XX5tfTQlc/PObIXQ2crpV5oKRWaN8JuZJjrM9h2UfyLm/XgdmPBXKJRpS
   /VMFDVzy+sVlQOLko0YLbXVm9P1oTwmntOfuZxmF3mnohzcSmuNcOSlyI
   a3j4lDiBHsRmFoUU11aUQCLU5Fd9LqlvsoBmD6H9g8CUk0vGTie6GAA2W
   A==;
X-CSE-ConnectionGUID: GUGhQ8HTToy4v1Dkgd7Hyg==
X-CSE-MsgGUID: rEhTLMbLQQqGFJrYqmhAZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="206512967"
X-IronPort-AV: E=Sophos;i="6.16,315,1744038000"; 
   d="scan'208";a="206512967"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 15:41:19 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 5A0641C000A1
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:18 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id AAD001C001AB
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 256A91A0071;
	Wed, 16 Jul 2025 14:41:14 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 07/14] python3-alembic: upgrade 1.16.2 -> 1.16.4
Date: Wed, 16 Jul 2025 14:40:55 +0800
Message-ID: <20250716064102.1813-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250716064102.1813-1-wangmy@fujitsu.com>
References: <20250716064102.1813-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118576

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Added new pyproject_async template, combining the new pyproject template with the async template.
- Add "module" post-write hook.
- Fixed the rendering of server_default=FetchedValue() to ensure it is preceded
  by the sa. prefix in the migration script. Pull request courtesy david-fed.
- Fixed autogenerate rendering bug which failed to render foreign key
  constraints local to a CreateTableOp object if it did not refer to a MetaData
  collection via a private constructor argument that would not ordinarily be
  passed in user-defined rewriter recipes, including ones in the Alembic cookbook
  section of the docs.
- Fixed issue in new pyproject.toml support where boolean values, such as those
  used for the recursive_version_locations and sourceless configuration parameters, would not be accepted.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.16.2.bb => python3-alembic_1.16.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.16.2.bb => python3-alembic_1.16.4.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.16.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.16.4.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.16.2.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.16.4.bb
index a40a594522..f6df3131ed 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.16.4.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2ee18d90dcc02d96b76e9e953629936"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e53c38ff88dadb92eb22f8b150708367db731d58ad7e9d417c9168ab516cbed8"
+SRC_URI[sha256sum] = "efab6ada0dd0fae2c92060800e0bf5c1dc26af15a10e02fb4babff164b4725e2"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.43.0


