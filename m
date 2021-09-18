Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.871.1631984267922809663
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N2EHB4HD;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 17so12916092pgp.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=N/D+PMjGw1QRx0Vhbsag7m2aJJ++PE9HC7JE8s8Sd3c=;
        b=N2EHB4HDTZExNlP0JpXsuTMtKG/oGEtxoDKid54llmxyxMkQCjujhISyqXRNN664BP
         Oh0mS401XkZoJFXGhpwGpoLwDwPOCBlLdGJj9C0s48w7TcFo3cSEDT7fw+VZAvUrguGV
         XUPbeYY/BqdW0TonFRaRfLKLN1QrhczisMn96I57gT65+q3WSR9iHrXmA7SKExDJpdXz
         vh+BoEnwXDbWrEcegfhKQYq0TepmMl17lI9a8QjEe1lXSeszz0QMjxr/99fwR3t0HUPi
         VsBlHZOtFgEqV6hJsY1oNNRhPsyTasby7e8pWKNQFEBAMlhPBcJT2N2pduhQLa36v0fu
         ao4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N/D+PMjGw1QRx0Vhbsag7m2aJJ++PE9HC7JE8s8Sd3c=;
        b=RtrLSPEIkCFwk4la7Hb4EbgqihvLVA+E2VI39pK2vmSRuFRWg4nJx9xJMrVQgkDNy6
         I3gTrQ8WfrsorTrj0JmDlXqHObwiLqj09/up8FSlyuCuTsx9UBTVBi7oca6nEvbqXQk4
         +dmvjCtQaYg+kHV48LDTub0/Di3RI276Gcx7vXHDxpE8gkbZQH+iQCCbYDYKwMGIz7zX
         v73dG3mjB16XGIdwblciaOE2XjHsfVkI9Rcgg6HmIprEOuyDx6uOvGJp45v0T3qDu8rI
         R4y+PbfCfr/MrLTzQX0TSqCNM0S9I6RgSEteKZ3t+A9hDUd6RE8oj2LJZkFDxroNpCrX
         2X1g==
X-Gm-Message-State: AOAM532+sEKRNnUAfvsPJsbkMEdvsKEnb456AmPi/xGgTedlqzal/AoY
	W52fevst3z1i/WKX/I9BJ22iA/kuSk8=
X-Google-Smtp-Source: ABdhPJxr4Hx33t5BxHzZRtMGI+BLZ8apff9Gh5+sshwtgu1XC99GUVD2nFuwYYY71LTdnP1nlbpl5w==
X-Received: by 2002:a62:7f01:0:b0:43c:ecef:98dd with SMTP id a1-20020a627f01000000b0043cecef98ddmr17081021pfd.50.1631984267384;
        Sat, 18 Sep 2021 09:57:47 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:46 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 10/18] python3-webencodings: set precise BSD license
Date: Sat, 18 Sep 2021 09:57:30 -0700
Message-Id: <20210918165738.2581429-10-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918165738.2581429-1-akuster808@gmail.com>
References: <20210918165738.2581429-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-webencodings_0.5.1.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb b/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb
index 211b2b3c84..ab33ce66e8 100644
--- a/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Character encoding aliases for legacy web content"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
 
 SRC_URI[md5sum] = "32f6e261d52e57bf7e1c4d41546d15b8"
-- 
2.25.1

