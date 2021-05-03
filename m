Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web12.1707.1620069138643343891
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MFuFDZ5z;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id x54-20020a05683040b6b02902a527443e2fso6093997ott.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 12:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=2ir5Heo212tADlh46txwsZhA03yEdzzuoivpBtqSA70=;
        b=MFuFDZ5zAF3Ru85IqYxjpq0ZQiNi1JhxBqqOCjY8NOqEnpUDNXWIGv7UNRobpN4bgF
         sM7bBQZMFobZMP9r2qBITyq6Ok4BDiTZF1u4Mz3I5wC0fgaNypAnd7PhdKc7NDuSJivM
         pkJOp+yla/sBzpbv1NXi9ZstQKfI32AWZHLhTI2IN/OJT0HQ4hRawFyLjSWHpmPpem+l
         DHh13TRsWwGisFICJh4q513QfDmyHbqTp0dTiq8PHtXl50aa1vM1VIyHCBzPuo0+1ay1
         slkWoK4iYo29N9S34kM1VDo0pX7YQL12U36DGfgMBqlJVlTVST/GPseVhxUV9gCa7eRw
         WnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=2ir5Heo212tADlh46txwsZhA03yEdzzuoivpBtqSA70=;
        b=FG1kGhJkbbGI0DOVIcGF4TnPkRTksNcNqWZMBu66ZnX2ZNOMZ4+C4yhOb/sOvYqHc2
         ZPrAZLax0rXNIYm2KiWhKv0SzfckJ5K1c3gqnitd0NbfopQ1/a9x6KlGKbifHzkMm0ic
         maeXKCBC3aCBbnJY/oTU9UrZAvHOsoGgXNws7W3wIPNUgiNsBwYSxUZIlMIXiTkCqF8O
         1aaBNGo6ep7fCV6tN9WPnFcLT8iqhkFF60/4FnyJP1X6ji59pInoBzjzWgmWxObwhm11
         LG8nDix/4AhcE9mDBqDtDnvIuOrwyH7KwoMI2418CdCrv3LWSHg84jxrcfswIFVXPmIt
         tFjw==
X-Gm-Message-State: AOAM532P3cooS8/v28aXDjFKsXau/QDDiqvVHGISSQ7qNUFuSLf1NY1g
	tDyAkDZDd0ZKaOFuBXt7HxSKgCeTRXRELQ==
X-Google-Smtp-Source: ABdhPJx5CWmPgpFPJle+OFP7V1pPrZ2pb+8ko0Sb6mxNey223/bwwYi7WonDelXxW+gMk+KYQ59Yig==
X-Received: by 2002:a05:6830:16c4:: with SMTP id l4mr6478065otr.93.1620069137874;
        Mon, 03 May 2021 12:12:17 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:dc35:22d6:72af:c1da])
        by smtp.gmail.com with ESMTPSA id s85sm150047oos.4.2021.05.03.12.12.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:12:17 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 09/14] gimp: Disable vector icons on musl/x86
Date: Mon,  3 May 2021 12:12:02 -0700
Message-Id: <8dcdded940849a729aa1c910e0f39da8290ab0e5.1620069042.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1620069041.git.akuster808@gmail.com>
References: <cover.1620069041.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

it uses qemu underneath which segfaults on musl/x86
until its fixed, we disable vector icons

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 44ca91f0fe174f9a69bc3e66ce17e1a2ae8447a4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
index a5e6990580..717716e1f9 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
@@ -55,6 +55,7 @@ EXTRA_OECONF = "--disable-python \
 
 EXTRA_OECONF_append_mipsarch = " --disable-vector-icons"
 EXTRA_OECONF_append_libc-musl_riscv32 = " --disable-vector-icons"
+EXTRA_OECONF_append_libc-musl_x86 = " --disable-vector-icons"
 EXTRA_OECONF_append_arm = " --disable-vector-icons"
 
 do_configure_append() {
-- 
2.17.1

