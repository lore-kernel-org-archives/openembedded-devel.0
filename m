Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F70E9B254
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 11:44:39 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18536.1771933477770578511
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 03:44:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=V3P8KX8e;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43988056dc3so418784f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 03:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771933475; x=1772538275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8BaBkeXGAswk9cmZQF4MRIJtfNBdvSwiLhp9dUDoCI=;
        b=V3P8KX8eRPP13wg88KAreHmPx0hcuFpNk0d/p+lwm3MwkPcf8SUD7SHY0S7zE/5UuO
         hrzOZniwOpHdPpXRD5XsOtzRbSYFT6GkTEZ6OYQtY6aQenG4mPkGYKMyyVGPtoyXVOoo
         7Bdbs4c8Gh+FyoPw9YpbaEEqtjCKi2i9brWl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933475; x=1772538275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8BaBkeXGAswk9cmZQF4MRIJtfNBdvSwiLhp9dUDoCI=;
        b=ZhQS3cLOuITBAodhQOHHCpnQIueZ5q23L3JP61355KoQWhtXczSxbyoxSMFWcePq4D
         gelXyR0V4cv81v82erYA01h9OEFHRCuuN9H6+EeIu3N82TDm+Z72+dnEF2ySc8tktk1L
         hlPfAXgJAj/hD0WAnPFZD5Q0VJ2NrxVq7Dd6a/lup69Qreq3tti1+N4hXBxhy2Jy0+n5
         InE9tjL/AA6bcnGV7s9Rf5QZTkI18/RdxdejohIW579eZV3MHXcjJtz9e3zCvBQB7aL7
         sPf83y2A6vwOnbB9Q5f3TNVZg7M58LI8Tv8n8yr0+hSeN2M6HXwR73zRPsKDnazmFVrI
         dV0w==
X-Gm-Message-State: AOJu0Yw0g5yx2v7DTlrNUhOSFGbHuin8vbJrqT7oUhVFb25wPID6+52i
	dO73HTZBdc5JEn/E5rMFDh1j9lzT9V9HhAyPiRnWcqg5VH1TGiRU5LOrf9ygQMkQoAmsbrP+pS2
	Qi3iL
X-Gm-Gg: ATEYQzxrg2Gcny30whw5fhlVmw3shzKXaKnNRquN040AgzVfRObk1oZLrdIhGJJvBvy
	KR/qUcqQB1gS4aWvpvo/tfZ5yogjzIZbp6+LKU5j1I1ULNy/2O5aVdhkXI5XRzHJQbI/10JrmYD
	/jmqcowkl8JFG7F/An2RpnSNnLPeABu4SqM93A9WaSp8oysxLqZbxwT6AhZrgvgprkBIapr9gNi
	ZNx86JCSibZgcTb5ahiaKRurOs1lfnUF/7k2pefyoSxMc/sbsjrkwS1Q5H4OJbFl0lJh+WjoUo+
	+lGWg+s3iZ56Ma4i/7nyAnF65RQGMlbeivRzRszBHdw3aeBWqGzesoqB7i2JqhCSaTff3nfbpWb
	FDKH7SU1PzvfQOe/XrnJlB7qmJbgRB0IOK/ETmzV57GLUSEg/59f4v47s9xQK9UfNT406KOo97c
	A+hZUY6nanuCn82Sy3CI6UzNV94ZP1LPtKfvk4F1EWuqouJm0=
X-Received: by 2002:a05:6000:2301:b0:437:678b:83c2 with SMTP id ffacd0b85a97d-4396f189eadmr21102777f8f.54.1771933475345;
        Tue, 24 Feb 2026 03:44:35 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d0csm26721126f8f.11.2026.02.24.03.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:44:34 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/8] python3-flask-migrate: Upgrade 4.0.7 -> 4.1.0
Date: Tue, 24 Feb 2026 13:43:42 +0200
Message-ID: <20260224114407.1760757-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224114407.1760757-1-leon.anavi@konsulko.com>
References: <20260224114407.1760757-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 11:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124575

Upgrade to release 4.1.0:

- Accept arguments such as --directory in environment variables
- Fix minor typos in documentation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-flask-migrate_4.0.7.bb => python3-flask-migrate_4.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-migrate_4.0.7.bb => python3-flask-migrate_4.1.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.7.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_4.1.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-flask-migrate_4.0.7.bb
rename to meta-python/recipes-devtools/python/python3-flask-migrate_4.1.0.bb
index bacf7851aa..7cdada071f 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_4.1.0.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alemb
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
 
-SRC_URI[sha256sum] = "dff7dd25113c210b069af280ea713b883f3840c1e3455274745d7355778c8622"
+SRC_URI[sha256sum] = "1a336b06eb2c3ace005f5f2ded8641d534c18798d64061f6ff11f79e1434126d"
 
-PYPI_PACKAGE = "Flask-Migrate"
+PYPI_PACKAGE = "flask_migrate"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
-- 
2.47.3


