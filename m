Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BBEC5DF6D
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 17:04:45 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17301.1786726398346529785
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 09:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=aifNfzBT;
 spf=pass (domain: baylibre.com, ip: 209.85.222.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92edb12cdf2so103868785a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 09:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786726397; x=1787331197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b2hNy9TlyE91DV9TtMLDt6435tstNnn70T2cnQ41tFU=;
        b=aifNfzBTXRSErYfRSTc3swKwpMyZATqELr7SL9/12zNRBBhWz1Jb1eKlHRX9I07eLa
         NEj7vFvE8bpjTN+9oenXWZe9gMNLOXic+grGlkeWrj1NJvplAsu03g5X4AuB89DvW4Mt
         ZxvqPDgJ6VIw6Ot2CIELWSQjpSsijc2SsR6fyd9lK5LFgzIUXk1gYi5PSRlBLqcLi5RW
         8V3BSRryOyXActANY5aR8q44W16N5X9hIzzhsHjvTsBXM7RVR1g6tVaXPYu4JzlPjkBx
         BZxoHZ95owZnzmoLprB5deTmzUqaHny1LhZiACdzYK3ooAkQouejpMN1AutiWxZzBLPB
         A50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726397; x=1787331197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b2hNy9TlyE91DV9TtMLDt6435tstNnn70T2cnQ41tFU=;
        b=MrRXyWBBU9x1i7XaYOwEMwFXQ1qy2wS92t9vffTkzWhRUSjFPQPgL8hjj5PojG5Nq/
         kxMAnMJIffWMMrBiAjx2PAexzv3gKQ09JZbu4RCitiWQwCdhdjTJ2fyGISLcqXKEQLOf
         9O3434vhkP2jXwRIavpU/YTvdjLY7crIzk3j34OBsLhNHeh1wZhNMRC3pKpYfNtIUI1O
         mCJYiaPWNAmpCG7dHROi09KGhcZ1MjNvFY8kV0N6FI138F1CM/NSrWKfBDwJJSP37SmZ
         Ym3Q/XcjhOA4OFOHS/dKemNekjvKWGOUxwunnK/Q1BKi8bbOdTrAfJjW35vGC8UDiMUC
         bi1g==
X-Gm-Message-State: AOJu0Yx1sPgRtgqcYrxNdU/TnXi9QxBgGlCEDdcIn5kVAkAKq+LnH82j
	5oiblAEX/YoEAQHMwiHRhfKXUb8+/KxQmNDhyJJhRwvSniMIEQRvouAKvI769uuGpv+vGRnBsUU
	xe/WIuzM=
X-Gm-Gg: AR+sD11R/nydY8sx/tDvkXWtBRTx2ly3PTWPVJJTUKQsTUdP1YVwBNz67oZ+v62Iw94
	84pDY+BTShE+HjpF9iLOcPs59jofbQMXEe8HreYy6FtmlH7g05HHBHWoZ/X2tAeoh2sTQaGNUQK
	2l0t0ttUaE6dybsOaszN/kcZX1V7APPQBOP4DgleQc+3AbXI6iqrX6Q7dOJ436LeYlTX90YsaE0
	5h8WCpKEavyDXxp1/XsXznwXA3SkItY/pvTFcAmXREvZ28fZigBqAjR8ywC2KBBPETmbFhl0tdW
	Vwb4hkRzuO2TdYTlqjdVP7im1p93cx5wmmZ+w8fNK3pWm5LF6/M1YuCfgGGSFmphXVk3gkgiIiQ
	n+s2vFzvFpPS1agiMIByrBoSEDz3OcW/EOpFZemakhbrfMKvY2MpbYvwJiX8oa6vnGP5ThJbnKX
	6XsJSmKFCNaQRl5vbLeArp8Ep/StiGV1SqkAWPtFGSAdhiSh+0ZXblmzncVl1f9/dW
X-Received: by 2002:a05:620a:8790:b0:92f:40d:6556 with SMTP id af79cd13be357-936d202a3a8mr469399385a.18.1786726397143;
        Fri, 14 Aug 2026 09:53:17 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936ce0b710bsm319130485a.20.2026.08.14.09.53.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 09:53:15 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 10/10] meta-xfce: add bitbake-registry configs for nodistro, poky on master branch
Date: Fri, 14 Aug 2026 12:52:50 -0400
Message-ID: <20260814165250.590784-11-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814165250.590784-1-tgamblin@baylibre.com>
References: <20260814165250.590784-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 17:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129064

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../meta-xfce-nodistro-master.conf.json       | 61 +++++++++++++
 .../meta-xfce-poky-master.conf.json           | 87 +++++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100644 meta-xfce/bitbake-registry/meta-xfce-nodistro-master.conf.json
 create mode 100644 meta-xfce/bitbake-registry/meta-xfce-poky-master.conf.json

diff --git a/meta-xfce/bitbake-registry/meta-xfce-nodistro-master.conf.json b/meta-xfce/bitbake-registry/meta-xfce-nodistro-master.conf.json
new file mode 100644
index 0000000000..377ab3965c
--- /dev/null
+++ b/meta-xfce/bitbake-registry/meta-xfce-nodistro-master.conf.json
@@ -0,0 +1,61 @@
+{
+    "description": "OpenEmbedded - 'nodistro' with meta-oe, meta-python, meta-networking, meta-gnome, meta-multimedia and meta-xfce layers",
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
+            "description": "OpenEmbedded 'nodistro', with the meta-oe, meta-python, meta-networking, meta-gnome, meta-multimedia and meta-xfce layers added",
+            "setup-dir-name": "meta-xfce-nodistro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-openembedded/meta-oe",
+                "meta-openembedded/meta-python",
+                "meta-openembedded/meta-networking",
+                "meta-openembedded/meta-gnome",
+                "meta-openembedded/meta-multimedia",
+                "meta-openembedded/meta-xfce"
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
diff --git a/meta-xfce/bitbake-registry/meta-xfce-poky-master.conf.json b/meta-xfce/bitbake-registry/meta-xfce-poky-master.conf.json
new file mode 100644
index 0000000000..3fe97f89dc
--- /dev/null
+++ b/meta-xfce/bitbake-registry/meta-xfce-poky-master.conf.json
@@ -0,0 +1,87 @@
+{
+    "description": "Poky - The Yocto Project testing distribution with meta-oe, meta-python, meta-networking, meta-gnome, meta-multimedia and meta-xfce layers",
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
+            "setup-dir-name": "meta-xfce-$distro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-yocto/meta-yocto-bsp",
+                "meta-yocto/meta-poky",
+                "meta-openembedded/meta-oe",
+                "meta-openembedded/meta-python",
+                "meta-openembedded/meta-networking",
+                "meta-openembedded/meta-gnome",
+                "meta-openembedded/meta-multimedia",
+                "meta-openembedded/meta-xfce"
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
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe, meta-python, meta-networking, meta-gnome, meta-multimedia and meta-xfce layers added"
+            },
+            {
+                "name": "poky-with-sstate",
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe, meta-python, meta-networking, meta-gnome, meta-multimedia and meta-xfce layers added, and with internet sstate acceleration. Use with caution as it requires a completely robust local network with sufficient bandwidth.",
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


