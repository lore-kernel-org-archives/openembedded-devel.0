Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0F9F588F5
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 15:49:27 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22599.1776700160029753908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 08:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H4vbTc8q;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso32643225e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 08:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776700158; x=1777304958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2YAmWL85/q06iYNragak5VPFjwzeLYJ8lec+3fi8Ew=;
        b=H4vbTc8q6O9YAUGeRoASvePf7Bs6zHrdXzxVVO5XcG9RUJuR5Xr/ZNLbdC2bZy88Hp
         +5igyeoZzlIcERhGe+utTSCPEbH2WRA/dpIrrmmW2szw52Fm9+4ecQw954VnWmf7PqOZ
         X6N00ADmcZFZ8BQjLp+bpZslmEzA1LtyOg9ddlxZWq2eFTJVbBjUKDUCaQf2qW5ze4xX
         uDRmLkE5HIzLGx+jB87l1qG09+mLZpk6eNFkoIwN7rIh8pJrcDWOrL3h8OzkGyTBeuQR
         Hb2IS4yB9P2ydXCpFRKWARScqRZNpeIIk6CuY8Es1arzjOsEcB05qG9QnRXjaGvKhCes
         sSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700158; x=1777304958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E2YAmWL85/q06iYNragak5VPFjwzeLYJ8lec+3fi8Ew=;
        b=Jj+hcJz+7Gzdhu9NHsT6zjFzZYhzWN+hXKt1cOPBj6nqhJsmw/QctN99k94aIKQM0/
         fhA/Xt0UXnglmB46ZbbkjKCKqmmHN2X0xRfisMboHfM9QdnL4BZjBTMHj9uWuIXsCvsv
         NHMODKzZkE9+W/fPqYAEZvtLGsbdRwn3WqLTuZWdkUyAVX78Vw99wqyIxDEigP46fJXU
         M9wvBKIXU/C0ejJ9UF8B4tUJnBHzAK7o9uQwctegUs6L3T3WyuKY0UXDg/ldgWn40mBM
         yFiFz3yrQkzOyhSr9Z16A2y+O66XiSArws02Hd081JTW26wj1J5QT+R38to2HZn3nm8d
         1mFA==
X-Gm-Message-State: AOJu0YyeshMffZZztxzWnrkYF1ZfrdSlXazGx2vUAyJMi9Xcgx0yZk6s
	pPB5QT5+oEk6oRyAdRoOSYnWRA7RYbENGxMZe0e/mp0Sr0/U+FtK/KNFZXrtkw==
X-Gm-Gg: AeBDieslwTcjNJm/LvOFTJehutK4bvMWKpYY0A2pDOmnbKNtGQNekvrHQbrIovTzkOC
	gBKJABCqtIIYpkb61BNh2cghAU17n4bwcDJlMYb2IeJ6199UiI5D6hgntUpGEXdam9dB+K7F0hz
	ogUfqXowf/WXVuwk3Nj6nWncZ4RCmlgFAm1WMrDC4IQNeyTGiB3hiQDs4S7TjqnRrkbBEH7zHqS
	Ni091fBo4op0scQnfDSsr8NO6NxMcOP8Mr9JQOz7SVE6qQlBpxtx1dnSOVQ+4J4mTwWJjoEnaKa
	9sr5lddeVGr+LjjmdGyR0SeF5bmZouEELUKVgeBcUGMxTdxYN0Ca1ro/V8yZhmtb3ZyEIFIve7J
	yH/+LfpSXFfCnL4S5tQd3p+70RsqtvBUBENH4fw6PJ7+W/H/Q37mbbnzgB6UHneOIjSto1ZNsVF
	Gz+1a4n9WCxq+szCv/ad8dWS1Tsl4Qpo4=
X-Received: by 2002:a05:600c:46cb:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-488fb7451e4mr197787745e9.5.1776700158256;
        Mon, 20 Apr 2026 08:49:18 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm85279255e9.9.2026.04.20.08.49.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:49:17 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 03/12] dnfdragora: fix SRC_URI
Date: Mon, 20 Apr 2026 17:49:06 +0200
Message-ID: <20260420154915.952359-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420154915.952359-1-skandigraun@gmail.com>
References: <20260420154915.952359-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 15:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126506

The source branch was renamed from master to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb
index 671b8ca933..a25676f0e0 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504 \
                    "
 
-SRC_URI = "git://github.com/manatools/dnfdragora.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/manatools/dnfdragora.git;branch=main;protocol=https \
            file://0001-disable-build-manpages.patch \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0001-To-fix-error-when-do_package.patch \

