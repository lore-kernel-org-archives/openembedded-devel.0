Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web09.16484.1612087320282018774
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Jan 2021 02:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OydIqXZ3;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id y8so338423ede.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Jan 2021 02:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8OrRJftBZmlq+OEc+3rLwQJ/LvasMmU5QanEwCS9FME=;
        b=OydIqXZ3sr13InNVX94l7bHuODT+bsOs+QWlKDeqaoVzgBy2nqd3954OMrycdmc/ar
         N+sv2yEfKwBpkFen8Y5fiqWjvqyGrwI4836WVq8mOglnY3zyZOAs9H+A5O6EpHlkRgoz
         dcN1KP7HynobXBXdMSC4DQyOBrzJ3erM7hLbwfvOIrXn+kfO/sEBSuyRiRuU3F6tZuhQ
         Lbbgl01YnPLdzU2sgWcpxLoJf6AFs56rw8U8TL0gZnlceaf7B9PuY1ZJcHLYrtFFCZU3
         luWNOiS+g7gw8g/NvSNDP4F0v6wGamyRAHDoSXWfyACmGfYBWKz1uZJMUGHY7Afc/zIF
         7SKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8OrRJftBZmlq+OEc+3rLwQJ/LvasMmU5QanEwCS9FME=;
        b=gGSAW8sby8HgJIu9V0VMKqcEo4alNPyChTku1hCbAY0vg395rFRuVu0DCtXCgOSYNx
         Dp4hTYsC/U+pZSSYLLjqDQ4R+JwKXKhOEqHAFI1d7/9Xwfk+fOZ/aHCAxhwOwdaG5eL0
         h26GMdumfoTjZf92HGPbhD0I2wJkOxpZK1z9ai8DRTC1fCsQsBlce+h7+s+Rdwwke8dI
         jzeopNvxPZ0gq06+Q9WpHTT90WqGlRzkpz6itCPZwNMmIDvXAJi2TUAEOIFaSdK6b3ES
         LZGRG59/18aB3RyTM3yldcsLk7KZIscVI438e3uSIhFr/5RCMN0up5xHODqoM3UXzRY7
         6RcQ==
X-Gm-Message-State: AOAM5306tfLa5u3AfQh7AXZWb0XKGGpKceSiG9K36/and83p2fF9grYo
	AKuf62FXeHE8Ho8uZ3AHSIYlAneSZbs=
X-Google-Smtp-Source: ABdhPJzyI6T9bfMJ7+bfzm1g6hJJx6hG5hOgYt+VL7LoSz421OQZgjIRkELwS4430o1s/dlNvX3BAg==
X-Received: by 2002:aa7:cb42:: with SMTP id w2mr13649957edt.21.1612087318797;
        Sun, 31 Jan 2021 02:01:58 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b17sm7001333edv.56.2021.01.31.02.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 02:01:58 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH] python-native: Fix parsing with default RPROVIDES dropped in oe-core
Date: Sun, 31 Jan 2021 11:01:55 +0100
Message-Id: <20210131100155.9953-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* adapt to:
  https://git.openembedded.org/openembedded-core/commit/?id=b8bbc1bbe282cce2ea4d0ff293f931f6caf6153b
* fixes:
ERROR: meta-python2/recipes-devtools/python/python-native_2.7.18.bb: Error executing a python function in <code>:                                                                                            | ETA:  0:00:32

The stack trace of python calls that resulted in this exception/failure was:
File: '<code>', lineno: 13, function: <module>
     0009:__anon_35__oe_core_meta_classes_devshell_bbclass(d)
     0010:__anon_151__oe_core_meta_classes_sstate_bbclass(d)
     0011:__anon_20__oe_core_meta_classes_blacklist_bbclass(d)
     0012:__anon_177__oe_core_meta_classes_siteinfo_bbclass(d)
 *** 0013:__anon_90__meta_python2_recipes_devtools_python_python_native_2_7_18_bb(d)
File: 'meta-python2/recipes-devtools/python/python-native_2.7.18.bb', lineno: 76, function: __anon_90__meta_python2_recipes_devtools_python_python_native_2_7_18_bb
     0072:        manifest_file.seek(json_start)
     0073:        manifest_str = manifest_file.read()
     0074:        python_manifest = json.loads(manifest_str)
     0075:
 *** 0076:    rprovides = d.getVar('RPROVIDES').split()
     0077:
     0078:    # Hardcoded since it cant be python-native-foo, should be python-foo-native
     0079:    pn = 'python'
     0080:
Exception: AttributeError: 'NoneType' object has no attribute 'split'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/python/python-native_2.7.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python-native_2.7.18.bb b/recipes-devtools/python/python-native_2.7.18.bb
index 72aa34c..5b29c9f 100644
--- a/recipes-devtools/python/python-native_2.7.18.bb
+++ b/recipes-devtools/python/python-native_2.7.18.bb
@@ -73,7 +73,7 @@ python(){
         manifest_str = manifest_file.read()
         python_manifest = json.loads(manifest_str)
 
-    rprovides = d.getVar('RPROVIDES').split()
+    rprovides = (d.getVar('RPROVIDES') or "").split()
 
     # Hardcoded since it cant be python-native-foo, should be python-foo-native
     pn = 'python'
-- 
2.27.0

