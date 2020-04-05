Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web12.19826.1586101789661439268
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 08:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Aty1u6mA;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id d24so4894461pll.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 08:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LdrX6sEsYp/8Mxg8oEkzoXLRKAYNJHLu0ayp3SY2OM0=;
        b=Aty1u6mAr9rZJ/UP4U85Do2hOont4+jRDCQHKV/r03m+jB3m7amCh8PsRzyMXO+KH3
         IRXP00iDJ9Ddkte8cYnADWYqbc9G2zJx104+Sk6bda5NmE5Qc/TG5GlMkj+tPPBya9tK
         9+x0nlj742eNbRGl4Xh9B+Paynp9L//sgEmRHCAc6e/74XsxS+zIqhCyX8bet5BPRh7f
         XBCfOcGsriZIvnckK4zDM7p1YTOlwCFC1kdz0cVRYPaL6P2FzImNYSN4+aNTRLHesXkt
         a4ETf642EAUYOM6bgpj/FNstEoE1gpnws5qDy7PATjOB0+vRYfha68D9ncir9Glat/0+
         H63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LdrX6sEsYp/8Mxg8oEkzoXLRKAYNJHLu0ayp3SY2OM0=;
        b=EYGLz0z0Qwu8eg6ya3MOInISB0BZBEa41QzSCWRzf2o2wdaTLqtmz9+LxZ0NrQqQf3
         AAik5tViMH99D6dRuNJjP8lKOiHgpopRBvzt+jJmyUIe1LGP9KkLCVAN2HWKP+IcrhN8
         Rsp/nukXoRQofrBPLEdAzwysJ5TIY+Aw1IyZ+R5HIjNHyX3+gyUgiGRJm032QD1HyfZw
         xflTpkd4ViP1E9vAZXvVXHqABryX4rXOIorRhQ/iG/1snWmnmms4aD0M/qHeW+1t6vrj
         aI9/aG7wPzz6/XxkCol97ABYVlhsq0fybm7nSTmN3FUlPbiZUj5woTcP6dbCGdnxGNTM
         U4fg==
X-Gm-Message-State: AGi0Puaj8gsGTmiWxJaQ9PMQqoreRU02GiAIq/FzpPz7lsgwlwSAyhZ0
	VaZvumXx7FZfqpcaZ/qjH4uraytykRo=
X-Google-Smtp-Source: APiQypJM/ffte8Y6nzcNvVLp1LTlWcm9tUw5vnc1DQIA583gW+ZgaheQEvY/Kk/BA74pAfgHm0AWAg==
X-Received: by 2002:a17:90b:3009:: with SMTP id hg9mr21161690pjb.108.1586101788702;
        Sun, 05 Apr 2020 08:49:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3e84])
        by smtp.gmail.com with ESMTPSA id k14sm9692933pfg.15.2020.04.05.08.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 08:49:48 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Kelly <mkelly@xevo.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 2/4] upm: Undefine PYTHON_EXECUTABLE cmake variable
Date: Sun,  5 Apr 2020 08:49:59 -0700
Message-Id: <20200405155001.1816150-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200405155001.1816150-1-raj.khem@gmail.com>
References: <20200405155001.1816150-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

upm has its own mechanism to detect python that it has inherited from
openCV, this was forked long time ago and never updated to latest from
openCV, ideally it should be fixed to entertain PYTHON_EXECUTABLE
variable passed from cmake but it does not and causes build errors,
proper fix is left for upm community, here we ensure that we can still
compile after OE-Core change

cmake: fix Python executable with cmake

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Kelly <mkelly@xevo.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/recipes-extended/upm/upm_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 3ab6bbb6ba..2e8ec0e022 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -27,6 +27,8 @@ COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 
 inherit distutils3-base cmake pkgconfig
 
+EXTRA_OECMAKE += "-UPYTHON_EXECUTABLE"
+
 # override this in local.conf to get needed bindings.
 # BINDINGS_pn-upm="python"
 # will result in only the python bindings being built/packaged.
-- 
2.26.0

