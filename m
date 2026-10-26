Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39906.1793009960815713841
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=okrMePpP;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a05da1cc1fso905538b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009960; x=1793614760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgHhFatbRtW33acQKC7ipwW7T/BNqa2AranbMop6hCE=;
        b=okrMePpPQcX/1GxnwMCyclnXPg/MuvdYGeb1DLclb2bjPJ4Wht6iG4CaskZnAi0Blj
         GMTfXJQ+2X26lZ3qEgZMSZUNGMLCBYnBhJY6e3hoEElaEDE2UJ0XOPUfSMZh9MuLf+HY
         MwzHV0rHXloFaUNdvNwnfBJYmOC1mrwKltlDWNYPZZVLpCvuezinNINrcE5abCraZYa7
         bW3k3L19esuIu18hb4A51tdUPUUB9QDxDar1BJAl/4YVVcBxIO0fiV7aGfqBG5xcXHu7
         6EdUwBVrP4rT31eU1szZzIxTIxuq8r6eJaWQ63GZiC7r+oxpnesOLVXwH1ICk5b16Mb0
         RH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009960; x=1793614760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgHhFatbRtW33acQKC7ipwW7T/BNqa2AranbMop6hCE=;
        b=I7Fbmt434TFQibs/eJ3pynuwxilpYSMonMRq+nMZazWO8nk/jGIoAKgUsk3A9yPU/J
         rY/IWFexvNEd4SJirYToh5/DOnePi0TuFTFp+mGoQv08xdwtcuQv3FFTg4RIznO9LdJH
         xyMQTEQC6wUOUsCQJS5r95PJSjtem+WcE+vEbsAvaRM7NxE+Z004KqmrJhgtUYcGkbal
         AI0KLCOctmd4fEyjEV4ATNrZk2m7PRFyefD7ujk4cpvAh+DO463PgNHanef+nkT9boT/
         6MK3W4mBuple4ZwM1GFGH5i/rKWEEjA5Mwho21h38P5XWmKZpxTltb5jzQopAezppzyM
         cF7Q==
X-Gm-Message-State: AFq9FYLndzocrR3ZLAIbS9djQKnIDhhqLOQ34z7GMupb+M5dzPuRPDgm
	3iINdkw4aoUX2NfUCByNc9uKLEOhthGaDyhFWcQTFIpuXhYeUAG13DyVKhyJfQ==
X-Gm-Gg: AYBFou16nUjn6k9GzcMvJqEF6zj4YroMi6AgjJXcRXeLI8JOYHZZLQPFE51ZfEf9qXv
	GywzUTXgddsEpxAnlnm+kpg7nfb7A8umcE/Uj6X0YwVLHM0KoMSyjHH/pcPEkOH72ZohEvdhsTE
	gN5QqwYWQutGcha07QW4yOPccTtN/0VASWvIMYIfPZ6mX5iAqerV6RAmAqv90xJO9xc+X2xRElo
	qukn8bawDedo3zEPzo3CKCdyn0whaGP7PM/lAmNJgEYiko0WCfAQtAo5cVhA8DMIWt9dzxqCkXh
	yCZhdav7TPHHw4A/rKXFMpR5x7mryGzPZ5pXjYMoJiQEd2+0NcvvSrVUOSldf/MkqYXBqpotXPM
	I32hvYojwXBK/iFXnAL1KLE3DEXpnPQgTVabwAOVQKjkWG+i30+FTOtHMemGTpvCyxol/Y5ntuj
	t7lGMl0d15GYNCyNjN8TpiSNO2N7HIsGuHsQUGEqHRjOyCz+/7KDK/CDDZ1KUoMBtoCQa5LIXZf
	z5Biteygj1yyEDgJTgv7oZ7GAHZ8AXvFzSoh5+BG5tSTXlOrRDHZzqsPkG5FO+FPLxrl23CbqKi
	Q5BvQ1oXlnMILOPbpFgH70WTGKkOImfDztMc11sYGn70pV0YJdBM
X-Received: by 2002:a05:6a21:880d:b0:3e1:f7a7:2d2b with SMTP id adf61e73a8af0-3e7af80076emr4514948637.5.1793009960188;
        Mon, 26 Oct 2026 03:19:20 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc4648dsm1383583a12.14.2026.10.26.03.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:19:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 7/10] 7zip: upgrade 26.03 -> 26.04
Date: Mon, 26 Oct 2026 23:18:47 +1300
Message-ID: <20261026101850.1470035-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
References: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 10:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131429
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/ip7z/7zip/releases/tag/26.04

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 1c45c216f647175c121e7b7f5fb19c8a042ed99e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/7zip/{7zip_26.03.bb => 7zip_26.04.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/7zip/{7zip_26.03.bb => 7zip_26.04.bb} (98%)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.03.bb b/meta-oe/recipes-extended/7zip/7zip_26.04.bb
similarity index 98%
rename from meta-oe/recipes-extended/7zip/7zip_26.03.bb
rename to meta-oe/recipes-extended/7zip/7zip_26.04.bb
index ca50aed8ea..49437b807d 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.03.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.04.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/ip7z/7zip.git;protocol=https;branch=main;tag=${PV} \
            file://0001-Remove-treating-warning-as-errors.patch \
            file://7z_wrapper.sh \
            "
-SRCREV = "0766b733fe3e06dd2a7f9a3cfbf2108ac73abd17"
+SRCREV = "9128b80e3a471108678e2b3ec3c985861c8d7b0f"
 
 UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 
