Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7546.1792574999271101409
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AWfZp0b9;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1517bda04a0so521769c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574999; x=1793179799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XxYAX0lCPWv/um9gq489mogC8yAXGqw0/0rlkk/qW2U=;
        b=AWfZp0b9kP0Yq4E/STGddEOodhjcXXULn7FGOHVUvJqocq98Vm5QQoEdYPEdtpmqIr
         oi6DbSG0pbnaMShLN2mTvYt2rN0uLPR46OX0PfK2NpEJRVDNbvBKXLF+0F3uhZEOphsQ
         nfcCNY42IZE5aZXltlA/ZMjrNBtRxH5uh12GjKQhNRFQUo6o0M5AUE7UR0cuQcqzgq4j
         U0kEXdS8udIyWyq3D/dBjAgugQobBYzjiM+yUYfgr3dK3HAtMwq8DWmvE0ZYnwSgeByb
         qhTUsD9Wrpxcq5Z3mPygi7mk15yfEaPsnhDgKwbk1SbzjdJNKlJoIRQLZNX+5sOKmQa5
         VBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574999; x=1793179799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XxYAX0lCPWv/um9gq489mogC8yAXGqw0/0rlkk/qW2U=;
        b=gCPfkgJWeylgUB/EivP1RLiDQL9EhVbahRBnHDcC+kqbatHcOPpL87gk6dD+CG+TWM
         mdANp+MM9HtPSK4GkUurUnp4EPB0+E5gEwbHEQS10aQUA1NmsEqNaA6p30ucMC8TIvej
         fjEKYCw0TFOYzuvwgoJD0wGpByAMVXGgdxf+OCDpt8LkdOUJfLjOmTutIpMu7W6cijk8
         Yfhp1QjhSNw/BTdg8BJoNSkJy9YWQLJxv5DgleMDQOch9hmNaKnuqc5iwqqDvxF2CBod
         nBQj7V7X279aWVuishEqNpPrAFz6oH6LYb6qovlLBszEa5TplWF8YHontVSOcTlaIuev
         LZQA==
X-Gm-Message-State: AFq9FYKkZBwElXRmlr8NkjKL/is1GFpKzRbA6di3um/QCRYlLIido1u3
	8aiHa0jcOP2ftj6+FQ3CPfL+M5Av3KCz5otETkPORijs7TtRbo2unHgYT9H7Og==
X-Gm-Gg: AYBFou0Xf9C5LHl7B5WuqL4k0aacKgmu6GEpdVOweDWJs+hxMZZiPKhbBQGKLngVyaC
	OFnHtb2qcLOJUGB8Ps3iOagbCl9nxZbF6J7Ezw6FJ66HkDoWkvoGEKAWN2U/10cOKLdD0sZdagM
	cwlMALrFYCFSXH2p74M9sT8+8iB8yrfCLIOZMFMs4xaC9lZqnN+NCKty7p2gFteMEa4IiMvlY7m
	AI2aD1F14htx9vTdmJP1+b8L7lnF2x9Tobg8DASVUYqqz94v8J+/V9zyArPLFFRzW+lXJnzEQr1
	pGu4YXU9TtYgQG0L2S6xEpo5WMA9/JHmxtE9XwbsmfO3O3FhwFS9jL6MggWMpavCnjOwCkVJVyp
	y95LjnxaP057r9PjLGx9KvN7g8yuCqLsXt9jd6rHVwSrTNnwZB3W3UqQb/lDoApFgE5YJVbJaNR
	16Ds80VwJaslJwaJxVrD9hoqRIm3MSnEqZAA3DbLbTpJAzV5QdRCWi2f1JTthNk3sa6b7diJuCf
	/pQ/WouOXmp9AHt2Dke9TMcb5RRR7j1zmDFZwbwlSV7rFbia3LaXrZyW/okTNwhGUixskYUFI88
	Ly+Vs7C6wmwpm7+CcfCrJHJTyZbljG8=
X-Received: by 2002:a05:7023:a4c:b0:166:5552:780a with SMTP id a92af1059eb24-190a4c2036bmr1919379c88.8.1792574998582;
        Wed, 21 Oct 2026 02:29:58 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:58 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][blacksail][PATCH 24/44] pjproject: patch CVE-2026-57160
Date: Wed, 21 Oct 2026 22:28:37 +1300
Message-ID: <20261021092857.3585453-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131211
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57160

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pjproject/pjproject/CVE-2026-57160.patch  | 42 +++++++++++++++++++
 .../pjproject/pjproject_2.17.bb               |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch
new file mode 100644
index 0000000000..a25ed5a28e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch
@@ -0,0 +1,42 @@
+From b14ebbccf5c228ca298ad11ecae2cedde792edae Mon Sep 17 00:00:00 2001
+From: Nanang Izzuddin <nanang@teluu.com>
+Date: Wed, 17 Jun 2026 15:43:46 +0700
+Subject: [PATCH] Merge commit from fork
+
+When printing a generic array header (e.g. Allow, Require, Supported,
+Unsupported), the ": " delimiter following the header name was written
+with two unchecked stores. copy_advance() only guarantees that the
+header name itself fits, leaving as little as one byte before the end
+of the buffer. The colon then consumed the last byte and the trailing
+space was written one byte past the buffer end.
+
+Use copy_advance_char_check() for both delimiter bytes, matching the
+boundary-checked pattern already used by every other header printer in
+this file.
+
+Co-Authored-By Claude Code
+
+(cherry picked from commit d6a0e7f76611c3a6f530ee051e3e7a622bb1748c)
+
+CVE: CVE-2026-57160
+Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/d6a0e7f76611c3a6f530ee051e3e7a622bb1748c]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ pjsip/src/pjsip/sip_msg.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pjsip/src/pjsip/sip_msg.c b/pjsip/src/pjsip/sip_msg.c
+index 06c8cce86..cdc99ff9e 100644
+--- a/pjsip/src/pjsip/sip_msg.c
++++ b/pjsip/src/pjsip/sip_msg.c
+@@ -964,8 +964,8 @@ static int pjsip_generic_array_hdr_print( pjsip_generic_array_hdr *hdr,
+                             &hdr->sname : &hdr->name;
+ 
+     copy_advance(p, (*hname));
+-    *p++ = ':';
+-    *p++ = ' ';
++    copy_advance_char_check(p, ':');
++    copy_advance_char_check(p, ' ');
+ 
+     if (hdr->count > 0) {
+         unsigned i;
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
index 59684ac7c7..254a2952a2 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/pjsip/pjproject.git;protocol=https;branch=master;tag=${PV} \
            file://0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility.patch \
+           file://CVE-2026-57160.patch \
            "
 SRCREV = "5a457451fa2712ba18e12b01738e8ff3af2b26fd"
 
