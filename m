Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.43418.1589813414472423715
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o6G4lE4d;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id y18so5060074pfl.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xqmImLUEcS57TMDmDF4QGsXgE+xmJl9u7kYVik/NVvg=;
        b=o6G4lE4dqQ8mHeuOk8USQLH6RgOebVoBerxWJBXnxO+h64Uh+Hip/xhYXbBLNoWNcG
         slMMQfOW8JElpOWbJwz9CgIwLlMeUICsc4gvJOTGJWGeR2P4UUxOkp0QgcGLGxQd2UyJ
         RDIW8DGAykskt4ZrfFAJlSX6HgN5N8alJHz5be+MvSTnGx9EeYl9HFxGTxguFE8cwVYp
         sLErSGhU4sWUuUWXZJJ4T91P2o93qyNEFTke/OZglSzqHGCPh60/n3+sV3IhynpxrJff
         fNQSMC3BLWOcbHda2BifhBCI1WbmNpjIU+EOfAn/idyNXWToPJinSB/ZMkeQs7VIxCEU
         wYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xqmImLUEcS57TMDmDF4QGsXgE+xmJl9u7kYVik/NVvg=;
        b=Zkdmm4ERWVKhQTX99X2j57fVrpPP3RALqmsd0+UWpVWeqj0A8NVGC2Mu/m308igFZD
         mVSB6Dojl5PoZBhN4EhPE4d201Z3YtoYOBCvYTG80/xsYy98rb/6suNGkOl6WqBxn2Uo
         uYkRlRTr9kVaQhKcS5c+cT5wNtmE7GxNBVgcHGuX72iljpdtRqMKkxJlRJDARftZxuRD
         dgivP/UqyeG0H2xYTT3b2bvtHhfLCIDnZpTdtWqa3ejvowLnCYYabYSLj7MKqntSvlNL
         eeB925jwaDsPLGqNUEpIprofv5l+15GhB2lgoZlBRrwyMWKipgDQ3YryEmdtgBLgvhmt
         aO/A==
X-Gm-Message-State: AOAM530+56ZttfoaZH6EonEoqyGeHIqhw7mnAEnxGl0dhvYTVQuZdJDW
	cnMFAGr0oKeAVPqJhhyJlJXDNDrg
X-Google-Smtp-Source: ABdhPJwN4rO2QRKgBS3Mxir/gDg6J+BF1e9vLDASx10Ux+8aGTOXRXvnEQ5WY+dWt8BGs7WzdtVmYg==
X-Received: by 2002:a65:4c41:: with SMTP id l1mr15622616pgr.43.1589813413734;
        Mon, 18 May 2020 07:50:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:13 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 07/57] python3-parallax: add the missing rdepends
Date: Mon, 18 May 2020 07:49:12 -0700
Message-Id: <e9e00f7bc83d17f0d06a863ebbe015f1aaaa0b2e.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import parallax
 [snip]
 ModuleNotFoundError: No module named 'fcntl'
 ModuleNotFoundError: No module named 'Queue'
 ModuleNotFoundError: No module named 'getpass'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e04584ef5ba7ed0abaf5b98c2da00bbeab5b6db8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb b/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb
index d658bd621e..60631d43a0 100644
--- a/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb
@@ -8,4 +8,6 @@ SRC_URI[sha256sum] = "e9e4dc500f1306a638df0f19d4ef976a623b260fc614c55cb1fd0d8410
 
 inherit pypi setuptools3
 
+RDEPENDS_${PN} += "${PYTHON_PN}-fcntl ${PYTHON_PN}-threading ${PYTHON_PN}-unixadmin"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

