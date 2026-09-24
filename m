Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220CDC98312
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:33:54 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.729.1790224425087365579
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ELjLPzXV;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so924497a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224424; x=1790829224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KosvtCUSJ21fJx86qYZ14SRwmW6A54Sj34r5H5qP8E=;
        b=ELjLPzXVqbGSiEnYdBEitlhbGwuVhfOYzQu4+3CZ9GHPfGZX3n7oMkA3SLd9Z1okr2
         KHtcWIIOhvNtcw2l36I65ud2i/1s4+/hcYh50KEmRt0AEZ887N1ib44wKdAf0dwPVh5Y
         x/y2PRZ/iJOh73rCkq7WiPrzVmoIByHaoZJ2xrXDWgRMGF+aqJsFI8KYavBRVeUb3m/+
         wIVa5SUZ8INx+4g9CtIwZJJxZGL5fCx7m5S7nFvoQ9P9QVAX+Wj0Ucn2r0vdNbTMqVO5
         UGqhFquOkzPwBiCodyAlvFN/5Xh/T6Fg19b2WcEsb3xVVH1NZ3fHktzWH5zbf3ZLWXig
         H9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224424; x=1790829224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8KosvtCUSJ21fJx86qYZ14SRwmW6A54Sj34r5H5qP8E=;
        b=Uw6w4zKjbbDG+K1rRzlfllJooDXuGzGhXpqrhYUHF8zzNN1uAobXjmYz7215BsV/XV
         wLqs5ZVuhOXjVzAUmffsAqkIHmy0e4jgvbOERIVsLpUMjU6kjOHFlEzFiq+La7Eak62X
         xkSZ0ZII5DlMzTSWUyjtG8PIHlJ0dqJcY6BmWxLgu4QvX6j0llIvdxot+JAxRqQmDBBg
         jTQjKCoX36JQSGnQjVV+k/5mHbVugH9MznFOnksAjLWZeMBF3blWHvHd2JslFQexttcH
         TOqsQw3eSL8dTQq4Pi0piSlYuaAr9Zaz4IbT6/YJXSZTUcMyCqHuOyjrqFNMafOg7qRJ
         9Wxg==
X-Gm-Message-State: AFuF++n4sVHEBd6MsD60tDK2hOQzBKWbTt3hEOTojjp/KsjSxJKf8+GQ
	rpUKprbvhI+fAVVlznY5taCYi66kYPfCq75mi03sENgWdNgTa4YvboGO1mQyIw==
X-Gm-Gg: AYBFou0m0/rRAqkPu0rgjCvOm3Ue7yqL8PaRKM1CTfZ5yhGDofunCtV5eJanwpyNPIo
	uB3q0C+zBWnANaldj7JVjnrlIToXb+mEVdi61sS8NR7ssDIG/LTi6V/qHroC9duoybrHeqg7NW3
	LDYtdWXTspjOuCGfKsp5bynlUGaWAip05fiT983MlJwHfzjXKCLLwoH77g7vdUX2qxEcZg4cyPg
	M0DOYbGptQ3cAqyVMKYnAt65pDB8iuZRIZKYe8fDU0H1bz6JXfZFKR41e7IzrysllqtICjZd1C8
	l+P8LnNQW55Jz93LJKuWhZrKVNA/22OLuP1Jhc1GoGDJGLWOCjHtmi1kFMYNrVtenByEripInOm
	2ETF6JK1bQjTuU1LlI5PQ2hh2lhZCH2PpA/+8nsGcDK4qqGiWZ8bP44Y2E5+/BLouwqdwX3lAPn
	sWWi6plMIj+jWmnEOoo5MUhF4zdBh7pDhc4somBwJbTVl6bKaFWXP6/8Nanrhjy6TEBcdoJH6cD
	rlEXF+CmuQNihruUUbcwQIilxS+wKYLlg==
X-Received: by 2002:a05:6a20:3d09:b0:3dd:a00a:c5ba with SMTP id adf61e73a8af0-3de0e7f49aamr1164357637.45.1790224424446;
        Wed, 23 Sep 2026 21:33:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:33:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 11/24] strongswan: patch CVE-2026-78131
Date: Thu, 24 Sep 2026 16:33:01 +1200
Message-ID: <20260924043315.1663186-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:33:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130259

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78131

[1]https://download.strongswan.org/security/CVE-2026-78131/strongswan-5.5.3-6.0.7_x509_ac_leaks.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78131).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78131.patch           | 86 +++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78131.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78131.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78131.patch
new file mode 100644
index 0000000000..da53f8e5a0
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78131.patch
@@ -0,0 +1,86 @@
+From d1d29ac675b42a8c4a6454db84803bfecf5a0d99 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Fri, 12 Jun 2026 15:55:43 +0200
+Subject: [PATCH] x509: Fix memory leaks when parsing attribute certificates
+
+This can be triggered by an attribute certificate with lots of GeneralName
+entries or AuthorityKeyIdentifier extensions.  There is no verification
+before the certificate is parsed.
+
+Fixes: 3134379ac7f1 ("x509: Fix some whitespaces and do some minor style cleanups in acert")
+Fixes: 26930a8c3e42 ("certificate factory can load certs from file")
+Fixes: CVE-2026-78131
+
+CVE: CVE-2026-78131
+Upstream-Status: Backport [1][2]
+
+[1]https://github.com/strongswan/strongswan/commit/23c9b9a2708e4958292d828424523fa63c0be829
+[2]https://github.com/strongswan/strongswan/commit/9762cc3b091b423543510113a5d05215daf16951
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libstrongswan/plugins/x509/x509_ac.c | 33 +++++++-----------------
+ 1 file changed, 9 insertions(+), 24 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/x509/x509_ac.c b/src/libstrongswan/plugins/x509/x509_ac.c
+index 3fc5de2..68b7cf9 100644
+--- a/src/libstrongswan/plugins/x509/x509_ac.c
++++ b/src/libstrongswan/plugins/x509/x509_ac.c
+@@ -186,41 +186,25 @@ extern bool x509_parse_generalNames(chunk_t blob, int level0, bool implicit,
+ static bool parse_directoryName(chunk_t blob, int level, bool implicit,
+ 								identification_t **name)
+ {
+-	identification_t *directoryName;
+-	enumerator_t *enumerator;
+-	bool first = TRUE;
+ 	linked_list_t *list;
+ 
+ 	list = linked_list_create();
+ 	if (!x509_parse_generalNames(blob, level, implicit, list))
+ 	{
+-		list->destroy(list);
++		list->destroy_offset(list, offsetof(identification_t, destroy));
+ 		return FALSE;
+ 	}
+-
+-	enumerator = list->create_enumerator(list);
+-	while (enumerator->enumerate(enumerator, &directoryName))
+-	{
+-		if (first)
+-		{
+-			*name = directoryName;
+-			first = FALSE;
+-		}
+-		else
+-		{
+-			DBG1(DBG_ASN, "more than one directory name - first selected");
+-			directoryName->destroy(directoryName);
+-			break;
+-		}
+-	}
+-	enumerator->destroy(enumerator);
+-	list->destroy(list);
+-
+-	if (first)
++	if (list->remove_first(list, (void**)name) != SUCCESS)
+ 	{
+ 		DBG1(DBG_ASN, "no directoryName found");
++		list->destroy(list);
+ 		return FALSE;
+ 	}
++	if (list->get_count(list))
++	{
++		DBG1(DBG_ASN, "more than one directory name - first selected");
++	}
++	list->destroy_offset(list, offsetof(identification_t, destroy));
+ 	return TRUE;
+ }
+ 
+@@ -539,6 +523,7 @@ static bool parse_certificate(private_x509_ac_t *this)
+ 						DBG2(DBG_ASN, "  need to parse crlDistributionPoints");
+ 						break;
+ 					case OID_AUTHORITY_KEY_ID:
++						chunk_free(&this->authKeyIdentifier);
+ 						this->authKeyIdentifier =
+ 								x509_parse_authorityKeyIdentifier(object,
+ 											level, &this->authKeySerialNumber);
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index 4d13507151..19f1cc2f69 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78127.patch \
            file://CVE-2026-78129.patch \
            file://CVE-2026-78133.patch \
+           file://CVE-2026-78131.patch \
 "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"

