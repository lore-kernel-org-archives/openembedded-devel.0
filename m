Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.5398.1618064980376552936
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Apr 2021 07:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ri5iQZ2e;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id f29so5968067pgm.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Apr 2021 07:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=OrbSumKWTM2VN/HkSJIVQGihTv2zi0mXgj+JZUTKVRA=;
        b=ri5iQZ2exW27kINifKFmr5YdnWJ2QdIM3E7UqpWnb7H/QZtql5yBvJxJ7rlU9EY6oC
         gy/RREDO6RXVFGY2XWF8DWqM6vfaRPmBJxFa86tA497fybIDcDDxlKL6QlbgKVjBoYNu
         ouf0Zwu/pRmCxEfMk+6xFuGEjyaJeAYJW4JduTAa5CKemKpZtkh0ijnrvBPM/anTm6hI
         mnyt0l6zTud5sTuC54epwJcRYHaobJ5fZCIvyyk0uh0kMrlSBJgNT22etVI2Vkftxxn/
         fSryZvuaD/pldyUWCsAZc1XtIIW+4nWTKgQMZ4eQMw/sCEHvXYFhHHIiPJkG1V9ee674
         5cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=OrbSumKWTM2VN/HkSJIVQGihTv2zi0mXgj+JZUTKVRA=;
        b=ROfpE6/6squv/7d2szgaLht+CFOhFyc6o80Jhh9nGowdMV5QGFXmH3MGygy5A6ZzQY
         f3R7k9FD/7UJyDZphiiX4sGCU+HR1WYCogheIAr6d2yaTAXSfY5Hi1MNVgNWFTWrz/GG
         3aVmNNNDQE5xyrf6P48Uq8STHNZTyCzCvKW+1ql5FANQzoa+EK/ur61hmX8nDPZYHdIz
         bWU2RCGHTKAhFb/LiKsAVcmCtn/Cp/57p4P7qjSPISJUatVOYwf05I4PfdOFhbMGKLLO
         s38XBgUvptM86z8hha9TeQGj05kn+aH80hOntXJ24RfkMN7AWBFIBYQGarpQsnl7OB5d
         NpZg==
X-Gm-Message-State: AOAM532Ya1GZbXW9Lxm6h3fkaPaqR1OeEqYGUKEDnw5eNRYDqFBgFy46
	4JYg4+8p4t6AP6dcmpfntBZRpzMJ6l8=
X-Google-Smtp-Source: ABdhPJzmpyaYbXwMK8hFlEDVcTM0WApGQdgsp7FNKZNLySJVV8CiGtVba2pVyjMnzQar3iuJb7F4Xg==
X-Received: by 2002:a65:6905:: with SMTP id s5mr227661pgq.58.1618064979845;
        Sat, 10 Apr 2021 07:29:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8d5:10ce:6d52:dfc6])
        by smtp.gmail.com with ESMTPSA id a65sm5120183pfb.116.2021.04.10.07.29.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:29:39 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 2/6] libsmi: set awk as target path
Date: Sat, 10 Apr 2021 07:29:30 -0700
Message-Id: <a5ab08adbc76f184e165fc9f4aac4944d9cc51f4.1618064877.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618064877.git.akuster808@gmail.com>
References: <cover.1618064877.git.akuster808@gmail.com>

From: Oleksiy Obitotskyy <oobitots@cisco.com>

smistrip contains absolute path and prevent to
create reproducible builds. smistrip should use
target awk not host one, so override path.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 98cc63eb3b7..212b1e797c7 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN} += "wget"
 
 inherit autotools
 
-EXTRA_OECONF = "ac_cv_path_SH=${base_bindir}/sh ac_cv_path_WGET=${bindir}/wget"
+EXTRA_OECONF = "ac_cv_path_SH=${base_bindir}/sh ac_cv_path_WGET=${bindir}/wget ac_cv_path_AWK=${bindir}/awk"
 
 do_install_append () {
     install -d ${D}${sysconfdir}
-- 
2.17.1

