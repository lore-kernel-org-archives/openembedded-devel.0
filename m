Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C4CC56201
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:32 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24825.1785872484258503467
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KXnX+HGU;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so176255a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872484; x=1786477284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8Y1o47IH8B0G1BAcvP7DpA6BQL/DokPSZyyNATxgDU=;
        b=KXnX+HGUzt43jO3zDl0cMUEKNmpw9vj79lCjaNECZVImTbCDhVlr2JxIXh8kYl8r5v
         cHZLGsKbiKnzOU5bZp2N9+5AtdoP+hF/z8BrJcnbA1huWBVj8nT+yW+pKKJ6MxyyPnCC
         6AguDiF7Vb5394g7fsDACpDRiXLV4paYudXV/R8D8PJ3pcrEVQ+ernkpDhfTuLkyZdCc
         8lc8HDmSscqwiQy5hxTSYNbQP8+vpz7e+8FOEjqXPKFoJ7bEo8ypB2Nywib6abNngJJs
         U7mY2D4es5s8iw6k9F50+56UVTIhorXVog+8pAushYBqsYYn0+UMh50ZwPRRlwXqDiqo
         L2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872484; x=1786477284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r8Y1o47IH8B0G1BAcvP7DpA6BQL/DokPSZyyNATxgDU=;
        b=cfTuSR37dhCzuHX3a/M8K3p8NegInrQi4SO0qoaTozspef4Gf2NFuosBrHrRXx3MOf
         p6O0hbVnEij9MmCyAwC5W0JmhUiw9chbhVagcbcMtOqCjOUoiU9A0UthBMCFNEmM/ifT
         KXE9zYCU9XR1t4Dc9uDa+8gtt8sDNi+f/N+mx26sDkkWTFnx2jFyFECuyhTFpQcXa+u1
         J0EAbGZw8LhoVBsZ1DtM6fV7AiLku8Qe2wR5ZbkBc4R9T5ba/MfZ6NhFXhCrTVdL9+bq
         C+YROsIQJoYnE7Zi7mz1AtZCzcp/Dfxr0Xwwnjw75BlARkwnPCfuzqBEn7g4zBdzeeE8
         Zhmg==
X-Gm-Message-State: AOJu0YwYJSd0sTk4rXMFOvib11i8rsTy6TjqkfDIIyguJviuPGSsm5uJ
	Gh1B3m1ucC/J0LiQy/WpF8PWqJ6SV4pc0FgNMlLrXHRsRhCeN7cEsPz0R0Hwfl4w
X-Gm-Gg: AR+sD11rx20n9mHMWvn7U2Cxv2SBqmCyur/rc6EU+lIDqR+BK3CELEutVUgKT/F+9Hv
	yMHLrbXXvbtJbjkjcER9U399TGM3uKJO+n1y8CL0CLo7m9e27WCZVzDUkiQwk+VETU62icoir9f
	oDDqoK2AjqMHiTv7xumBsrwc3DmPwmmQqGd1U2zXEGk4p5mFZUIlgG/1Vu0xLhdLwj8dU+CDwAL
	e/cGsN7qhVNCZBHBOsMCEhCAWvyEVppoMRL4k7k359pn4Tee3trhBJvdWNG1YkKdWAyO5cnwEaf
	zXj0dALflq7d4EQMlZlrkxBx51NAIVZJ5sNhHJ2a2dOc4tG+JaYA6Vq9bghG1Ae6uvX/n0hw1+E
	5JxXRD2bPaKXKINg6JZ76ZVicoo0T0qnOOKXO8O44jv8J3iDtbQXfswF69AdbfbfZVPUZljhiZR
	nL8s9JPSgtAys1rqhyegGJ4glNE9ErH7sSHxpQyO6vcQjM3bCsqQU+H/4h0/v5474QRLuFVFGLr
	A==
X-Received: by 2002:a17:90b:53cf:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-3903c54b340mr1143419a91.7.1785872483616;
        Tue, 04 Aug 2026 12:41:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:41:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 29/36] gssdp: upgrade 1.6.4 -> 1.6.6
Date: Wed,  5 Aug 2026 07:39:56 +1200
Message-ID: <20260804194003.3158916-29-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128776

From: Khem Raj <khem.raj@oss.qualcomm.com>

Upstream changes (NEWS):
 * 1.6.5: block the corresponding TCP socket when allocating a UDP socket.
 * 1.6.6: fix binding to unicast sockets (regression from 1.6.5).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 2292354019d5374052c66356a4b1b1ebc2221d4c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gupnp/{gssdp_1.6.4.bb => gssdp_1.6.6.bb}                    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gssdp_1.6.4.bb => gssdp_1.6.6.bb} (92%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.6.bb
similarity index 92%
rename from meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.6.bb
index 94679ce28b..944a4ef16f 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 inherit gnomebase pkgconfig gobject-introspection vala gi-docgen features_check ptest
 SRC_URI += "file://run-ptest"
-SRC_URI[archive.sha256sum] = "ff97fdfb7f561d3e6813b4f6a2145259e7c2eff43cc0e63f3fd031d0b6266032"
+SRC_URI[archive.sha256sum] = "767d2275254ce0efeaeac64419ff9f4f0ad470d134ef672f5c556b2abb786bcb"
 
 DEPENDS = " \
     glib-2.0 \

