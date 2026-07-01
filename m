Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18067C43602
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 07:05:21 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39467.1782889514204064445
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2026 00:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SrzuZ2HF;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c979d03538so1879065ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Jul 2026 00:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782889513; x=1783494313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nqI23lOxjyJ9iFt9P6xujfqGZJSx/LEd5qNoGMPXWBU=;
        b=SrzuZ2HFIqFQobxEW6LrCLyU7yRONxr/T7+6xXfuC/d9EL5fzpjOM7ceOBwEI7Jpu7
         ygLtzY1+lwF79TcW3F991f/o1rH23+m2WMGdwBl+GXkdIoRLkrx1pa8Xdl7RFVHY2ivz
         swZ9VUX0TRIfnnjpSQ7lmYyZsO9lTDAwwRGhGIjy6hSK6zo/8V8svdIW/1C10WDXpG7f
         4ZbLcAwI6TNIuLqFZEqaFmT8E+dC2wKIDKS7BHF440by+e6CfulqsJUiglMzmQFZY9Gn
         n0G5CHeIBygdvT3Pn0UKZ5Wpvy+pLAkFgPLoOonzO7R1m8fFeRZUHhu+JtYTREg0tbyS
         QOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782889513; x=1783494313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqI23lOxjyJ9iFt9P6xujfqGZJSx/LEd5qNoGMPXWBU=;
        b=POBmitLurrunQAIHEZZ3l6ypPaqiwsuAJLA/2roB/aGXEP4/BRpMSsLCNqmpDZxJIJ
         ey/973fx1Dy3Yiy2t0OomDNfhNUme+4m1lcqkxGqf2zHxCGlmzIiyZw2amMwouzNEHUX
         C8ziblHa1q6JE2KcFe9zFX5GALEVMmnR8ApJm8V5OarnNrHiuWJVWK99BVX2NGssfwul
         O5f+zboFWPKFdIFfxxKPtESU3dXTu0MxSPp/oUW1nuQaSspr2SybQ/U7WA9xB81I8VEM
         LAPi+w5eeD2OMeK7hrHrWYtEiOh/WFFuatgwPwYbbaWpwqe6/yjGMFMvapV9P9HqspND
         0dPw==
X-Gm-Message-State: AOJu0YxNxGn31pjyXA6zLHAyJZj8Ii0abtLLs/u3IVQrYnPRgVkyg0An
	HfixEgx0RIIJjRhH9OqzqA+yxIqPqCqFQwjnTSkCI4iMr81MmFGgrmOgAqI/glM6Dedvlg==
X-Gm-Gg: AfdE7cl8spKI4ooPqMO8oRafuOz72kEMKCqLuNUYZ/GAs/Bo/11b0M2LmifCXLXtj3B
	J8h/sKCVYxIF/qsoEkuIpE/wVJ0vVwyDRNjWEASiLAQ/89/5aF+EMO+VsUtTYhNsP6fvFyqEqss
	qiigNlNedzChlAve7phQblLJn1e45sAIrKClXTt07XJUGfn+jqNScNIVWiz81XYMNRnCW8JcDqA
	Z6rVWElL9wHmOhJYshkUvyv8LF8sxvqDbYCn/u6XeHzODFlhFFqZr1qRBtuMV8UVIeq0q5hdale
	1WH+8Z70T3XuSIotshYv8PfENjY176+m65fPSN3cYp7gI4ZKw/8y0jq2wQzl1oS8n5y07kOMD58
	zbR0g2jEY4Ml7OtgFYcRZrbf+JRRUIwYBvPD4GJfwfIPmkAtnMSbib4+i4lSrn3vfRsbwwHOtIu
	7y8TgFqTPdTrdlWJyyRzdG35A8RnSsNhMJF/qOyIsP0XCTgr7ewtfN5Yh0/nkEDu9QX8okz3xqG
	YvTLvHSvlzP58US0f579k3/V9WHxEecJVMlChyRXa+jvAYVJxJDJIejv5D0QJf1atPj2gQLVwUF
	bKkOD2G8OQ2seHk73FG91CkWFzD9Lw==
X-Received: by 2002:a17:902:e852:b0:2c9:d851:58d5 with SMTP id d9443c01a7336-2ca7e680c73mr6233775ad.8.1782889513522;
        Wed, 01 Jul 2026 00:05:13 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382d6759sm26243315ad.83.2026.07.01.00.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:05:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] pcp: Add readline-native and ncurses-native to pcp-native DEPENDS
Date: Wed,  1 Jul 2026 00:05:10 -0700
Message-ID: <20260701070510.3245665-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jul 2026 07:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127990

pcp-native compiles the pcp sources src/pmns/lex.l which does
'#include <readline/readline.h>'. The native recipe only depended on
python3/setuptools/flex/bison, so with the header search correctly
limited to the sysroot
0001-configure-Limit-the-header-search-to-sysroot.patch
the build fails on hosts without readline development headers installed:

    lex.l:25:10: fatal error: readline/readline.h: No such file or directory

Depend on readline-native (and ncurses-native, which readline links
against) so the headers and libraries come from the native sysroot
rather than the build host, mirroring the target recipe DEPENDS. This
makes the native build reproducible and host independent.

Verified by building pcp-native from scratch

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb b/meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb
index c4064d8330..e25cf2e8e4 100644
--- a/meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb
+++ b/meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb
@@ -1,7 +1,7 @@
 require pcp.inc
 inherit python3native native
 #autotools-brokensep
-DEPENDS = "python3-native python3-setuptools-native flex-native bison-native"
+DEPENDS = "python3-native python3-setuptools-native flex-native bison-native readline-native ncurses-native"

 export PCP_DIR = "${D}"
 export PCP_TMP_DIR = "${D}/tmp"

