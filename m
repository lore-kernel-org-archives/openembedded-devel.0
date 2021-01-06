Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.9425.1609946288432739585
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hv3ScnXk;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id lt17so5552027ejb.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FiaEhXMxTnolmAqiD1JE9FHJu8eoaB+Y8Xjn94lmqwU=;
        b=hv3ScnXkSTrhBTB+hX+PpFyODQSFBCkDucdCjaarsGget4hx1sB0F+E+U38PpTwEvl
         /pr/bP9zT3kmZ+ax86P8xvofXaNmqDaamd2PoWrHlFotOZnwBvWUSPgf+x8K44cDYFd0
         ka8aa5xv1fJ4s7RBfpZEcMyW6lOdieUwvBEqfXCaX1p/5ZYEBO8XuEvESBbgEyMSyZ/J
         715DGzPL+WcnaP11d7oeh/Ac3DfsrcAnJJuWiwZqiI3oLGZlRPUoRqMTNnlJkeGJvtQc
         0aDbSUFT5V3cNdT56FULaIIikCHWstJhaPfIwb4UECBBOKAykWC7I/lOPHpgvcKH7nPd
         E/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FiaEhXMxTnolmAqiD1JE9FHJu8eoaB+Y8Xjn94lmqwU=;
        b=moJbaGMKW4mTJBOc3gIV1QDViOXQpcDT451eeGc5TMSm/I2pZqZT+uMZgDsouxHSVU
         dEr5Wc3ox4qAQBOE3bMXkkqcBaGm9bYbOTzjY5yP2HEc+GlUlcCHvWJ3mfgkiXrzwFYz
         71rEox8hVieMX3fZPAbijxUwPNg7pYgpDGI7HREhYzZFJ8OVM+lFr0rE3T4f/o/mMZZ0
         UQz+BJNiTSK/elrDJonxYd+vV/e08JKc+Ia5W3/eTTCod9GTHFwKTMMOPpuMtSCb/1Yk
         bGdkV8DOcpPqv+mPt1grrWJsNVDFRiYB4mTSPRsl4GubXbdO5ftehmrKbOYvv3bZMD3A
         d69Q==
X-Gm-Message-State: AOAM533Zl5ggy4nirbFELNYA81ksVsSuN8SVaaWTqSJ5OpGBK303G7Sp
	E+EQA4bwh1JVxkoVFrLM6u4h5aQ/10t/1A==
X-Google-Smtp-Source: ABdhPJzMep3k3USIwaoQ35QaSOVLkzACwNh7dn2s1r1GgDkq65jCSCTo0Vvxl+nCBfnwRbr9YGWLTQ==
X-Received: by 2002:a17:906:144e:: with SMTP id q14mr3132414ejc.150.1609946287090;
        Wed, 06 Jan 2021 07:18:07 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.18.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:18:05 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 28/28] blueman: upgrade 2.1.3 -> 2.1.4
Date: Wed,  6 Jan 2021 16:17:17 +0100
Message-Id: <20210106151717.1779543-28-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Security release, see GHSA-jpc9-mgw6-2xwx/CVE-2020-15238 [1]

Changes
    Force cython to use python language version 3
    Do not use exitcode 1 when we expect to fail
    Mark more strings translatable (@cwendling)
Bugs fixed
    Unstranslated strings
    Searching (with Ctrl+F in manager device list) did not work
    Default PIN lookup
    Fix device removal handling (@Yannik)
    Only use LaunchContext when we have proper event time

[1] https://github.com/blueman-project/blueman/security/advisories/GHSA-jpc9-mgw6-2xwx

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../blueman/{blueman_2.1.3.bb => blueman_2.1.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/blueman/{blueman_2.1.3.bb => blueman_2.1.4.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.1.3.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.1.4.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/blueman/blueman_2.1.3.bb
rename to meta-networking/recipes-connectivity/blueman/blueman_2.1.4.bb
index 9143a67ae..29bef230e 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.1.3.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.1.4.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
     file://0001-Search-for-cython3.patch \
     file://0002-fix-fail-to-enable-bluetooth.patch \
 "
-SRC_URI[sha256sum] = "3bd02e0cc9e2c1424df1fc2015da710a280ef4c657515727e47eafabf8c2cfde"
+SRC_URI[sha256sum] = "1d9c3d39a564d88851aa8de509f16bfa586b0b50f4307dc6c6347ba4833664da"
 
 EXTRA_OECONF = " \
     --disable-appindicator \
-- 
2.26.2

