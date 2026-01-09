Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB52D1D48A
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:29:06 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6696.1767950943786100637
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 01:29:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a7LHJoyy;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0d67f1877so33947205ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 01:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767950943; x=1768555743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqfqw5OiQYH8z/Gcn/71tBo09CdJ2zUfQQPQAlo6DBQ=;
        b=a7LHJoyyKeyHBiNZNnzME3HQx5PRB0sEnNw+M8IJwGA1by817iUm5Kbx0/xWvX2KmH
         sZ999qaDVcxKBH2z+i1iSdSLYr7zmvBQ7TeJfrhZ+bVU/FSbC4fssRuaSQilxu7AqRGw
         Dh4adc2J7QOSyloJV26Pkcc+zyAEeUUcttp1PNjCT1FB8nnj8gmudmbq/hFEf7+AuhSI
         VNm6TqMmy7FNIj/hs6vA8CawuUFmxiNxa9e4vaSAdZh7+NoMnqQvTKkhVM04zFwrFLWz
         /4KWkjNlBhBpgdWuKztrrxQyPkN5nbj80Qs4AZBj4uzF8AJv53Ibp6oPHs/iicFuonbN
         R4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950943; x=1768555743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tqfqw5OiQYH8z/Gcn/71tBo09CdJ2zUfQQPQAlo6DBQ=;
        b=ibv6Z/R1IqiFDd8Sjg+wI05w/qzexU+IWbM1irwyBtVByhjERn0NRM1tj9yZjj0nJz
         N/KcNYQ2TzVQCjWJwqrUeB7MrcGJC3jrkXtuuQc3dbHgcQMvvU0CHmgtAud4AswNFPNb
         5hxwUCKQWOjJ3J6oKlfjBuqIMNbNXKFbiEUAugIY5OpsSAlHZTX51a1zGXpi2l+PXSAz
         qaEnEkhOXltQRMDO4Jhov9Gxjqcyst+j4ns5ZyJI+/l5Bda0vM7x1F4dfYxmLUatwsqj
         XjI3KNtoyF4YB5obh4b1QgZ6P+tfuyXQt5EZ6YsUojKK8kVgH93Arx6KedR7Nw/+j+7h
         8Jkw==
X-Gm-Message-State: AOJu0YwPA1g99aLOExF8pxiDKPId81oGLeQZniF/X7NE6lmKb0iXI0mN
	RFzwVE9Lv1uZsmHgFbDrVy4ceFgDm7zxIMiUF/tUuUTYwZdWuPHX/KqR6gdokg==
X-Gm-Gg: AY/fxX6VdOxUoiZaMCBE0VXqFlcyhPtlfBDljBKmU9APXDWbb9aILE5LcqXA1Hx6Ji9
	t1BcbYJdzLjoJeTyM/33Xxxcz7Cz8GpXcwT3nKlN1YgyGfpZLHPzoziIULJHKmb1GkUxSR3m2OH
	LkCeFNRVDuTmhIY00xc30GzRD0VOqQ3CQJStI+p9o7fLAR4IGor8uHWfrCmL412Qx8Y6OOGEGPB
	c4SVLHj4z2W+VHJM4RrpCoM5oZiYAfUaljAHhIbRn8QHaEMJKi25TIBOWuW8JkRSNCQhI/G+/iM
	h8ODepJB3uqRaqLpGOGHyX91QEBpXp7cBlauSvGTsUXKMULdgEck5NorXet8ivNfUsTp1e6sONM
	1ZldkH/0MMlP6K5odSrBmsIk4+o3I4U1GM/Lt6cpp1ot4ytoczW+J+9F5fkUrzETfAJonLsss1D
	5IZCEm7Cxj5YvIKXUUsKAs/Yo=
X-Google-Smtp-Source: AGHT+IHDMqt8OgaLyQb9qPu3QC+/GFtvCyhh0KyY9bV/RCRjF62bumUkxPGlmNAwABUqOugcVhKMFA==
X-Received: by 2002:a17:902:e888:b0:2a0:e223:f6e6 with SMTP id d9443c01a7336-2a3ee4cb047mr92850965ad.46.1767950942942;
        Fri, 09 Jan 2026 01:29:02 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm99529295ad.75.2026.01.09.01.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:29:02 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 05/12] libcoap: patch CVE-2025-34468
Date: Fri,  9 Jan 2026 22:28:35 +1300
Message-ID: <20260109092843.1924568-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
References: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 09:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123283

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-34468

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libcoap/libcoap/CVE-2025-34468.patch      | 127 ++++++++++++++++++
 .../recipes-devtools/libcoap/libcoap_4.3.4.bb |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/CVE-2025-34468.patch

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2025-34468.patch b/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2025-34468.patch
new file mode 100644
index 0000000000..9aee64c3c2
--- /dev/null
+++ b/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2025-34468.patch
@@ -0,0 +1,127 @@
+From f191ae30013c205a350cd897fe24d56dde2e593a Mon Sep 17 00:00:00 2001
+From: Jon Shallow <supjps-libcoap@jpshallow.com>
+Date: Fri, 12 Sep 2025 10:07:41 +0100
+Subject: [PATCH] coap_address.c: Validate length of provided host name
+
+Host names larger than 255 bytes will cause an internal buffer overflow.
+
+Hostnames provided to coap_resolve_address_info() now have their length validated.
+
+Discovered by SecMate (https://secmate.dev).
+
+Sanity check host lengths when parsing a CoAP URI when using the coap_split_uri()
+function.
+
+CVE: CVE-2025-34468
+Upstream-Status: Backport [https://github.com/obgm/libcoap/commit/30db3ea]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ examples/coap-client.c | 11 ++++++-----
+ src/coap_address.c     |  9 +++++++--
+ src/coap_uri.c         | 20 +++++++++++++++++++-
+ 3 files changed, 32 insertions(+), 8 deletions(-)
+
+diff --git a/examples/coap-client.c b/examples/coap-client.c
+index 18b6777f..8512fbbd 100644
+--- a/examples/coap-client.c
++++ b/examples/coap-client.c
+@@ -822,6 +822,12 @@ cmdline_oscore(char *arg) {
+ static int
+ cmdline_uri(char *arg) {
+ 
++  /* Sanity check the provided (Proxy)Uri */
++  if (coap_split_uri((unsigned char *)arg, strlen(arg), &uri) < 0) {
++    coap_log_err("invalid CoAP URI '%s'\n", arg);
++    return -1;
++  }
++
+   if (!proxy_scheme_option && proxy.host.length) {
+     /* create Proxy-Uri from argument */
+     size_t len = strlen(arg);
+@@ -836,11 +842,6 @@ cmdline_uri(char *arg) {
+                                          (unsigned char *)arg));
+ 
+   } else {      /* split arg into Uri-* options */
+-    if (coap_split_uri((unsigned char *)arg, strlen(arg), &uri) < 0) {
+-      coap_log_err("invalid CoAP URI\n");
+-      return -1;
+-    }
+-
+     /* Need to special case use of reliable */
+     if (uri.scheme == COAP_URI_SCHEME_COAPS && reliable) {
+       if (!coap_tls_is_supported()) {
+diff --git a/src/coap_address.c b/src/coap_address.c
+index 2dabb366..6cd55ba5 100644
+--- a/src/coap_address.c
++++ b/src/coap_address.c
+@@ -469,10 +469,15 @@ coap_resolve_address_info(const coap_str_const_t *address,
+ #endif /* COAP_AF_UNIX_SUPPORT */
+ 
+   memset(addrstr, 0, sizeof(addrstr));
+-  if (address && address->length)
++  if (address && address->length) {
++    if (address->length >= sizeof(addrstr)) {
++      coap_log_warn("Host name too long (%zu > 255)\n", address->length);
++      return NULL;
++    }
+     memcpy(addrstr, address->s, address->length);
+-  else
++  } else {
+     memcpy(addrstr, "localhost", 9);
++  }
+ 
+   memset((char *)&hints, 0, sizeof(hints));
+   hints.ai_socktype = 0;
+diff --git a/src/coap_uri.c b/src/coap_uri.c
+index 6f658730..f2360ceb 100644
+--- a/src/coap_uri.c
++++ b/src/coap_uri.c
+@@ -59,6 +59,15 @@ coap_uri_info_t coap_uri_scheme[COAP_URI_SCHEME_LAST] = {
+   { "coaps+ws",    443,               0, COAP_URI_SCHEME_COAPS_WS }
+ };
+ 
++/*
++ * Returns  0 All OK
++ *         -1 Insufficient / Invalid parameters
++ *         -2 No '://'
++ *         -3 Ipv6 definition error or no host defined after scheme://
++ *         -4 Invalid port value
++ *         -5 Port defined for Unix domain
++ *         -6 Hostname > 255 chars
++ */
+ static int
+ coap_split_uri_sub(const uint8_t *str_var,
+                    size_t len,
+@@ -165,8 +174,10 @@ coap_split_uri_sub(const uint8_t *str_var,
+   if (len && *p == '[') {
+     /* IPv6 address reference */
+     ++p;
++    ++q;
++    --len;
+ 
+-    while (len && *q != ']') {
++    while (len && *q != ']' && (isxdigit(*q) || *q == ':')) {
+       ++q;
+       --len;
+     }
+@@ -197,6 +208,12 @@ coap_split_uri_sub(const uint8_t *str_var,
+       goto error;
+     }
+ 
++    if ((int)(q - p) > 255) {
++      coap_log_warn("Host name length too long (%d > 255)\n", (int)(q - p));
++      res = -6;
++      goto error;
++    }
++
+     COAP_SET_STR(&uri->host, q - p, p);
+   }
+ 
+@@ -222,6 +239,7 @@ coap_split_uri_sub(const uint8_t *str_var,
+ 
+       /* check if port number is in allowed range */
+       if (uri_port > UINT16_MAX) {
++        coap_log_warn("Port number too big (%ld > 65535)\n", uri_port);
+         res = -4;
+         goto error;
+       }
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
index da0cf50f92..efea6d24f8 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/obgm/libcoap.git;branch=main;protocol=https \
            file://CVE-2024-0962.patch \
            file://CVE-2024-31031.patch \
            file://CVE-2025-59391.patch \
+           file://CVE-2025-34468.patch \
            "
 SRCREV = "5fd2f89ef068214130e5d60b7087ef48711fa615"
 

