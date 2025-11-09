Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7B1CD13D9
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:47 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27204.1762704039983916713
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dH8bOLHC;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b3b29153fso45384f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704038; x=1763308838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLd5cvW7qQZWovDCsKP80oSfSdwe8OB0K04wB0qZqlY=;
        b=dH8bOLHCTVaOijeiMDtdW/NRxnBpImguBsGk+gNICYESn/ndSXHBwdr2z2a4II12fM
         P48z9ViaGNeij7Qz//LpKVU1XlgWJVqzczae3l5Sxb5vDSiJ7QD3tNAdGx5XRv4qPB3M
         mGf03V7MgD+wjIWmKI8FagGkAhlQ+GAzXsjQkvPnjbaMr0d6U8p9lHyyjMbFHVAavnTQ
         3x2sppvgJB3PDZ6AtzwNZlbKTd65BlCsYWBGnt5cm7DZAye9KtO8WA96NABAOZGkV5iU
         54zVVMkNFK3FduDn342ByG+Dm5n0ZPo5/fAuQcRm6QkThgLxe7SaG3v1RBCzRAMO8lve
         JdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704038; x=1763308838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sLd5cvW7qQZWovDCsKP80oSfSdwe8OB0K04wB0qZqlY=;
        b=S7SZ5PFxke5Q01jwDuD9vMK1husm8VRhgQCPAcAeef+azkIVy/d7qchWsXf2LUBnMS
         WAWySRg0GIPMJr+AHWTpEHYDBwJbkGKlKbge8O0vVXyHQIqi9S6Khqq5ALh4ad+Wo7FO
         Gwfa2FHvWwJe/Nt+1tY/BerG39RQohsAzcr3nIP3r3bn9shCTz3N1Y/ERBlJjA7p/gpA
         wYokj/Vz/pVnlgADQb2HbRlDfEsPSaqspY7e1Xu2CyOEREQHCwo+I/+u7ewzqxL92vUj
         zj2K6FR3t5nYFRPu2oQsx43Yel7ORZpPUwo9rpvcK2zpIPaFO1y4nR68MTxVS8ZMrH5g
         hTqw==
X-Gm-Message-State: AOJu0YzwFruv1M0XXB75NzrG6cQffv+cZI0mNVoNHoC9RXs2ROclKYtl
	ZlEjt7Asp7f9SRlgr8dzY0yqyyrfMZPNiar/Td8rY62xueTn21MXp6Jqq3inmIH0
X-Gm-Gg: ASbGncuMzVN5OvPGFZoeyEiYPUDH5nqQuVIG+lNvIfvTohfRgi2Jdg4vhj5cjO0udbg
	T5Q8rGaDxj9SFLcfL1SqhBkfoZg2T8HWVjgbEZk6MWZfNQ1rR3P2y1kSlaIpuSQRDdAzivsOeVH
	Or6QgblZAWnRxv4EivCtUOupjyJOSFwOcOufIcDki9ivvXkiMj7IWxUl272SfpRlGqDiwGelre3
	UTMt8mU0J/vvi22Pig1lG1ySx2ejzbp0tWG74adnCgLHYD+TNVunwa1hhk121gfC2xRx6ksPv7p
	rPqyEAk3kDnG1RGzBEKOP86+ixetx9uahR2Gm1fhhid8mRFJdsp5Wsl6TSsAipQlx3lEIJjzd0T
	LvlOMcdRZy4oInyKVgCWcSyvDH78zI7bs+uRB+RhfPJK1d23Cw1QsN3n85Lpi01e5qHj5I6BGSP
	F4Chk1lUvN
X-Google-Smtp-Source: AGHT+IEYNNs4GA7dkThJ5Cp/U+goL+f1I3ShMxGBkQR9kyPfPww9btdIcNQApcfpp0snReOQxPrHMw==
X-Received: by 2002:a05:6000:2b05:b0:42b:3023:66a6 with SMTP id ffacd0b85a97d-42b30236856mr2542180f8f.40.1762704038280;
        Sun, 09 Nov 2025 08:00:38 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][scarthgap][PATCH 15/27] hiawatha: fix SRC_URI
Date: Sun,  9 Nov 2025 17:00:07 +0100
Message-ID: <20251109160020.2522353-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121431

The previous url stopped working, switch to the same host
that's used in the master branch also.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
index 2e848eaf56..0b3c325e80 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
@@ -6,7 +6,7 @@ DEPENDS = "libxml2 libxslt virtual/crypt"
 
 SECTION = "net"
 
-SRC_URI = "http://hiawatha-webserver.org/files/hiawatha-10/${BP}.tar.gz \
+SRC_URI = "https://hiawatha.leisink.net/files/hiawatha-10/${BP}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 

