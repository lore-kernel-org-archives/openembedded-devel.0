Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3854.1794729100965770662
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OR2SbIzG;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3791619605cso4880401eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729100; x=1795333900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqZCMUvNylCMg+b+AX+5vi2wVuvdsnLD9RomHnayKa8=;
        b=OR2SbIzGiYQoH7th67XmYpIJIcEuDPStEX/IKb2HIba2EfyxAJ8JxGIzoyTS9Zh1x5
         hPI8z+nhM0QDFTcuWx9jH+5oJ/lZAjcS0zE5AsYVoToh2CRVRbunvSSP7TQsPTWiB2Ie
         54pIxr1UwOShrQBpjfi7plXcLBLPDdbPEOC1exjCRL3dHc/RVz7tCSquNkzSzf7srQGg
         B9cg3Eo1KjxAts/mwd8z9XbxaIT13Knb6ejXmnNEZFaoMAREoAILG4jiMfvb91RR+Lvs
         itcXb1y+RV6dcF+SifhxcAhx9wOR2T8GNiNS7b8oD4oDWH6w1yJdF/qpm1UiuYT7cTMQ
         mmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729100; x=1795333900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RqZCMUvNylCMg+b+AX+5vi2wVuvdsnLD9RomHnayKa8=;
        b=deY1rlK6l9yV77Oy0UqfLWoQaFFgsSMIN87ftEbufGESt6YZK1GyQzWK0i7wnQJUQn
         M7yGH1UYmAbHY4Z03eWEz2QLyY+PAYl8biKMHDEdT1JclpzIZDmyb5LWG/Wt7V88ZQK9
         ciQaqTWn/gnBnB7UG7I06xR3Zm97m9Z3yEL45kENQSsDI2bQbzsuQaR8yaCTN6V76BT9
         qTfD7tPUKNstT4vguYadKmivRjb0FmtfeHh5CpXmCLxFU/PoC7DdV6ofipCp1I40HkNZ
         MAJx98SXKR+APSnFSfhQz/9Yp9qP1ex2dBrbus0jouwNiayfepFqLb8H2AsiMoFxB+GH
         GCgw==
X-Gm-Message-State: APuU4Z+Weo5AzwzFWEea0UBgb+aR/lNLEh7mJyTK9Q+t3wuxuvOL6il/
	EV3xovMtliJmDHuq6jyN+GLsHEtGvo02MAbVMyJ/fjcHd6Zt/ovZ+2DqH+sYHpoG
X-Gm-Gg: AYBFou0hAC524eOyP5geolANBag53rd/HBYlhUXIfsrbeoN+PrcWkcnfw04OjSXzXLb
	fbrH3hDsPw+1Ah5HDcqKt6gamKDTCnnK99tey/vVfcaiyFBCMAi8OrA9qBXiTueIjPW5Ewb7c0H
	4C6lK2EYZK6zGekEbnUCusqmnYZGe8NT7+NRYjRtIW7lwpH1vFNDdK2xGEIT0409pYKTrhs9Dg0
	IKfWZTFQKzjACq+w3W5ZdateH3c2wAGUa6tq7OLiO1arntlVXuUzbbvTwJHBbAAZhL0P8B/hM5d
	052sEwqqyI3vB9Lb2SACuTCIBz7F4jL39LLFAl4vXuVcIsa8guVVp48S4vETehKG05XZ4P0k1Dd
	45gn/phf1zMEIvgcT149IKv2q2zZXYjjFNCpOy9Lk5qGFv7nEXcIGoM/m0MLydxLi9YLjiXHueQ
	gdemMXb2s7BkvEDU4/7/iKCRnpatfCZV44UND9jsAV5ksmZW/FY0UD0n9IcLujtu9pMVTOENLHl
	+e+ri7046YA0HV2ZvRNpN0oaYqPN+JfLVgL7QK34Egdg1PWHEv8nfNfHOqZRkUtpJrSE7cC8KoI
	rbyIpkuwp5zpMKTKIBV/aE69NTahcaxCtyKpN2B1YvuFAyE349wvSiIiPRUmCmN+LSFX7ykphME
	Q3y7YlEvCytiX1sBUeR996eaYynZiIPLQrIrq4LxABJFsBxlApliMi/j8XdhX8yXC/hQbhzW8Ky
	4dAFTE7RDC5c3C180pTw7fzkkNkdhJ8DNC5dxR88ZFgs83wKHbScbMAooI0SWf+FurLEoNJEuXI
	BaCndTR2yq2CV1XGLjq5kHk5dYQCnXTuuW4JCwMfzsqCFt/ehKR9dWC94XTg5W1yQ4x6C6lIUxR
	o/zU
X-Received: by 2002:a05:693c:600a:b0:36a:180f:3154 with SMTP id 5a478bee46e88-3796628e9afmr7202291eec.18.1794729100286;
        Sat, 14 Nov 2026 23:51:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 85/96] hiredis: upgrade 1.4.1 -> 1.5.0
Date: Sat, 14 Nov 2026 23:49:03 -0800
Message-ID: <20261115074918.2932593-85-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132355
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../hiredis/{hiredis_1.4.1.bb => hiredis_1.5.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/hiredis/{hiredis_1.4.1.bb => hiredis_1.5.0.bb} (95%)

diff --git a/meta-oe/recipes-extended/hiredis/hiredis_1.4.1.bb b/meta-oe/recipes-extended/hiredis/hiredis_1.5.0.bb
similarity index 95%
rename from meta-oe/recipes-extended/hiredis/hiredis_1.4.1.bb
rename to meta-oe/recipes-extended/hiredis/hiredis_1.5.0.bb
index 6d4e7391cd..aa5e8f5d60 100644
--- a/meta-oe/recipes-extended/hiredis/hiredis_1.4.1.bb
+++ b/meta-oe/recipes-extended/hiredis/hiredis_1.5.0.bb
@@ -5,10 +5,10 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d84d659a35c666d23233e54503aaea51"
 
 SRC_URI = " \
-    git://github.com/redis/hiredis;protocol=https;branch=release/v1.4.X;tag=v${PV} \
+    git://github.com/redis/hiredis;protocol=https;branch=release/v1.5.X;tag=v${PV} \
     file://run-ptest \
     "
-SRCREV = "616f2286ba5503f74ae96e720623fa11dbc690af"
+SRCREV = "5bb7f030f6631b243438cf0fdd3be84352b905bb"
 
 inherit cmake ptest
 
