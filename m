Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977ABC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:03:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.13559.1635260636816958986
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fC6hq4Lt;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id m42so14431325wms.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RqZsXNeK4lobkw4GJnjgwE7zXv2c6iqNLWwbHJRmRho=;
        b=fC6hq4LtYLnw4skeKKydfjetBcWVmD7OuTHoCcMhPP1dXYiK818VzXu/FCdkMDgX7Z
         beYw39oL1nLsqb4SU4powgGvBL/ogxcIsiebUXnJcEQ6ntUm4LA2PHDvUB0BxIDNaMX4
         odxLVKQZuDPSZ7jLmnULJenqTLn2Ueu1nf5jl/BrfVP0UGlqMllQio/VhdLZxQsO7wAn
         JFscFWqHYnct5X5ewwhv6nWskkMe87gPgMYsatMoEqVSxycbvtahlI6aGsjCa/4DepTD
         VnOQt5Mw2GIJIHkPk2m1rCW+0NExdEJ1l1gV2OZ4YX8owbce+np8z77BXT//FegoAKas
         Gb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RqZsXNeK4lobkw4GJnjgwE7zXv2c6iqNLWwbHJRmRho=;
        b=ax/yS5hYdeeECp+0H3NHWzmosWuO8zU7dygNgbxTZRkZvZtHIaJm4H4grpOe6CMOAf
         D7BfCXx5CMCitrSRpm8yF2Mog6cMa2MCnFon2VtuDd202LcPUbppR0pRjQ9zKVYUGTf+
         ewBrtUHw0bt9nPCy/Ua8l8YxzbvShi8nD5njssiZlQarIBOqSqGK8uVBw/mqlnTAneb/
         jvCTxyGklw/egYskM4TDH8IRvcVWQP+VTEc2+MbHDUD5btWp90rqtMPN/GoH+W/SfauM
         f/6b5ev/uKwfmz0HYOsCwJGLo+pGTnofSOrxtm9BEX/BsNWZyDe46dZsC3xnNXejthuI
         Zkaw==
X-Gm-Message-State: AOAM530yJKJcCcMH5cRkI3dSaInQzNKgLTmXARwOzxMVD2uWql7eKd8I
	kIi7sVY076BgFC88iV1hynxjIWJBvYU=
X-Google-Smtp-Source: 
 ABdhPJy6hGXWd2xxKVSoq5ZbMOV5NqLBVEmTOCmmle0BpKCqVZUrrCqXE6cQ0KYPIU5Vs5ehNivupA==
X-Received: by 2002:a1c:1941:: with SMTP id 62mr27371034wmz.131.1635260635482;
        Tue, 26 Oct 2021 08:03:55 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l2sm952002wmc.3.2021.10.26.08.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 08:03:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH 2/3] python-systemd: inherit pkgconfig
Date: Tue, 26 Oct 2021 17:03:49 +0200
Message-Id: <20211026150350.1290780-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211026150350.1290780-1-Martin.Jansa@gmail.com>
References: <20211026150350.1290780-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 15:03:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93600

* otherwise fails when searching for libsystemd-journal:
  http://errors.yoctoproject.org/Errors/Details/614895/

DEBUG: Executing shell function do_configure
Traceback (most recent call last):
  File "setup.py", line 55, in <module>
    **lib('libsystemd', 'libsystemd-journal', **defines))
  File "setup.py", line 40, in lib
    status, result = pkgconfig(name, **kw)
  File "setup.py", line 18, in pkgconfig
    status, result = call(pkgconf, '--libs', '--cflags', package)
  File "setup.py", line 8, in call
    universal_newlines=True)
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/python-systemd/234-r0/recipe-sysroot-native/usr/lib/python2.7/subprocess.py", line 394, in __init__
    errread, errwrite)
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/python-systemd/234-r0/recipe-sysroot-native/usr/lib/python2.7/subprocess.py", line 1047, in _execute_child
    raise child_exception
OSError: [Errno 2] No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/python/python-systemd_234.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python-systemd_234.bb b/recipes-devtools/python/python-systemd_234.bb
index 907ea99..fd657ed 100644
--- a/recipes-devtools/python/python-systemd_234.bb
+++ b/recipes-devtools/python/python-systemd_234.bb
@@ -8,7 +8,7 @@ DEPENDS += "systemd (<=234)"
 RDEPENDS:${PN} += "systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging"
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-inherit pypi features_check setuptools
+inherit pypi features_check setuptools pkgconfig
 
 SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
 SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
-- 
2.32.0


