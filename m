Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8090.1795739734377272946
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0QAKo71G;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386cf1041cdso4191955eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739734; x=1796344534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3KgeF+e63D0Pj3rPGtZkR9DhtPIGD1r5YyhHtuYxfwM=;
        b=0QAKo71GU0ns34uC0igucmW3vZXxkrhm6PS9fcPHUUQGJo8jqKNLGwif/9ChU3VKWb
         1S88E5G9PyRTwqXMdbdYXqtuD5Q/kVwLDbZ6GdW3iorr/D4b6P7sHGUGS6+hvoZFNip9
         NrYjAtrvDdut4KSDbncTZ/RBAgwFoafmccMSuJGnkVQR8ao6Te3zuRgLahvGLeE2hop1
         5AXX0MWldi/QCRI8jNBpBXJ6oI6h7npwq2zfKxWSTsKaZdc05SqnsLmByhiTQPSefnPZ
         P1WQW1E36Q29aKYztC8+Um9xgYnkuKVCLb0TyFO7IIM4R95q0h1sAusmADOPjOipzgw0
         cHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739734; x=1796344534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3KgeF+e63D0Pj3rPGtZkR9DhtPIGD1r5YyhHtuYxfwM=;
        b=WplDVNr6iOnrkDaOdv0oGAUIqYMS4hEW4r4j/DBuKkKN2M3TxWprf+X2caivfDnm0S
         0shwoV8ASNFde/L+xcc5SaJya7kX4QqqL6/fUK3lgMKl2M5L2QeV16wlckd+5Oq5fT2o
         sqFxyJwFfGoh5Er8tVMTVSuhejuBFGixwro47PWbZf7Fw2i/IHA/1xBGi+HPenfyCDhD
         dmBB8fSRceMQLMOvAW+UeN1qrZPeNGSx6C9j7sn8SJjY9Q9ZOF3agmLQsPYlmo5G0eMM
         gb/pjnsVVCqso1w5brbeeRMHvSYBRujqVWohLEbkrLbUbDYQ/YmgBWzvaG7JHAqd0zpY
         igoA==
X-Gm-Message-State: APuU4Z/uSclxmdP/2EDsAgbz8KFk8Kg9zFfK/dIR4erjeiZocwRpHJeL
	uwSf0OBzQUxRVmm3VmYQbcGfDsbhFacApkD1nqLONf9Zpf9lZCGmpnWxLK/1LAta
X-Gm-Gg: AZFdTZfIgNSDGNyWJoxjPpov6Y7VOMsJtwZfGqlHldpo+ZMdYEZNqNHOcx97LloIOam
	gDnL0IBtxaeVc352FRoacSoCYw6Xc3ZgX8nshYsX9rxFTAmrdDvswsO9U6oOB6zlxXAcKdOO8G7
	G0XyzHdQ+z7xYN5wf9qDrag2peDglwkhABjgpPU+ISoo8wwlDvvCmxfA7RhWKT5Ceze1jy7olEe
	gPuvbVVCFU5S/y7EuLAP8eEmTYSaGFlkzzWoLIuJddQpjAsotV3GG2hLgZ45rHWG06iUEmafc7d
	eUHLASX4JhumTIVo9WRb0vVnca5BzkVORS8jMWveGFi2fG5YULljK70HlNkF836cTDWICiq6gGp
	BjuVKcWNI70baQN3m9yictaCQ4sOazqcDDfTslc6jSwBNIu710Yx4SLvQEBrcmeE981s6f63wVV
	Juqw9nVwcO4tiL0oWIHjMJTHkO8533Wy6mZMQnxPq+zvBOl+o/FTsjNtGvDzU3uju4sax6t8g+x
	P4t63ilaA7fFkFvWIompsQmLz4XYvlxq0QK+aO3ahpZziaSIp3vq/a6htaCvSJhxYNB0os2jxaR
	wWn+LNL/71avKTZCMTMZrL0ZxyyyhuNTS4lbteD1FEREd+O0LbWs5h7RIdsDOrMt3uIGzvE30/l
	dlz0v/868VZGpGTh0Jtv9m6x0Tj6M7NYnVjfhoIOWormEIPKeiEi+fpJtTuB5hAWFml+WcUoA4M
	Vb0Ic/PgeMnlb/sCmgvaNFn9QS/J27/538n+F+cspgtQ2lh0a0SOSm2KYlP02GVZK3yViCQquWx
	Lin6XWLUnU3hTkjAm0WMwrqkv43vn44WQTU7EeD+lh6dVX1txSVB0sr560lMYmNDjlqdXWAPeuw
	lECR
X-Received: by 2002:a05:7301:dd83:b0:386:5adb:ac29 with SMTP id 5a478bee46e88-3865adbb03fmr19103521eec.7.1795739733753;
        Thu, 26 Nov 2026 16:35:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 60/69] libiodbc: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:16 -0800
Message-ID: <20261127003425.2166632-61-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133160
Content-Type: text/plain; charset="utf-8"

The unanchored regex matched numbers anywhere in the GitHub releases
page markup and reported 11.28. Match only release tag links.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
index 0e861971e6..dc868dbcc6 100644
--- a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
+++ b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://github.com/openlink/iODBC/releases/download/v${PV}/${BP}.tar.
 SRC_URI[sha256sum] = "3898b32d07961360f6f2cf36db36036b719a230e476469258a80f32243e845fa"
 
 UPSTREAM_CHECK_URI = "https://github.com/openlink/iODBC/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)$"
 
 inherit autotools
 
