Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5ED2C5DF72
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 17:04:45 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17298.1786726386476115586
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 09:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=TLXg5vrt;
 spf=pass (domain: baylibre.com, ip: 209.85.219.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8efec2c28f8so7794466d6.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 09:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786726385; x=1787331185; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=52K9GGHiBxLNGjZ4r04DJx1aBtagW0f+as5wV3ubFk0=;
        b=TLXg5vrtn9X9pvhkaaYF30fOcip0hiCdQ4irFpJyAdLbe3mudrHjJuZB38M/GctdhJ
         bLa2Ga4AssrZwBR64f3mlmtvFyID5PcRkoOsdY+t2Z6LHZlPjFl7iQnUw3jSba7o2geA
         7hLyJjHkwMFu9avXjso3+xc6hNtkanyLwAdv4i1mgdDY1bQ6ROM0m/tor/eMGfHQkQyu
         dapOgSZdSnC8Ne/cV28rxbjHoWOcQPDFr27kAV0JLuOxcz41B/efAdhmCftYa7MqI6Oa
         /kj3qIo4w4tilw42pDTnDlJxVVdC8A9T2t2M23dGmbraptW2JLCLAeJYRBlG1XX36NG1
         Yo2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726385; x=1787331185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=52K9GGHiBxLNGjZ4r04DJx1aBtagW0f+as5wV3ubFk0=;
        b=MXkhRLqQLOlDZeeP7Cby4s3RvfjeH1zmrNuc/EUWVzKoGwEbg86y1rap3fJ6ItNkHE
         lcQVsRqcqywxUBThau/YqQOnxenJguuUWT/xdsQYzClt/x/KZm78PZMherM88qwq9Edf
         Kg1G6dHkZpPttJOql84sTOcOAuKa59iWn44B+J7igPeVEtWEXo21IDoWK+ra39v1z4s7
         f1PTBx2bRxwR0Ni5grSBV/Jz9xAolaEqN04arLtm+La2BgAYPri8NvdmFq68kDB7J+n6
         W67rJDDOXCG+vKSwDj9d+p3YF1l31Iu03E9VoCgWUXBspE480g3pYfHMcqHkspWGAKqf
         Q+iA==
X-Gm-Message-State: AOJu0YwXkcmiia5jiM/lai7a6DyqAEXmbtqih1zhvjoTl5eFoM1jPMrJ
	Zzvo22eqoys1k+VqfojhP7AzHb5VBasF/3StxnUglLY3kOaGwf0+Tbx7nDKb6GX1DuedxtgzMaN
	L/EBYOkc=
X-Gm-Gg: AR+sD11j5PjOkqC0wDCMig//JLfBq3jYRHxWN3oFzUtGFevP5OQh5hb9bDiu+5Xp10e
	VOzYH8wB4dkr2H0Vu7omIiOqfLuNPwg0Ae4LoH1Ab/Gmqr3mOvY+dl7QfObvGZI51Q1Gju2Izrf
	H3jk+1sESycGOMeGax0ahdWHbExWm2PiXPZhEBJgpfXg4Hgba5nvT6DB8snuavppiCQqyFtYZYi
	HfRbJfec3r65tRnfu/YE00wguGk5lXVXAM/ikieYak6rreAvQdUmEfpFqyNKCybmzx378JwA1TP
	0g17J45CPzT47oyxWF1Wn6FiTW66zadXrPUV1A6wGzetG3cH97+LnjTnpB0vMXfBesdRUZIpAYn
	b59V9c4n86ODG+hdQBj+KrUO/8ZxdvJWnyBeVTHAvYsmqtqTdF48f9F8hoNUjfD9JWe6m5cjaVV
	4xZ+sWqYY/Z3p6xOtoUP1aKyXHHJ5OVN7hLyoLYBwJzkjByDInss7NQRzKW0f5rX5lr+g2puBxP
	r0=
X-Received: by 2002:a05:6214:1316:b0:8f2:3472:5b33 with SMTP id 6a1803df08f44-90a91da5cd9mr79960786d6.23.1786726385150;
        Fri, 14 Aug 2026 09:53:05 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a93584343sm20977956d6.41.2026.08.14.09.53.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 09:53:04 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 05/10] meta-networking: add bitbake-registry configs for nodistro, poky on master branch
Date: Fri, 14 Aug 2026 12:52:45 -0400
Message-ID: <20260814165250.590784-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814165250.590784-1-tgamblin@baylibre.com>
References: <20260814165250.590784-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 17:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129059

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../meta-networking-nodistro-master.conf.json | 58 +++++++++++++
 .../meta-networking-poky-master.conf.json     | 84 +++++++++++++++++++
 2 files changed, 142 insertions(+)
 create mode 100644 meta-networking/bitbake-registry/meta-networking-nodistro-master.conf.json
 create mode 100644 meta-networking/bitbake-registry/meta-networking-poky-master.conf.json

diff --git a/meta-networking/bitbake-registry/meta-networking-nodistro-master.conf.json b/meta-networking/bitbake-registry/meta-networking-nodistro-master.conf.json
new file mode 100644
index 0000000000..2f383560dc
--- /dev/null
+++ b/meta-networking/bitbake-registry/meta-networking-nodistro-master.conf.json
@@ -0,0 +1,58 @@
+{
+    "description": "OpenEmbedded - 'nodistro' with meta-oe, meta-python and meta-networking layers",
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
+            "description": "OpenEmbedded 'nodistro', with the meta-oe, meta-python and meta-networking layers added",
+            "setup-dir-name": "meta-networking-nodistro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-openembedded/meta-oe",
+                "meta-openembedded/meta-python",
+                "meta-openembedded/meta-networking"
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
diff --git a/meta-networking/bitbake-registry/meta-networking-poky-master.conf.json b/meta-networking/bitbake-registry/meta-networking-poky-master.conf.json
new file mode 100644
index 0000000000..afe8b5dba9
--- /dev/null
+++ b/meta-networking/bitbake-registry/meta-networking-poky-master.conf.json
@@ -0,0 +1,84 @@
+{
+    "description": "Poky - The Yocto Project testing distribution with meta-oe, meta-python and meta-networking layers",
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
+            "setup-dir-name": "meta-networking-$distro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-yocto/meta-yocto-bsp",
+                "meta-yocto/meta-poky",
+                "meta-openembedded/meta-oe",
+                "meta-openembedded/meta-python",
+                "meta-openembedded/meta-networking"
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
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe, meta-python and meta-networking layers added"
+            },
+            {
+                "name": "poky-with-sstate",
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe, meta-python and meta-networking layers added, and with internet sstate acceleration. Use with caution as it requires a completely robust local network with sufficient bandwidth.",
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


