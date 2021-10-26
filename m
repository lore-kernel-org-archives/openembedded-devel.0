Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD690C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:03:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.13558.1635260635883868921
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S1Qgkcx6;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 z81-20020a1c7e54000000b0032cc97975e4so2075413wmc.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cY+hwhUN9NpLMWLtifxDx35LUqDDX2+su7w0P3afusE=;
        b=S1Qgkcx6/MJF8wQkAqbIChhJ4AgW11cYB2PDPsdkG5NNtBG/kuBTo6X+BdCyVmkAHv
         dwgCLCV98kQI6zTvI4uh/PYcn701h1yt8ykzTz0IZvu0S97hP78tgGmLkpz5IC8eIFV5
         ecHlSGVJ5xQ6v0N9zmBqtBVLFF/WzrE5tG1wF1mBPlLmnL0S9m+JroT9UTGd92P7mJHF
         3vXUUKVkr9EzXP/EcqNRAwb43zTIgdk4+S68kIRA3murSR1moTSTv/lX3nvEatB4lCKU
         AC49X3T6C+IYUQa143pHH0LQeP8GPTouAc1NNM0dkITpRJjZ5pDiYBIdQ09ATqbjgHpn
         S7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cY+hwhUN9NpLMWLtifxDx35LUqDDX2+su7w0P3afusE=;
        b=PQNIx2M2BRGES7e/f9kKdmo0xUuZiduBqwJZi2BKRBbWPQnVcFZVw76hO+09zZzMpG
         M55j8mOxVSjmYxQw93R3yXYUYRkgFwK9m1svJQ+u874RDrp3bF/PZtklCLWnNcv17v91
         NdT5AvoWPgnXojxyN53aAzZvEgOn0ClkLGb9bG1VsebXwRmKaetlGGF2hzrqCc2t05Bj
         7OTWoiESTO0A5iRKaQvsKBmnCgKF6Vi+siJ4QP9GVrTboSjtCpAiP2NDsN4kFKnKF1a2
         a9JCk9c96eHlSil6AbH3K45K8b74qpENh9KIoOo8/NgUmApB3arCJ20xY5KnD/Yv+Igf
         kI3A==
X-Gm-Message-State: AOAM533iRUJbGbgsuDW+AUMLYdRuMByrgOKNRwVzIYQpEYwOWrIiTsr9
	SOSXy7jbcFjRbq98n48A4xST2wdxlqk=
X-Google-Smtp-Source: 
 ABdhPJwms1PYuDA/cxmQbQbMLd93UZTSEwiZO1bT32SExnPqRFzDePq/OyHvLZNevJbqbLtBFQJo9A==
X-Received: by 2002:a05:600c:19cf:: with SMTP id
 u15mr27750159wmq.45.1635260634182;
        Tue, 26 Oct 2021 08:03:54 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 i13sm1018643wmq.41.2021.10.26.08.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 08:03:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH 1/3] python-pyparted: inherit pkgconfig
Date: Tue, 26 Oct 2021 17:03:48 +0200
Message-Id: <20211026150350.1290780-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 15:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93599

* otherwise fails when searching for libparted:
  http://errors.yoctoproject.org/Errors/Details/614897/

DEBUG: Executing shell function do_configure
Traceback (most recent call last):
  File "setup.py", line 60, in <module>
    check_mod_version('libparted', need_libparted_version)
  File "setup.py", line 54, in check_mod_version
    modversion = subprocess.check_output(["pkg-config", "--modversion", module]).decode('utf-8').split()[0]
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/python-pyparted/3.11.4+gitAUTOINC+104ca13567-r0/recipe-sysroot-native/usr/lib/python2.7/subprocess.py", line 216, in check_output
    process = Popen(stdout=PIPE, *popenargs, **kwargs)
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/python-pyparted/3.11.4+gitAUTOINC+104ca13567-r0/recipe-sysroot-native/usr/lib/python2.7/subprocess.py", line 394, in __init__
    errread, errwrite)
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/python-pyparted/3.11.4+gitAUTOINC+104ca13567-r0/recipe-sysroot-native/usr/lib/python2.7/subprocess.py", line 1047, in _execute_child
    raise child_exception
OSError: [Errno 2] No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/python-pyparted/python-pyparted_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/python-pyparted/python-pyparted_git.bb b/recipes-extended/python-pyparted/python-pyparted_git.bb
index 76981be..b5d6ef4 100644
--- a/recipes-extended/python-pyparted/python-pyparted_git.bb
+++ b/recipes-extended/python-pyparted/python-pyparted_git.bb
@@ -27,7 +27,7 @@ RDEPENDS:${PN}:class-target += " \
 "
 RDEPENDS:${PN}:class-native = ""
 
-inherit distutils
+inherit distutils pkgconfig
 
 RDEPENDS:${PN} += "python-stringold python-codecs python-math python-subprocess"
 RDEPENDS:${PN}:class-native = ""
-- 
2.32.0


