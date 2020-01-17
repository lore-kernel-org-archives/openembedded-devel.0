Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3A97A7F8CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 07:21:12 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k25so11218705pgt.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 23:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nWCDClq23GCYw/49QpNw04GtFL4yz//X7JwhN39ddcw=;
	b=c9VssKGoxSSVH59TmquOkvKW6mqb67Krh7hiqGoF7zX7D97EWPqyHnRpyjZ5WzsoNc
	Ds5qOvMqp9mUOw0KtO1pcYewZdNY0dvoweXhukzE6Uvjhiyl9RfJCXcpzXQ6lFHElX0R
	0X8tskxezlEseAkpSui3fJDNHN2Zx1JLWkuY4OostF3bDlwJNWfWIl5J6halB9eYa4jl
	GJH8nWDULNBscBBEh5VQNwN1QTn8Xu1oC2MG3RTw7fqWDvx3nlEPQUi7S9SO2IAB2dE0
	JXtI0c1j1CNcHIHvMaVJt2WNEJycNKBtw0rvI90kVuwLj7EXupEWg9o0qh1mcmesgK3A
	nOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nWCDClq23GCYw/49QpNw04GtFL4yz//X7JwhN39ddcw=;
	b=BWG1eJB1QQEM0vX6mVmyjZM1t6ZcpfOOg1pGMp6CFGiRJCmLyuypPKZ81nwjdPKG8g
	9iXVCd9RgQYBjNFbmo23wm9EDy0JqZ+xo2QnpliAeVewcU2ALNUGafVJGVFvBRou1cT2
	yu+batGSDA9FWz0jmAENjuahMJSkBY13u6tg8gDZWDnBRVMsics5zVRoQoFHeeNrAKeD
	jRzzFChOAh8mnQEkTJZwSiPLbjo0MBx3O+ApIakiHcq/37CgfxZJ2ArHCLxSK36JJg4v
	g4fNmboPyuNlI2QqnF0CDZWXFVDMD/09Gd/OQZiX8AnzDhiFvM7T2H+nBPqTH/S51JmD
	KKQg==
X-Gm-Message-State: APjAAAWMkMfyqt5MEz688PnLgWgOyFoydM6ttomNildtCQ4U+dxASY2Q
	MT/DMC2XBvcPF6qzozElw/OxxjI01gg=
X-Google-Smtp-Source: APXvYqy74g0GIuK4cpDnu3YvicWhb50xb1PQ+511tG60G1fslEcrPhOVuZpGFxeMWcDlFKpssMOoaw==
X-Received: by 2002:a62:33c6:: with SMTP id z189mr1627944pfz.246.1579245672812;
	Thu, 16 Jan 2020 23:21:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	u128sm28590000pfu.60.2020.01.16.23.21.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 23:21:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jan 2020 23:21:07 -0800
Message-Id: <20200117072107.1505223-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] opensc: Upgrade to 0.20.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jan 2020 07:21:12 -0000
Content-Transfer-Encoding: 8bit

Drop all patches as they are already included in 0.20.0 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Fix-misleading-code-indentation.patch | 69 -------------------
 .../0001-Remove-redundant-logging.patch       | 34 ---------
 .../{opensc_0.19.0.bb => opensc_0.20.0.bb}    |  4 +-
 3 files changed, 1 insertion(+), 106 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opensc/opensc/0001-Fix-misleading-code-indentation.patch
 delete mode 100644 meta-oe/recipes-support/opensc/opensc/0001-Remove-redundant-logging.patch
 rename meta-oe/recipes-support/opensc/{opensc_0.19.0.bb => opensc_0.20.0.bb} (89%)

diff --git a/meta-oe/recipes-support/opensc/opensc/0001-Fix-misleading-code-indentation.patch b/meta-oe/recipes-support/opensc/opensc/0001-Fix-misleading-code-indentation.patch
deleted file mode 100644
index eb71b9d766..0000000000
--- a/meta-oe/recipes-support/opensc/opensc/0001-Fix-misleading-code-indentation.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 283578519ec83a8792b026c10322789784d629de Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 27 Dec 2019 11:33:57 -0800
-Subject: [PATCH] Fix misleading code indentation
-
-Fixes
-error: misleading indentation; statement is not part of the previous 'if' [-Werror,-Wmisleading-indentation]
-         if(cipher)
-         ^
-../../../git/src/libopensc/card-entersafe.c:369:2: note: previous statement is here
-        if(sbuf)
-        ^
-Upstream-Status: Submitted [https://github.com/OpenSC/OpenSC/pull/1894]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libopensc/card-entersafe.c | 12 ++++++------
- src/tools/pkcs15-init.c        |  4 ++--
- 2 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/src/libopensc/card-entersafe.c b/src/libopensc/card-entersafe.c
-index 3e42c11f..abb9fd81 100644
---- a/src/libopensc/card-entersafe.c
-+++ b/src/libopensc/card-entersafe.c
-@@ -352,10 +352,10 @@ static int entersafe_transmit_apdu(sc_card_t *card, sc_apdu_t *apdu,
- 	 size_t cipher_data_size,mac_data_size;
- 	 int blocks;
- 	 int r=SC_SUCCESS;
--	u8 *sbuf=NULL;
--	size_t ssize=0;
-+	 u8 *sbuf=NULL;
-+	 size_t ssize=0;
- 
--	SC_FUNC_CALLED(card->ctx, SC_LOG_DEBUG_VERBOSE);
-+	 SC_FUNC_CALLED(card->ctx, SC_LOG_DEBUG_VERBOSE);
- 
- 	 assert(card);
- 	 assert(apdu);
-@@ -363,10 +363,10 @@ static int entersafe_transmit_apdu(sc_card_t *card, sc_apdu_t *apdu,
- 	 if((cipher||mac) && (!key||(keylen!=8 && keylen!=16)))
- 		  SC_FUNC_RETURN(card->ctx, SC_LOG_DEBUG_VERBOSE, SC_ERROR_INVALID_ARGUMENTS);
- 
--	r = sc_apdu_get_octets(card->ctx, apdu, &sbuf, &ssize, SC_PROTO_RAW);
--	if (r == SC_SUCCESS)
-+	 r = sc_apdu_get_octets(card->ctx, apdu, &sbuf, &ssize, SC_PROTO_RAW);
-+	 if (r == SC_SUCCESS)
- 		sc_apdu_log(card->ctx, SC_LOG_DEBUG_VERBOSE, sbuf, ssize, 1);
--	if(sbuf)
-+	 if(sbuf)
- 		free(sbuf);
- 
- 	 if(cipher)
-diff --git a/src/tools/pkcs15-init.c b/src/tools/pkcs15-init.c
-index 1ce79f45..9a73121c 100644
---- a/src/tools/pkcs15-init.c
-+++ b/src/tools/pkcs15-init.c
-@@ -2311,8 +2311,8 @@ do_read_private_key(const char *filename, const char *format,
- 			r = util_getpass(&passphrase, &len, stdin);
- 			if (r < 0 || !passphrase)
- 				return SC_ERROR_INTERNAL;
-- 			r = do_read_pkcs12_private_key(filename,
-- 					passphrase, pk, certs, max_certs);
-+			r = do_read_pkcs12_private_key(filename,
-+					passphrase, pk, certs, max_certs);
- 		}
- 	} else {
- 		util_error("Error when reading private key. "
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-support/opensc/opensc/0001-Remove-redundant-logging.patch b/meta-oe/recipes-support/opensc/opensc/0001-Remove-redundant-logging.patch
deleted file mode 100644
index 291f1a239a..0000000000
--- a/meta-oe/recipes-support/opensc/opensc/0001-Remove-redundant-logging.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c012f46965b3fe24e31367796e52c2d0b14ca5d9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 17 Dec 2018 18:44:23 -0800
-Subject: [PATCH] Remove redundant logging
-
-Same information is printed a few line below in same function, the only
-difference is that there it takes care of case when label is NULL pointer
-unlike this line
-
-secondly, every function call to cosm_write_tokeninfo() in this file
-passes label=NULL, and then it tries to print a null pointer
-
-Fixes errors like
-src/libopensc/log.h:48:47: error: '%s' directive argument is null
-[-Werror=format-overflow=]
-
-Upstream-Status: Submitted [https://github.com/OpenSC/OpenSC/pull/1557]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/pkcs15init/pkcs15-oberthur.c | 1 -
- 1 file changed, 1 deletion(-)
-
-Index: git/src/pkcs15init/pkcs15-oberthur.c
-===================================================================
---- git.orig/src/pkcs15init/pkcs15-oberthur.c
-+++ git/src/pkcs15init/pkcs15-oberthur.c
-@@ -70,7 +70,6 @@ cosm_write_tokeninfo (struct sc_pkcs15_c
- 	ctx = p15card->card->ctx;
- 
- 	SC_FUNC_CALLED(ctx, SC_LOG_DEBUG_VERBOSE);
--	sc_debug(ctx, SC_LOG_DEBUG_NORMAL, "cosm_write_tokeninfo() label '%s'; flags 0x%X", label, flags);
- 	if (sc_profile_get_file(profile, COSM_TITLE"-token-info", &file)) {
- 		rv = SC_ERROR_INCONSISTENT_PROFILE;
- 		SC_TEST_GOTO_ERR(ctx, SC_LOG_DEBUG_NORMAL, rv, "Cannot find "COSM_TITLE"-token-info");
diff --git a/meta-oe/recipes-support/opensc/opensc_0.19.0.bb b/meta-oe/recipes-support/opensc/opensc_0.20.0.bb
similarity index 89%
rename from meta-oe/recipes-support/opensc/opensc_0.19.0.bb
rename to meta-oe/recipes-support/opensc/opensc_0.20.0.bb
index 0d744e213b..a815980c4f 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.20.0.bb
@@ -12,10 +12,8 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 #v0.19.0
-SRCREV = "f1691fc91fc113191c3a8aaf5facd6983334ec47"
+SRCREV = "45e29056ccde422e70ed3585084a7f150c632515"
 SRC_URI = "git://github.com/OpenSC/OpenSC \
-           file://0001-Remove-redundant-logging.patch \
-           file://0001-Fix-misleading-code-indentation.patch \
           "
 DEPENDS = "virtual/libiconv openssl"
 
-- 
2.25.0


