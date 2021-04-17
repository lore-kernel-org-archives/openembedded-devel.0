Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.3559.1618693573887402372
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IkZZhM1+;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id a12so20619742pfc.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=f2B/bfcg5yqkbUpJMGS34mNU46cWc6qMe7WeBJKPWcc=;
        b=IkZZhM1+V/kq4qMTUMNvQ5Za+ZiG5ulqK+fn3PqSIzJmW2nfNcUZWLQpm8FYRHp6l+
         89h9eCHFp/N0ksValniA2IoNRTBuD5CbjuGpToWcRxEoKZxrj5uHLXn4TEYrikYUpyYf
         IR54hJGE0mH0Sne8mLn8Drz3/tPU0gVGAqNhQLDHp4s68/lsfQaiHQr68XQIQAt+rGAT
         HG8TrnZy3HSC1/24OPQ14l3XbRubw5ZjWgidJnAmWxUoaxAcp72K2V0KKQ11jr35OiD9
         ZPei67IUDPVbnik/wWAZ0ICGs0QncUGrzfORh3wW533Hu2ZYtWqKRE7LIw1evb8IPKQL
         /OuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=f2B/bfcg5yqkbUpJMGS34mNU46cWc6qMe7WeBJKPWcc=;
        b=hOXHwkbukKIBtuuarEg78j0KW6/g+z78Dd+u7Nfnp0zwcHScvH8SDYpPhjmmgDs6sK
         Nk377D2hOGAIcyqTK6LslF5B5bcxT/rZL7FRq6spiwkn0n/MeUlCoTbg3a66bCaa/lv2
         uB1KXH4WyFjNrIWhEGj974Pvl4sk4Qwmn7CmwJ8M6cbT80ocQz3bmGPOBh6tu8okM//N
         3CLoY3Hpz2zIAHQHNxeW4LB5x1OqWj76bdXuZ3dm9DzjYq/2EN1/lPUGL4Vxw2jTrdLg
         L4BzEdAVmr78N4BbD6kAHUt7vHO93TpuayJCD1QOsj5RYFSC1YZVI+ZCY1fBXoQwwIe7
         4vnw==
X-Gm-Message-State: AOAM532fVZqzAE2eCL9jW3IkbloS0rAUaj4YMfIV6vihahtbRDhmPI0N
	xFqEUbVCCHP8W+2tO8TGKqVXInuYi8uHnw==
X-Google-Smtp-Source: ABdhPJyWGo7ZXHYzqPzC7CxC2f3519DYppQBNiaOQF4sUTHEFVImBOoYmDXUSjKah1AXEzXaZ1ctGg==
X-Received: by 2002:a63:fb12:: with SMTP id o18mr4760397pgh.438.1618693573161;
        Sat, 17 Apr 2021 14:06:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:12 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 04/50] python3-ruamel-yaml: Upgrade 0.17.2 -> 0.17.4
Date: Sat, 17 Apr 2021 14:05:13 -0700
Message-Id: <6beb289d5a935ad7a8c05680e53a73bfb4898011.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 0.17.4:

- prevent (empty) comments from throwing assertion error
- fix for issue 382 caused by an error in a format string
- allow expansion of aliases by setting
  ``yaml.composer.return_alias = lambda s: copy.deepcopy(s)``

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 5aaffd50a7df53f2b6b704a350d4a8cc37059eb5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...hon3-ruamel-yaml_0.17.2.bb => python3-ruamel-yaml_0.17.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.17.2.bb => python3-ruamel-yaml_0.17.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.2.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.2.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.4.bb
index 6f15d1e709e..2543269fc89 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.4.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "8f1e15421668b9edf30ed02899f5f81aff9808a4271935776f61a99a569a13da"
+SRC_URI[sha256sum] = "44bc6b54fddd45e4bc0619059196679f9e8b79c027f4131bb072e6a22f4d5e28"
 
 do_install_prepend() {
     export RUAMEL_NO_PIP_INSTALL_CHECK=1
-- 
2.17.1

