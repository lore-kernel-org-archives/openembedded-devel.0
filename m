Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8857.1792580479278404188
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ifPXSf5c;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e10a70540so337415f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580477; x=1793185277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHLS4yHE3TYbkGEWwmVse8RfSv855VQcACfVOgr2sFA=;
        b=ifPXSf5c3nhuv1FRN3xXqiVKfv38/bq+uQsm96EsxY6deJg+oavmJ1rOyHTYCB+7QC
         liY8WKPlIXpo1kkPlBSz6R8VOyzOs8d9fp3f7lEso4s/bFu3PaRlWsLZwUcZWGyxBBYR
         iXVRLo7f/1vrN3ijQAWfmHUZy4p4lTvGRxDs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580477; x=1793185277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHLS4yHE3TYbkGEWwmVse8RfSv855VQcACfVOgr2sFA=;
        b=2gGcugzHSzO82NafUooBwIU8Ck0VpxzclB7By1ZaCo4oOI0Bh+k8ExTmjtEPn6aUzu
         D4BQ18OinVIuM6Gu9N4wngt4PB7fo/TA3ZqaD3JG6aXALf/ZtXjrkOBfy0vaFwOj0CAb
         RP56FY1RDHpR+xEntBb7DGKwPSWGbQAwfXnbWgKV/PiXsLd53cwMSxHa6Q4QWOvkKz1c
         14uICRlc24zgiBHU0Rf5lvWeEJw91zYNQnaXJJVvwhhod2B6bvHo5JIENXH4Ce/iszAI
         TdIg+LYtXcHh5/B04G/+PvzcVnfQeoafyWj+Zln7QdbHXaG/6+eAPVUuxy4v/dk6K+wM
         pgig==
X-Gm-Message-State: AFq9FYL0UiJcseqZ3EomTlOH5iNd8ukyV+08qdmqKa66nxqu3Gx54xvL
	N1v2c0eIE6d+Hh9ILNMuhj6YeXuTMAf8noVafCB+/l0R5eayMeKUzx7Lg2WfkHq1Xqmgx5Zp4zW
	kTYby
X-Gm-Gg: AYBFou1hTv8uVI9O9No31EYMd6SDdz2PSoSxiKVhXeUv954E11KrwoHbACy1AR0xnwm
	IN9QdxKKLXquWojK2oDOkaujAXGtByxbQ9gLWUnJ3j64s1ssyEYwqdoTHa2t41t4CpvK4s+0wp3
	/08CveDhiEw6xt5WK1NOefeWMd/xT2lQtMBRl5gfcklTYALhgJmgv4YuCbrfXk3s681N46UQ6Cv
	LnUEAg67xlKo0FBXXidX9uf6TpgMmE1ZKMGU2kUmLF2Qd3PHaTyutUJuF68SuyYQ5rCtF6qv9TB
	F6qbg2IlxLZmwpqxKXot0AFLYvAfel5h9KjC3FJHj2C8nXlKxz3z1B19H6bRN6ww0+oq8pIy5ct
	HtxTbjgx4Z1VVzx+BmeTjPc3J1qb+0zGNW5+AMhIv37hS48wN1bgn06T4f0EkFCgvQievgRzkB6
	DFIGOLvY4RuRWV7wI9DqI1wLEkuHLwRmbNca3mCSyofPYRAgz6B0DKgAahXZyXS/Yf47pd1KC7J
	s7VgJ7GxkQbLPAmEImcflI0x9DRXifL4eJE2+g47faM+uxYDvHOyK8X3aSnoTaqcrakuy2HZPHQ
	YOqWBKoiojFWjCOL77qxroeEspFXrIj0U1SOsXnlCV/pk1CgVJFpUeueNE1vbA8aaedPiOAkvLf
	cTeok
X-Received: by 2002:a05:6000:41c4:b0:48d:f14a:9173 with SMTP id ffacd0b85a97d-48e26424471mr3324573f8f.8.1792580477230;
        Wed, 21 Oct 2026 04:01:17 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:15 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/36] python3-dunamai: Upgrade 1.26.2 -> 1.26.3
Date: Wed, 21 Oct 2026 14:00:29 +0300
Message-ID: <20261021110103.1943456-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131264
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.26.3:

- Fixed: Version.bump() ignored the increment when a stage had no
  revision.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-dunamai_1.26.2.bb => python3-dunamai_1.26.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dunamai_1.26.2.bb => python3-dunamai_1.26.3.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-dunamai_1.26.2.bb b/meta-python/recipes-devtools/python/python3-dunamai_1.26.3.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-dunamai_1.26.2.bb
rename to meta-python/recipes-devtools/python/python3-dunamai_1.26.3.bb
index 3059f65b8c..00d3198a9b 100644
--- a/meta-python/recipes-devtools/python/python3-dunamai_1.26.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dunamai_1.26.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Dynamic version generation"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=059eed55dbfd3fea022510ea62c95dc1"
 
-SRC_URI[sha256sum] = "84ea45eddf9bb4b40df7610b1b22a03137365e6257dbf9d7b72128fdccca564c"
+SRC_URI[sha256sum] = "fe2f732186710ee5048044fdbef6c76c6afbb9ee7de4f6d00cf34256e9ec2e7f"
 
 inherit pypi python_poetry_core
 
-- 
2.47.3

