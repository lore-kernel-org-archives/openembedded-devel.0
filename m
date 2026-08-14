Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D47C5DF77
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 17:04:46 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17466.1786726376246514279
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 09:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=SdIrPKP1;
 spf=pass (domain: baylibre.com, ip: 209.85.160.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c1372f84dso9205131cf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 09:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786726375; x=1787331175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B8vXGBtSDMfFnlaFacgpak2kE24XJAn7grbflq7Le7Y=;
        b=SdIrPKP1VQ9weDR+rzmE673KTprEwWIQrbhp4NZ3sv0eIdf8QmDuAtz6nIynyYN79h
         p5VZJGl+fkwuMIbsOQdHfcngKL8mOasjFcmuIDqmRt01xOzW3amcXVXiRw9hkoLG9636
         18tZdPaLlj+POH+Sr/DmysNPRBWoC4dfcx9l0RXkriBMrO5PYX1bWa4vbNeN/6J6xg8v
         KwEtbHx3dAyhUNLq+pLW6mg60tvkMuXgQXIP4nyHp8Aeo28SbpYhEiC+ZmlJsCKcBKZk
         MIxoxYiy5R0Qawvpl7m7Y7IBKNDVpDu+um0pTxqIf1yYtLCkOPr86idjjmxQinO2jAQd
         mWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726375; x=1787331175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B8vXGBtSDMfFnlaFacgpak2kE24XJAn7grbflq7Le7Y=;
        b=j/yov+P3v3sk5o7mEMpIjVfUG5Tu2iNnQi8KklMNcgpngAGuTvk1wmz0PO5qA/Pzuy
         Ip6ICsesl6/1ALuiSqlRisXBSu0N8520D0DglNWxc17ZX96qnlTVThBTZ/UfKfVUA3TZ
         lBnSjnxNnulLKAdGqMzM2w3r8fzPTw94W9ESJY0/VGOM+s9Fo8JsFdUb6RbVNz4x/FZt
         GorKAfVYQVWNfG2Ai4E7cpwBsnZiYQiXIV4bWgX9n8mFZVTbZXYVcfz2R/ioJgH5qHoZ
         gDVw3Jw4Jy9vYT1bU8T7acf3MbXTApnwGJpniw9w5OqaG0VJHqhPzp3zy5cwJ0xoWiPK
         PEmw==
X-Gm-Message-State: AOJu0YyjXPMp8UxCpnPzVNQtwbHshxgU6pmFED5ovD6brHSiaQCJei+w
	ACrEeIqaM7tUmBdNh8oBAN8GJAw+oQpTAPHrw0H9R0pAtfvpfhJj0rjp/76HWEb0IkZtHni4p7B
	B/NPYpx8=
X-Gm-Gg: AR+sD12TXj+qeo5ahMCxA1awOfzdBksNMWX4ZLQ+Atu4wHKcG+Sh7gO8sD19XDl2EUr
	eELGKgePUsMGkZwuWkdylfy3mt/+vSG64kg0P1X/hXXjrzRWH7y8EfrDqnvE1gZcToxtn80Eful
	zi7J5YPl1y54L77vM/IGhhpF2SPGWcx/jNCMTlfkipyThol+YiR8ncOpq1Zcg5zvpgP0CFACBBm
	19P6BAuxHd/LKiMZ/4HX55vGvfCSOTI/hIC/GVR7MjxymSW6bIGqEr2+/ncnXpiQVo529dowS2K
	CMHW++kSbCP1u+/HlCa8iY4/fOCKmE0FQY7QY8iS2F7+I2vzOE++JEYtP7NXHhttR94r+ZewHzc
	4UztFUkElBI7rR3Adut1Vrr5/mslrC8KNM7licRRuK059BFvWbIVsp5vFs/8uGAPRONGZQGnVi4
	UtG9ZzDDisgDbWxzSUVb4HLvxgwfzezv//eF5YfFKNdTkj/tiHsgiX35zosfFrhw7C
X-Received: by 2002:a05:622a:40f:b0:516:d812:c35e with SMTP id d75a77b69052e-52d855011efmr79946511cf.21.1786726375096;
        Fri, 14 Aug 2026 09:52:55 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d840ea890sm24941311cf.29.2026.08.14.09.52.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 09:52:54 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 01/10] meta-oe: add bitbake-registry configs for nodistro, poky on master branch
Date: Fri, 14 Aug 2026 12:52:41 -0400
Message-ID: <20260814165250.590784-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814165250.590784-1-tgamblin@baylibre.com>
References: <20260814165250.590784-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 17:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129055

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../meta-oe-nodistro-master.conf.json         | 56 +++++++++++++
 .../meta-oe-poky-master.conf.json             | 82 +++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 meta-oe/bitbake-registry/meta-oe-nodistro-master.conf.json
 create mode 100644 meta-oe/bitbake-registry/meta-oe-poky-master.conf.json

diff --git a/meta-oe/bitbake-registry/meta-oe-nodistro-master.conf.json b/meta-oe/bitbake-registry/meta-oe-nodistro-master.conf.json
new file mode 100644
index 0000000000..90fd1f4a9e
--- /dev/null
+++ b/meta-oe/bitbake-registry/meta-oe-nodistro-master.conf.json
@@ -0,0 +1,56 @@
+{
+    "description": "OpenEmbedded - 'nodistro' with meta-oe layer",
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
+            "description": "OpenEmbedded 'nodistro', with the meta-oe layer added",
+            "setup-dir-name": "meta-oe-nodistro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-openembedded/meta-oe"
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
diff --git a/meta-oe/bitbake-registry/meta-oe-poky-master.conf.json b/meta-oe/bitbake-registry/meta-oe-poky-master.conf.json
new file mode 100644
index 0000000000..aae886e229
--- /dev/null
+++ b/meta-oe/bitbake-registry/meta-oe-poky-master.conf.json
@@ -0,0 +1,82 @@
+{
+    "description": "Poky - The Yocto Project testing distribution with meta-oe layer",
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
+            "setup-dir-name": "meta-oe-$distro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-yocto/meta-yocto-bsp",
+                "meta-yocto/meta-poky",
+                "meta-openembedded/meta-oe"
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
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe layer added"
+            },
+            {
+                "name": "poky-with-sstate",
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe layer added, and with internet sstate acceleration. Use with caution as it requires a completely robust local network with sufficient bandwidth.",
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


