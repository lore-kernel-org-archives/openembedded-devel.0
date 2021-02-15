Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.25704.1613351626858372005
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Feb 2021 17:13:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M0yAXiTU;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id o38so3319886pgm.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Feb 2021 17:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VVKzKAcSGsK3Tf4jNtBwUPNeEswaLyTk0u1LErLy8oE=;
        b=M0yAXiTUE5OPFoC8YPsT0XPIynyMaztYunEUOAFLzMj4pdf4FsOGBQGltI2X9jtg9G
         Wtz79IIETqZH+CgbygnaiRdWP26lacu7jbXodQ1Vi2qIxRXWTfaJMNEsitFV1tltEtza
         XbCosdKpG1QFTutyTL6Aq9cibpd7o9NKL01hFi5+jKFdj48g3XvWzeXbYPV6fqeeNV4J
         Go3uGdb3msFbO19+knBRpbEdkH++IelTOLyic0PdWHtiTHYXOYDYlKIxOqTjDEDEqTwk
         X6P32FVY2VCbhGBb2eTV4XP2ul3qHqEPCnsW/wiUSk0l1dk93OXqcxDeK1ZVsTJPLnHv
         Qlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VVKzKAcSGsK3Tf4jNtBwUPNeEswaLyTk0u1LErLy8oE=;
        b=C4/Xcsfp0EtiA2BSlMaivI6loIAKvk3vj8rMWn5xaLpoAOttxaX4INWbObnFw0BbPU
         GiG4nLAcsMC8cFFbcxF/N1HsQ3BSHJ4mUkURANkmK1+nsGb9MlrSwsUicm5hpoq2ehRB
         wkmdLH+konPxvcYzLD9SNs7vorsFBK1gSb4csigT9p1f8F7yBlZ7QRgcjy+qaku0bdz1
         OdIPhbAaDPvdEq3r/xHk6scNdM0Z9FldexT2/+8llr3+Ejtn1NhGZl1yS0/1E4WMWZWd
         MnmhGJ9nuFduilwb1aC+p8p6JEzy1EHJ1JxGQzFMdOCfbCiVxBvHW19zQcbd7Fu6enCd
         7zXw==
X-Gm-Message-State: AOAM530XeEt24rScXs2x/X+kknkB1OHW8zz+XiNRlT2NUQJhugCS8zVw
	WP3lmpakVvzZx/l6/rK4eJQl8PlDZbNBHw==
X-Google-Smtp-Source: ABdhPJxu3+tGGJldLu50XAZKNYcfZ/qxw3QlHnW5872ehz2Mw3p2FmbYiCYZrF7YfQTXj1WyCEM2EQ==
X-Received: by 2002:a63:4623:: with SMTP id t35mr12637398pga.294.1613351626191;
        Sun, 14 Feb 2021 17:13:46 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id t1sm16077998pfl.194.2021.02.14.17.13.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 17:13:45 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 15/15] postgresql: Inherit python3targetconfig
Date: Sun, 14 Feb 2021 17:13:29 -0800
Message-Id: <572d4148267c6ff1b43dd3498020349cb0aa77c7.1613349480.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613349480.git.akuster808@gmail.com>
References: <cover.1613349480.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

it now ends up searching native python shared libraries and tries to
link with it and fails on non-host architectures

recipe-sysroot-native/usr/lib/libpython3.9.so: file not recognized: file format not recognized
collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c499aaeef80b5af8d20521658449c4148f3d0806)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 826bcc1e1c..09c6a3ca9d 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -36,7 +36,7 @@ LEAD_SONAME = "libpq.so"
 # LDFLAGS for shared libraries
 export LDFLAGS_SL = "${LDFLAGS}"
 
-inherit autotools pkgconfig perlnative python3native useradd update-rc.d systemd gettext cpan-base
+inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext cpan-base
 
 CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR} -I${STAGING_INCDIR}/tcl8.6"
 
-- 
2.17.1

