Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.130108.1597997060893659730
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 01:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=THcsisYZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: jonatan.p@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id d19so630620pgl.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 01:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/3cATWhBEklL7RMCcOeRMHc58q1fd3fOPZyN0JWq0yA=;
        b=THcsisYZ73fCgo4uIItHMx/miTIuarHGvdkPsGKIPcaXMCyCbsNCyHzVhFoIgQ+i8B
         fywMJGD+9iBreTzy7UMqzK/7lSK4BU80b2qUtzS+89J9f1pwAkMfYO/O3TVoR3vMMMRj
         nKrM/kgbbAb1z/HR7TPjo5xnl4O2TrUzCgE+Rts1782ERLyuKPHYfTOP5RSPoA2GydG6
         a0aw6sPzCrZs7nwMfqzxAu7rt4tKBFYiyno/Ll+1NLvCu0AjiSgrKLabcSh3CMIQfiio
         2c6bVw14+QzMGGqD7m9UGrdkzXjXRMz5eJy0jcCHlmWJyTRvx6M2KwbhL/1lcWfK44x2
         UDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/3cATWhBEklL7RMCcOeRMHc58q1fd3fOPZyN0JWq0yA=;
        b=T9ZIaj8IEmv2U3sHQ/jXOKP9FNrKyw8mQ7W+JieZa/L0cbOtd+q/nsudo1JOBZFP+u
         o+LMgr/nU2ykgpm9dkk0HgonIemVO9JNuh+LUNnuxgd2v8xsvrGBq6OgeOooRbQ5M288
         B161Xux07HIP4YaXXy8oL3mlOMF9yLj8WhywSl69CUuauHXtdAqkLEcmAHezymhfGaFT
         jLj2SSmp9iD5obDTHhPiBIVVhVAnHRtQJ0hl3wvJySl5M9YuqoEhcLTvxJEu1Y2g79TI
         Gk39IRnj/x6XHvtSA3chfF9j3TQTMD7m2ry6RIx19DBvfWP6taocrRhGDicq3auRzb2u
         byBw==
X-Gm-Message-State: AOAM532A9eQ3wmTYHhvioGG41YAeVxCeIW98/c/CROc/BHnq0YvVPc+Z
	qLdoSuXQcrA2oT5icWt+ezJagW5Jzjc=
X-Google-Smtp-Source: ABdhPJzrauISvBzLA0c/Mnv5Dy5VcZs9UZnulmJVcvIB/+jdZz/VETxk7u/PLEKelwUy9X30v19Gcw==
X-Received: by 2002:a62:1dc3:: with SMTP id d186mr1550236pfd.93.1597997060024;
        Fri, 21 Aug 2020 01:04:20 -0700 (PDT)
Return-Path: <jonatan.p@gmail.com>
Received: from X1.corp.ad.wrs.com (h-170-217-237.A357.priv.bahnhof.se. [81.170.217.237])
        by smtp.gmail.com with ESMTPSA id v20sm1092145pju.14.2020.08.21.01.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 01:04:19 -0700 (PDT)
From: =?UTF-8?B?Sm9uYXRhbiBQw6Vsc3Nvbg==?= <jonatan.p@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Jonatan=20P=C3=A5lsson?= <jonatan.p@gmail.com>
Subject: [meta-java][PATCH] openjdk-8-native: Don't warn for stripped libfreetype.so.6
Date: Fri, 21 Aug 2020 10:03:50 +0200
Message-Id: <20200821080350.2936495-1-jonatan.p@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Mimic the approach used in openjdk-8-cross.inc and add INSANE_SKIP for
"already-skipped" to avoid the following warning:

    WARNING: openjdk-8-native-252-r0 do_populate_sysroot: File '.. snip .. /build/tmp/work/x86_64-linux/openjdk-8-native/252-r0/recipe-sysroot-native/usr/lib/jvm/openjdk-8-native/jre/lib/amd64/libfreetype.so.6' from openjdk-8-native was already stripped, this will prevent future debugging!

Signed-off-by: Jonatan Pålsson <jonatan.p@gmail.com>
---
 recipes-core/openjdk/openjdk-8-native.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
index 24b6f20..92d9473 100644
--- a/recipes-core/openjdk/openjdk-8-native.inc
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -88,3 +88,6 @@ do_install() {
         ln -sf "../lib/jvm/${JDK_DIR}/bin/$tool" ${D}${bindir}/$tool
     done
 }
+
+# FIXME libfreetype.so.6 is copied from STAGING_LIBDIR which is already stripped
+INSANE_SKIP_${PN} = "already-stripped"
-- 
2.26.1

