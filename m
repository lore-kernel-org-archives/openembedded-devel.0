Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A923A6007A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 21:43:40 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w9so25725577wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 13:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JnuVwS6jhKw3ei1mlAbjSj6eQRC2ZU8Gq14oUqrwfKc=;
	b=lIgUHeRfLSbMAPdJZXOwwXtVjA9jc9+6dRI8MeolnhSh+menvf3RpQMjCMTYcMiEb9
	6nBIxyTKJFSx26sjOr1g/KTxPodF1l3yi2zn8Im+AA3lBSoQzQcKsTPzLUAvMsl89i6N
	YL1FgolNSMUxeszSHKE58JkgyY1OPRfcasrUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JnuVwS6jhKw3ei1mlAbjSj6eQRC2ZU8Gq14oUqrwfKc=;
	b=HELr4DNata1s8Ao2c8sCiR3qL5CReYibTWUORDoX8W1pNGL08zKCR3JwbHy+sP3VnP
	shWZ3P1R+u21x5KyHNgZ0Pr0NVKwF2LeeECwB0M1MvTR24mZfN+yGCs3Ao7g1s1qA7wA
	Ebt+8X5tZgAyrudCYnj2FIROkmm2U/vGQuqnrbVw6Wl2jPfXbjldbQUVSEkBJtMYSuT2
	TOZWDgo3EKvkvvKxDT6aVk6d4XCxN4+PG/EsPUH6M8zIMptAdyjiORz7hSlbzSTCtOAL
	I0x0d6KtyinxjnWKVpwAEZUDDNzRkaCDvbNMXOjmxbLbXL4myMBLKZMiCnolm12illEM
	F1nQ==
X-Gm-Message-State: APjAAAWIJ7M78glcUTHuqL/v/Zqy2b/oOD/1w2momYmKYUQlFsQ/azry
	CpKPdEYIOkEXuByiyPXXbWb2e7Hh5+uZjjhx
X-Google-Smtp-Source: APXvYqyzWA1A0X6wEzCoqSM3K06I6qI29WW9aFYsmAQJRoMk5VV3QThama4tpI0e6q6Ynx709DArZw==
X-Received: by 2002:adf:e3c6:: with SMTP id k6mr38480296wrm.135.1574199821380; 
	Tue, 19 Nov 2019 13:43:41 -0800 (PST)
Received: from arch0.home.b5net.uk ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id
	u203sm4523531wme.34.2019.11.19.13.43.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 13:43:40 -0800 (PST)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 21:43:29 +0000
Message-Id: <20191119214329.549122-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] liblockfile: Rename patch
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
X-List-Received-Date: Tue, 19 Nov 2019 21:43:41 -0000
Content-Transfer-Encoding: 8bit

The file name "0001-Makefile.in-install-nfslock.so-and-nfslock.so.0.patch"
falls afoul of the default exclusions for subversion, preventing import
into other projects. The simplest solution is to just rename the patch.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 ...k.so.0.patch => 0001-Makefile.in-install-nfslock-libs.patch} | 0
 meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb        | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/liblockfile/liblockfile/{0001-Makefile.in-install-nfslock.so-and-nfslock.so.0.patch => 0001-Makefile.in-install-nfslock-libs.patch} (100%)

diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-install-nfslock.so-and-nfslock.so.0.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-install-nfslock-libs.patch
similarity index 100%
rename from meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-install-nfslock.so-and-nfslock.so.0.patch
rename to meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-install-nfslock-libs.patch
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
index de2c1e36d..10d88a3b5 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
@@ -8,7 +8,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.14.orig.tar.gz \
     ${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.14-1.debian.tar.bz2;name=1.14-1 \
     file://configure.patch \
     file://0001-Makefile.in-add-DESTDIR.patch \
-    file://0001-Makefile.in-install-nfslock.so-and-nfslock.so.0.patch \
+    file://0001-Makefile.in-install-nfslock-libs.patch \
     file://liblockfile-fix-install-so-to-man-dir.patch \
 "
 
-- 
2.24.0


