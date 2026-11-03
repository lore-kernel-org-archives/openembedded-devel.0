Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4297.1793738742746063352
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 12:45:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Wc3djaXR;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14394530ec6so67081c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 12:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738742; x=1794343542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfr32258dotONBRNlTmIXHTOhD3+sLwgUUs/9UId8z0=;
        b=Wc3djaXR2XMxg9qmsSfAMKB5IWuQ9Hd8WUWj+LLQ/e+xbkXW4c42OUmmelI+qQP1He
         M9n7qn2lV+gUrGHpJBPReuOKgyHP8Fc2KlqqqKaFb12bH20lpMWLM77A59DaCS32mWTt
         o50431TIbMojEw3Fic1Hg/L4flg1eiz8rOiau1W0dgOqq436FsiAXjbeODaLRCCnnoPB
         2xnRvHSWCtx3fAAVziGlTR1IFxW5sQIj7FLzJPxNOmLf4isMiGqvrnEXXS/jyQlblesV
         XSbmiF2bx267YI/WFdP/Uv0bHiQ9HqVcri69c0cw9PGIdy/24DWCZQjWw074m6iAfJVQ
         exNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738742; x=1794343542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hfr32258dotONBRNlTmIXHTOhD3+sLwgUUs/9UId8z0=;
        b=CdSw3kc3hzpPAHDGOvxBth79asZ+mHmk9JEiwFNA2+O7yvj9lBJaH6j2mbE56NZ4rC
         bE54RpL/iY60z0h8z18jaXUNEl+A8AxW3+/mpNCQd0wBod/KQ6G3aEhgGwvhEfmMvGQF
         1GzgdUc7U7PhtfxqjMHo5Fgen0K6NEwkjhJwescEga0kpL7NjKgkDwH4YpsWI6JSrbm7
         K3XQua6duwGiKa34uZ+Gu2jbXnOQcO7eA6kIZPdSaObJIiLGHgLn7a6fcY7ldyzIFYId
         0RopOpDFm3eUpXNHK9XvCOwvDq5d0MBpJKkrYROSv0W/4lFOYLGWinEcNHWqoIBHRJ7c
         lbQA==
X-Gm-Message-State: APuU4Z8ClPewz4i9Novhp+inwENd1ayVGGwKWB1UjmW+iW23PWsLclW8
	BrfAFInI2HnL3Zl2Puhy8R59HgOJV38/e1hU4SVnetg9XzbnSN0jTWE/vrSjBA==
X-Gm-Gg: AYBFou23XGAjfOKHZhCH7IPMWPAYBapLZCdMCvGlsfXt+Zvg9ta1iuquv6SXqEXz73l
	+Ks7yuKYU406bJz46tzfm/yBIKR8Oj+Lm0kDVztrbhdZPoxD4cQnOStjKt/gQi86JzCCotUOzOh
	K2kRgjcDrbcVsxdI+twN6APkIn7b67ljF7qpCRDdMFfgsXhmjr4wS/IGwpZz3j5WktPR9WnH7eV
	BrzMFIt3FYUFpYVnm2v93HxiV2t8v2qZ/1cYw2AGJ66wh9j+G+0RK7t0+2XKhwajjExVcNeoSJE
	A2nrzB5tIkDfoR/sO1nnl+mle+OOZpRhjoU8Djhw1/8xk9hdoJjNKfJ9CUmj3dHi05FxrLJVGY+
	3Im5TlQXwg4Xdn9sN5JUilzE9Eh2tUq3FVapUSNZYONCi3HfXZjGpQY6/QtSnMmMeNZKb31a6nc
	SKRV/Hw9hFVzTKKz6Q3NC2G0khA7Pl1vYwtbu3YiKfvL5RzLx/8cFv7oNuwzY9wB1TCZ/m8Aaii
	K6J72GjA5ktXUVcvIX1CajVwagX518qaJmUzNzGrDt3kPlZSlueg4KRp7VNbJXXdm+y7PgVGfqD
	L93Mwx0q6yn/LrNWRP6JegFqYlYmz+B1ikDiZ9Q2JevjktGZnFJ7OXWOR0+DbQ==
X-Received: by 2002:a05:7022:f908:b0:14c:d84c:7182 with SMTP id a92af1059eb24-1ac5da75597mr18790731c88.22.1793738741997;
        Tue, 03 Nov 2026 12:45:41 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c47076sm1104555c88.16.2026.11.03.12.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:45:41 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/5] jsoncons: upgrade 1.9.0 -> 1.10.0
Date: Wed,  4 Nov 2026 09:45:26 +1300
Message-ID: <20261103204529.1094356-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103204529.1094356-1-ankur.tyagi85@gmail.com>
References: <20261103204529.1094356-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 20:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131827
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/danielaparker/jsoncons/releases/tag/v1.10.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../jsoncons/{jsoncons_1.9.0.bb => jsoncons_1.10.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/jsoncons/{jsoncons_1.9.0.bb => jsoncons_1.10.0.bb} (89%)

diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.9.0.bb b/meta-oe/recipes-support/jsoncons/jsoncons_1.10.0.bb
similarity index 89%
rename from meta-oe/recipes-support/jsoncons/jsoncons_1.9.0.bb
rename to meta-oe/recipes-support/jsoncons/jsoncons_1.10.0.bb
index fdbce38e01..f269e8d452 100644
--- a/meta-oe/recipes-support/jsoncons/jsoncons_1.9.0.bb
+++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.10.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ee7f7ed2001e4cde4679fdb8926f820"
 
 SRC_URI = "git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "bcb44594c50c495ee1e690602cdd71455942ad0e"
+SRCREV = "9e57e421285422d7aeeb5aa7dc839f6a19121ee6"
 
 
 inherit cmake
