Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682F8CA601C
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:59 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31580.1768811333949029074
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gVZaGxKh;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0fe77d141so26655465ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811333; x=1769416133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHnavGgDul6L1A/wZZ26JS0iTMShWa6z3SvHXmOgxQU=;
        b=gVZaGxKh4W93fvWm4+XrcVrRuzu3YSRdscoDrWAetRsw6CXF4U5EZ/d+qVKzcsBZfI
         WxBJEWJIQTepG+MdgjXiyjJjgLdNH2jkrdZ+IfpHNGLxijkAFsDDr4poOdNZdL5WQF1t
         Q/Vlc0kkLlkmKzlCmi4drmcx1mFofX9UgS2KjzLmUAwIkg61Rp/t4JN8wuavgqTZDWzM
         D2gD4tM5vNrF0sozxPAqwpGSZ0LgOHPJE25/VeFHVVm8vD/epRM9aO1xIBx3l1+BCfGZ
         SLhSMLT9wmPiYj9Bb64kOSEqvW8YMSeXsoljcqD32Sb+Gk4PbxorGHEgWvmf762JR/g9
         3mJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811333; x=1769416133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FHnavGgDul6L1A/wZZ26JS0iTMShWa6z3SvHXmOgxQU=;
        b=GcHWwokjjN3wDaZiFBr/4+huipyK9rbUU928dALYqJmF9t3mGsYBOHtH3C6ELBI6XE
         mpv3J+HC0nnLjSAjGWdOU5XytViwf0NJNSAC8HZp0spzQ3pjssi46+Kqmjzir+H80B/w
         JowLXSk7aniKjdKUjt0d8tN5PUyX8rh741m50e70DDjOK5kiaZx7Wg9aJ5DG/e3XYUYa
         VwL59lKBnRKqBlEHkGWum9J2xALlEGGGHn8O2r0R5XeIKBNAKQcK8vD9BKeYu/3tXI9d
         Rl3rHT40IxRFvJ/NpUKkpeVR6wCfalwyXCiecNoHmEGQlE3fcjEOEkWKZMJRUoi2efEs
         hwcA==
X-Gm-Message-State: AOJu0Yx/DZntpgIJWP1xRhYGOAtRdpqrL4W+wB+mZA+GRTPf8v1bPd8I
	MiMvyUFbsBP6r+EbchsVi7TOa61MOj2v0HhscjWNbGq0/f7mitslDi+tdiuCvA==
X-Gm-Gg: AZuq6aI8iW+AUOKwKjuAIYv+PiZoHtwj7NJevbXm2s9QBUTq32A6u8jGJq9PWm0HRJm
	5pobfJOjBAPguHdVqBGJep9GfbKfwcMYrTE7I8ixZqyig/g+rM6d6CfNivEZetMujha64/vd3E+
	wnz3ZY8qESSHEEINRANZBMhLvLW/z0u0iBuny3QUq3dfCOtEIT8p5xbXRTq7DIedKEVXkBPWnEj
	Gu1Mq08dD4VXsDqCKHguHv1bqrsHln6cO6doHk7WO6fcWoO7iWpJMtMtMq6n2PrxN8U58heH4Mi
	yzRjmdUgf1e/kLNqGoindB8fHoDcUYjgQc/Q7xf3OmMSM7GMNc/3o6vPg6Txnl/pXPTPXaUGYty
	jzcdvSY2cHJk40viSZUv2+SOXciNnL1FAqQcmo7ZfBS6pJka6jJKwXq8EeWIfxjR9sat4MrdJOC
	5LhslKp2aiDWaOnV0Sj0RRXQ0=
X-Received: by 2002:a17:902:e785:b0:297:f527:a38f with SMTP id d9443c01a7336-2a7175349bfmr102414795ad.18.1768811333148;
        Mon, 19 Jan 2026 00:28:53 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:52 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 20/28] raptor2: set CVE_PRODUCT
Date: Mon, 19 Jan 2026 21:27:42 +1300
Message-ID: <20260119082752.4120991-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123614

From: Gyorgy Sarvari <skandigraun@gmail.com>

All relevant CVEs are files against these CPEs.

See CVE db query (zediious vendor is not relevant):

sqlite> select * from PRODUCTs where PRODUCT like '%raptor%' and vendor <> 'symantec' and product <> 'velociraptor';
CVE-2012-0037|librdf|raptor|||2.0.7|<
CVE-2017-18926|librdf|raptor_rdf_syntax_library|2.0.15|=||
CVE-2020-25713|librdf|raptor_rdf_syntax_library|2.0.15|=||
CVE-2023-49078|zediious|raptor-web|0.4.4|=||
CVE-2024-57822|librdf|raptor_rdf_syntax_library|||2.0.16|<=
CVE-2024-57823|librdf|raptor_rdf_syntax_library|||2.0.16|<=

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 15aca0b2fa03dc25f551e84d381295c89dae8253)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb b/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
index 7014a28c02..03e57ce86f 100644
--- a/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
+++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
@@ -22,3 +22,5 @@ EXTRA_OECONF = " \
     --without-xml2-config \
     --without-xslt-config \
 "
+
+CVE_PRODUCT = "librdf:raptor_rdf_syntax_library librdf:raptor"

