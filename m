Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1ECECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 21:37:17 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.17799.1661895434668393090
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 14:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=muSbchDq;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 w88-20020a17090a6be100b001fbb0f0b013so13127339pjj.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 14:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0/nWhufz5zdrL2TrEx4ds1QaKYoGpgB1ltABxuxNWKY=;
        b=muSbchDqLBvlzlfaptpB4ZAz0yuk6SlUedntAAoWSOnuVq1Kp/LT3xKWWbHwTj/LI6
         r/bvt2ybbIY2ig7YlUFyRW8ELDMRZ9htN+AEruHWrPAjb3U/KgHNfdxk5gVn6f4CTNJh
         oBdPYqB3YbTnNq4KtSxTmmXz2qh5onL7tnh58AdlpDD4gJKq6SJoDBxzjlRvKLmSCyhx
         SCueFkenmfuMUdh53Kb0wfN+cqmeonZKx2IK7xo29VszExATuQ63FyX+3xDgUtdm2UOX
         URLkK/b7rfEaURfUekvrC1nSTV+knBqiWzxW9nSMMD/zZTQSrTjB6Kpn+71WBdy5K0XA
         JGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0/nWhufz5zdrL2TrEx4ds1QaKYoGpgB1ltABxuxNWKY=;
        b=FLSQqaIqRNx+h6l1ahoWgv964T0PYOZxntagPqSKoTDOB3EcuYQnMucdvuJs4jGHCe
         s1/64UPqZMgQvVGw7LTZLscsvLFkLRjweotTuf4cnNFX5Q5CDuvHQy9IsKmPGzk+y49z
         tDv1CeM/dPHO4Q4Up9E41TLApFmhUQxBJjrH/WX1GiyYa0r8+Upl8jv4DZorr4hh24Uv
         +xetWBZTBj3T/wrc7n0XdTpjpVvLwnFI0OuJze8Sa+28bT/SJ2EfYLy2dO2LyuXoE4Rx
         BFFQL+OWkGdWagI7XiHMYiRyDZSVcIwrW9YZiBnA3E6tkzPIQtdcMmajQXuFCh5nU8ms
         Y3Kg==
X-Gm-Message-State: ACgBeo2SFEo/1MHWQqwKDYJTmPkV3UOTkmJSHF39l/sd4cRHEGa9iG3B
	MQ8PMBVT0o+ZPca0yYvqgHgjqLxw+v1OnQ==
X-Google-Smtp-Source: 
 AA6agR5ua38hDDseW575uvWOogPFIixNBQbsH+VsWdW/zaClxPLNKKzdgsnie/s6XPFRwWUvvUUhug==
X-Received: by 2002:a17:902:7689:b0:170:8b17:37f4 with SMTP id
 m9-20020a170902768900b001708b1737f4mr23220227pll.42.1661895433563;
        Tue, 30 Aug 2022 14:37:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 n6-20020a622706000000b005385109fe5fsm4155250pfn.81.2022.08.30.14.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 14:37:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 4/4] libgtop: Fix build with clang
Date: Tue, 30 Aug 2022 14:37:07 -0700
Message-Id: <20220830213707.1413842-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830213707.1413842-1-raj.khem@gmail.com>
References: <20220830213707.1413842-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 21:37:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98567

Backport a patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libgtop/0001-Pass-correct-parameter.patch | 29 +++++++++++++++++++
 .../recipes-gnome/libgtop/libgtop_2.40.0.bb   |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop/0001-Pass-correct-parameter.patch

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop/0001-Pass-correct-parameter.patch b/meta-gnome/recipes-gnome/libgtop/libgtop/0001-Pass-correct-parameter.patch
new file mode 100644
index 0000000000..5ea8eed516
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop/0001-Pass-correct-parameter.patch
@@ -0,0 +1,29 @@
+From e969ac59335d3fb1cd228f8e7c4f6c2dda4fa536 Mon Sep 17 00:00:00 2001
+From: Avinash Sonawane <rootkea@gmail.com>
+Date: Mon, 20 Dec 2021 13:33:42 +0530
+Subject: [PATCH] Pass correct parameter
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libgtop/-/merge_requests/35]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/daemon/main.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/daemon/main.c b/src/daemon/main.c
+index b51addf..eaee3b3 100644
+--- a/src/daemon/main.c
++++ b/src/daemon/main.c
+@@ -222,8 +222,9 @@ handle_parent_connection (int s)
+ 		       0, NULL);
+ 	    break;
+     case GLIBTOP_CMND_PROC_IO:
++        memcpy (&pid, parameter, sizeof (pid_t));
+ 	    glibtop_get_proc_io_l
+-		(server, &resp->u.data.proc_io, parameter);
++		(server, &resp->u.data.proc_io, pid);
+ 	    do_output (s, resp, _offset_data (proc_io),
+ 		       0, NULL);
+ 	    break;
+-- 
+2.37.2
+
diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
index 2e60264e04..fa95e0bee0 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
@@ -6,7 +6,9 @@ inherit gnomebase lib_package gtk-doc gobject-introspection gettext upstream-ver
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI += "file://0001-fix-compile-error-for-cross-compile.patch"
+SRC_URI += "file://0001-fix-compile-error-for-cross-compile.patch \
+            file://0001-Pass-correct-parameter.patch \
+            "
 
 SRC_URI[archive.sha256sum] = "78f3274c0c79c434c03655c1b35edf7b95ec0421430897fb1345a98a265ed2d4"
 
-- 
2.37.2


