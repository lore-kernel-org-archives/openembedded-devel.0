Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.162.1593141286174417578
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 20:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KCn0Yeth;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id u9so134603pls.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2020 20:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ZtnRUD0lAwzeMTcrPZp+hmMuaSBkAnr9NrShIbeN4Vw=;
        b=KCn0YethU5/RCKppRu3/N4G3pEaTKSH0gw7zSF7URqdeVHxEhYfilxlJnbw3ZT0CXz
         Fkd2oJ6YumIQGC7jT7IokSE9hvDDAuDhRN34Y2rhF21S+CBdrDwrMgQCBkTPfaSyGbsB
         uwxe8E+28GS9QnRrJADmu2jjaKpnQImLaAVLV1xehqIeGAtlGfSuztE0pl7s8+ku05Ec
         GGfwyjRf8+fP1YxBrhRLY8K79NZCpmLSQ4ut0SGnXT5xJmA6nCEoRBQ2omv0+6FBs+Dd
         GnA5DziHLyLopZVz4imPrZ8nSPnD8Zs+0XUyvZqDJwwRct1vIOkxKAtT85fhASqQ5gNv
         Uicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ZtnRUD0lAwzeMTcrPZp+hmMuaSBkAnr9NrShIbeN4Vw=;
        b=jWwYtgq3DXqdYefRFq9hH6y69Iuf2unTLXT4E5kOOJRg8W/eCjcqic9MoOYGQhA5H+
         o2z+MpdAT7W2tZJZzBXK0ywnjhrizv01vdQ1N7JL0TBOr/vTjG+lkuhn58KjjWXME659
         2qnfNVNM0CWH0rtPonmc5OaSgcGn2JArEOurx+7iM2braUJM2kjYEKGg8KqjDSj8tueI
         xajaVqnMOUJNyF3045aOJcaBNZQFU3pzRCubY3H01yUEI6WpepM0cRcDZYRMkwwyp7V3
         Ofyp4krabYe29o1jNTcvVOZlTVO1zFgVCIhifYoDGcP3O6VEnmjqEdMspqXuzir/GB6L
         /wfw==
X-Gm-Message-State: AOAM531UnYP/P+Ok5OKLnWle/x5hVsdxDaatN8lSqFLYKWQUuqcRJqXF
	DUK8mgYyydCFey1+8I2Sdv44prbW
X-Google-Smtp-Source: ABdhPJzHyGE0wFJbKwBRSmnOxzSVQ/kCmu13eD9p0OQC8URwP23pRCRm/pdmqF5RvcI16P0ZtfaYuQ==
X-Received: by 2002:a17:902:c402:: with SMTP id k2mr831577plk.184.1593141285285;
        Thu, 25 Jun 2020 20:14:45 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:acbe:8216:8a55:1b44])
        by smtp.gmail.com with ESMTPSA id z1sm24506070pfr.88.2020.06.25.20.14.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 20:14:44 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [zeus 4/6] opensc: CVE-2019-19479 CVE-2019-19480
Date: Thu, 25 Jun 2020 20:14:36 -0700
Message-Id: <22862f7bdc690268ab44548576f002cf585a6f78.1593141198.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593141198.git.akuster808@gmail.com>
References: <cover.1593141198.git.akuster808@gmail.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Security Advisory

References
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19479
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19480

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../opensc/opensc/CVE-2019-19479.patch        | 30 ++++++++++++++++
 .../opensc/opensc/CVE-2019-19480.patch        | 34 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.19.0.bb   |  2 ++
 3 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2019-19479.patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2019-19480.patch

diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2019-19479.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2019-19479.patch
new file mode 100644
index 0000000000..73222ee1a4
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2019-19479.patch
@@ -0,0 +1,30 @@
+From c3f23b836e5a1766c36617fe1da30d22f7b63de2 Mon Sep 17 00:00:00 2001
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Sun, 3 Nov 2019 04:45:28 +0100
+Subject: [PATCH] fixed  UNKNOWN READ
+
+Upstream-Status: Accepted <or Backport>
+CVE: CVE-2019-19479 
+   
+Reported by OSS-Fuzz
+https://oss-fuzz.com/testcase-detail/5681169970757632
+
+Reference to upstream patch:
+https://github.com/OpenSC/OpenSC/commit/c3f23b836e5a1766c36617fe1da30d22f7b63de2
+---
+ src/libopensc/card-setcos.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libopensc/card-setcos.c b/src/libopensc/card-setcos.c
+index 4cf328ad6a..1b4e8f3e23 100644
+--- a/src/libopensc/card-setcos.c
++++ b/src/libopensc/card-setcos.c
+@@ -868,7 +868,7 @@ static void parse_sec_attr_44(sc_file_t *file, const u8 *buf, size_t len)
+ 			}
+ 
+ 			/* Encryption key present ? */
+-			iPinCount = iACLen - 1;		
++			iPinCount = iACLen > 0 ? iACLen - 1 : 0;
+ 
+ 			if (buf[iOffset] & 0x20) {
+ 				int iSC;
diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2019-19480.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2019-19480.patch
new file mode 100644
index 0000000000..12c1f0b4af
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2019-19480.patch
@@ -0,0 +1,34 @@
+From 6ce6152284c47ba9b1d4fe8ff9d2e6a3f5ee02c7 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Wed, 23 Oct 2019 09:22:44 +0200
+Subject: [PATCH] pkcs15-prkey: Simplify cleaning memory after failure
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=18478
+
+Upstream-Status: Accepted
+CVE: CVE-2019-19480
+
+Reference to upstream patch:
+https://github.com/OpenSC/OpenSC/commit/6ce6152284c47ba9b1d4fe8ff9d2e6a3f5ee02c7
+---
+ src/libopensc/pkcs15-prkey.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/libopensc/pkcs15-prkey.c b/src/libopensc/pkcs15-prkey.c
+index d3eee983..4b249582 100644
+--- a/src/libopensc/pkcs15-prkey.c
++++ b/src/libopensc/pkcs15-prkey.c
+@@ -258,6 +258,10 @@ int sc_pkcs15_decode_prkdf_entry(struct sc_pkcs15_card *p15card,
+ 	memset(gostr3410_params, 0, sizeof(gostr3410_params));
+ 
+ 	r = sc_asn1_decode_choice(ctx, asn1_prkey, *buf, *buflen, buf, buflen);
++	if (r < 0) {
++	        /* This might have allocated something. If so, clear it now */
++	        free(info.subject.value);
++        }
+ 	if (r == SC_ERROR_ASN1_END_OF_CONTENTS)
+ 		return r;
+ 	LOG_TEST_RET(ctx, r, "PrKey DF ASN.1 decoding failed");
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/opensc/opensc_0.19.0.bb b/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
index bc1722e394..d26825a06d 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
@@ -15,6 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 SRCREV = "f1691fc91fc113191c3a8aaf5facd6983334ec47"
 SRC_URI = "git://github.com/OpenSC/OpenSC \
            file://0001-Remove-redundant-logging.patch \
+           file://CVE-2019-19479.patch \
+           file://CVE-2019-19480.patch \
           "
 DEPENDS = "openct pcsc-lite virtual/libiconv openssl"
 
-- 
2.17.1

