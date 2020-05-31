Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web10.18208.1590941819794452905
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XVfjD/gx;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id n9so119704plk.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=cSDIg2mNfCsv2NucBejI0BLWwR8AtmeRXvvsS4sTr80=;
        b=XVfjD/gxct2c6bqV90SHKiLeiubJpWFEBVQlMty7u2Zu8BbDSB29gzm0+UdqMkM9im
         gMYVMiQEyYiMmXHL382H+OuaoChcQWfxZQS0TZutCGdZ58ihKNVV513eqWVN1gQu7FJA
         1PGjfyDSGLrsWXnbzuszmNXUQLqVz/FVcVVJpnGjYhkod5V2fuhcJwako3NwXdcxFYkk
         aCmRPPNK7i2vJtdlsRg2d6v16wRw29NsaHw1oa7zxiOS4Qh8NH7TOHa5zDkiDXf25b+s
         IOYAO4kiE8pKj/oR1Mw1edcmUNttIm13s+nOskv4yDAKr7uThQ+jiZPCCMs8XGZ94VUR
         +BYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=cSDIg2mNfCsv2NucBejI0BLWwR8AtmeRXvvsS4sTr80=;
        b=E7ylZkbbLWebn3T6Jn+galCvKulwATpGWKIu/9kF6g9W+nWY19y/3STmKn1fzHQ+Ns
         /vvOniWQjpKaUxmlaSnPaaiMVs0bhYSyzylGNGq8+Fhcm4Bh9t8Ze1q/aaCQAF8p/+D2
         qyPcQvGuZo9qGjY5HvzYdiU/sBT4VJxaLI73hmzf+/WT7SAeA6dRfT3xOuE06KnTzOom
         KtWOb84bi8Oqa2zHEOwqcleX3CsT8B1p1RwadORwUyFSVeQIBENau4bWtkKM7BkA0fZY
         HgAB0mlB8XTdgpcjTJVlp76ES4GbirfgAVAE1Q+2lWw5/s6RLUheud0BaWJ5gbZ8bb3f
         6Xow==
X-Gm-Message-State: AOAM532Ynpa5iCoEr9MK6vG2lLovAMhfGRCQLoT+RNJ3Du16IkdH2DwM
	jm3tVfh5fYGGLdIH799Ki5nmKah8
X-Google-Smtp-Source: ABdhPJwBv0+TgFPowrdzvsz44KhRTrWziFsuLUfdNyCWlp5Pc3TjbZ15O/AFBDrfLbNUBpubRbbkgg==
X-Received: by 2002:a17:90a:730a:: with SMTP id m10mr19742911pjk.196.1590941819193;
        Sun, 31 May 2020 09:16:59 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:58 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 29/35] turbostat: fix the build failure for new v5.7-rc6 kernel
Date: Sun, 31 May 2020 09:16:16 -0700
Message-Id: <abc3111d46124fb9cb12506f65e4f7d9fe4e7bf2.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Yanfei Xu <yanfei.xu@windriver.com>

Due to the new v5.7-rc6 kernel has some modify in header
files, turbostat build failed. Now match the files.

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 90bcc2bd494c2c7a0a43e1d0c4943cdd061e929d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-kernel/turbostat/turbostat_3.4.bb | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
index 60040a47af..48c72140c8 100644
--- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
+++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
@@ -42,16 +42,28 @@ do_configure_prepend() {
 	mkdir -p ${S}
 	cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/msr-index.h ${S}
 	cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/intel-family.h ${S}
-	cp -r ${STAGING_KERNEL_DIR}/include/linux/bits.h ${S}
-	cp -r ${STAGING_KERNEL_DIR}/include/linux/const.h ${S}
+	if [ -f "${STAGING_KERNEL_DIR}/include/vdso/bits.h" ]; then
+		cp -r ${STAGING_KERNEL_DIR}/include/vdso/bits.h ${S}
+		cp -r ${STAGING_KERNEL_DIR}/include/vdso/const.h ${S}
+	else
+		cp -r ${STAGING_KERNEL_DIR}/include/linux/bits.h ${S}
+		cp -r ${STAGING_KERNEL_DIR}/include/linux/const.h ${S}
+	fi
 	cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
 	cp -r ${WORKDIR}/COPYING ${S}
 }
 
+
 do_compile() {
 	sed -i 's#<linux/bits.h>#"bits.h"#' msr-index.h
-	sed -i 's#<linux/const.h>#"const.h"#' bits.h
-	sed -i -e 's#<uapi/linux/const.h>#<linux/const.h>#' -e 's#_LINUX_CONST_H#_LINUX_CONST_H_KERNEL#' const.h
+	'TMPCHECK='grep "<vdso/const.h>" bits.h'' || true
+	if [ -n $TMPCHECK ]; then
+		sed -i 's#<vdso/const.h>#"const.h"#' bits.h
+		sed -i 's#<uapi/linux/const.h>#<linux/const.h>#' const.h
+	else
+		sed -i 's#<linux/const.h>#"const.h"#' bits.h
+		sed -i -e 's#<uapi/linux/const.h>#<linux/const.h>#' -e 's#_LINUX_CONST_H#_LINUX_CONST_H_KERNEL#' const.h
+	fi
 	sed -i 's#MSRHEADER#"msr-index.h"#' turbostat.c
 	sed -i 's#INTEL_FAMILY_HEADER#"intel-family.h"#' turbostat.c
 	sed -i 's#\$(CC) \$(CFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#\$(CC) \$(CFLAGS) \$(LDFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#' Makefile
-- 
2.17.1

