Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C539CC61DA4
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 02:13:45 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.25722.1676772822388687679
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Feb 2023 18:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Iif3N+s7;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id nv10-20020a17090b1b4a00b00233ba727724so1494912pjb.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 18:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tbzEDjcDqX/V9156BBSVFxDPCyoYixdAWCh09x8hzsU=;
        b=Iif3N+s7Ba/V3kBqwg/nAN0Bg8SYct60m6MgJg0fWvI1DJpOSl3RefsQqtBhlCHw+j
         Hwsk1NpdNl0n6ylzeM+OEiRAliFc2h9yxuEhRHBJcjDlLWjSm0zkazxH+yXtlBE7ByR5
         dwJ4zDetEsmg5V68ooyulYUinr9ESLURXtczA0X8//S85k5xUNdhBtpRuVKa1FgbSyyz
         7V4/iD3vqLN+zP81c/JzjbIsIWE56TkQMQ5vIunX/eelBjW0NiDNmpTb4vJznEY5WrxY
         eKywARR4PUXYJJRGNQbE73N8e7EmmxudaOaj8nUW/oKm4Os18T4XJf5OZTerGNdufYq1
         8cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tbzEDjcDqX/V9156BBSVFxDPCyoYixdAWCh09x8hzsU=;
        b=lJ9xQmJ+ueLvcXqughLsmZ8MtAM2b3F9/lf06Aqgp7a5IJmRhCskBnou6/OuBiVa17
         I7LjL/Fnmt9PG8imy8HwGWANsqKj7p/DVzQXLMbiw/8I37HsqqD62A2j/rJ8Gh/+JzWD
         M38MGK8tqxBbU6jLRAz8Ub+OBKRCzM5+AwKc1vULFmEoUQ3WtZY8rH3R4NrO6EBlZSPQ
         rAM5Y/OGTDCjPxyGiB8YJd0J8fYWY2f2QqJNrWs8/z9B5o2g/eVo1m0OcBSHv55Xx4Lt
         KU5V/zE2pKjDxd23ly4I8CAeeAeQOPH3Z1HhWSyK8adeH8L9nQ5PrLUYaD8xxdWLNXJ5
         WAhQ==
X-Gm-Message-State: AO0yUKWzlQ58v6ewEViHMtBsFHdJXqoeVEBOG2O7X9sIYkEPsDxYzdC1
	CwNQaQBQsQ6Bad+6FUMzsDFBTZHSurE=
X-Google-Smtp-Source: AK7set8fLzLe7sjMU+LUW1ss+uD6dzZ9Perso6WORjWJ1g9FTE9Lfj4Or7MeqmHxqTolHAhPFmhlFg==
X-Received: by 2002:a17:902:f98f:b0:196:790a:8bae with SMTP id ky15-20020a170902f98f00b00196790a8baemr24333plb.43.1676772821176;
        Sat, 18 Feb 2023 18:13:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::112a])
        by smtp.gmail.com with ESMTPSA id p22-20020a170902a41600b001966d94cb2esm701087plq.288.2023.02.18.18.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 18:13:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] networkmanager: Fix build with musl
Date: Sat, 18 Feb 2023 18:13:38 -0800
Message-Id: <20230219021339.3157586-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Feb 2023 02:13:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101149

__assert_fail signature is assuming glibc which is fine for glibc
systems but we have to consider musl case too.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...just-signature-of-_nm_assert_fail_in.patch | 37 +++++++++++++++++++
 .../networkmanager/networkmanager_1.42.0.bb   |  2 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-std-aux-Adjust-signature-of-_nm_assert_fail_in.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-std-aux-Adjust-signature-of-_nm_assert_fail_in.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-std-aux-Adjust-signature-of-_nm_assert_fail_in.patch
new file mode 100644
index 0000000000..6640bce173
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-std-aux-Adjust-signature-of-_nm_assert_fail_in.patch
@@ -0,0 +1,37 @@
+From 8c8b13768d22f39edfce38e123b740c43d7e31c4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 18 Feb 2023 17:29:10 -0800
+Subject: [PATCH] libnm-std-aux: Adjust signature of _nm_assert_fail_internal
+
+the LSB states __assert_fail is:
+const char*, const char*, unsigned int, const char*
+https://refspecs.linuxbase.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/baselib---assert-fail-1.html
+
+musl uses a signed int instead. however, this is ok:
+https://www.openwall.com/lists/musl/2019/03/04/6
+
+nevertheless, since the application redefines __assert_fail, we have to make
+the types match. (not upstreamable as the opposite breaks glibc)
+
+Upstream-Status: Inappropriate [musl specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libnm-std-aux/nm-std-aux.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libnm-std-aux/nm-std-aux.h b/src/libnm-std-aux/nm-std-aux.h
+index e556aa4..0756a7c 100644
+--- a/src/libnm-std-aux/nm-std-aux.h
++++ b/src/libnm-std-aux/nm-std-aux.h
+@@ -230,7 +230,7 @@ typedef uint64_t _nm_bitwise nm_be64_t;
+ _nm_noreturn static inline void
+ _nm_assert_fail_internal(const char  *assertion,
+                          const char  *file,
+-                         unsigned int line,
++                         int line,
+                          const char  *function)
+ {
+     __assert_fail("<dropped>", file, line, "<unknown-fcn>");
+-- 
+2.39.2
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.0.bb
index 856afd7bc8..dabf9a1d36 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.0.bb
@@ -30,6 +30,8 @@ SRC_URI = " \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
 "
+SRC_URI:append:libc-musl = " file://0001-libnm-std-aux-Adjust-signature-of-_nm_assert_fail_in.patch"
+
 SRC_URI[sha256sum] = "2f6756d507bb6b46716594b67e6fe7491891e1b5b167bbafc5157dfa7753d5b4"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
-- 
2.39.2


