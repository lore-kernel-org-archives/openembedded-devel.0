Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.3395.1616141914676344115
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Mar 2021 01:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PbRDFxhA;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so4465038pjg.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Mar 2021 01:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=INcaeuvwury6xRq2BzbKccIw+4UJhLJNRyhkpazMhmU=;
        b=PbRDFxhA/TRDXmx8/IYf5BOa1P+6+OZKTI5lifOA1UgvKtjZ5V7qpxSv+AngPwjAaK
         NiL5EMmsz/IHmQRKJSthYK4GZ9Yfy8iaA6mYAsO52JJkzTZzGg3hL1KXcAXLOzEUFS9h
         +aVzBtzKs0VcNZYJuoswijlMMCUs0Ad9qpFzA4AARR2UI4WiNEf67OJHiVEuERmYj/2b
         idDpayjtauhyTVbytadD8HvVG0Q9RAUYMbnBgsAp3xmGliTkCBmyfCIV4XvxJzC91GnZ
         BBoCNwSIwB52afPoTISQqIZVLC0C/4dIBAa2JAHCHvC5k7BuiPYQOdUz8LFMj9M7PbKr
         H1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=INcaeuvwury6xRq2BzbKccIw+4UJhLJNRyhkpazMhmU=;
        b=IUglFOnFLCOWS45JazdX+GWdWWFls2t4EN9KvYVuYpXC7/50dTR9EtdEueOWZlmG1C
         1KCwMTH2MjoW5owJ6TMXSg2hf4Ij+GRxC4YRDvaHcRCnxI/GULaTKI0bUiVD1tX7d6yZ
         PNEoWtgSj9I3QXNXvUuuAWysZ0EZY2uPbNZqym3ByvhiGvdp5SDwecH+4xdYmOvUzGng
         EmP6/PKyXw5Zp3qGpAM1MAVxftT14JuaI7dT4Pcn545E173xUZ4kixsgN9q6bySDIA1f
         wtZ6nH5/WAfcL3pRJzQr9km11TCr/O4JSOILr8Mov8W358V3beX+hEQoHh5ChWTUnCEW
         u3NQ==
X-Gm-Message-State: AOAM532yQfCGgHtcdrsjpl2nWK9OQ0zFFCIhf6ZCGcLB+CG6iwZSlxOn
	obHYtKuKs7RJXQVPWOhIBBr+De1BloDWaA==
X-Google-Smtp-Source: ABdhPJwb7ZW7ARazpecAZZidKmJqopsmAxyf/5dMdjZNQiUIXRG/sfVwu8uWBzj/g0Nq/7gDG01+dA==
X-Received: by 2002:a17:902:da91:b029:e5:e7cf:d737 with SMTP id j17-20020a170902da91b02900e5e7cfd737mr13343216plx.24.1616141913682;
        Fri, 19 Mar 2021 01:18:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id u79sm4044974pfc.207.2021.03.19.01.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:18:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] vboxguestdrivers: Add __divmoddi4 builtin support
Date: Fri, 19 Mar 2021 01:18:31 -0700
Message-Id: <20210319081831.2979642-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc 11 needs it on i686

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../vboxguestdrivers/add__divmoddi4.patch     | 36 +++++++++++++++++++
 .../vboxguestdrivers_6.1.18.bb                |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch
new file mode 100644
index 0000000000..8dd30a20ef
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch
@@ -0,0 +1,36 @@
+add __divmoddi4 builtin
+
+GCC 11 will generate it in code
+
+void foo(unsigned char *u8Second, unsigned int *u32Nanosecond, long long timeSpec)
+{
+    long long i64Div;
+    int i32Div;
+    int i32Rem;
+    i64Div = timeSpec;
+    i32Rem = (int)(i64Div % 1000000000);
+    i64Div /= 1000000000;
+    *u32Nanosecond = i32Rem;
+    i32Rem = (int)(i64Div % 60);
+    *u8Second = i32Rem;
+}
+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/src/VBox/Runtime/common/math/gcc/divdi3.c
++++ b/src/VBox/Runtime/common/math/gcc/divdi3.c
+@@ -68,3 +68,12 @@ __divdi3(a, b)
+ 		uq = - uq;
+ 	return uq;
+ }
++
++quad_t
++__divmoddi4(quad_t a, quad_t b, quad_t* rem)
++{
++	quad_t d = __divdi3(a,b);
++	*rem = a - (d*b);
++	return d;
++}
++
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb
index d620e9893f..1def1a3115 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb
@@ -14,6 +14,7 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
     file://kernel-5.10.patch \
+    file://add__divmoddi4.patch \
 "
 SRC_URI[md5sum] = "c61001386eb3822ab8f06d688a82e84b"
 SRC_URI[sha256sum] = "108d42b9b391b7a332a33df1662cf7b0e9d9a80f3079d16288d8b9487f427d40"
-- 
2.31.0

