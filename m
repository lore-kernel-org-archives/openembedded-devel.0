Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB27CCF9EE
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:40:34 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.954.1761363626671117990
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QgcFmVa0;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-78af743c232so2649379b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 20:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761363626; x=1761968426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9IPhjAXReuNUKGPra4kyLhrLde5ArY7FRqZrK1C2r0=;
        b=QgcFmVa0vLMkOEnlW9S8FbXlNWVBN1Ppv41zRrFcU01UL37rmDJIc0FlqYSuK2Oskc
         7+V4wAEXxCVAGzbiN2pCdTF8AKktSU+U4VKCeOlbY2fZa+IDKZbS7HOn+uiaWpejCWbd
         r6JxIinqs6SEj65IZO/KiGmHlIi7OoLyDdraJtUOEZxdaYe2G0hpLXXzUdeepvJXnQV/
         Eef2oeF5e6EtgGQ01w5uSGHNW1LPNbRS0ssh5V/z3YXUQ1NbbnKiaHg3Bh4657deWHDV
         KXtZMgwq2FSh8SH4khA4zJfx+huLVfa8F+VynxZUFwaMi1+2BkYLlBBocJ80a+ZAmkXE
         KqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761363626; x=1761968426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9IPhjAXReuNUKGPra4kyLhrLde5ArY7FRqZrK1C2r0=;
        b=wRBwuodfyu0pbmoCTP2gNaE/W+HAODsfzPqYmgHKgZkDK7XZuM0uFH8+i0BvkAANvH
         SQFjUCKGGXH1X2werqr/aHAWe4RIKlXhSoSRopGykN52k66xAojffY5ob9+qL9+QoVhx
         +ZU5JIovXdYG4yYgfmjHRX2QE63YRtPJQSdHEPqZ/ibvzoNlxadwF+GDQTQPtWSc1JGo
         vDpK/eiyQeITGLFKoMIF7pZCkFFb5ekpppqubmO/GSH0iZzueIBQyQX22l0gsqFwZ757
         I3Fw0B2lmhsS6dCJSD1lvR8sjPnuXSzXWuOc44ZRd4bJzJgPXb79AGVntGAjSftTfRpP
         LuzA==
X-Gm-Message-State: AOJu0YxJJQnBgQf8VvjKbLFMYbEcwDP0K8VsW7AkFpq1jQBgbf2ddQvI
	ArepWZjjv6iA/6JLVfoy9Dd5QNfdnifl9GrdNbJMVaL3vRuv2IpO2HXkZJmT8O3y
X-Gm-Gg: ASbGnctihwG2YQ4+dYBqEKLtmmrxC1TbsxbPEweSM8Vsb/pH76p9xnvFPjU7XbUTWMu
	/Ptfx8cp/7lv+3YsXkwLeM5d3ZGQdX/OpS5jwfPU3ioZPaw2GtQbVNmoSVu/+Zsjd0o29PTZadq
	zi4QjJPLUgoOGcLv+l4ZYu/peVqRxpX+9Q1YCl6dZnFHiR30L/241hlSuG+UqPHEp979RSMs4x6
	ewNJVDoNMqQ932I0q+kMM9fEmxcU89nObWTEp3/dfEV4LktAyOXo37qBbRZhmRhy0lUptfspGlF
	vJ9/XI0xJd8Hl4E9Bhmyd8mZEVpSxh+ZLt1/MYjawMq0FCAX4rRbAypKFlKnVK7UktZU7yPgPF/
	uVLTggcM2hZm+jA5+ofC32t7ahrgIqhTTVojRT+ssH/LEyexDLGjh/nPXir/VsPS7s3wVcztQif
	/7AuElI09HYFFfhl6rwoviNN/NHhuPq14RTwgIJFD5R4TetWD0TEIbcbeyXH1dnSXYmVJ9cHVt
X-Google-Smtp-Source: AGHT+IGDk0Vigif8oq7RuhkA7q0QbpL5oDUPQWiMZ3Hv/RZKhIp10RRFlznN5Vm55YQR8extuZjQYA==
X-Received: by 2002:a05:6a21:3290:b0:334:84e4:d4cc with SMTP id adf61e73a8af0-33de9099b2bmr6580048637.6.1761363625817;
        Fri, 24 Oct 2025 20:40:25 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012bf4sm808487b3a.1.2025.10.24.20.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 20:40:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 06/11] python3-ukkonen: Update to latest from git repo
Date: Fri, 24 Oct 2025 20:40:11 -0700
Message-ID: <20251025034017.2071643-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025034017.2071643-1-raj.khem@gmail.com>
References: <20251025034017.2071643-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120990

It has no releases in past 4 years but git repo is getting updates
there are fixes needed to build with newer python and gcc-15 accumulated
over time.

Switch URI to use git fetcher until next release comes out

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-ukkonen_1.0.1.bb => python3-ukkonen_git.bb}    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ukkonen_1.0.1.bb => python3-ukkonen_git.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-ukkonen_1.0.1.bb b/meta-python/recipes-devtools/python/python3-ukkonen_git.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-ukkonen_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-ukkonen_git.bb
index f1f35ecceb..b9e85e78be 100644
--- a/meta-python/recipes-devtools/python/python3-ukkonen_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ukkonen_git.bb
@@ -4,9 +4,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7e49a187324d5a1a6c4ba2b9c3fd4033"

 PYPI_PACKAGE = "ukkonen"

-inherit pypi setuptools3
-SRC_URI[sha256sum] = "976ad9a991c9cb99a7c318695a5f6b46236bbd4c33c5b55273fa241dfca8e0fa"
+inherit setuptools3

+PV = "1.0.1+git"
+SRC_URI += "git://github.com/asottile/ukkonen;protocol=https;branch=main"
+SRCREV = "ad108a16e8203867f4860287b61149e0bdd838ca"
 DEPENDS += " \
 	python3-pip-native \
 	python3-cffi-native \

