Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1489.1793731046690954400
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TxIYPGXm;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4981765eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731046; x=1794335846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CQMGDBBUx9y1Hw9WcmVXq9pFRko7pyUGxZKghOYO9Y=;
        b=TxIYPGXmT3ukx/OgwphG2VvsJDfhuNH4mIvI1kPnEyyAdqEiH0b60NVb47gmcSJQdO
         TCLiM8sqf9kYfUfvweFPwL1f8D3mc+WWvxAKSWE8768qXfxG8vfm3QCUaBUAzcdz517i
         hL/siBjgs0ZD7aoPTLEbBAVI3dpXgGvDmKqCYqtGd+k0GIYBLt4tHZKmyUf70pOdw26v
         Nta8pfqI0QJ+OTKLaph+ZeoEPN5ROi5NcDLwEM4pi8mo1+Fxut71yT5g6saQ2i3t7i5r
         Ar2ruvFsX0xPLjyG6kecwLjlDUhGjXfkDuHOk38px2vjHsCfbUpo5TqYglYC2WfHx6yo
         1j2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731046; x=1794335846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CQMGDBBUx9y1Hw9WcmVXq9pFRko7pyUGxZKghOYO9Y=;
        b=evIEa5Sl7cYPE9rsVrytxSnMJA0xWORz9VZFtleFPHBJWrOPGhVG8X1eWOlUydltK4
         tvuYsTdfr4I7YkBZ1NyrDCdOhi0L41h+dComrBZXYdMAfShvjYgzD2Nyeqye3Sy/gWTZ
         1LbZ8DVoeyi+3q1z/nAie4Ru5Ng338TwzIGPh9WEWO+uNGWhg4g2B7mbdJFoccxYEn6l
         EJ1sxmozEk/ka0MmlXe/eyHUE7buxTl+1hgQL9lzZ9pKMp/d0YV4mDpahccci6M4DpCp
         ErD2AqF8NPK7zwUTNYpPuA7ohUdB1/tBgI4fooyeXIkkNBTOWUH7yrKom7izaZA7pRb9
         /JqA==
X-Gm-Message-State: APuU4Z9pZJU6olNyqsWCp3g8HoiwDbjFxhp2xzM4JT9e1R9Fj6sRF2co
	w6dB0FQLG9jwBMYP9sfu6UiOsU5sbjeOQAXKxb/cKCUppK3O4bdv7ZUp9/i2WQ==
X-Gm-Gg: AYBFou1r1Jc+xt9dkDPK0fmTJNrKKN9MULs3DS1TgRvsXLk4e60hjebfiWr8bMwNnog
	L2VABIb+8j0ovlOzx6r3PAoN9izF7DTHfocbqmRTVWwLbkh326fGZCnHunOS93Vw09zfgLxC4Qy
	ENgyA9TUC5I+D0dX1lO69sipE/gvA8yeMkeXPYSnKNu3Voo6qJB7y3/61fa5HP5T3ycEpJNaLUa
	cAuzzU1LwewyXVY1IJf+tm1oZJO9IaBRCGjeN1lKmjVTgWe6lmYvyZJ4kdgwOl56ZsUtY211jnX
	S7i775uiUr/THXih3VPHds3EjGSyxTnLs6help/aOfBlowzvs0AGrJBcdtuJJFMnCL5vzG22H/y
	Qbj5EkPIo9Pp1PheSgltCcje/SQmxSk54KeiMIWYvKzntDwfmg6zmTPzf55BtxcozNSQpE0+Gan
	8aKQJQ9TREV+EtlHclJ7MigdV+AgcOku0C+H/OdjBqxdn1LiH4w4o8jSGoL99rlJszU2uvFfkwB
	wUByc5Yw86dpn4mxw+GfyEO8qdij6ExF+Z3gyvMD+XXskXKC/f8ZPGzUu3eRiUxKd9QZby4wARm
	azy9K9W8Hb7ZSs9bO5rOve9D38L403SfOAY90b9WPKrmsmjCIWc7EdqWRMB0A6ML
X-Received: by 2002:a05:701b:4208:10b0:1a3:116:848a with SMTP id a92af1059eb24-1ac5de5424dmr20381128c88.35.1793731045963;
        Tue, 03 Nov 2026 10:37:25 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:37:25 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 20/20] ndpi: patch CVE-2026-116744
Date: Wed,  4 Nov 2026 07:36:40 +1300
Message-ID: <20261103183640.919438-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131818
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-116744

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ntopng/files/CVE-2026-116744.patch        | 33 +++++++++++++++++++
 .../recipes-support/ntopng/ndpi_5.0.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch

diff --git a/meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch b/meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch
new file mode 100644
index 0000000000..5794963ada
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch
@@ -0,0 +1,33 @@
+From 00706d4da0b7a1f9eff61e5835a0a1cc22c9c7e1 Mon Sep 17 00:00:00 2001
+From: Ivan Nardi <12729895+IvanNardi@users.noreply.github.com>
+Date: Mon, 26 Oct 2026 17:35:39 +0100
+Subject: [PATCH] softEther: fix out-of-bounds read (#3298)
+
+Close: #3291
+
+Reported by HaiND (Nguyen Dinh Hai), Post and Telecommunication
+Institute of Technology, github.com/Haind03
+
+(cherry picked from commit ca9d819151606377ac53305583fe819748c69be2)
+
+CVE: CVE-2026-116744
+Upstream-Status: Backport [https://github.com/ntop/nDPI/commit/ca9d819151606377ac53305583fe819748c69be2]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/lib/protocols/softether.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/protocols/softether.c b/src/lib/protocols/softether.c
+index 379e743f7..c6f5d131e 100644
+--- a/src/lib/protocols/softether.c
++++ b/src/lib/protocols/softether.c
+@@ -200,7 +200,8 @@ static int dissect_softether_host_fqdn(struct ndpi_flow_struct *flow,
+   payload += value_siz;
+   payload_len -= value_siz;
+ 
+-  if(strncmp(val1.value.ptr.value_str, "host_name", value_siz) == 0)
++  if(val1.value_size > 0 &&
++     strncmp(val1.value.ptr.value_str, "host_name", value_siz) == 0)
+     got_hostname = 1;
+ 
+   for (; tuple_count > 0; --tuple_count) {
diff --git a/meta-networking/recipes-support/ntopng/ndpi_5.0.bb b/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
index 6eadf8ba62..80890b1f27 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 SRCREV = "375f99ef9fb4999d778b57bbeece171b3fa9fba6"
 SRC_URI = "git://github.com/ntop/nDPI.git;branch=5.0-stable;protocol=https;tag=${PV} \
            file://0001-configure-Stop-embedding-pwd-at-configure-time.patch \
+           file://CVE-2026-116744.patch \
           "
 
 inherit autotools pkgconfig
