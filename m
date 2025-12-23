Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A8FE6F086
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 17:49:35 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105723.1766512169633263223
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 09:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CIHb4AeO;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso34576675e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 09:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766512168; x=1767116968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0at+y+aZKFwtRJiuHHs3QcQQ/4CvyGBSY4QNCpyLQM=;
        b=CIHb4AeONC5TKFJ8aSKjsaqM55mXDq/3SIgWX9Vh6x2iL3IHoLPdoVUNMde7vaE5Pc
         mcYrExvlOHVZCR6HtWC47h9ld54bgAtTW/98CPP3NB14PevqoxGOJ7ttQdXbKIuBesmm
         QdaBEDCWwaJcpwFP4QavU7ZN+of7JVlsfxnHRT7qhQS0LpOByEQqPLvcuI1xFRdc3fGL
         OU42Je30QLXaoWEukHu6dRpvPZtgM8QnnXU+htfwwF6Rw+aF+PJabkQyhJwQ39gvJKTN
         3gxw+OxZs29PFIhR1C/XAZJCLqLUrV3UqlHO6ryr1a6jeTJs8RUmto330H7Zd85LvvP/
         ylVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766512168; x=1767116968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0at+y+aZKFwtRJiuHHs3QcQQ/4CvyGBSY4QNCpyLQM=;
        b=eECe5Ro2vpf0yEFuJKixTHGHKref8FeVUdlXf5HiYYYMqreJlTiF3s6GVpUkfFr4RH
         aNgp433IEPs8thmoEC7Pp+Dl/YRKDBGzXHcVVWUefegPbFKvaM7RjVGhz1udhxRi8Zxa
         NQR78p5i99OcLuq562fd/2zMxeFv99u7OvjMams0qQmlz1BU9F6f3ABn4/JbyCy5tQi+
         t6GkIfrT5Q0vvM1vuwKATDN5CAA1pJlEO15aZDGolvUflOb143+DOfdT1eHGxE+seTgR
         Lgt8AnHaiRm90gDTHb1rfJ9Wo88ScAEmiFPahjyzDS8ABn2qL/181CacNxJPLE8r3DZb
         g/vg==
X-Gm-Message-State: AOJu0Yxdq9pBRfpAtUVrGnA91Jz1FWJUsCCGV7BmFLPWv7KP3ZVXIFJ5
	hxO6fq5TaPYgKZeIWygSML/nOEE+WfjGymmAmJn4fZ9g7XldUYTWezwFshplzw==
X-Gm-Gg: AY/fxX4urz8+a9ZTTqkpmgxqYXABHUCpYaBQfs2dD7loQxFmwkr9yoNm/VEhYvLNu6y
	/e6naPEgAOGml+TYAawQChqLOROpEKf5PtPaNdq9qSCAJauSEAXS9K65/VlPRQeSNASi/Z/zHrR
	BS82iavKjufQyC0W2yDguYrr17F/LJ1e4VdZl3pddgQ0yRg8X2WbB7lZwyCxJwLREkXRuKV5eoS
	aSGdfq0ytY9MwSjb5dGWwlO23aY2EHLAC7nwtGTQLPjTfPXxzae4BNjpm9+gl8+EG/kIx9mC3Q6
	LecRypabPN0Pn46lY76Kq7TKASsINqfvswtv5Zf1FjTdOK7eFvRWYd/nEjwCj9yFC9z8k2PJFtM
	r7AGid0ygwfh6yJ5BcigWZ0Ea//3/y9dwXyjRqRX4k89hqoDf3zWbqtlkNIrUtBc7Vx35wR5ROY
	FmHsHQoZzW
X-Google-Smtp-Source: AGHT+IG6dZMJ57k0yT0WWU3ZklycSRry/Q6NZcfwFdUvSqVXRptxt7zOlRhyhieyjlFW3CPog5rjoA==
X-Received: by 2002:a5d:5f54:0:b0:431:907:f307 with SMTP id ffacd0b85a97d-4324e506ab1mr15325373f8f.48.1766512167713;
        Tue, 23 Dec 2025 09:49:27 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830f3sm28436823f8f.22.2025.12.23.09.49.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:49:27 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] tinyproxy: patch CVE-2025-63938
Date: Tue, 23 Dec 2025 18:49:25 +0100
Message-ID: <20251223174926.897953-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 17:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122840

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-63938

Pick the patch referenced by the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2025-63938.patch  | 43 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.2.bb             |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch
new file mode 100644
index 0000000000..e06e0d3eae
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch
@@ -0,0 +1,43 @@
+From cee659d2ac1e4e9d1ce388338f46df6c4bae8278 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Fri, 17 Oct 2025 22:57:39 +0000
+Subject: [PATCH] reqs: fix integer overflow in port number processing
+
+From: rofl0r <rofl0r@users.noreply.github.com>
+
+closes #586
+
+CVE: CVE-2025-63938
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/3c0fde94981b025271ffa1788ae425257841bf5a]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/reqs.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index a65ed54..1e5895c 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -174,7 +174,7 @@ static int strip_return_port (char *host)
+ {
+         char *ptr1;
+         char *ptr2;
+-        int port;
++        unsigned port;
+ 
+         ptr1 = strrchr (host, ':');
+         if (ptr1 == NULL)
+@@ -186,8 +186,11 @@ static int strip_return_port (char *host)
+                 return 0;
+ 
+         *ptr1++ = '\0';
+-        if (sscanf (ptr1, "%d", &port) != 1)    /* one conversion required */
+-                return 0;
++
++        port = atoi(ptr1);
++        /* check that port string is in the valid range 1-0xffff) */
++        if(strlen(ptr1) > 5 || (port & 0xffff0000)) return 0;
++
+         return port;
+ }
+ 
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb
index 5b8e9dcd7a..e386d39cdc 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb
@@ -7,6 +7,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://disable-documentation.patch \
            file://tinyproxy.service \
            file://tinyproxy.conf \
+           file://CVE-2025-63938.patch \
            "
 
 SRC_URI[sha256sum] = "2c8fe5496f2c642bfd189020504ab98d74b9edbafcdb94d9f108e157b5bdf96d"

