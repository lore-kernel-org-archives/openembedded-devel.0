Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1421.1793731026201598342
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ePCLRHWR;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2761c69fbso7790026c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731025; x=1794335825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkbk9v8QWoEAKSRIbum/fxdTWHuAy15gFboza/sIiyA=;
        b=ePCLRHWRhqY2r0pmlTUulgPR8F0pAWT71dp5CdIlNWNarQyLZue6jTGtxjIEIRYyo3
         kj3DeHa0TO6YHsRCav2EZBcS34FZimX/i0CMI2MxdGic49GtwvztqkOzJj3ksplp4FGy
         khrGupOr0nq36Cap8lD7hK/bRnWUx3++M7HYO6fsY/peQmayl2HRlJPhJtss44yejKN4
         fP9or6WnKA8Fr+n0LHZrs7UOVNFUri9U2+0NeRTjmcc0QKW0UPxA0WoM1I5xJUMJfHiy
         xCBvigayCWx2lY69ADkqRVniLIwYt/wTPrb7svabSi4F0c58bsmDE8zl+jT8+/gDUryQ
         glBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731025; x=1794335825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkbk9v8QWoEAKSRIbum/fxdTWHuAy15gFboza/sIiyA=;
        b=rcI1yTrWX7zcLoFQKwhM5Poks7R70YnswXIuRDtr/gfnqSh7pX68ptSbwZa4gIobza
         oODl0a7iTxhsmnSW4p6cnOWdqXVa1eFqN2ianGsrfzUkNZHCzn4lp2TIxUuI98wzx6xU
         iSKJn1k6JdVKvaNvmHnJS6YheeIr8tlk5KTKm5LcKcHKiRinbccJ/GGS4N0cbGcM/DQ+
         T/TuddAbriBhwRPjl99x1mb8Ug916pHgilhyT3Ox7t/4FQ/7/kynL60t5MDW9utcj1Qh
         w1GAJC1rc7jp4tIqCpm4DejKK8MlxwYwyV3rvF/zN6r/trHxXu8cxYkaBu1Omsy7E2Wq
         tsdw==
X-Gm-Message-State: APuU4Z9V8UKhPabvNrD4Sy+URDKQ+Xkd8qyDzDRM8eZLjByVGHR/qmGs
	zfndjlexqyctV7AyfIqU3NopeXSxlhOYHXc5QIwExWf9pT9Ps/EJ8bLnObt4YQ==
X-Gm-Gg: AYBFou1AtgioBPPd+gEutY8FQQ8xs2flu1T7nxl2y7sIEbY3djoy4L3iY4YpRuJisA5
	zwn+BA621OKCvkt1K7l5I3K7iFd1WFG3vnzNDkArw3f0JmrXm8GF9FCJeDplR+gETxctGxWawke
	4MBz42N07nMokHNa0hAHuWeO1pJIJMA9YmYq4FaJVjNojXJXoCG3ACqj93tAvFPuGlm25VetvEs
	iGdi9jtIDJpg4D2AK7gifofLzCQAoGod75klw2wp7qL1gwFN1pkmzLirj7doLs/ktbjADsE3LNy
	i7tuTWDHCo8bn2K+9pChcLsLM9jEgFd6ysGCyvzSw8vY7QKmIXZh0aG+2MRvAQ+07EZKMcWq0HV
	OCERiRp7gsIDurjXBh7bh91QPqhUHYQhyVbfxlVdVnVrJnsX4XxODszHova6kXzgiiqH/BJL0IQ
	s72P3u6w7rEPYmlQcjKt/qoaHuprhbKtu391hR53MLXvLEpHor4C0rEmFC3/8U1xAUve8ivt5RH
	OII3GoP4/UOw1Anv+kv6NtDsR54hGmb/mm8UlkVTHIBePTwZOgaAmuqNz6yVKz0RkuCUJGHTGNw
	RpmgIJuRqtltF1LeYX3svQpzrapyTM5MUkuoly/OQeQsdzDqpTFplihNRhj2rgHgk22hHvzlOMP
	uwzCiSuU=
X-Received: by 2002:a05:7022:d8b:b0:195:c6c2:c6b with SMTP id a92af1059eb24-1ac5c273c3emr18110062c88.35.1793731025355;
        Tue, 03 Nov 2026 10:37:05 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:37:05 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 10/20] imapfilter: upgrade 2.8.5 -> 2.8.6
Date: Wed,  4 Nov 2026 07:36:30 +1300
Message-ID: <20261103183640.919438-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131808
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch that is part of the upstream version.

Changelog:
- Support building with OpenSSL 4.0.0 and later.
- Bug fix; UTF-7 encoding mailbox conversion problems.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...NG-accessors-for-opaque-ASN1_INTEGER.patch | 45 -------------------
 ...mapfilter_2.8.5.bb => imapfilter_2.8.6.bb} |  4 +-
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta-oe/recipes-support/imapfilter/imapfilter/0001-Use-ASN1_STRING-accessors-for-opaque-ASN1_INTEGER.patch
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.8.5.bb => imapfilter_2.8.6.bb} (80%)

diff --git a/meta-oe/recipes-support/imapfilter/imapfilter/0001-Use-ASN1_STRING-accessors-for-opaque-ASN1_INTEGER.patch b/meta-oe/recipes-support/imapfilter/imapfilter/0001-Use-ASN1_STRING-accessors-for-opaque-ASN1_INTEGER.patch
deleted file mode 100644
index 4342de42c9..0000000000
--- a/meta-oe/recipes-support/imapfilter/imapfilter/0001-Use-ASN1_STRING-accessors-for-opaque-ASN1_INTEGER.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From d0e1b29ee5ae0e6e91944fd5c04b943fc810e13c Mon Sep 17 00:00:00 2001
-From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
-Date: Mon, 3 Aug 2026 23:02:04 +0200
-Subject: [PATCH] Use ASN1_STRING accessors for opaque ASN1_INTEGER
-
-OpenSSL 4.0 made ASN1_INTEGER opaque. Replace direct struct member
-access (->length, ->type, ->data) with ASN1_STRING_length(),
-ASN1_STRING_type(), ASN1_STRING_get0_data().
-Upstream-Status: Submitted [https://github.com/lefcha/imapfilter/pull/317]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- src/cert.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/cert.c b/src/cert.c
-index a6f614a..b188dd0 100644
---- a/src/cert.c
-+++ b/src/cert.c
-@@ -186,21 +186,21 @@ get_serial(X509 *cert)
- 	serial = X509_get_serialNumber(cert);
- 	buf = xmalloc(LINE_MAX);
- 	*buf = '\0';
--	if (serial->length <= (int)sizeof(long)) {
-+	if (ASN1_STRING_length(serial) <= (int)sizeof(long)) {
- 		num = ASN1_INTEGER_get(serial);
--		if (serial->type == V_ASN1_NEG_INTEGER) {
-+		if (ASN1_STRING_type(serial) == V_ASN1_NEG_INTEGER) {
- 			snprintf(buf, LINE_MAX, "-%lX", -num);
- 		} else {
- 			snprintf(buf, LINE_MAX, "%lX", num);
- 		}
- 	} else {
--		if (serial->type == V_ASN1_NEG_INTEGER) {
-+		if (ASN1_STRING_type(serial) == V_ASN1_NEG_INTEGER) {
- 			snprintf(buf, LINE_MAX, "-");
- 		}
--		for (i = 0; i < serial->length; i++) {
-+		for (i = 0; i < ASN1_STRING_length(serial); i++) {
- 			len = strlen(buf);
- 			snprintf(buf + len, LINE_MAX - len, "%02X",
--			    serial->data[i]);
-+			    ASN1_STRING_get0_data(serial)[i]);
- 		}
- 	}
- 	return buf;
diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.5.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.6.bb
similarity index 80%
rename from meta-oe/recipes-support/imapfilter/imapfilter_2.8.5.bb
rename to meta-oe/recipes-support/imapfilter/imapfilter_2.8.6.bb
index 3e449523ca..6485316a23 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.5.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.6.bb
@@ -2,11 +2,9 @@ SUMMARY = "IMAPFilter is a mail filtering utility that processes mailboxes based
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c9e8d74e78283c6319317d3cb15eded4"
 
-# v2.7.6
-SRCREV = "23b693f7f7cad8b459beb5cf748078f9cc0e5dc8"
+SRCREV = "e9a00548a6d56030b99ffde2985c4af32cb8aff7"
 SRC_URI = "git://github.com/lefcha/imapfilter;protocol=https;branch=master;tag=v${PV} \
            file://ldflags.patch \
-           file://0001-Use-ASN1_STRING-accessors-for-opaque-ASN1_INTEGER.patch \
 "
 
 DEPENDS = "openssl lua libpcre2"
