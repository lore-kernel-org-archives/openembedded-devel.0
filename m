Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8430.1794467639033439428
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 23:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RPk2QBIZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ea138a3497so23942275ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 23:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467638; x=1795072438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h0FUFLEZTGzlWamemxAXdZY+ZtgQNv3UyFvsYDXcDYQ=;
        b=RPk2QBIZy/bqGFqORrnJbTcOW1gmDjH6MYbD5mwwAV42OBwDRkHFRsymkHOShL6Y8t
         A5NJMy5NXWHRTl6Io2g+IJFPedLehivEDHOohtyU3L9nRzrTr7bTwYvfot66zq4n55B/
         cQ7BQozHwRdpRe479aJX3X3NuuFV0V1WCxUIQ03WZiZS31BxgUteRJc2NodtCIIQk65b
         BBabztHJ15hTMnLMpVxdLZcouM11zcfk+QNbeElI2Kq6L2+N+2CE7tsN+ylFk+jUz0g9
         oQ8I06da4pE/PiPckt0nwKkI8EWB0Uj3qRfgPyExBX+lxh9nsCl1xQRZZqbMaOKuYKqZ
         gF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467638; x=1795072438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0FUFLEZTGzlWamemxAXdZY+ZtgQNv3UyFvsYDXcDYQ=;
        b=rYxDPWqZ5RzT8he3ziDUqbYUv5WSjMSkCgZE36vr9Km0GW1nMit+SdVYFey4iGLEQz
         9dDKlibLAW1fOhyTK90ocVGAqLz8LLj8TFnl59ZuAuHIbrs5Em9dyJDa+UwgTCZDDFY9
         HOjbfs6HornIw7QrvRkLCS/lj1o8fFzJfM0BddXPynlHGDNrHBU4ec71zeViGOfrdYNG
         +S5Q6NumrRe+7tOsun6n8ET10hsBRGhJJSbxE2wMdms4Cwd/WjAxKJ1mF/6FkRSbCxJf
         Zo0G8TcGf8jGXKjrVu6DfSssqr7W4UwSCq96lJeb/IXLGZP89jOcn0Rja8y3UlUjF+6f
         TtHg==
X-Gm-Message-State: APuU4Z++AYjZK2HVVHG3dlFczlt+hMsPB+1bgdy/ceK4HjuAmjJP8JIY
	St9/vSPrLlSPfJuOgAFAA4tFoQwuP8RDMgjJVb29WIoqb/jQI397MxeTdmQu+g==
X-Gm-Gg: AYBFou2J7WtenHGZlUholySRKTGUXzsx4XuWIdAYcHLBWrC4src/Wq7qzJwCFCXrvoJ
	B74d0QP5FJpkRk+qIGynGGJhCCqbJOBGwDQe2blgNSuXfmJmSmmJvh/XtnK7v4MwczZy4ulgBBf
	WRYo0yvuJHERjpVU799UAY3v0zHRHm114NGyCpk38HzCpvwTyqbr4EVbqWmVOWVbZXu3cdCl3Kb
	w/RGegDAQZfvVoZDvInW/TVlz8r/PbajRDYM8WKtXa2p22g7nl56oOcu7wRJple8kp1whPlmCSa
	NaDdirUzm0tfFKzQkFmtqQaxdhhC6ArwtUdzJ8hpQNTFCoNAYD38xG6m73+9+4PyolVW4OcwgTr
	5WhMd7hxyX4UplmaNyB9YnokXN0XM95cSGRCW14jSE3BNMvvctWcqZyN/QvMBD3KTJy3zPMi8xY
	JV3IgNQhDOpC/Y1dWurAVJsVOBgfS4quijnOhKWM5mBw4ih58vOas3FRq6e/Oy3UjCsdhJCdt82
	nREsB/MbSPWd1Rt+5zMOgNctjrFDAmpkZ9HVZiuAxsx1b+1WioUKhCpbO0GyVRaouqme9fw2vxL
	djDN11b55jFcAdgmCWK+uCN7rdK5o76XkR5Ar57UitUNsZb58bvCmQ0bJwjY7SRQpCs2JHrGaK7
	RqPpRrhc=
X-Received: by 2002:a17:903:37cd:b0:2e6:136e:f264 with SMTP id d9443c01a7336-2edd7a691cbmr47388945ad.50.1794467638303;
        Wed, 11 Nov 2026 23:13:58 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7e062sm29018355ad.35.2026.11.11.23.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:13:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/6] 7zip: upgrade 26.05 -> 26.06
Date: Thu, 12 Nov 2026 20:13:43 +1300
Message-ID: <20261112071348.4144113-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 07:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132200
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/ip7z/7zip/releases/tag/26.06

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/7zip/{7zip_26.05.bb => 7zip_26.06.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/7zip/{7zip_26.05.bb => 7zip_26.06.bb} (98%)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.05.bb b/meta-oe/recipes-extended/7zip/7zip_26.06.bb
similarity index 98%
rename from meta-oe/recipes-extended/7zip/7zip_26.05.bb
rename to meta-oe/recipes-extended/7zip/7zip_26.06.bb
index 050673f678..375f55f0ef 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.05.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.06.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/ip7z/7zip.git;protocol=https;branch=main;tag=${PV} \
            file://0001-Remove-treating-warning-as-errors.patch \
            file://7z_wrapper.sh \
            "
-SRCREV = "b88c6bc09339de32f7d18bbab900686b244f42ba"
+SRCREV = "d3296e39e1f1f92c7b41c0c3848e65640428d42d"
 
 UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 
