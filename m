Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28586C54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 13:56:58 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.166743.1673877416864962403
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 05:56:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=SuFkXULL;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8R+v2xIA1K4ttgJ6TjTKe5d7FLiCvlfiQalgzeZlYnw=; b=SuFkXULLgCPmNDb9iGrsL+DaHN
	svRN8btTkd8hUpKPHTTOIcOlIRgCySAE0zPYDohjCWKeSBLDfzFI6YYfN82+aZ0rT6uyOEeiIGwf+
	EXgkmpNRIeV8H2jjnpiEty+vG+HvkSQv7vHljneyV/8l6n6FOsj2d5ef/bfhdClVyrPMHOjiMpLNK
	n+n4JkUZur/XILedfuEETsIh28Hnws189abnWS8hbhk/zRXuF+1bTmoOPab+FUA15oDW/59T1g9CH
	MmKmJ3g4UVp754ENWHN/gL5km2IW5hbVnrYNMxdoGofJ0TkKaNzgzNM+xjbNinBU+hLb6Ds2Fz5Ds
	5FuWhKkA==;
Received: from lan.nucleusys.com ([92.247.61.126]:53414 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pHPzF-000B4g-DJ;
	Mon, 16 Jan 2023 15:56:55 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-alembic: Upgrade 1.9.1 -> 1.9.2
Date: Mon, 16 Jan 2023 15:56:44 +0200
Message-Id: <20230116135645.2836536-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
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
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Jan 2023 13:56:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100583

Upgrade to release 1.9.2:

- Fixed typing definitions for EnvironmentContext.get_x_argument()
- Fixed regression where the string transformations applied to
  server defaults caused expressions such as (getdate()) to no
  longer compare as equivalent on SQL Server, others.

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-alembic_1.9.1.bb => python3-alembic_1.9.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.9.1.bb => python3-alembic_1.9.2.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.9.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.9.2.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-alembic_1.9.1.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.9.2.bb
index 03a38d5ff..0d83f86c4 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.9.2.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f5a8522010db1a393833988dbe2c7f0b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e3023b042cb6002cb398344b51c67093"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f9f76e41061f5ebe27d4fe92600df9dd612521a7683f904dab328ba02cffa5a2"
+SRC_URI[sha256sum] = "6880dec4f28dd7bd999d2ed13fbe7c9d4337700a44d11a524c0ce0c59aaf0dbd"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.30.2


