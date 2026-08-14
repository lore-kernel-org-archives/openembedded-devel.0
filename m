Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57D2C5DF6E
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 17:04:45 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17295.1786726380864187874
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 09:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=iuLRgCX5;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9309d4ea213so97822885a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 09:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786726380; x=1787331180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RY1h0bV3JKXLqQTrkbwgIapAGfRbYXW8vm/kC4sa8EA=;
        b=iuLRgCX5g62BkvDrrQ8glKjogqJvdAIl5Ynj4LqQ9Pl2e/Szv/vqBojNazeQwwWH8f
         ABaIdpp2YeOf0O6fCUYcMa2af2a28hMtI6o/NdKgP7FE1LNx+cRJKBtZd3MpKhQIgWIM
         0IGo9MlEfupV2Tl5hrZ65pgo+VYRV5SwE1n51EZZQ5BNvY/uuz8/LkPq1qjrtUr8NjJO
         jqxTdZc4Z1pKc9q/PRPV5ERQKnqA1ziBPh+WiR1pYiiiA4DY7EJ2ne+Ic69/qnVUurNw
         HtuFRwaqYanvistCF/nnOZACm7oJ0paTsBPd6oILxz5gT26J+VjXJfwf6vuV1IA7I3Zy
         bBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726380; x=1787331180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RY1h0bV3JKXLqQTrkbwgIapAGfRbYXW8vm/kC4sa8EA=;
        b=nc/vdVTdOigxJpH5kgqhw07zMnQJFDJdujac8TCvRcp84InX3xlZP/zFlmQwvO94p0
         ibzbrt2D/+28DEi9XwiUJKeQTdJUT8eiIC2FXMclH/kFa72dnSUbOFOGSwIquHrlVazN
         Utd6pIKpHlPOOJRnUqJ6pBJyz87Iy69N3OBwTh1iwzo4t4IRQEcH2QZmiaAFztOWYPhr
         gfqqi2IvqVb3W/y0CNGpeqeyMAGRxAEUNhl7RVBj4qJkqmZnsizf9XCDPJ5iHbPENnVS
         2/gQ6dkfW3WgoWkRJYHD7tKCJh2ZiuWl6lfmQtOZqnRh7xU70l6dN7eSQthXa3Ppralf
         L5qQ==
X-Gm-Message-State: AOJu0YwRBPjLu652nOmw8vFM8IFnMrTOblviBq75JEjlY7tOnuwqCw73
	mo0X67TvLQ/n6AQZpQnF3AkQcawyErsMdca8Pi5EgmoSYrJiNoqtzI+W3teM4MH6hdGchvV7NoS
	vEOdq+rQ=
X-Gm-Gg: AR+sD12zEp4lyEGLPG6MzBbq+N1PHiKIWCSrM7SpAEM8Wd3Tt9gzv+1Wc4Y6LIzO3Wz
	YpzfsFKjgQtGwK7cgmyTUUyk228cjxBbna4rbs9T0IJuznaYS+uk2K4nvRFaLuvIvp189D961y4
	PFkaGmJyDugcj0hMz0tp2CZYwnxpM1gpCltryYhFen+z0/5FC6LfQyKBzKeEB2TqOaBUf3FHk02
	B8cnGDxHCGGFTWYLMNOXZeSHpZqGmp3vEJHFWaTAv4tKr/VBEt9+pD1ZHG7NYZ+2xzEMNaff0QJ
	uJt2OD0jCwow9Qkb401PeLFCRT7JHs1x5ZgRWuTrKVkgGpxXggnAO/3xx3hXsryC5u06kku6QT4
	zK3/BUz1liloucFNOzSoxd54hzo83CDdDTbv6y0ewjE80fZD06Ml/+/aNsnDvJzNdr3w2BYmks6
	qxm7FWL/LrbbxJJ2ymesLOg4+eeDxEUpew2WRPXyxPT8eEAPsKcyune/co0Dlj3a9unl3Fbp6U2
	5w=
X-Received: by 2002:a05:620a:1b91:b0:92e:694a:77b1 with SMTP id af79cd13be357-936d1fd6723mr835982785a.4.1786726379611;
        Fri, 14 Aug 2026 09:52:59 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936ce1e40e2sm315167585a.26.2026.08.14.09.52.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 09:52:58 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][PATCH 03/10] meta-initramfs: add bitbake-registry configs for nodistro, poky on master branch
Date: Fri, 14 Aug 2026 12:52:43 -0400
Message-ID: <20260814165250.590784-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814165250.590784-1-tgamblin@baylibre.com>
References: <20260814165250.590784-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 17:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129057

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../meta-initramfs-nodistro-master.conf.json  | 56 +++++++++++++
 .../meta-initramfs-poky-master.conf.json      | 82 +++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 meta-initramfs/bitbake-registry/meta-initramfs-nodistro-master.conf.json
 create mode 100644 meta-initramfs/bitbake-registry/meta-initramfs-poky-master.conf.json

diff --git a/meta-initramfs/bitbake-registry/meta-initramfs-nodistro-master.conf.json b/meta-initramfs/bitbake-registry/meta-initramfs-nodistro-master.conf.json
new file mode 100644
index 0000000000..bfd867c365
--- /dev/null
+++ b/meta-initramfs/bitbake-registry/meta-initramfs-nodistro-master.conf.json
@@ -0,0 +1,56 @@
+{
+    "description": "OpenEmbedded - 'nodistro' with meta-initramfs layer",
+    "sources": {
+        "bitbake": {
+            "git-remote": {
+                "uri": "https://git.openembedded.org/bitbake",
+                "branch": "master",
+                "rev": "master"
+            }
+        },
+        "openembedded-core": {
+            "git-remote": {
+                "uri": "https://git.openembedded.org/openembedded-core",
+                "branch": "master",
+                "rev": "master"
+            }
+        },
+        "meta-openembedded": {
+            "git-remote": {
+                "uri": "https://git.openembedded.org/meta-openembedded",
+                "branch": "master",
+                "rev": "master"
+            }
+        },
+        "yocto-docs": {
+            "git-remote": {
+                "uri": "https://git.yoctoproject.org/yocto-docs",
+                "branch": "master",
+                "rev": "master"
+            }
+        }
+    },
+    "bitbake-setup": {
+        "configurations": [
+        {
+            "name": "nodistro",
+            "description": "OpenEmbedded 'nodistro', with the meta-initramfs layer added",
+            "setup-dir-name": "meta-initramfs-nodistro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-openembedded/meta-initramfs"
+            ],
+            "oe-fragments-one-of": {
+                "machine": {
+                    "description": "Target machines",
+                    "options" : [
+                        { "name": "machine/qemux86-64", "description": "x86-64 system on QEMU" },
+                        { "name": "machine/qemuarm64", "description": "ARMv8 system on QEMU" },
+                        { "name": "machine/qemuriscv64", "description": "RISC-V system on QEMU" }
+                    ]
+                }
+            }
+        }
+        ]
+    },
+    "version": "1.0"
+}
diff --git a/meta-initramfs/bitbake-registry/meta-initramfs-poky-master.conf.json b/meta-initramfs/bitbake-registry/meta-initramfs-poky-master.conf.json
new file mode 100644
index 0000000000..1dbdc3fc34
--- /dev/null
+++ b/meta-initramfs/bitbake-registry/meta-initramfs-poky-master.conf.json
@@ -0,0 +1,82 @@
+{
+    "description": "Poky - The Yocto Project testing distribution with meta-initramfs layer",
+    "sources": {
+        "bitbake": {
+            "git-remote": {
+                "uri": "https://git.openembedded.org/bitbake",
+                "branch": "master",
+                "rev": "master"
+            }
+        },
+        "openembedded-core": {
+            "git-remote": {
+                "uri": "https://git.openembedded.org/openembedded-core",
+                "branch": "master",
+                "rev": "master"
+            }
+        },
+        "meta-yocto": {
+            "git-remote": {
+                "uri": "https://git.yoctoproject.org/meta-yocto",
+                "branch": "master",
+                "rev": "master"
+            }
+        },
+        "meta-openembedded": {
+            "git-remote": {
+                "uri": "https://git.openembedded.org/meta-openembedded",
+                "branch": "master",
+                "rev": "master"
+            }
+        },
+        "yocto-docs": {
+            "git-remote": {
+                "uri": "https://git.yoctoproject.org/yocto-docs",
+                "branch": "master",
+                "rev": "master"
+            }
+        }
+    },
+    "bitbake-setup": {
+        "configurations": [
+        {
+            "setup-dir-name": "meta-initramfs-$distro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-yocto/meta-yocto-bsp",
+                "meta-yocto/meta-poky",
+                "meta-openembedded/meta-initramfs"
+            ],
+            "oe-fragments-one-of": {
+                "machine": {
+                    "description": "Target machines",
+                    "options" : [
+                        { "name": "machine/qemux86-64", "description": "x86-64 system on QEMU" },
+                        { "name": "machine/qemuarm64", "description": "ARMv8 system on QEMU" },
+                        { "name": "machine/qemuriscv64", "description": "RISC-V system on QEMU" }
+                    ]
+                },
+                "distro": {
+                    "description": "Target distributions",
+                    "options" : [
+                        { "name": "distro/poky", "description": "Yocto Project Reference Distro" },
+                        { "name": "distro/poky-altcfg", "description": "Poky alternative with systemd as init manager" },
+                        { "name": "distro/poky-tiny", "description": "Poky alternative optimized for size" }
+                    ]
+                }
+            },
+            "configurations": [
+            {
+                "name": "poky",
+                "description": "Poky - The Yocto Project testing distribution, with the meta-initramfs layer added"
+            },
+            {
+                "name": "poky-with-sstate",
+                "description": "Poky - The Yocto Project testing distribution, with the meta-initramfs layer added, and with internet sstate acceleration. Use with caution as it requires a completely robust local network with sufficient bandwidth.",
+                "oe-fragments": ["core/yocto/sstate-mirror-cdn"]
+            }
+            ]
+        }
+        ]
+    },
+    "version": "1.0"
+}
-- 
2.55.0


