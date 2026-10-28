Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36192.1793161457762260591
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ibvccwaS;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a06b436dffso269041b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161457; x=1793766257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlkOVDlMpahwpojKxINx/myU6vsCVLw5aqsNGwAyzhA=;
        b=ibvccwaSgyDZrlTzrAgBZ7q/L3URl3fVKLeeve8s+a71SvO4iXtWUesa5AwvZpzKFI
         AgX5jWf9uP+yTdA/LRlLE8ezhUiOqUa0Ct/R04eWlpxLb61q+e5CMgDp7+72v118HiHc
         UumHmKR2KBnfN4azwy1RnNmUDqLXimcSYa8jIGLg1UG6azRO0uPMaqzQsw7qgyeYhAkw
         XAt+qJ20b6b4u3z9tZcarCQEU8gUpp9GpxjhS4YlJ69IcRPTO00hJZUTM+7r9l/CeJzO
         s/NLMHcWlos0+kW0lRXa3nXE0PpaQs4n70hAYsix/ebRzwQ3nMpwVmUCcfT1FvQ49lQ9
         SRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161457; x=1793766257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OlkOVDlMpahwpojKxINx/myU6vsCVLw5aqsNGwAyzhA=;
        b=DozGrL1vMHJns6DLZ8QJwqHspLaxS/H91jLZz0N6NgEaIxaMbDo1CSSvHxWj2czcbQ
         t4lz0Zv1+82AaVfgabnGolSAe4mJfJlxZtm5d4aQL7W1xyP6OTBF8rv+zhvoGbPEBxj7
         MddxUWswjSKP4RdNYiwDG1v8qAa/E2J53bGyG9qsCkcpC1+oyOOGTsm5ldnw2+RUAwdV
         1p+Lqe87YSJKyFbD5eoOf3ITfDakMlsYEoTX66xoCgcZuE97tvBu4i/+CxJA0LHriNtN
         h79kKKSsaPLJXFisSkMAjAR97tey3tCIkxKrrbxVOHoCURsr/88lATSfnekNpf2WaMUW
         yGDg==
X-Gm-Message-State: AFq9FYKEZn+/XH75ELPGJDCWZy+wKIUoJiy4SOBlG7Q+TGopA3WSflC3
	pUHTRKlJsjgiBFq4VKW5qTaQPNxL/cfY2n6jAq8eQEAAuCgq5kFv2e8aNDZDBw==
X-Gm-Gg: AYBFou34+YFUnk0R8flz1TfxlCainelGt4YxBK8rumhvyPQ0JSJc4KKDmInm6ha7oNO
	zKoR+4k5BwihulOw5ROJr53wyQ22d4d34Xsqka+H9iisg3a48XhLcBnmWoK8Jo5vqZP2IzmohI2
	VImxwzIoW9GguoCqlLKW8ym8RwwamIhnmoyGasPxeOIHML+ywG5aek/Ni0wbZgnq+mJMmkwSEJP
	Mo4Ybly7Dso6JRkvABqUb6Fw1IvHKhEu0CFyfyn2R3wNQxeFMF58Tf0nHdXqnhfNiKNN3cB6cdz
	j0mwtZZ/ZZl2xopifiGFM4bZv8b9vDniQucRs19phdOSQn8EMh5HEdxvoDYgVMcQpB7kR3cw9YV
	2LLZTZYuRxcW+7ypNjSGdHcimxpw1uve6usuMkEDvoSQtG7qSnb8uBLyrf60GOQh/o1+t36SSOt
	dKYfytZzmyVZO1VtwqQTfakKnpiRzV7Trc4THBeQ8snWp1Epg3Sm1Rig9XxHncRHFOYxImceXiT
	2FzmltJ9ZGA7/Y6yS9KmT5+TE+QgKsg7rRonzOU5VDe2vGNoN4RKXre2M3rxdphgHzVTDRJt2w0
	vNgdFw7l215uP3XNRqxvffPgRfAasmJjLzsa4cKbdOutS0RWRa8asUAv9o6mtw==
X-Received: by 2002:a17:90b:3c83:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3ae58324cc3mr805719a91.65.1793161457068;
        Tue, 27 Oct 2026 21:24:17 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:16 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 04/60] tinyproxy: patch CVE-2026-54388
Date: Wed, 28 Oct 2026 17:23:02 +1300
Message-ID: <fca616e1efd162d3465218dd0537d9a6ae4110b9.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131556
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-54388

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2026-54388.patch  | 32 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.3.bb             |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch
new file mode 100644
index 0000000000..4dc7f88310
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch
@@ -0,0 +1,32 @@
+From 2639058707dd9d199196b167823ba1865a60ea08 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Thu, 7 May 2026 16:39:48 +0000
+Subject: [PATCH] reqs: prevent multiple content-lengths getting emitted
+
+addressing point 2 of #609
+
+(cherry picked from commit 364cdb67e0ea00a8e4a7037e2693e0711e816adb)
+
+CVE: CVE-2026-54388
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/364cdb67e0ea00a8e4a7037e2693e0711e816adb]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/reqs.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index d5037cf..117d755 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -681,6 +681,11 @@ add_header_to_connection (pseudomap *hashofheaders, char *header, size_t len)
+         /* Calculate the new length of just the data */
+         len -= sep - header - 1;
+ 
++        /* prevent multiple content-length headers from being inserted */
++        if (!strcasecmp(header, "content-length") &&
++            pseudomap_find (hashofheaders, "content-length"))
++                return 0;
++
+         return pseudomap_append (hashofheaders, header, sep);
+ }
+ 
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
index 25df44301b..46d3a4d7c6 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://CVE-2026-31842.patch \
            file://CVE-2026-54387.patch \
            file://CVE-2026-55202.patch \
+           file://CVE-2026-54388.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"
