Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0391CC6B1D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 10:22:29 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10219.1791973348889876951
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 03:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CHMxYiAV;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so627072a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 03:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791973348; x=1792578148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQzQfdIgmo6wmChrjnmmVoUDd8CduXKDBYBOGJoOOUs=;
        b=CHMxYiAVi9EmvxIG7R2RcWnARjsNCX6SIBT+Tf8FLNYlqHY5tuiPWcPjpUIBwc0BZb
         5czPc0VDd0ivhcEC5T9Gjj/+nXg1sZYD+Dyo3IloWI4cqbfFgonuVDhkqKKE4+j6jgRE
         7RRyKGPbmntdhEccQSh0XliypkwanEG6XoNvBivQzaEDPAM3XeQzUocf0bICi5ZuUqj+
         5vIPq2S262nGmnq9zYpPQQqKEqDT8Pa1gxTRcDUd3+fcIvsTLCZxazaA3CTcZxMJyz/+
         mJ/JE7DDjwGMwNucSortiPB2CV4C+b72t474ag/ZYiLVUw8e31TXqWkj60fJEeJHdpna
         fO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973348; x=1792578148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FQzQfdIgmo6wmChrjnmmVoUDd8CduXKDBYBOGJoOOUs=;
        b=aE32SQ/KGCNG6J037Jdeo1ayrwaMfvb41rIwvw0wFozTZKHEYri3tnZNePTqpp7xxc
         9Q1wR5LJO233t8JDkXePRcMxfvP5ySJNmrtuZP0aiO1/J6xncKJL/DRIxE8BoJ/5bhBa
         gKgFOJlGws1FdGqCuIMkIQKv+kVycGmADgB3WqL+Sx5Fv6RXB9XDN80Gh0syCG5TR3oi
         nK/mh5XvhBWY2W9KW20cw5G1Bl5miTyyDOXI6pijBXzB7xXOpwOOWXBYjObBXSeZxoE1
         C2puQZcmcCIBvBQLiHAcZqk8xMMP4maaxxsbOAy+odxjqOsbhPhBqQ+B6TY8O14tiSoR
         FUUA==
X-Gm-Message-State: AFq9FYJx9aYha8opypcBkxEjlZDpIO40G/y62Iu9AXxThDRomugCq30P
	RLdISZcKKg2VljCORIMPaASGHq3PjdkSO04IXkOMDnJCZ6dHrWCLY047X8z/3Q==
X-Gm-Gg: AYBFou3FDbnaDkpqb5NvpogZ4EIbm1+kSSUPupNGQe7oV4LtIbZDh85QwfK+/mQJycC
	lum21Rnk2hOptrJ5Z/3j28BU7KC4W8Rptz4JHLB5aZB57Xv8SlIOQ/0fbMS93lXkxZyoe86gHAx
	t7oG2QF3iFTTGLZm/OyEBKCFh1Mj4TgdXpT2A+wMqTPE1rkK/ujh7ouO0TLSLYjEjPTaOU+PMiM
	SGNQhStk37zRT53tSP6Ptiwr0j1DDZveNDUAkbfV8PrzpYrgC2Li9aspp20biyj5T5UjAASYQUt
	sZswh/dnbBF8DYYZDc0m6MG0p7Xipmg/viIv/domKKifhs/IqGZaNUpXCG40K7/gx2DpBGzNXrt
	gH5uWoe0l8nef1Pzsl/f4S8G/0+NGgXm1XVzgpv6k2BhviuQ7vfBQ4J+LMPJGAYxeKvAFwYK5sG
	t2EO/ZZFAkn9qfOM7zRsz5hmUQBrwsTkkWuM6oxKn2JlbFH0niI7Dq8cYI08e6WeuEQ+tvVdAyb
	NvVjzYXQyiFwjUMoQ2en3AqmEVarkCGBVOF5Ng=
X-Received: by 2002:a17:90b:5807:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3ab3a9dfda0mr11847180a91.40.1791973348167;
        Wed, 14 Oct 2026 03:22:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61170b7bsm4017740a91.16.2026.10.14.03.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:22:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-python][wrynose][PATCH 2/11] python3-tzdata: upgrade 2026.4 -> 2026.5
Date: Wed, 14 Oct 2026 23:22:08 +1300
Message-ID: <20261014102218.880640-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
References: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 10:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130888

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/python/tzdata/releases/tag/2026.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 01bd918ea8c7a391e977b9ab409605fa7fc5d953)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-tzdata_2026.4.bb => python3-tzdata_2026.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.4.bb => python3-tzdata_2026.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb b/meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb
index 91679e8bee..ef78b4c2fe 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=804220b73c90950be376e7ff7b2066bb \
                     file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     "
 
-SRC_URI[sha256sum] = "f1b8bd365d8d210c55353f4d7f8d6d8561c0ba50d704b700d195a9424bba0d79"
+SRC_URI[sha256sum] = "8cc73c0a0bfca7dbfa59235d60b2eff82231dee33f53d206db1acd9173cfc0a7"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

