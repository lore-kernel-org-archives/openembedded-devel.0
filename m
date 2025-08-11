Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F016EC87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 11:33:35 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.46019.1754912014561602061
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Aug 2025 04:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IDByhPiN;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-71b5279714cso35441387b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Aug 2025 04:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754912013; x=1755516813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ky1Uq4dgf3itaJlxKRkhOaqjb9X8PGTYj4cKVlcciT0=;
        b=IDByhPiNV2HFtqaiUUEU4n0d4a28cs9zqJOOUKBfSxfheLJrSZuIJfaQNTi2fpsBLV
         Z3kkpKpJEcNEN97ZrKyEshA0P2ULqHLyYIEiLlvNhL2+iC9uF2hFM3J1f75eCVDXkRJb
         KKEsz2iYGnCH/yyWCQnpK8SS4h/G+IbEI+9BloHCYBNz/zKMN3iQcKlWFifjCGrFKQgU
         FnJntKdzLfAzxqJxC4IAy7pDNvsKQ+ZxjRb6lPZdiqZaTQjJ4tLFw5L85jtLMNmvCF2U
         GCm1Ac3CA+GedlVKfEVIQF23ZbQa7xN1LoicrDlQ8n1oaNdEKqH7yirHHtVpMjLGOIc5
         L+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754912013; x=1755516813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ky1Uq4dgf3itaJlxKRkhOaqjb9X8PGTYj4cKVlcciT0=;
        b=e07gC1XHVvyvLBrBAjF+ajQglT2Lez74uVt/jKTScMa5UyFY1eVrxIABkqRfFm5Znw
         kJBdiAVrrkXCIfg7zZ+HYndFg+KMcAq8fZxUx81Sjk9dkCYp+heGuKjt1rHeT102HRWV
         EEv5Pt4mbMUmjOuVYxQ9DT8PniDcIdWsSDzfpBjbKlFApKpaqLOOGhKdihQqtMo+zzSF
         O3BEIl0SSBJJ4eKWv9/WMPEWGmpkTSB/yhkjKcFDRPkHadAV/n0p+fSKSQUXNE4my0Je
         qFQMZD14XU+2cZsbH/Th/pXZniWxtL+n9+CNaKhU/tas9vSSlsQ2WEB24vP3GnvR39wA
         NcUw==
X-Gm-Message-State: AOJu0YxQwm+3gHKsNR0ZkQaX6RN+UhTqOJuR+PMxbHgUsiSt0EUSF0Mh
	oR+DAwI4zZigv0ZBjNpffI3trI5FodwbKTMud+hjoY2xWi/eTehDWV6gX3NUVw==
X-Gm-Gg: ASbGncuz/4YG4pjiYHDcODrPkxiCcboSJn9NyBitnP8Nw1X9+fqwYtQTKP0jVunN7w8
	OWckTK+FDgmj7dWY7FuuJnFuB/peoqFXqQg+rH2A1eN/nP+KXQMc2ifKWDLW2NyzEWdIF7FHDwJ
	kaJncnVzNBiCfHR7KjCX/4xEPk/YevOziz15GfZC4Y/sV8HqbA9l9278jnf9lWuopv36kg3S+K1
	wtAUOVRUOrTX7k7ZPiheri/q2gcm1+/sgnO+gVRAzVkgtyBjrs6QupDcvAcNWqSNVFhFZzqBPtO
	9gX3fjycS4uiKOW+LUKNmwISifK7Rq4CiJ26+bMUR03bMWjb7gv3to5Jg3z5vawu9rl+zNz/1nf
	7GltWzlOIhnQyHq+8yfZUc3rzejk2
X-Google-Smtp-Source: AGHT+IFg+se1xa+84g2ANDXJenKB6rTzGPsVckNzXyMgc/KmI14XP0HVaDidq2m1o1RU7DppMLYV7A==
X-Received: by 2002:a05:690c:4b08:b0:71a:3ad2:4b31 with SMTP id 00721157ae682-71bf0f260admr145090087b3.42.1754912013143;
        Mon, 11 Aug 2025 04:33:33 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71b5a3fa66bsm68519307b3.36.2025.08.11.04.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 04:33:32 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][walnascar][PATCH] c-ares: backport a patch for a memory leak
Date: Mon, 11 Aug 2025 07:33:11 -0400
Message-ID: <20250811113311.1218652-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Aug 2025 11:33:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118909

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/0001-ares_uri-memory-leak.patch    | 21 +++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.34.5.bb   |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch b/meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch
new file mode 100644
index 0000000000..4d08651be1
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch
@@ -0,0 +1,21 @@
+fix memory leak in ares_uri (#1012)
+Dynamic memory, referenced by 'outpath', is allocated at ares_uri.c:527
+by calling function 'ares_buf_create' and lost at ares_uri.c:536.
+
+Signed-off-by: Felix The Cat (@F3lixTheCat)
+
+--
+
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/ee2a1c3eff3c8164b09123005f4b49c571788b59]
+
+--- a/src/lib/util/ares_uri.c	2025-08-10 15:59:17.501710307 -0400
++++ b/src/lib/util/ares_uri.c	2025-08-10 16:00:35.867494819 -0400
+@@ -533,7 +533,7 @@
+   status = ares_buf_split_str_array(inpath, (const unsigned char *)"/", 1,
+                                     ARES_BUF_SPLIT_TRIM, 0, &arr);
+   if (status != ARES_SUCCESS) {
+-    return NULL;
++    goto done;
+   }
+ 
+   for (i = 0; i < (ares_ssize_t)ares_array_len(arr); i++) {
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
index b6945f221d..8204f25cdb 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
@@ -6,6 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
+           file://0001-ares_uri-memory-leak.patch \
            file://run-ptest"
 SRC_URI[sha256sum] = "7d935790e9af081c25c495fd13c2cfcda4792983418e96358ef6e7320ee06346"
 
-- 
2.43.0


