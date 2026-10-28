Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36212.1793161526256650512
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=aYcvGx0k;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab41538192so433876a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161525; x=1793766325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Ia57Yt5XUYUZCmhKfVbWDfQ1WThh7M6NiDd4GdflPs=;
        b=aYcvGx0kwxeYjGcsGYX0iKjcePOfcNTNXasFfGGg8aaSdWstInMF6/kPQJPXQV1oOd
         1Tp4FNK5MHAStg35ex2JL6e6UAMOX6qe0aUHg9dV0FORF3qLkjhDODOIZ+tS5KnGwGq8
         khLBy6l2z+mQ63cxnE/FNcB5XFZTtSyuZg62ygmOK7BAx2sWtd5fOLluSIk+TyNtAvtq
         V2KlH22xbAyACSI1lFuEfF1qIISksLNmpeMEcc5eEz3/iHMprM4xtWNEobZgORgrbRiv
         o31KTQ31VpwJ5la3weCQhh4j7fxsPxCnfLrlGW4p18Bb8C1ZqdjFpYdNOVbujswnDHFA
         iDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161525; x=1793766325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Ia57Yt5XUYUZCmhKfVbWDfQ1WThh7M6NiDd4GdflPs=;
        b=sUuMb0BtY3IGfa8JG5EJhG49sDH5jBVnr+VvknCFIPA/i6jny5Iv6WYWM22i/WpCAx
         URGWLDsaDys6Doq8cQauNr06NpsyJhzthsnT0Ryl2vOC4u+lOPhb2RAYHafJjKfD6rCM
         XHmcgC7JTbKnIba1JTLZ1SV2B5j4EDHzKrSJOk88ZYfDl0N7CE0F51IRnFNFmFdqvDSt
         GFb01mpqyauyyPcfT4pkaUBMHl6FTHGorLfuCe0UlV0tPDsLVp6feT+Q1wQBWf4f8R5d
         nUUXj8ssmaecc3bGi9DKpIedBwAk0pno7EHXRiV8Ea6S6D2PXlU9ZwSBljuz75YU/i5z
         crww==
X-Gm-Message-State: AFq9FYKgft2p2vxSeabQFNfsCyeL8uJwewuwxg41wHOSLWsEyplHjvm2
	ZoSylLwWPoS2G5AHNH00+lDm8/+pqKeZaOuBnkUfVh6HCGVEBfFZAC8ID+RIhQ==
X-Gm-Gg: AYBFou3+yzRiZ11H6cDttj4gn1GfJDCLI7gR21tmaAsbuxN0e9jrgerWTdLlsqHA8CJ
	cEnlCFmUduSyxBJjZD1pcxBiljAV4htOvE+AG31hUST28I7T3K8+KoP4ezVByJeHGDoOQ2pZNJg
	73FEtw2EvJ/ga2k6Vdq+5x3vbAkg1PEE2AjdnDKStkXf8umGJfGZcaIdn1fue4cwAJSjHjQjHPM
	d85sxIBs9VlSZSshBmj6/svRmRC8ynvrKAR/EYlOb0nVgEKj9dBkBB3W38MPk4r/gR3DuLbaeb/
	snJFCJFLyjWZv9paCTffOu3mWf9/g9Az6aMN149tkHkLZ4Rx5eARD1Kd12UBkljMwG80sdIsl6k
	gc1oesxdnqfx/Yhxxdwjp6lzjB91sdFR6U7E8CLyC3bUEUYbC/LyVoAYjbBRprnjEuduZR2LxVd
	7cRocZUgxF8uE/qK+NqIgyDEpI5kJVROcU71qTBsq0zC/H7u9GJ2FUJwf0zt9UxK3+eFdP+kVS1
	600KXdUQnuiaB+Zf1xYCO2gHUn8dKSgQfqEgI/Mw0G6d4oL+zhDMR14l6QRJlbfW0epY55xM+LL
	Oj+u1LRtjt8v7itAv7tnw/JdmBNYNBI4upLEC15icjqvBurSNtRt0YrJM+gwfw==
X-Received: by 2002:a17:90b:3c8c:b0:3a4:ca46:8d44 with SMTP id 98e67ed59e1d1-3ae5819e58emr890255a91.18.1793161525569;
        Tue, 27 Oct 2026 21:25:25 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 34/60] nmap: patch CVE-2026-72712
Date: Wed, 28 Oct 2026 17:23:32 +1300
Message-ID: <406da4cb702d021602a2088b8259bf68870691c6.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131586
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-72712

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nmap/files/CVE-2026-72712.patch           | 46 +++++++++++++++++++
 meta-oe/recipes-security/nmap/nmap_7.99.bb    |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-security/nmap/files/CVE-2026-72712.patch

diff --git a/meta-oe/recipes-security/nmap/files/CVE-2026-72712.patch b/meta-oe/recipes-security/nmap/files/CVE-2026-72712.patch
new file mode 100644
index 0000000000..f5e81aac0e
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/files/CVE-2026-72712.patch
@@ -0,0 +1,46 @@
+From 120d13b8aca52ec306e50eae9a74fb1bfe49540a Mon Sep 17 00:00:00 2001
+From: dmiller <dmiller@e0a8ed71-7df4-0310-8962-fdc924857419>
+Date: Thu, 11 Jun 2026 18:31:31 +0000
+Subject: [PATCH] Stop parsing on a zero-length packet option
+
+Fixes #3368. Closes #3373.
+
+(cherry picked from commit 7ef4ee030a0023fe22616387a000032e1a678b6a)
+
+CVE: CVE-2026-72712
+Upstream-Status: Backport [https://github.com/nmap/nmap/commit/7ef4ee030a0023fe22616387a000032e1a678b6a]
+
+Dropped changes to the CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ nselib/packet.lua | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/nselib/packet.lua b/nselib/packet.lua
+index ec6db40a2..e17972d88 100644
+--- a/nselib/packet.lua
++++ b/nselib/packet.lua
+@@ -686,10 +686,7 @@ function Packet:parse_options(offset, length)
+   local opt_ptr = 0
+   while opt_ptr < length do
+     local t, l, d
+-    options[op] = {}
+-
+     t = self:u8(offset + opt_ptr)
+-    options[op].type = t
+     if t==0 or t==1 then
+       l = 1
+       d = nil
+@@ -699,6 +696,11 @@ function Packet:parse_options(offset, length)
+         d = self:raw(offset + opt_ptr + 2, l-2)
+       end
+     end
++    if l==0 then
++      break
++    end
++    options[op] = {}
++    options[op].type = t
+     options[op].len  = l
+     options[op].data = d
+     opt_ptr = opt_ptr + l
diff --git a/meta-oe/recipes-security/nmap/nmap_7.99.bb b/meta-oe/recipes-security/nmap/nmap_7.99.bb
index 515623d63d..0cbef990cb 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.99.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.99.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
            file://0001-fix-racing-between-build-ncat-and-build-lua.patch \
            file://0004-libdnet-fix-PF_PACKET-conftest-nested-function.patch \
            file://CVE-2026-58058.patch \
+           file://CVE-2026-72712.patch \
            "
 SRC_URI[sha256sum] = "df512492ffd108e53a27a06f26d8635bbe89e0e569455dc8ffef058c035d51b2"
 
