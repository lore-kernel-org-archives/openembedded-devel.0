Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.8795.1599057323415035516
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 07:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PqziyHQs;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id h12so2635552pgm.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 07:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AxM23iksBv11E4KKv4RzQASh1WR5cYGcaOL6kETfDeo=;
        b=PqziyHQsXWWRnQvnofkxBPzoX0uBE4FFoPHsBdZccze0fXWU6KjpXTSazXwCXavfOq
         G5uVsnP8Ir2iocgWX7xiUGhgldvNyCn38qLgldOFR9XBJ2RhXxbtpvDj54q8BGXPa5JN
         uFftAjZKHOm9XaVPsq7689E0sBE/GjqX5jxGLlDGwgY8Ei2/wWU32UDaFo9fjdNuSHS/
         HpraggTrrAZuDlPSHxqflo4jtSVK93ExPREnQTYygP/OByDgNFJ/CPb/lcdMsw++HUz/
         uVB3MAi8XdGhuT/DW36FS0ow97PSmpMsn3Kg7R6cvtvxKDbHHEpnqDsSkROibidWawGO
         9rQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AxM23iksBv11E4KKv4RzQASh1WR5cYGcaOL6kETfDeo=;
        b=bEnWWy9EZviybI3j5fig8ReJIBBaOR1RXz57J6sfRgO5WWFPRQEyKIWr4Wg63xCz4X
         NVeBdB34GY1pJXLC72XA8lqmkkQSUXXJrx05Qm7w6NMLprwd2sRpB4xL0yw1TdWUZT8h
         IiGvCPSjWUq6dw0h+Dc4j6c248NZHpQvW6pKq5M+pIT0F7w2SZn5vNkjA3/+PoYLb24c
         d+kDu2gyn92hyH2NmoIQLzwWRpVDxWL+HMoO3AfU1A+EOLwALXJOzmdxOh0htAh/j8Z3
         LRehd9dWTn8MYCju1Wvu5XUdBHHdVTTuUrwYCJvPGSgtpKhG3ohHCoR4WPdrq90T0J0U
         56pQ==
X-Gm-Message-State: AOAM530Q5iWsdxa1HFC9i1euNCkyIQ1flA62lbK7jjoIHAsg3nibS0Fl
	Tnk/uZBCY0iCzY4a9W42aB1djI9Pzd8=
X-Google-Smtp-Source: ABdhPJxKdDCuLCFt/4YcrnCwzXG91tDJs6Prp2sWK6H5j/aZWW0Fgubms712IUMm3YXgzM+YsGJvPg==
X-Received: by 2002:a63:cd0b:: with SMTP id i11mr2123960pgg.306.1599057322744;
        Wed, 02 Sep 2020 07:35:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3889:a22b:6ae0:235a])
        by smtp.gmail.com with ESMTPSA id q18sm6014717pfn.106.2020.09.02.07.35.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 07:35:22 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell][PATCH 2/2] babl-native: fix build issue
Date: Wed,  2 Sep 2020 07:35:20 -0700
Message-Id: <20200902143520.19803-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902143520.19803-1-akuster808@gmail.com>
References: <20200902143520.19803-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

../babl-0.1.74/babl/babl-fish-reference.c:1064:7: error: ‘for’ loop initial declarations are only allowed in C99 mode
|        for (int i = 0; i < n; i++)
|        ^
| ../babl-0.1.74/babl/babl-fish-reference.c:1064:7: note: use option -std=c99 or -std=gnu99 to compile your code

Fails on CentOS7 with Arch64

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gimp/babl/babl_0.1.74.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb
index c470987b4f..9b405be0b3 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb
@@ -10,6 +10,8 @@ inherit setuptools3 gnomebase gobject-introspection
 
 DEPENDS += "lcms"
 
+CFLAGS_append_class-native = " -std=gnu99"
+
 # https://bugs.llvm.org/show_bug.cgi?id=45555
 CFLAGS_append_toolchain-clang_mipsarch = " -ffp-exception-behavior=ignore "
 CFLAGS_append_toolchain-clang_riscv64 = " -ffp-exception-behavior=ignore "
-- 
2.17.1

