Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982A6C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:03:59 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.13561.1635260638368165132
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GlU4nRhc;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 83-20020a1c0456000000b0032cb02544aaso2495298wme.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Slj2zJOngMUG6GUDtsNPXoxPwywvwxDPuMFVFLaWG8o=;
        b=GlU4nRhcrLeEhPtZqPLbsqQobaqN2RwNyT5AMHMM5Zo9XhPDzssnGc/zBOaOLm5k4r
         eF/eP+D0Ud5iDYRYC+KHKVuZORGRJPpzpsuyf4kzAGnROGDWG2yQGwlRQLS7mJskhG0a
         KsQNMwfI8/d/goH67+gY6JevsYebXJiKt7thU7IjDBe9KLyM4drEjqjVgbkjoJElYLgv
         3OubM/mR1xBuxL1kUV/yYDbKi6CFa3w/ooP45+CHeef2VsA4gymPyksmSXqyEnEAMhtV
         em/4WTf3HPQMvdETa1sbn46dkYNjiPM//OgfqEwxynnGEqHxsXLEla1dHa5nsxlseOvg
         11/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Slj2zJOngMUG6GUDtsNPXoxPwywvwxDPuMFVFLaWG8o=;
        b=2JX44LE1s1LzTKUKi18jmucPOlk41J8VfJkTf6uCdVHzG71kcijdq0Lb3wAJMx8Gu3
         0J49LoeoIVFDkAFShToQ0DXljIHa3BG3J/mCljLZfvOM+hbPCCcSicvXmHU/MzsuLVoX
         gs9g8m9lOj794Osv/p/QbSB/ajlLVJayvAbxR6vRR6IzzhyBkSyu98wywhIKXg62hIzx
         QPj06M96+/xkaMN1F3n3CHFRkUe7mkt3Lme05v7fOUJPIanIFPjRN8zsv4dLSUCWAPak
         JYDRzKDvtQS0Ah03e0eGjtxZ8+FJOajJdAkPeUbqiz19nkGjYiaar6UELk4ZYnO0DR+T
         3l/Q==
X-Gm-Message-State: AOAM532XsMYTQ5HENGfNbuux8UQZ+8YDdl/+aQtmXpsJRXuS4NZWZnBq
	6b7CpUpDhW9kuz18Z6H4v6gMbG74pWs=
X-Google-Smtp-Source: 
 ABdhPJxPWrS28r1kOVk73BDAcrgqukNpyHC+D5FSr+oT+wcP25MA44gdyqDt9KvMZH6mfN4x40d5Og==
X-Received: by 2002:a1c:f402:: with SMTP id z2mr59531330wma.53.1635260636749;
        Tue, 26 Oct 2021 08:03:56 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k8sm857531wms.41.2021.10.26.08.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 08:03:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH 3/3] python-m2crypto, python-pywbem,
 openlmi-tools: blacklist due to openssl-3
Date: Tue, 26 Oct 2021 17:03:50 +0200
Message-Id: <20211026150350.1290780-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211026150350.1290780-1-Martin.Jansa@gmail.com>
References: <20211026150350.1290780-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 15:03:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93601

* python-m2crypto fails to build with openssl-3.0:

http://errors.yoctoproject.org/Errors/Details/614896/
SWIG/_m2crypto_wrap.c: In function 'init_m2crypto':
SWIG/_m2crypto_wrap.c:32981:102: error: 'RSA_SSLV23_PADDING' undeclared (first use in this function); did you mean 'RSA_NO_PADDING'?
32981 |   SWIG_Python_SetConstant(d, d == md ? public_interface : NULL, "sslv23_padding",SWIG_From_int((int)(RSA_SSLV23_PADDING)));
      |                                                                                                      ^~~~~~~~~~~~~~~~~~
      |                                                                                                      RSA_NO_PADDING

* python-pywbem, openlmi-tools depend on python-m2crypto

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/python2-target-recipes-blacklist.inc | 4 ++--
 recipes-devtools/python/python-m2crypto_0.30.1.bb        | 3 ++-
 recipes-extended/pywbem/python-pywbem_0.15.0.bb          | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/conf/distro/include/python2-target-recipes-blacklist.inc b/conf/distro/include/python2-target-recipes-blacklist.inc
index 71833dd..9480297 100644
--- a/conf/distro/include/python2-target-recipes-blacklist.inc
+++ b/conf/distro/include/python2-target-recipes-blacklist.inc
@@ -8,5 +8,5 @@ RDEPENDS:packagegroup-meta-oe-dbs-python2:remove = "${@bb.utils.contains('I_SWEA
 PNBLACKLIST[lio-utils] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
 RDEPENDS:packagegroup-meta-oe-support-python2:remove = "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'lio-utils', d)}"
 # meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
-PNBLACKLIST[openlmi-tools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
-RDEPENDS:packagegroup-meta-oe-extended-python2:remove = "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'openlmi-tools', d)}"
+PNBLACKLIST[openlmi-tools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'depends on python-m2crypto which fails to build with openssl-3', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+RDEPENDS:packagegroup-meta-oe-extended-python2:remove = "openlmi-tools"
diff --git a/recipes-devtools/python/python-m2crypto_0.30.1.bb b/recipes-devtools/python/python-m2crypto_0.30.1.bb
index 6bd6170..5c595f8 100644
--- a/recipes-devtools/python/python-m2crypto_0.30.1.bb
+++ b/recipes-devtools/python/python-m2crypto_0.30.1.bb
@@ -63,4 +63,5 @@ do_configure:prepend() {
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-m2crypto] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+PNBLACKLIST[python-m2crypto] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'Not compatible with openssl-3, http://errors.yoctoproject.org/Errors/Details/614896/ SWIG/_m2crypto_wrap.c:32981:102: error: RSA_SSLV23_PADDING undeclared (first use in this function); did you mean RSA_NO_PADDING?', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+PNBLACKLIST[python-m2crypto-native] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'Not compatible with openssl-3, http://errors.yoctoproject.org/Errors/Details/614896/ SWIG/_m2crypto_wrap.c:32981:102: error: RSA_SSLV23_PADDING undeclared (first use in this function); did you mean RSA_NO_PADDING?', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
diff --git a/recipes-extended/pywbem/python-pywbem_0.15.0.bb b/recipes-extended/pywbem/python-pywbem_0.15.0.bb
index 6661ac5..6604452 100644
--- a/recipes-extended/pywbem/python-pywbem_0.15.0.bb
+++ b/recipes-extended/pywbem/python-pywbem_0.15.0.bb
@@ -67,4 +67,4 @@ ALTERNATIVE_PRIORITY = "30"
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[python-pywbem] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+PNBLACKLIST[python-pywbem] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'depends on python-m2crypto which fails to build with openssl-3', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
-- 
2.32.0


