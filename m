Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1892.1795113378931922436
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=e8Fk7cg/;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b600fae14dso46472b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113378; x=1795718178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AHukX1t+rmRqXYccUdWQMzTC6St+lBukbiMWGKvbp64=;
        b=e8Fk7cg/puIURBie84fNcmzDGjWt761cBgHWtlJvqXpC008NDu47n/jiPNcC3d8nG5
         J1JDktYsEr3bLxACkgsY0kEDlV/7uuy8ToIeRLdTNrvrsVDZJ5GtEIats+FeifFbjN1l
         A7hEIzHf33C9D9BCzwsyVZAyhcFlc4LwuCohPkDw2fvgEo2aPBMlfha7REoQON5leHxr
         fw6Jq0Nf9kgpb4zLrYwQFibsX4zsL6nkiYeGpk1USTJD+ovhuPpKjI0r2YTFwwfEks+f
         BrAQ7aRYqesZpgZw9CIB3wZLrmmQ/hi/BjoF+3Xh9oYG8/sXZneFMEcC6Lu1gbTfW2fe
         8aXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113378; x=1795718178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AHukX1t+rmRqXYccUdWQMzTC6St+lBukbiMWGKvbp64=;
        b=ZEXoMDMDDLXcSleTb9uJKG8faJacpY8SA8fub8tY6NFnidT2ChsPjVt/1aoXzi7RIR
         NEKbcZQKRIlY0HUjoKKrjCoPJWCtcvJLCmYsQ8PFpAmuPyxAWJZXEblDmqjSkedWKT1f
         V9Xe+TBDQP2AcGrCEbLYnJAjAQKCJvwXLaxZSqzWxecUK3awENrNIMYaomIXv6rmA/5+
         +jYfpBmK440EFELvZPij8lgb3nFUjEXIDMYwyRRKzaKm3xXdGLxY3X1hOGQ+ykVFUp7D
         BasX9izPSYC9YaLvG3K6mW7mjp+xWh62Pb7Srexg22NRycyc5/W4ETz/N3CS6annExJC
         KjeA==
X-Gm-Message-State: APuU4Z/S2xCP/5QvclKvVOtqAQAaMPAVh/LyxULpSjtBiBrAsc/S1gWn
	SxA1z0dnyiCfoZRhnOkZ2gaOuoPyz8Z8GF6+3lzWJl+WlJUF1GtbEvLHk+eMlw==
X-Gm-Gg: AYBFou0ipU3RjSL/zULHXSQO+PIOIc2ze2w20FcQIexHHCOwkTzHBZRVl6Tkg0aain3
	XQ/qeO3s1kWyqloS+ZHY/9TzaJs7YAcX9rw6Ig9zPfBqzb169T6gjBJcZmsuzx2EuxEwZDbHkY1
	Zk6qsd6+yZ4lXjceAPet7xWYOhQsvwrG9due6uhGSQROCmW5hvUIxO/kEOohYmjs5vCdkidcjp1
	iNMYzBYK93gp3gRSx6DrK1+cN6lpExsqf0dHG4pCi+MSXJ+YL5PZDmE2xufHQgOdufUx13K1eQ/
	zc9f7AYhpS1JLFDpidEhlKb/DpsNvOyK/FAf6EaI8qRkPSfhlkeFRF7DV1GUlnBU0b/V2U9wftG
	rzPTGakN3UJWy276Jc3HFyzeZlpIuA1Orn7xEAqwB1anPpXIcN4N4owmuJ/FpPN1en+IKk6ndsc
	1Mvepl5KJw3fmJmL2+4KysyRY+jkG2OQYItxuW4qsmATadkE9EuIKIgyVlnP+81U1VvAk0/yR7X
	qeHuX6z19oXYDdIkmBGZElJDdMPsFt85CwnsM8b0RdPrbDxQTCd7y/739vbw6A+lhrXuX+RFzKQ
	axaLFzFJpul5ryhmaRPhhQ+lvWA9HqtoMYo28T/0+EEbyOJC2SG0n/YYfAF4Sg==
X-Received: by 2002:a05:6a00:1808:b0:89c:1f2b:a73f with SMTP id d2e1a72fcca58-8c87bcbced8mr493873b3a.17.1795113378211;
        Thu, 19 Nov 2026 10:36:18 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:17 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [blacksail][PATCH 09/64] libraw: upgrade 0.22.2 -> 0.22.3
Date: Fri, 20 Nov 2026 07:32:37 +1300
Message-ID: <f258232193b79dcd3d02ab56f2e7bc819cec8bdc.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132699
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/LibRaw/LibRaw/releases/tag/0.22.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 2f7a0c3dfdf3e8faa6fbfd07b60328dfa65a9b10)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libraw/{libraw_0.22.2.bb => libraw_0.22.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libraw/{libraw_0.22.2.bb => libraw_0.22.3.bb} (92%)

diff --git a/meta-oe/recipes-support/libraw/libraw_0.22.2.bb b/meta-oe/recipes-support/libraw/libraw_0.22.3.bb
similarity index 92%
rename from meta-oe/recipes-support/libraw/libraw_0.22.2.bb
rename to meta-oe/recipes-support/libraw/libraw_0.22.3.bb
index 2db0c14a61..c0601f71a8 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.22.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.22.3.bb
@@ -3,7 +3,7 @@ LICENSE = "CDDL-1.0 OR LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1d66195044cfbe4327c055d1c9c1a229"
 
 SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=0.22-stable;protocol=https;tag=${PV}"
-SRCREV = "b93f6e45c194f5df9b02a43b1af9a54b4f41f33f"
+SRCREV = "cf02d66eb5c19d4e46df7aee0582e47a4918509a"
 
 inherit autotools pkgconfig
 
