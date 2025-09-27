Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212FACAC5BE
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:32:56 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web11.6888.1758954768568557016
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mkRiYQl8;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-427621906faso6012175ab.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954767; x=1759559567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYCFTOj9Y/Vue8pxTn9plkPCz4lBWYeItgs3UT9ITmg=;
        b=mkRiYQl8rK51kf6a1giUYBYzNFz2oQr3y50ecU9RFPQ6ADXDZP5w8jd70LEKOtJtBF
         etLCPEK7vykpWIGK7+DgL19HgVpfJdl39haxgOoetTB25409BpOwQ79fW96Zi+M31g6N
         kmXUkxFu/pI9bMh03u+fJprn/AYALdwnDo/tWg1ofvS6PQsMmYRNjspFC8CBnacNvLS4
         KKZIRDCaykqzIgKVi3dGCzaye7w3P12qEQi6mlJrInqFroCLLNSVRfJELBIH3dTovu92
         g7HuxHdRJ7bis8D5pbKMlg4DO89wwZEwsm/CNRbAdKnYtIhC9E3ofMXCkC7sNnsm34kN
         JdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954767; x=1759559567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYCFTOj9Y/Vue8pxTn9plkPCz4lBWYeItgs3UT9ITmg=;
        b=IWTpoUDQDAyqvWBTioGGLzuhNtWBdGWZvy2Og2Erp2DFmBqJTRbtsg/SkWk3lw2bip
         RPckd0SLPIJsQOqZmFhyuMCnyGKAgu/QhY9jWy+9YswHnVWVstQwOJb2ZdWpmOAKqgca
         XWSB5Q6YlGcwnneg6/5xOeQMUBKh46606fK0rPBgHMLutFvg9Re9Fq4jgmitpchCQ9BM
         DEWgNbgkcSJgusj7iNHfS9LDZ3+fiytj1CysDaLR4Y3ujltgcMpkiYkTDkV2ZH86RhGR
         lr9IwNVZTEdSBjMns+GderDT1uQQ6mudWTaqoURNUo/nmHS6GvpytI4wI33hEihwhLkL
         kV+Q==
X-Gm-Message-State: AOJu0YwEAFDFoojgOvyXduPx+qTl5tPyumQSJdwu5O8seRmKal1GEEWo
	DvGGdopuk2E/aoONwEPck2vOPJgvbW314ztOte79R4Utw0Gk/KbFceT85pVWnA==
X-Gm-Gg: ASbGncveqQaqOnyr2qYGMrcndpF1Cdk9GOcR6xnhIx/9F8IiyqMmgvHO0Rqp/9LlIs1
	xBxSVJbHQj+GVkKqxme4NGo/JGhe0sFIKnWkG1E7wWdrnvoXPn2x/+TX3x2YQUJwfsg2u6T3rvY
	SxflVISN3qlhBW4hWnaqJP/uGzIIrMDsBIrlk5uJlhJH/uftsvkIK/kE4kzPqjvhEjudYjfnNwI
	/8TqL/6c9OtYOG/HEeMYEnqA4RXzOD8luK7XjaGifChN8w+HadR+bSqTWqEmEo5u2uOmy20FIdg
	bnyyoV+AVOjZHwVfqkkv38OjopAfLA2Iw9j1caUraBvmw2af7mf9PfTZWABvc4YXjH0zsGy3lSy
	PXnzncfiXFAnw0FzowX6Wu1d5qwTcj0Gs8aiL8vTgH4mLLswMmkUjekemxWzZzg==
X-Google-Smtp-Source: AGHT+IF1v5ag8zb7HdjkjNWVTWi6V3NjVYh8Os/YdFXh8Nt3FfKlRn+jom0B2JNqISjDyvQ8mcBbWw==
X-Received: by 2002:a05:6e02:152f:b0:424:80f2:2a8 with SMTP id e9e14a558f8ab-425955cfee5mr155915045ab.3.1758954767616;
        Fri, 26 Sep 2025 23:32:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:32:47 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 09/21] valijson: upgrade 1.0.5 -> 1.0.6
Date: Sat, 27 Sep 2025 18:32:04 +1200
Message-ID: <20250927063216.1865627-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119963

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 108183d40f6f3fda76e1924bd6034ed47fc8eea8)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../valijson/{valijson_1.0.5.bb => valijson_1.0.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/valijson/{valijson_1.0.5.bb => valijson_1.0.6.bb} (93%)

diff --git a/meta-oe/recipes-devtools/valijson/valijson_1.0.5.bb b/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
similarity index 93%
rename from meta-oe/recipes-devtools/valijson/valijson_1.0.5.bb
rename to meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
index 9661d57e2f..7f5d0b1416 100644
--- a/meta-oe/recipes-devtools/valijson/valijson_1.0.5.bb
+++ b/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5c4583a434195e4f3b418e17c8ca2daf"
 
 SRC_URI = "git://github.com/tristanpenman/valijson.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "8b320f25676030ba13fb90c1bf06133df2628086"
+SRCREV = "4edda758546436462da479bb8c8514f8a95c35ad"
 
 S = "${WORKDIR}/git"
 

