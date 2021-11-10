Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B9FC433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 04:02:51 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web11.7448.1636516969680909047
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 20:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SQNOQGII;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636516967; i=@fujitsu.com;
	bh=7+TMNMcFT0P4isMxVkYHfo7VRjl3S+aOwISp1CXC/t0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=SQNOQGIIvJf2EHyYzLyPgS4tF13XIGD/V4EQeqaPM83Jy1KcUoSEF53LFjL+aa3qi
	 ZmRVLEofrb7AiddLRAZnTiT7VoB8EgXka+VvLZ6jwEWTQ1OzuQqQXnNYlP0/1rj/Q2
	 pV/Yizxr27IVQB11ojzEbs2uGLvMVqY2/5ND7v13E5i13/57HbniR9R4vprJFjUCSy
	 hJbR8zVT4KvfQh5dX3xJgSISeZ7NteYBR3dXr44hj69mtocmIVKALm9D+xX3l3EGe5
	 pguYMPsO2DwaFOcc6NWjFL/oJv38T1Vxn5zBIgf7+14zyenDx1jIQRtb6sdMjvNmNP
	 UCHKDvrxMOPEQ==
Received: from [100.112.196.154] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id AD/02-09147-7644B816;
 Wed, 10 Nov 2021 04:02:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxVTfNpTv
  R4OwKfYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePizFssBY84Kqbc6GBrYJzC0cXIxSEkMJNJ
  4uStHhYI5wSjRPvpd0AOJwebgJrE9Fs3WEFsEQF9iaWz9zCD2MwCKhIvfvewg9jCAv4SE149B
  qtnEVCV+PfsFxuIzSvgJNHx9wgTiC0hoCAx5eF7oF4ODk4BZ4mvd4VBwkJAJXMnfWOBKBeUOD
  nzCQvEeAmJgy9eMEO0KkrMvtzMAmFXSMya1cY0gZF/FpKWWUhaFjAyrWK0SCrKTM8oyU3MzNE
  1NDDQNTQ00jW0NNM1MjTRS6zSTdJLLdUtTy0u0TXUSywv1iuuzE3OSdHLSy3ZxAgMx5SCI9d2
  MB54/UHvEKMkB5OSKO8Boe5EIb6k/JTKjMTijPii0pzU4kOMMhwcShK86U5AOcGi1PTUirTMH
  GBswKQlOHiURHibnYHSvMUFibnFmekQqVOMilLivD4gCQGQREZpHlwbLB4vMcpKCfMyMjAwCP
  EUpBblZpagyr9iFOdgVBLmPeMINIUnM68EbvoroMVMQIsPfmkHWVySiJCSamDifhh6Kag4MTx
  UrMWx8mqFm2mZt+AGg408Zy1q9jq+mRfP477qScRq44ibdzc9LdlyM7BhdlboHImHfXavrKf1
  J6a2qv/yO90qeKj04iXBCRYV08Push22PLm7oF7w/g9B4ZPcIi5+iseTKuo9+tacW/vsldK9J
  41crpKKRx8XPtvu6L5O3/tn1PMcJ4l5PYx13hJRf37NmNCstVlC17741JVHk3+xuW96KOHzLm
  TZ+wK19sDS8jNnw8/qlhrLt7jw1TW6OVxaMkGyx++U7e8fPnUrfh0M1FcI1L5y6uzBiHVOX6S
  3ihqZHr4vy3M7Yi9z+pUDBeZb+v7cWpkYsPSAOufuZ/d7ZZ7wvz2nME+JpTgj0VCLuag4EQAp
  ZelQQgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-291.messagelabs.com!1636516966!52987!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28825 invoked from network); 10 Nov 2021 04:02:46 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-9.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Nov 2021 04:02:46 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1AA42fiw030412
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 04:02:46 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 10 Nov 2021 04:02:39 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-fastnumbers: upgrade 3.1.0 ->
 3.2.1
Date: Wed, 10 Nov 2021 12:01:37 +0800
Message-ID: <1636516897-63008-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636516897-63008-1-git-send-email-wangmy@fujitsu.com>
References: <1636516897-63008-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Nov 2021 04:02:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93897

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-fastnumbers_3.1.0.bb => python3-fastnumbers_3.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastnumbers_3.1.0.bb => python3-fastnumbers_3.2.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_3.1.0.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_3.2.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-fastnumbers_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-fastnumbers_3.2.1.bb
index 5c913ffef8..0db33052ff 100644
--- a/meta-python/recipes-devtools/python/python3-fastnumbers_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastnumbers_3.2.1.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517"
 
 PYPI_PACKAGE = "fastnumbers"
 
-SRC_URI[sha256sum] = "7cc4f96981ccd3cf212b6ea7b84ef621620b62da8b454f420aa2e81c8529e68f"
+SRC_URI[sha256sum] = "44f92b42e7e9f2ed77ba5cb7d664f05c17e43d4586718ed6cd3b3fffa0e67f33"
 
 inherit pypi setuptools3
-- 
2.25.1


