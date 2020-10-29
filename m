Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.6391.1603965830089205192
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2020 03:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lKIhi6IZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id w1so1281715edv.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2020 03:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GZ5qRooekEJTuAVgPwlGDPQB4CnE/mBkVQ0+8cp9Nh8=;
        b=lKIhi6IZggBquil+/iNPv5wLm6Kr663M1n5DAEOqkDAbD3qmXU0kDJGPuCkYvj6RHF
         ynENkslDwfLDE+t3ci4gnJjYv446EPQcOM+G3cAH7JKxxZH6fFd8d8R1pbh8Gui1XQYY
         aVBS5x8i4oJxfXmHovXjODb32Xnm/yufrUSZXDFYUBnyECTHUSY4UHN+T/3EBDf+igEM
         0QbTy/xy9edk4EekTGvUIXB7O870zawtk/4qBIKchmkgrYzCcroFGkFiGe1+y5Ic3InH
         s2nRFHFCBefNRZcZdiP7/4puMJAQ6H2DBnOpY5H/gLj2XM3yijst/yTRs/2BQONcd5MS
         sawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GZ5qRooekEJTuAVgPwlGDPQB4CnE/mBkVQ0+8cp9Nh8=;
        b=MCdtKMhCI3CvoNwNIou/0Qqh2AwPxsxUU1pelSLg77uW7itbl1LbI7Pv6+FrFsn8VK
         Aeg9iDKlp8a5jpspcAte9q/XXSDX9Fl8HkYzlBoqRdETShmCxfj9MK/zUZxj0xmxjKv9
         hqjG/mzIXRTvQs0e4a8NV8GJckTUPNHip8lwazk/aISP241LO1X3fa/IO+pncZKTi4et
         fCGYeGDXoUJNVIKSCRdNjbysSacPyEisn/wMcSfXQvStDxuvoW/qxNFibtU6RcjsO1lL
         6gXPfsSviCMEhWOPjP631U0FJXPL5EVxGPhri7u8L+xgf2hwwy5jPu1NOnPS7QBBOv2L
         qN8Q==
X-Gm-Message-State: AOAM532PHtDA/JdPtnk9xoEnw8lPYQvMgHMJU5rKLRwktK9dnza7/Vk2
	XGVoP801OPG8kaSqmBAkShlLYihyg7YZhA==
X-Google-Smtp-Source: ABdhPJz6Xk1HT/GpnEj2LSd9UL7YOrgEUwWIXAVGuL/8zsKucl7TQgmTY7zNvprAJioG1a7IfTR7dw==
X-Received: by 2002:a50:e881:: with SMTP id f1mr3153618edn.58.1603965828159;
        Thu, 29 Oct 2020 03:03:48 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q2sm1196316ejd.20.2020.10.29.03.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 03:03:47 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/4] collect: do not build with -Werror
Date: Thu, 29 Oct 2020 11:03:36 +0100
Message-Id: <20201029100339.26698-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The option is prone to unwanted regressions, particularly
new version of python has introduced new deprecations, which
broke the build.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
index b9e735f27..f84a91adf 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -56,7 +56,7 @@ EXTRA_OECONF = " \
                 ${FPLAYOUT} \
                 --disable-perl --with-libperl=no --with-perl-bindings=no \
                 --with-libgcrypt=${STAGING_BINDIR_CROSS}/libgcrypt-config \
-                --disable-notify_desktop \
+                --disable-notify_desktop --disable-werror \
 "
 
 do_install_append() {
-- 
2.29.0

