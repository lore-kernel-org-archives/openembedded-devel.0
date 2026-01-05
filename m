Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64943C2A085
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:02:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61069.1767607368199712378
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:02:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KRsTZy7K;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4775895d69cso59018075e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607366; x=1768212166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MC0pIM3NWiibb6VwwacYdUSjQGkl5w5BXsHt/Yj554=;
        b=KRsTZy7K31GcjEG1YhgDghud7EQndCVUvoha0AM2r9Q9PUoJchqOVtzhG9xKtGwTl3
         n8QJ8cJDjMQplQOtLJ/72F3O4/Om4xSPMlhyDzrpdjhy3iDaMZhO+mPv8gOYR26fwk7J
         mMiz44htFW9u9gRXAUDc8Xp32zhrVBNM4+vn1QSxcbRSefmfc1U82Etu+DsoQJvbHwB3
         aajtUtpppXTxeSnG+1EALC7MdxY322DRvd6IfC59/1tPuI63qK6Qgi1KNeXewuVKghWV
         II16LsYJNpPPU6JCPjNktWYnX0QzwqEea37fVh4uH1u5TWukwQHsp1vuY3abbpQG0iLU
         Rftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607366; x=1768212166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9MC0pIM3NWiibb6VwwacYdUSjQGkl5w5BXsHt/Yj554=;
        b=DDFZY49CcVs0diJ42E/2AAqOXjUqiteNxKa38m6RWHSjT1WoC/H0LSb31SUOvsBaUI
         hs/29NaJJ24GTmiVv87X88fBCfWzBFk9UaU1aTCxOUrL1AxT66OZDrB/ubRByGSx/fjE
         oNHF7O6z+LyPM66/KOZYV9u/qyXWKBMWbXNEV4ARzcTOH1g701Qe+31zYrHCjVDevvdz
         Ys1eREfsvDsO2pg8eV+PZ7bG5yK3bvi+BePWw3kFytvlc/KL+1hKzW5Swu8JftNZ5fP0
         kIoOUO7VxR4LFPcrVpvUeKUNafljPSUCkc+j1yspdAqbDmJUry0nZRK9GAjOelHhAEFm
         W6Ag==
X-Gm-Message-State: AOJu0Ywu8O1EhVLMvgZmg3nUuKKXDKXmzpqtF+zI+RzNzd0+u+Kq6m+8
	adVJflxBYttzzfufDftXNQ5yioazFNjzA3oqErUCfBVDCcWvmX5TLk5zhZjkLA==
X-Gm-Gg: AY/fxX7/xjq2JUmkoFHocflnRud6zof0unexTQlN12JunWqD0ygO7G+s/+rbeGPBxRY
	LMUCXZ4oEzsjto433o65kFPDVRd45imblvVt4QP+5M8RnHv9+7XjFsbilKAJ9qTRGfnMujPypjk
	oMDmkkFi3iA1T7KAnWqZ9Nv3I4GPN3b1E1Zu/tQzHNNOt9ppjAoQWeaiO2arsSNxbhBwCnCPU7G
	TKyz7oaNfqOIIuB/KIsxWwSgd7omuIMiedp/lLJAdxsAiHe/KRReh9uh+oetNLcZnPk+sH0D/4v
	7ZvvFpGu/YABQ7fO+hB/kMfzWui8p9Xmm38TsFDKZX74jG3EiI39RDLubshYaLUJocODoclNzGd
	lfAHdMKzy+MkRMbTqlmWG6pJJr4lvEr0F6LxFsT9Yvi3SUi3GH6VFZUHHWKUSlH3sevjBwFC0La
	7Q2QnNMhfIYMniWpqvOvc=
X-Google-Smtp-Source: AGHT+IGSV/CfcxCZPtV4hzOxWGxpaVGsLicUm6D5zptruq4xrisSyN0Hn460iri4+tpWnA1dN15RPw==
X-Received: by 2002:a05:600c:3106:b0:47b:deb9:15fb with SMTP id 5b1f17b1804b1-47d195a0feamr622709185e9.33.1767607366331;
        Mon, 05 Jan 2026 02:02:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm144604435e9.10.2026.01.05.02.02.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 11/17] libwebsockets: fix CVE-2025-11678
Date: Mon,  5 Jan 2026 11:02:31 +0100
Message-ID: <20260105100237.3081345-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105100237.3081345-1-skandigraun@gmail.com>
References: <20260105100237.3081345-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123142

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Backport a fix from Debian:
https://sources.debian.org/patches/libwebsockets/4.3.5-1+deb13u1/CVE-2025-11678.patch
Upstream commit:
https://github.com/warmcat/libwebsockets/commit/2bb9598562b37c942ba5b04bcde3f7fdf66a9d3a

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 5fab8bd31b32892acf3d8b56b240a7958890beac)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libwebsockets/CVE-2025-11678.patch        | 128 ++++++++++++++++++
 .../libwebsockets/libwebsockets_4.3.5.bb      |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11678.patch

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11678.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11678.patch
new file mode 100644
index 0000000000..3489a7e6a1
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11678.patch
@@ -0,0 +1,128 @@
+From e1d4c32bf773b8cf01eb5e368a4a21679e0b670a Mon Sep 17 00:00:00 2001
+From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+Date: Tue, 18 Nov 2025 17:03:33 +0100
+Subject: [PATCH] NN-2025-0103: ADNS crafted response overflow
+
+This document contains sensitive information collected during our
+security research activities related with the Libwebsockets library made
+by Andy Green (warmcat).
+
++-------------------------------------------------------------------------------------------------------+
+| Report information                                                                                    |
++:===================================:+:===============================================================:+
+| Vendor                              | warmcat                                                         |
++-------------------------------------+-----------------------------------------------------------------+
+| Vendor URL                          | https://libwebsockets.org/git/libwebsockets                     |
++-------------------------------------+-----------------------------------------------------------------+
+| Affected component                  | Ecostruxure Automation Expert                                   |
++-------------------------------------+-----------------------------------------------------------------+
+| Affected version                    | 4.4                                                             |
++-------------------------------------+-----------------------------------------------------------------+
+| Vulnerability                       | CWE-121: Stack-based Buffer Overflow                            |
++-------------------------------------+-----------------------------------------------------------------+
+| Proposed CVSS v3.1 Base Score       | 7.5                                                             |
++-------------------------------------+-----------------------------------------------------------------+
+| Proposed CVSS v3.1 Vector           | CVSS:4.0/AV:A/AC:L/AT:P/PR:N/UI:P/VC:H/VI:H/VA:H/SC:N/SI:N/SA:N |
++-------------------------------------+-----------------------------------------------------------------+
+
++-----------------------------------------------------------------------------+
+| Security Researcher(s)                                                      |
++:===================================:+:=====================================:+
+| Name                                | **Email address**                     |
++-------------------------------------+---------------------------------------+
+| Raffaele Bova                       | labs-advisory@nozominetworks.com      |
++-------------------------------------+---------------------------------------+
+
+**\**
+
+Libwebsockes is a C library that provides client and server
+implementation for various protocols (e.g., HTTP, websockets, MQTT) and
+more.
+
+Nozomi Networks Lab discovered a "CWE-121: Stack-based Buffer Overflow"
+in the latest software version of libwebsockets, specifically in the
+async-dns component.
+
+The vulnerability allows an attacker that can inspect DNS requests made
+by the victim (e.g. being in the same wireless network) to forge a DNS
+response packet that overflows the stack and may lead to arbitrary code
+execution (depending on the platform and compiler options).
+
+The issue resides in `lws_adns_parse_label` function in
+`lib/system/async-dns/async-dns-parse.c`; this function iteratively parses
+a label however it does not correctly check the number of bytes written
+in the destination buffer.
+
+Specifically, the size of the dest output buffer is specified in the `dl`
+argument, however during the read of each substring of the label only
+the length of the current substring of the label is accounted for not
+overflowing the destination buffer, but previous reads are not accounted
+for.
+
+This means that a label of arbitrary size and content can be supplied
+and is copied onto the stack, however it must be split into substrings
+of size less than `dl`.
+
+To trigger the vulnerability an attacker must be able to sniff the DNS
+request packet to send a response with a matching identifier, otherwise
+the implantation correctly ignores the response.
+
+We have provided a harness for testing, for ease of use copy the harness
+in a subdirectory, for example in minimal-examples-lowlevel/api-tests/,
+and build it
+
+```
+cmake -B build -DLWS_WITH_SYS_ASYNC_DNS=1 -DLWS_WITH_SSL=0
+-DCMAKE_C_FLAGS="-fsanitize=address" . && make -C build lws-test-async-dns
+```
+
+Then it can be run `./build/bin/lws-test-async-dns < poc_stackbof`
+
+![Address sanitizer report of stack buffer overflow](./NN-2025-0103_image.png)
+
+We suggest keeping track of the number of bytes currently written on the
+dest buffer, this could be done by saving the original dest pointer,
+decrementing dl on each substring memcpy, or using an auxiliary
+variable.
+
+CVE: CVE-2025-11678
+Upstream-Status: Backport [https://github.com/warmcat/libwebsockets/commit/2bb9598562b37c942ba5b04bcde3f7fdf66a9d3a]
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ lib/system/async-dns/async-dns-parse.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lib/system/async-dns/async-dns-parse.c b/lib/system/async-dns/async-dns-parse.c
+index bdfe2050..81743b3f 100644
+--- a/lib/system/async-dns/async-dns-parse.c
++++ b/lib/system/async-dns/async-dns-parse.c
+@@ -35,7 +35,7 @@ lws_adns_parse_label(const uint8_t *pkt, int len, const uint8_t *ls, int budget,
+ 	const uint8_t *e = pkt + len, *ols = ls;
+ 	char pointer = 0, first = 1;
+ 	uint8_t ll;
+-	int n;
++	int n, readsize = 0;
+ 
+ 	if (budget < 1)
+ 		return 0;
+@@ -88,7 +88,7 @@ again1:
+ 		return -1;
+ 	}
+ 
+-	if ((unsigned int)ll + 2 > dl) {
++	if ((unsigned int)(ll + 2 + readsize) > dl) {
+ 		lwsl_notice("%s: qname too large\n", __func__);
+ 
+ 		return -1;
+@@ -101,6 +101,7 @@ again1:
+ 	(*dest)[ll + 1] = '\0';
+ 	*dest += ll + 1;
+ 	ls += ll;
++	readsize += ll + 1;
+ 
+ 	if (pointer) {
+ 		if (*ls)
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb
index 0b74adf990..cd69281833 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.3
            file://0001-sll_protocol-may-be-be16.patch \
            file://0002-allow-build-with-cmake-4.patch \
            file://CVE-2025-11677.patch \
+           file://CVE-2025-11678.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"

