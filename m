Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D117C5DF6A
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 17:04:45 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17474.1786726390691617806
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 09:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Vb9nUNcW;
 spf=pass (domain: baylibre.com, ip: 209.85.219.45, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ee43b3e5abso7419986d6.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 09:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786726390; x=1787331190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XTEGUFrWPP3iU1r9eOo2BZz+wxJCYwwQMsxwdzG2vRs=;
        b=Vb9nUNcWkCpVCLVzNkQQq976v93Cm5RaUYDje2XiP7X2xRvPsGDxY0AVTo34X090w+
         NAUn6oTxCNwp58+y51a8kmtgHUXLZKz2nCeDyg04QHCQ6kHawuahZhi5847cvNc3tEUJ
         xOu0HGTwDFp8lpBiUTctvVg9f0NkkvkRktaSxddAzOWMpoyK/RliU6ae/S6k84nc9WV4
         wkLN/ojWrXAA5KBZ5g2GrRBVoeORzUzWEjr/sZwelvIgnHNdQt/fRxB6GMyaz8lllskr
         QfcF+f2kiGxVbyz6JZd1uhj98xM36BW7BHdFSNH9L1upcWk7H4eTvcYT/1vKH1HXPpew
         JFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726390; x=1787331190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XTEGUFrWPP3iU1r9eOo2BZz+wxJCYwwQMsxwdzG2vRs=;
        b=a57kNJE6qmQtQ19o1MsLI3/TT2hVZswcydUCKO+bX7AAN2hMowhKeR4D5x+h0WzCkh
         5VFH3EJVIxJ4juLztC4rbleiRyi4SHM5SzqNAsBOLXaXIrB6vsK4UOPV4LJ6TucHhAlK
         MDcsLA3nIfzYeChIIdFYmQwwt8g8lJjSGabGlOipRLOq9rYU0teqXIaOVrkTdkXH9JsR
         3AdziP88Te9rYNA3YwtOdavuo+yG9wP2R3SA4XbsfJUIahWYLp2ZlDyOAF/5ubF6YIxQ
         aMWhWPUIjfmNgkgYpBs8+sYV4T5sYZ2hJYh+siJKsrqdAt7oBLQ9z+w3Zdzky/RY/hFs
         rrkw==
X-Gm-Message-State: AOJu0Yzz8xQNaIs+WJ+ZaAsoYI7cfoxemlF+L2GF6lkPN0AplzROm7/v
	+tl7aunCvrxYe1KsBVtvuGE6D/qVTCTCffl7jpKouKGYrMaCi60WCGzuhCNTMFTpjuJEG+kGeDh
	uj85UeIY=
X-Gm-Gg: AR+sD12OweYzB9hCVZ6RfiBSMszSLr3aoo2CMvyhXWv2jj+Ud/op1UgzrmT5x0rlVnb
	ITWvqZyJky4nVGR7XpqQZCGhJTmsGqdfvfWizbAX4Hbsnx7bVs4JaeMrpSh2y6eJKYMfp+IZK4S
	La+gAtXA/4QrIU/NjNcD4CihR3XWxrDl3yjWdJ2LwGbqBoSbz+sN9HGQLOHgQQDEclekyHkgeV3
	Qh6/ca6PPT2B9shJOW9bR9vaCeTNnJw81PIxqCLnv5Zwon7j2CdHJwvg0xTQgsEk3fgOQlGGBei
	Kka63YFBvr5dnWaR8YLV/JG7uQq/tMz0eNUcaFzUkRu+a+StsxppqYnGCDX8JBoQJmkVygGeYn2
	ckngKktHL7i0MjQjSbbx4JMQzrCyJypuQh9kf/93OM7jkz6v/JfKRt/ILSRF1QMyZkPKeEDE4TF
	Evk3L5AQ7jwBJDipulRvYZD0mR+ejeWgs3j8K4Anm51om5hvtX+SK1TC+m+Ef55KU9
X-Received: by 2002:a05:6214:5182:b0:907:5150:a2dd with SMTP id 6a1803df08f44-90a91d4a872mr72006326d6.14.1786726389521;
        Fri, 14 Aug 2026 09:53:09 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a921e6f51sm23001936d6.8.2026.08.14.09.53.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 09:53:08 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 07/10] meta-multimedia: add bitbake-registry configs for nodistro, poky on master branch
Date: Fri, 14 Aug 2026 12:52:47 -0400
Message-ID: <20260814165250.590784-8-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814165250.590784-1-tgamblin@baylibre.com>
References: <20260814165250.590784-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 17:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129061

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../meta-multimedia-nodistro-master.conf.json | 58 +++++++++++++
 .../meta-multimedia-poky-master.conf.json     | 84 +++++++++++++++++++
 2 files changed, 142 insertions(+)
 create mode 100644 meta-multimedia/bitbake-registry/meta-multimedia-nodistro-master.conf.json
 create mode 100644 meta-multimedia/bitbake-registry/meta-multimedia-poky-master.conf.json

diff --git a/meta-multimedia/bitbake-registry/meta-multimedia-nodistro-master.conf.json b/meta-multimedia/bitbake-registry/meta-multimedia-nodistro-master.conf.json
new file mode 100644
index 0000000000..2fad86bd63
--- /dev/null
+++ b/meta-multimedia/bitbake-registry/meta-multimedia-nodistro-master.conf.json
@@ -0,0 +1,58 @@
+{
+    "description": "OpenEmbedded - 'nodistro' with meta-oe, meta-python and meta-multimedia layers",
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
+            "description": "OpenEmbedded 'nodistro', with the meta-oe, meta-python and meta-multimedia layers added",
+            "setup-dir-name": "meta-multimedia-nodistro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-openembedded/meta-oe",
+                "meta-openembedded/meta-python",
+                "meta-openembedded/meta-multimedia"
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
diff --git a/meta-multimedia/bitbake-registry/meta-multimedia-poky-master.conf.json b/meta-multimedia/bitbake-registry/meta-multimedia-poky-master.conf.json
new file mode 100644
index 0000000000..6b34e0d0b2
--- /dev/null
+++ b/meta-multimedia/bitbake-registry/meta-multimedia-poky-master.conf.json
@@ -0,0 +1,84 @@
+{
+    "description": "Poky - The Yocto Project testing distribution with meta-oe, meta-python and meta-multimedia layers",
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
+            "setup-dir-name": "meta-multimedia-$distro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-yocto/meta-yocto-bsp",
+                "meta-yocto/meta-poky",
+                "meta-openembedded/meta-oe",
+                "meta-openembedded/meta-python",
+                "meta-openembedded/meta-multimedia"
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
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe, meta-python and meta-multimedia layers added"
+            },
+            {
+                "name": "poky-with-sstate",
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe, meta-python and meta-multimedia layers added, and with internet sstate acceleration. Use with caution as it requires a completely robust local network with sufficient bandwidth.",
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


