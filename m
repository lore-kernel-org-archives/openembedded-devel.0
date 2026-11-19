Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1911.1795113421110986484
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Mj1YXsqO;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so77868b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113420; x=1795718220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FD5hA5NP2EbYdBt0y7hYgcALI71h3eBJkyvRh2PiAq0=;
        b=Mj1YXsqO4cpjBlVxYInTWCNIOCfUUuzcS9ZHkSc0krVWi8S4vdJt/kgp0q3a5W2P3L
         j0+iv/q/UAlPTccy+k81N8fpa1BH2jfq8wB4Oi3+U+4d6WhTZcNiqziNq3zQEU6lr4FO
         OjzsmBY/vyJaYi4CLkbAFcYV/w7VjzQMTMnS0lwGZ7MiyrGrqKGnk5IrdrjVfcsHvR2m
         Vwv7u9RrH0TuEF4Wod/C7kdmTJkj4a/miMWLgjnLRbPa6WSL8BwrTL1oAsvCJ5sDVLpA
         xCEfEEU2tLnqC/ozUGm6U11LKX9C6SxwTcP7tDz93lUvqqZDNjQv38vcgAqk629xJkvX
         77kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113420; x=1795718220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FD5hA5NP2EbYdBt0y7hYgcALI71h3eBJkyvRh2PiAq0=;
        b=VQcs4Hb8EYwqc2iTDfCGPLT7FB2yYbz40ZToT84HwwnSC+ZMdGi/23IIoMHoA49kGy
         vqjeXvRz8kiCZZdgppnzllCkzyXorRwxCN7CvvkG/UgkSf9PAtKkhiXDJIJIj6YnK03T
         pvdePFpplJwpqJVdR/ii0prFBegA6ZbggrOrQ5TLiYX8OvdYoDJZxWuxgkrIs1k/4UQk
         /3zOQrV+EIAmR+7q6+ovI/GhBjTBJ12lVJTomm7vvNID+azh8W+a7bWCDgCq0a2jpCNd
         ZFoAis8vvZOqbQwtpaCDPrXsTmy7yuitqhVY/4DlZEf8PJnfkpV8kEiIbpLbH76kMPFQ
         fKSA==
X-Gm-Message-State: APuU4Z9DkA0OjkKOsP6u+/5zOKIhpxQj35IhcKT2Ol8vVj4NAHCqHhoK
	dfmMxW/XpZIg16TQh8XDDo1fJmxK6FN+rgvz/mxXj3Y/sni+7ebGxcp9r2cQaA==
X-Gm-Gg: AYBFou2nwKhZ5e207I6ivw8YwQnL0GYgXk0X+lo4A8nq67OXDPDekDEWXXOH/YqIi7K
	MJo6Aq4cFYW3A6S25lAdg5lOiVE/rZLZMU5eIP0GsOG7yAh5cKZznNGtyibJxxjPCy2LDV87Q7A
	j/jQ2sJROsf3DHFUZkDiuN0ZvvDJjLqI1kz1gObhFPPIlkF0dPs20bF37u0a1kIWjsQ7ldFXn1O
	YMGnMffbGCtDO8+qDyi3+2regBE54cgdunDK/M1v9LrOIu5cxWvjGTTsSRaImE6Zt2SMc+y9B7n
	wFcsSnKsqIbJ18lmq4KCMxUgQNMBACGyXrb5TqEtjIhCUtmL4YgwHO5q8p8zf1X+QMBTEixb5jZ
	AvK6d2/dBhNuzPLr3GtkF3/ThWuKFXrtBhXA5tIOzykvSDPTsNnG7rkgaf0gKWfAiobLXIGxuoI
	SrrxE4LFCUmK5bwWnyMvNmj7EGfD4Zyf23MSAuw3k1Oy8mv1Uxj9jbyEG2OJE3owD4UFRGjwJSx
	5ZesuDEM6xh1k5Lc3zbmejUStdY2FXJK7pMuHrfHicrrifYRVQZtVL5GmLX1tC7mnb+jbnRrUYZ
	wjF88vRsPWWaxr/OnXB1osRYRrHht5dfOY6PKUvjM3ppLQo7Zw9bMUVTiVYkGA==
X-Received: by 2002:a05:6a00:b42:b0:8b6:12fd:7271 with SMTP id d2e1a72fcca58-8c87c38846bmr481771b3a.25.1795113420369;
        Thu, 19 Nov 2026 10:37:00 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:00 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 25/64] hdf5: patch CVE-2026-120756
Date: Fri, 20 Nov 2026 07:32:53 +1300
Message-ID: <8048828662fa6782a395e98712a76ac01c0618e6.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132715
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-120756

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/CVE-2026-120756.patch          | 45 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch
new file mode 100644
index 0000000000..28bd658598
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch
@@ -0,0 +1,45 @@
+From 43855883c1ea10a072b7e7cf2dbc5a29ab411a8f Mon Sep 17 00:00:00 2001
+From: Nayyar <nayyar@bugqore.com>
+Date: Sat, 12 Sep 2026 16:37:49 +0530
+Subject: [PATCH] check object header message size after decoding its header
+ (#6589)
+
+(cherry picked from commit 10f1af5528168c5a71a58eba0b486e0677f3aaa3)
+
+CVE: CVE-2026-120756
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/10f1af5528168c5a71a58eba0b486e0677f3aaa3]
+
+Dropped changes to the test and CHANGELOG file.
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Ocache.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/H5Ocache.c b/src/H5Ocache.c
+index 8f0928f290e..9dc6a2e21bb 100644
+--- a/src/H5Ocache.c
++++ b/src/H5Ocache.c
+@@ -1270,9 +1270,6 @@ H5O__chunk_deserialize(H5O_t *oh, haddr_t addr, size_t chunk_size, const uint8_t
+         if (mesg_size != H5O_ALIGN_OH(oh, mesg_size))
+             HGOTO_ERROR(H5E_OHDR, H5E_CANTLOAD, FAIL, "message not aligned");
+ 
+-        if (H5_IS_BUFFER_OVERFLOW(chunk_image, mesg_size, p_end))
+-            HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, FAIL, "message size exceeds buffer end");
+-
+         /* Message flags */
+         if (H5_IS_BUFFER_OVERFLOW(chunk_image, 1, p_end))
+             HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, FAIL, "ran off end of input buffer while decoding");
+@@ -1305,6 +1302,13 @@ H5O__chunk_deserialize(H5O_t *oh, haddr_t addr, size_t chunk_size, const uint8_t
+             }
+         }
+ 
++        /* The message body starts after the message header, so its size can
++         * only be checked against the buffer once the whole header has been
++         * decoded
++         */
++        if (H5_IS_BUFFER_OVERFLOW(chunk_image, mesg_size, p_end))
++            HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, FAIL, "message size exceeds buffer end");
++
+         /* Increment count of null messages */
+         if (H5O_NULL_ID == id)
+             nullcnt++;
diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 2d5d134e01..390884e618 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-19023-CVE-2026-19024.patch \
            file://CVE-2026-120689.patch \
            file://CVE-2026-120754-CVE-2026-120755.patch \
+           file://CVE-2026-120756.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
