Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20586D116F3
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 18:34:56 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2927.1764527694322459969
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 10:34:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qf0X0DWr;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso5514056b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 10:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764527693; x=1765132493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W3ntU6p5T6Ku4k6zH6auKPQ3+56mA/IJYWJ9GvDdxfU=;
        b=Qf0X0DWrghHhov7hiNtdfg+5FB3e12UkaNG1UbO0ASIhCEvJ1+NvpSMAtvguvUZX1g
         eeN142pT2kE9iqIMQYsCIAgC0Xa0vooSYItT/fid/0yUsTxCmjrQpiFoYeFHEst6sO/q
         d2A9ceC0dAccd3XICRVgUguHRU2HoM6hMJIsCaETKl/+AIS7V7/241tZFCL/z9nrEBJy
         ViM0YPyYGxLPDQ/nhXAP+hScGHHaGLJPq3GPn4obEKqVjI/WEwt1/JpMSwAmocOxhHo2
         yD6d1z76RWm6/phNMIQPSXg4pr3+TMnQnZWI0bKoIrxfPsKQXqdE6GkCX6FeKSS6l1jW
         TsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764527693; x=1765132493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3ntU6p5T6Ku4k6zH6auKPQ3+56mA/IJYWJ9GvDdxfU=;
        b=rU7FeQZ37W4ohnRohVRAaEH1z1grnv3+Y/Fpu3hDJ+KCASSNXgnbIIDC4BdsBSCcyg
         xprYAUPkHjXTn7TWHwGhR2iS31UpD8JAgTu5+ecVSf1zpFTDEQEzG/NXBjyPLxFb+7ps
         FYN8PD378TsUaUu+tawWJ+ngr0B+s6eawoCNcI43ls5PYyMjk14859I+cLUZXyrDyys4
         bwl/cG5wgbeq7nkG6jnwQGhBRE5TC2K/bzn9lYybirWwzpGoi9S++V8ixOqqXf9PH8jo
         yn8F83otVOgo8DmknlGN4NXaD+2dmmWKg4lOf447bTxfWDMff+3b9dparY21WmSmVFHS
         GiDg==
X-Gm-Message-State: AOJu0YwMb+P5MO0CDnGois9fDp4mPQ713CqpPPuYQcaXFXvF91UEHCn/
	envzFDRsLCrkdRwMG5933mh1Fsevfn8OijKxfYAAfRU4eGVdXHnUt6I7lYT7wscB
X-Gm-Gg: ASbGncu1KNVjN6TGJa9GpfI4KwNImzTDJMM+McjEevg+Xt5VlE2NeGnVCu8+DAvfmHJ
	ZpVS4wjEULIE3/5He/yNYJ0PXALnUnYapBfQ8IWaZugMrDTokDPGs/3Dkc5tzwS9c7QEveb5b7L
	1iwWMDpfWw8SixP5fIaHZvLBiVqd4yoLaPP+ulQMYzgO8Ymtnt9YqnlSWyS8CJ3Se9u9nEhTyfj
	Xr4qllofQMLmIqEeo+qRGQL4F2Eqlf5Co6OdYFNYNxYFP247QBxb8w/u9lnb1izgjYaBdq/ZJD6
	d3N9JWzJy+QZT+CxKpVFsnMOTNH8VtnMuyD+gmkdpxDbPtCuhFeS6dFiYVds4W4a3qWNDxwd8UC
	uP5ru16TYlWBScUMT/7a0x6PFpSLzI0ZM3SUKrJprMugIkYui4o/noXUywHuSv7EztAMTO51CX4
	WqtFqi9i8VYxTBBEkmdsMKlhXiT6YpGj58IdJ8Hebv/1zGM9m+t5525nCp67WuyV5YqyaMJaZ/a
	bP2FVi6yCM+6Uh9OuiUEUv1aiQRy+7b
X-Google-Smtp-Source: AGHT+IFkXa3RRRk72Cv7L3zI33RHobS7tAe8NTRJt/WBebo3ZF8gq8MghrRwX18hpyYj9bNS2zpp6A==
X-Received: by 2002:a05:7022:f95:b0:11a:126f:ee7d with SMTP id a92af1059eb24-11cbba4c514mr14107409c88.35.1764527693191;
        Sun, 30 Nov 2025 10:34:53 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::821d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcae73bedsm46995380c88.0.2025.11.30.10.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 10:34:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-fastapi: Turn swagger-ui dependency into packageconfig
Date: Sun, 30 Nov 2025 10:34:50 -0800
Message-ID: <20251130183450.101776-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 18:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122170

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-fastapi_0.122.0.bb    | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
index 37a475ef8f..a5c9d257b0 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
@@ -9,6 +9,12 @@ SRC_URI += "file://run-ptest"

 inherit pypi python_pdm ptest-python-pytest

+PACKAGECONFIG ?= ""
+# swagger-ui is in meta-xfce that meta-python does not depend upon
+# Users can still enable it in their distros explicitly but its disabled
+# by default
+PACKAGECONFIG[swagger-ui] = ",,,swagger-ui"
+
 RDEPENDS:${PN} += "\
     python3-annotated-doc \
     python3-fastapi-cli \
@@ -18,6 +24,4 @@ RDEPENDS:${PN} += "\
     python3-typing-extensions \
 "

-RRECOMMENDS:${PN} += "swagger-ui"
-
 RDEPENDS:${PN}-ptest += "python3-orjson"

