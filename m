Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F25CCD1297
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:38:17 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13809.1762853887346565729
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:38:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CtKCe/jn;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29558061c68so48528625ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853886; x=1763458686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NPffb/MP9ra4DmYC89sTNAhuqL/qS0iTjRjiEiXoBU=;
        b=CtKCe/jnyLvyvSuxbBksvLkztzOg+YPG//IwEKljQPHm7oxvW5BqQ+/pgZZmu5leJ5
         FUIY8+sn0HOn1P7dzTibOb8US+nQXA9XuQ/eel3+ljZKUN6d5wdqj5pa8rP6Ur0i3JVD
         FVc30iwivD+JJVEqRyCWjCk4UI30AAQqzvB+jOV5dPQyw4QxAkfJv3KSlggXFtjzGVDH
         zukVFf/zpd6iJovEBCa0AqT/jXCo0IcRmQTXajenZzndvlxLjgC8+sq/0wvRTMJLxo/a
         yaoAu3TiQ4W+P7ZK6fuNL+OJvag0Z75zwTshbChAtxg6I/U0R+UmDo+pOmb+mARycGAw
         mOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853886; x=1763458686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4NPffb/MP9ra4DmYC89sTNAhuqL/qS0iTjRjiEiXoBU=;
        b=C5VoQLqoUxwhMIERSfd6+3v9D0Y3RB3EQ3Qt32aqn4cJHi8RAeVrBaINJB7VUOsBDJ
         r9A+G/B3MPthgxLz5d2kfEGr4ABpi9k3ee8H1U/0YJ9BOqm4XcHYFP0S+Tm/IOHMSynX
         FXyX/+YfDNP9aAa/4eP5FzgjB6r1HM89wUk9XnNecESIlmdJFc5nJNnUOvJ334c90SXy
         BJdvkJ4RqsgqpfylGQwDGKPgfe9ReAEWx8u9chDF+QOCyUE5mhrn32dONBXHR4O9VWzF
         AW5DRAB4VY2k/ORKcHDot4ftXeKllY05UyT4Bx02YC3kHk2bnst6S/tbanUeg0hH6OuD
         Zdvw==
X-Gm-Message-State: AOJu0YxJ9w2/CBhPKonak2/cE8+sf6cyPpjubQt8AnfWxoQsInUuhDpT
	KuAMDb8ZYzGFoBGwSNCx4rp1XEhlxepcsvuEIDl5KsILjeZGnENxJ4MOlXywJClR1Ns=
X-Gm-Gg: ASbGncsjOCLSkSlix7c6N1jaYUwTVP3EAxsFRUBCfK7WYU6AuD6rGcgnv+NqJ7Xf16f
	r3fvJY1NMWn8ySiGvdCBP5TYdEXVvAsMw1I0Hgaz9da3InSFpT4lzaDqwgltjEOBat3+rzxWM1F
	1wrzRgdHutIX26e3jYuCWjkZsuyghD7uioTSvQlzscJEEuzOpydx5GNWE7iql0Pg0JemHxSc6iK
	yKfSNgGe4oq1vvzhDxpNN7ZuSMFYaK0p1E1DVgVMtIk/KVyPBU1a702ERrK6QEnXopOYAw3HK3n
	9F9SBolE5W1z1xQ1JHIWwVUUM9CGSOPbbVRrfDFIvW2OG25b3mCgNUaq2bRJrG3qpghdryqhHqQ
	afNQypJH09lolbOLKZ2Jt0dzhEa19fCSIlI8CgXFE/76xGTXWov0SrVDtSSLxtGOihVAu1cZnRt
	aXBdmh/4T94HQUbA==
X-Google-Smtp-Source: AGHT+IH4qVTjV9n4iqG2pVWMrAnmhx4CVQ8VfvC0SElEnwou0XeXbxcovGuSGwBwQc5v9GI4DdfsIQ==
X-Received: by 2002:a17:902:da4d:b0:297:dd30:8f07 with SMTP id d9443c01a7336-297e56e127bmr158287525ad.50.1762853886407;
        Tue, 11 Nov 2025 01:38:06 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:38:06 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 10/18] postfix: upgrade 3.8.9 -> 3.8.12
Date: Tue, 11 Nov 2025 22:37:25 +1300
Message-ID: <20251111093733.1393568-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
References: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121513

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-3.8.12.RELEASE_NOTES

Dropped 0006-postfix-add-preliminary-setting.patch as changes are now part
of current version 3.8.12 (20250919)
http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-3.8.12.HISTORY

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...0006-postfix-add-preliminary-setting.patch | 31 -------------------
 .../{postfix_3.8.9.bb => postfix_3.8.12.bb}   |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.8.9.bb => postfix_3.8.12.bb} (98%)

diff --git a/meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch b/meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch
deleted file mode 100644
index 50d0073262..0000000000
--- a/meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From c09d377cd3b91c4c4360ebfab5be37f6296ff26a Mon Sep 17 00:00:00 2001
-From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
-Date: Wed, 16 Jul 2025 02:54:28 +0000
-Subject: [PATCH] postfix: add preliminary setting
-
-post-install call postconf commands to modify main.cf. When multiple
-parameters to postconf, the order of those parameters in main.cf is random.
-Then it will reproduce random results in rootfs file(sample-main.cf). To
-fix this, add preliminary setting in main.cf.
-
-Upstream-Status: Inappropriate [this is the use of post-install,
-upstream is not affected]
-
-Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
----
- conf/main.cf | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/conf/main.cf b/conf/main.cf
-index 2ee7996..0c208e6 100644
---- a/conf/main.cf
-+++ b/conf/main.cf
-@@ -683,3 +683,5 @@ sample_directory =
- #
- readme_directory =
- inet_protocols = ipv4
-+shlib_directory =
-+meta_directory =
--- 
-2.31.3
-
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.8.9.bb b/meta-networking/recipes-daemons/postfix/postfix_3.8.12.bb
similarity index 98%
rename from meta-networking/recipes-daemons/postfix/postfix_3.8.9.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.8.12.bb
index 1df5d1b415..d3c91782e7 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.8.9.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.8.12.bb
@@ -26,10 +26,9 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
-           file://0006-postfix-add-preliminary-setting.patch \
            "
 
-SRC_URI[sha256sum] = "d0205a11e36d57b640daaa17a7e7166b8abc730d93b1db7e92e32dfb24bbfde1"
+SRC_URI[sha256sum] = "0fdabc9f272ee6c85781750dbd2642920701795f948f2fd3abe7b46a1f5160a9"
 
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.8(\.\d+)+).tar.gz"
 

