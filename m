Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451EEC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 17:04:45 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17476.1786726393289160649
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 09:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=hKX8blqM;
 spf=pass (domain: baylibre.com, ip: 209.85.219.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90898faf46dso5800516d6.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 09:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786726392; x=1787331192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1m6N0PbDekmg8EMaYZx7SnYmI/hdwWEgUC49fFE9MIA=;
        b=hKX8blqM6Qho69gAq3cHiOx9IWlu9zLTpXD+ZEFA+JZdsC1AuCIXhk1uy/waX64uuk
         kli68YrcCz5sv2O9BvgCRvDIrvQohUXuYPgFWA8vmMS2RKDtiHzMKNF89DwRLktwqwKT
         IqfLrrCAlXLMWJfx1Hpz19DKRmoY87i52DqzFKlNwweHNACa9brho3eyu3LFsIJvh/7B
         QJ56sMr5AHAgru1g+Uws4TmrWZqAMaF45XNjkcCYbfRkQZspnQRPRWSYFS0Ow58ZetOl
         NuIbHi3Z9UGCmLoJw1dkwlmZL4fpAIV3gm80LR0wM4qgeQP5a5m6vuU1wUZfyB8iULFy
         UoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726392; x=1787331192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1m6N0PbDekmg8EMaYZx7SnYmI/hdwWEgUC49fFE9MIA=;
        b=Sj+u3Eb37R+ZuIPMtJswOl3JHnrSxVLpEUJFRnIMgDz1ENHzJj5WkSJ3DanRyreyBe
         AWBx7HcRsvM8h2bMpJbZlddfthI5RXe3yXiwyD6xCK6cK1e48bLSXSCWUKXtfDFFcIE1
         8pV6Sw0AZrl66mriOnk+fo0s7r6mgQL0bZCu4Pbnxsvm0HHTxaekxZt1nXqvq9Fx6YZ9
         +X9hxies2z1YXkuB3iFB8JjEGJp6eVkZo1CraGnCo/kbMO9SC2xwiRpNz7KQxd0Sjo+R
         SOnM7e75RquPynFqjafComh6vadpW9WZKqvnR25WxbjfLETbaPh8Xfo5zsmO8vr418lX
         /XQA==
X-Gm-Message-State: AOJu0YwXKCBjRIodJbkUEpZw4Jmb3EzD5taNBcZQuQZBWL8/vxaWYOHy
	63ArwkLe8JXnO8x6KJRsyCdOpwThPcjvekDsnMYxqF0PQWMDsh9iS/UqRj5TeZKsXAGpcNa6FEb
	n1M4xgNw=
X-Gm-Gg: AR+sD11Hcdi+toYfKXsI88MyeAyhcubBijJD+DueRebPtBYlvEhshAmjAX3qH4zSWdq
	vT6sHwdgcC1ymMPU3AjuvmUFhf5rnOIVT43CgWA48F9CAs/qaUUCeKpfgoE4Q+TJ7cPOJP1lbzU
	eXRlLG/bBlQ8bd2BTQrYasR6NvI/mmQlgfz0RZWuTEWHc7dH+N2d9hd9oU2KjP6rNyZb86GZheT
	hO65jXJdXYMrh/XMZc5apcsmZVHeuj0IOnpf5MWOxhFgKnIRSLENT1ZfXVHDmhTPvLWFLVvddZZ
	RVhWBF2Yyz4+50g6dYbEQOI8kYFxMGnX2lc9Q2Qx6UPCeJaqpy4ZwqLAf+1QZT0rUvsyjyGCCWg
	p1GWUNcRUkf0aRPhjeO3NkkHLscWXi8hu9rmRKdFQ3m+0yJI3K9HIetS3dhhDv3y9+sbj1uUDaz
	kqov+YUeWYqbcQjMUlWJwn3Mj5aOCSGaaHmaLJGcWGa4KM5Wnwfr2rpHYesT3pTuL6
X-Received: by 2002:a05:6214:226c:b0:907:5451:8954 with SMTP id 6a1803df08f44-90a91d62a65mr77054846d6.16.1786726392103;
        Fri, 14 Aug 2026 09:53:12 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a92204da9sm23076196d6.17.2026.08.14.09.53.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 09:53:10 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 08/10] meta-perl: add bitbake-registry configs for nodistro, poky on master branch
Date: Fri, 14 Aug 2026 12:52:48 -0400
Message-ID: <20260814165250.590784-9-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814165250.590784-1-tgamblin@baylibre.com>
References: <20260814165250.590784-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 17:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129062

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../meta-perl-nodistro-master.conf.json       | 57 +++++++++++++
 .../meta-perl-poky-master.conf.json           | 83 +++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 meta-perl/bitbake-registry/meta-perl-nodistro-master.conf.json
 create mode 100644 meta-perl/bitbake-registry/meta-perl-poky-master.conf.json

diff --git a/meta-perl/bitbake-registry/meta-perl-nodistro-master.conf.json b/meta-perl/bitbake-registry/meta-perl-nodistro-master.conf.json
new file mode 100644
index 0000000000..ea7fc50090
--- /dev/null
+++ b/meta-perl/bitbake-registry/meta-perl-nodistro-master.conf.json
@@ -0,0 +1,57 @@
+{
+    "description": "OpenEmbedded - 'nodistro' with meta-oe and meta-perl layers",
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
+            "description": "OpenEmbedded 'nodistro', with the meta-oe and meta-perl layers added",
+            "setup-dir-name": "meta-perl-nodistro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-openembedded/meta-oe",
+                "meta-openembedded/meta-perl"
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
diff --git a/meta-perl/bitbake-registry/meta-perl-poky-master.conf.json b/meta-perl/bitbake-registry/meta-perl-poky-master.conf.json
new file mode 100644
index 0000000000..77913f8c85
--- /dev/null
+++ b/meta-perl/bitbake-registry/meta-perl-poky-master.conf.json
@@ -0,0 +1,83 @@
+{
+    "description": "Poky - The Yocto Project testing distribution with meta-oe and meta-perl layers",
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
+            "setup-dir-name": "meta-perl-$distro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-yocto/meta-yocto-bsp",
+                "meta-yocto/meta-poky",
+                "meta-openembedded/meta-oe",
+                "meta-openembedded/meta-perl"
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
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe and meta-perl layers added"
+            },
+            {
+                "name": "poky-with-sstate",
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe and meta-perl layers added, and with internet sstate acceleration. Use with caution as it requires a completely robust local network with sufficient bandwidth.",
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


