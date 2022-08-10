Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34C8C00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 07:00:43 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.2895.1660114840771133263
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Aug 2022 00:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UzLr9XhU;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 e8-20020a17090a280800b001f2fef7886eso1217582pjd.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Aug 2022 00:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=oaJQBWHdvvqg99W9UwnT2HHH5JrM6LPx6Lvfj9mfGXE=;
        b=UzLr9XhU3e++EAuwvs3ugLNlw9MPzm9xeEqRcGvsKrJD5uknPTfXMNv8yQNGknQ73V
         wBjOa9tpB2GI9CASzx2FUyuUAAp1fvkHKsePd5B2TxiHDJ+Rb42cSlBbkw56PJhYl2d2
         yddEDPAl+OXUdsk1l6Dtxv2zlcWg8oQPjqxA+5TVn2PCYFzDksiTeZrsN2F4xNojT7ge
         oOP1k8S/Zy2gpAoT/xto0vHGEUKJT735GQFsqMdzvzrpGVrzhigUSGhR7tkgGF8hl05M
         wOaM6U0af5VI5LwsaT1s7aqnONq901xf0xGV1mHKK4vEfswhw9odEWzgCJfDYMb7gAP/
         DwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=oaJQBWHdvvqg99W9UwnT2HHH5JrM6LPx6Lvfj9mfGXE=;
        b=PY75Jn1jtjVmMka97A+eRjCN7c2CHs11tICO10iM4JjfiIinmB36MY9xieQ5ujN0gV
         L5MTy3JgtHAvq30EbTJ0zVnit0O2Q8aZchFADUUo7BO+6GuFFT94LEtBH5nkbvEyM9o5
         fWpfMqhcBL5j7BfbyjARgB13nL5rWxkEyZojOlmHf+rJg+u6+KczFhXbQiZ09lGePNYL
         /Qf+cqZ33vJzbQrBDDHqjvgUXXfyJad1d4FrLSlZ6JDUfTS8+O287D0fdncj8NbYhow+
         zjwqL8CcewR1BZJx7k0ag2hgYvjZaRcQm9CgCo+oa8YydkJvNGCRgP/1fu3Ki/pnoHt+
         25aQ==
X-Gm-Message-State: ACgBeo0uO1Y2lQKV6FrqayGLpOf9/jMI96wVaFAweyGP1mxiJbdjMAVT
	i1IVZXRTBwi7NihRR57K+8QawrMNhzg=
X-Google-Smtp-Source: 
 AA6agR5nXKQVyaBj/fah7CMbVNvSGBk+TN+3M2f0YJcVSw97MxNYoPLKfwPKMSdFj+XLAKv0HvtSWw==
X-Received: by 2002:a17:902:ec90:b0:16e:d8d8:c2db with SMTP id
 x16-20020a170902ec9000b0016ed8d8c2dbmr26544168plg.69.1660114839615;
        Wed, 10 Aug 2022 00:00:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 c7-20020a170903234700b0016a7b9558f7sm12115676plh.136.2022.08.10.00.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 00:00:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] audit: Fix build with musl
Date: Wed, 10 Aug 2022 00:00:36 -0700
Message-Id: <20220810070036.3241757-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Aug 2022 07:00:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98184

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ute_malloc__-with-__attribute__-__ma.patch | 34 +++++++++++++++++++
 meta-oe/recipes-security/audit/audit_3.0.8.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch

diff --git a/meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch b/meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
new file mode 100644
index 0000000000..c2080e156d
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
@@ -0,0 +1,34 @@
+From 79c8d6a2755c9dfa00a5e86378e89a94eef0504d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Aug 2022 23:57:03 -0700
+Subject: [PATCH] Replace __attribute_malloc__ with 
+ __attribute__((__malloc__))
+
+__attribute_malloc__ is not available on musl
+
+Fixes
+| ../../git/auparse/auparse.h:54:2: error: expected function body after function declarator
+|         __attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
+|         ^
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ auparse/auparse.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/auparse/auparse.h b/auparse/auparse.h
+index 95cf256d..c7dbe5ff 100644
+--- a/auparse/auparse.h
++++ b/auparse/auparse.h
+@@ -51,7 +51,7 @@ typedef void (*auparse_callback_ptr)(auparse_state_t *au,
+ void auparse_destroy(auparse_state_t *au);
+ void auparse_destroy_ext(auparse_state_t *au, auparse_destroy_what_t what);
+ auparse_state_t *auparse_init(ausource_t source, const void *b)
+-	__attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
++	__attribute__((__malloc__)) __attr_dealloc (auparse_destroy, 1);
+ int auparse_new_buffer(auparse_state_t *au, const char *data, size_t data_len)
+ 	__attr_access ((__read_only__, 2, 3));
+ int auparse_feed(auparse_state_t *au, const char *data, size_t data_len)
+-- 
+2.37.1
+
diff --git a/meta-oe/recipes-security/audit/audit_3.0.8.bb b/meta-oe/recipes-security/audit/audit_3.0.8.bb
index 3dbfc9e604..28d7d01764 100644
--- a/meta-oe/recipes-security/audit/audit_3.0.8.bb
+++ b/meta-oe/recipes-security/audit/audit_3.0.8.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;protocol=https \
            file://Fixed-swig-host-contamination-issue.patch \
+           file://0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch \
            file://auditd \
            file://auditd.service \
            file://audit-volatile.conf \
-- 
2.37.1


