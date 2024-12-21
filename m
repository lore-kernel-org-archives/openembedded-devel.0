Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FD5E7718D
	for <webhook@archiver.kernel.org>; Sat, 21 Dec 2024 22:58:12 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.15858.1734821882973748728
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Dec 2024 14:58:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F3ECfbbD;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so555356166b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Dec 2024 14:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734821881; x=1735426681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzyBL+xzxM7+Rnm9o2Vr363DYLNIzmRez82VEAnkutc=;
        b=F3ECfbbDaP8E/o73jxB5lZzQLO/pe1etc6FSw8EFgAX0u7jdqpXB9SMJs0WbrglS8s
         y13yObUYoCixEUIEUK/asfNHbnJWyfx2P9yce2DqLcLOrNut0xR1hYNsgOkX7jrkwc5v
         aRxq+Zy0qXtt8Fy7CVx0WXneiNZvJ9zUKyRztplsRNbT5qjmj3jgv/Zgoo9YNVAWXhgr
         F5WWGoQ7Z8vle7zwl+u5B29Pp2bHLX7Ecq/C0sffESNKyIbRqMh4UfQbXLfTSCZMnIZZ
         BTdosMEwG4iSo5CNL003M+kLc7os1d7PaU6bV52HahUSN69Gw/jaj8q8BvAYBFTaAuYf
         mcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734821881; x=1735426681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzyBL+xzxM7+Rnm9o2Vr363DYLNIzmRez82VEAnkutc=;
        b=AENsVdzKVtHzYZG4Lh3SQ6ErQEVP+OF9puvoh2AGHN6pdm7SEg9fMIpsdx4zS5q6cU
         jAPMFsCSJJ1P0TdROe63Ofg/CQ9/A25u/YQK60PJU4bU+eiqZqYk8FbWbFbZc/6Gveef
         U9SXMKi11jncK4fyRegmCsQwlArQPaeXOsIm1KGWE1qia8M+Uf+E8hngd/4+qBlD1DZ9
         gN+nGeyRfJscnntKKr0ggIAqa+Og37HdIeroSLbPFyo48lwZ092TxSkfvyS9sCqscR6c
         kO9kW6iOT/hweucD8DVBRpl80ihw77KugylPQQNsTpSzYuxT8eAhSW4QvrSU2YzCwxp8
         kcwg==
X-Gm-Message-State: AOJu0YxMMFWp1f9VNCSjR4Ar2Mhu4l8NsvTmW/NTsGNyRJOvYRZO7H0Q
	3Mdlh7k75Z5liZOxCLATg5dVSYsTlq1tCnyHUsb2LwT6V42kLBk+tkmwqEs/
X-Gm-Gg: ASbGncu/f5H4FA2+ksLWqyTRhKkoDkldVompnFFh3Oq+3sUg/9lblQOY8JZkHBdCeSc
	xOOG1dx20/y+lbIPaUgug2R6Lc+oNS+gu5Apjt709ouxep4+abWYBWwuYramqss6UxyWQ1/cS0D
	rwAJnRABLVvgk+V5cemPUSmxbhRJgV7qskVDXyocuLSPvJigZVNyebA+D6C/WBU5rlkZuOKCTRT
	PA1s+XexTYiK1DNyUqOeHCnLcNcIon9xJkO4UjAKEFVGfOAuf9cYdA9mNGPnc9PdiT4ffsbhynZ
	MtZUD/P1LuawAeNqcbaYVr23fblgneK9/lI=
X-Google-Smtp-Source: AGHT+IFIpoIeYVeHFkw1brwKxz5pCpTWMIQ14in42L5SPMdWLJK89klideDHB8S6wvvuiCaao5ExCg==
X-Received: by 2002:a17:907:944d:b0:aa6:84d4:8021 with SMTP id a640c23a62f3a-aac34a07e84mr670731866b.61.1734821880501;
        Sat, 21 Dec 2024 14:58:00 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f858sm330717666b.21.2024.12.21.14.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 14:58:00 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 5/7] python3-pytest-asyncio: upgrade 0.23.6 -> 0.24.0
Date: Sat, 21 Dec 2024 22:57:05 +0000
Message-ID: <20241221225704.2712991-8-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241221225704.2712991-2-t.f.g.geelen@gmail.com>
References: <20241221225704.2712991-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Dec 2024 22:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114455

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 ...est-asyncio_0.23.6.bb => python3-pytest-asyncio_0.24.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_0.23.6.bb => python3-pytest-asyncio_0.24.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.6.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.24.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.6.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_0.24.0.bb
index 492020477e..1059b788f4 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.24.0.bb
@@ -3,10 +3,12 @@ DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python,
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
 
-SRC_URI[sha256sum] = "ffe523a89c1c222598c76856e76852b787504ddb72dd5d9b6617ffa8aa2cde5f"
+SRC_URI[sha256sum] = "d081d828e576d85f875399194281e92bf8a68d60d72d1a2faf2feddb6c46b276"
 
 inherit pypi python_setuptools_build_meta
 
+PYPI_PACKAGE = "pytest_asyncio"
+
 DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += " \
-- 
2.43.0


