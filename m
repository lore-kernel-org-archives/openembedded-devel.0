Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448F0D3F29E
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.30096.1729278824400456666
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G5jC0YDd;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e290554afb4so2463553276.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278823; x=1729883623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiVRhq6K4kIqPEp+Pm4fqoww5prRi5OddxpRu0DYsQQ=;
        b=G5jC0YDdxvFgAJReHIT+228Q0B5Azkkn2PoMv+kSMnaE7IcznNA1Nk/lGnOpFlzxF2
         2inU9wgKnX4NyWQCdpng/Gg62+ajeAMaRqyItNL2GvgOggRdhpejFQHA6PKEDZRt667h
         85nHumxnlKkHlskxtB6F5mGFVW6RWDhZD1ScWZIZ0gxP9+ddrvaRXSRMIjQFeWkehHXL
         cj5xJBbvnphrIODu0Ve4iZGHzPNFIMLWnZ8BC1KM2T27y77qsJrUb0pwSRyydHAaiEaV
         mbnIxe2wiJQfn1BpQvWABgPZjybM6tGPBfCmOQtegdPrHrgKr14rt/+u5tQNfEYepTe5
         mLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278823; x=1729883623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LiVRhq6K4kIqPEp+Pm4fqoww5prRi5OddxpRu0DYsQQ=;
        b=un1PlrbATvmtKQWFIxrJGE1CFTig1P41APBEK2wEWt6NGErxonZbD1yxdOv2ObWISf
         Yo6O1Ae2R0h+5927o7TLgGV7JIbrqGbNHOwpACfImkIh4egCXjvPJte71m5SnbS8lqG0
         cNjP8owqk7VMksfYrua0euE+Q4R4ucZSwYGCTBvQLtvo9ER7ygNWe287847Hhn40WnSo
         XKi060FtrWP/cmNgD09qrN6zqPYzy7k2ZVIEpRRHKC2Rz8JqfjaYbHzH6uTPyXc4tg8U
         a/KQGYMAINVqiOeHRsD7+1S9hewlCzy4DAdvL1wnLy0Wa2ShDNH3iyKqYSxEp4y584G1
         m92Q==
X-Gm-Message-State: AOJu0YwW4thpd3MtkC4S2FMuqmtHfYsDDLUFh9gtM8bmJoIRNDRValTz
	rwSgs0cqKEjHZZ5nyYrZjNwiavH109brGE58IUfncHZWuy74PUENOadzUg==
X-Google-Smtp-Source: AGHT+IEnymPTTgh3t8OVtqSjIEmFeSSXx0NBdcG9xGdaUVHMdIjxAfX/xBnsUwad0vrM3qDDpiE7NQ==
X-Received: by 2002:a05:690c:3391:b0:6e5:bca9:cb8f with SMTP id 00721157ae682-6e5bfc61846mr41614467b3.38.1729278822966;
        Fri, 18 Oct 2024 12:13:42 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:42 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 50/68] python3-pybluez: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:37 -0400
Message-ID: <20241018191101.25184-51-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113037

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pybluez_0.23.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
index a38e10eec..188700be2 100644
--- a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
 
 SRC_URI += "file://0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch \
             file://py-3.11.patch "
-SRC_URI[md5sum] = "afbe8429bb82d2c46a3d0f5f4f898f9d"
 SRC_URI[sha256sum] = "c8f04d2e78951eaa9de486b4d49381704e8943d0a6e6e58f55fcd7b8582e90de"
 
 PYPI_PACKAGE = "PyBluez"
-- 
2.43.0


