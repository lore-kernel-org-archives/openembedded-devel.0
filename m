Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50391C5DF75
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 17:04:46 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17472.1786726388216502689
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 09:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=TXiCqCxl;
 spf=pass (domain: baylibre.com, ip: 209.85.219.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-9063b380982so13142296d6.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 09:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786726387; x=1787331187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UYo68dbFoVjQTdbur2t7vtT2OoQGDA2I7q6D3o42TwQ=;
        b=TXiCqCxldnqiIltEFVYpjHw/+zy5dlgJm5w4vaMj21/xUNoHq1t8+n33g1tdSHl+aG
         36L4PCEsEuDYKU52/q4UYRlWPtZcZUmWObMs3SWMYkCE9IFP23qaTabL4EEKzyFGe/UU
         V4DOQrcobqsL/lJoRCROVlPFa9IblQs0TYWgYsuDtMyzRAefbsfg8kDWAIVefORc4n/O
         3KKQxWOFv3qnNaOwoRk8DStvszWWf47qMq/bveqvd1dvitgMJmJbkGeCnr6JNk7XeIA5
         xW4zDKFGSmEK0Z4qCinVqUbV/KsKHRZIaif/Sh9fDcKuVcPXEGEtgU4+kyH+b739PPB+
         5ekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726387; x=1787331187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UYo68dbFoVjQTdbur2t7vtT2OoQGDA2I7q6D3o42TwQ=;
        b=Iv3GdB/vp0K2Y8WOuwDrIAdNQJhCq38eFdqLXdFjzm/h1+PQeiueG6YumKayTtOqc2
         dP6VNmT1kAaGggAccqT3c33mTvxQfcB1jo64ewxk1xNt4PfzQV4im/Qu+ZOWdpR9rG+/
         w4j1iK8YCO1G5W0bbAm3+J3/1d+WyOeWCN7R2CwgqTLSy72Xmv4FLYufGyZ9TH19mwEW
         etxpdCnCVbv36R7PyK3er14OyLR94ydmIRiiAVpyuLyelyyygLOlg4Qh3ZlXs38v8fDw
         ink4Kv1sb4CT/bjGQWzVrqhZZMvJPzf+FEuXTeqlCqrKLSiBjQrwUnAy+E2CZiT0z35z
         jIhA==
X-Gm-Message-State: AOJu0Yy5ulriW9UskTjSnrUFNUJ/6mRReAZn2Iep5nXIpRS1c8hXz1a7
	Ar7zs6baRRI6dSHYyugcSNOUI7Mj/jHgaufepF/Xk2fxvllvaydmfoPr6fh2W70UgFY6El493St
	8HZW95NE=
X-Gm-Gg: AR+sD13UFMP9DfRcrmwziYHx4XiB6j1nSIompVEMEhOE0HrUbyhbgH1WB0wuTUjkWi0
	46X5dTuAcWMQihXWzBz3Sd8M6EJ6sM2tSlj8TP+3gonJfqfKK5STcEqKm5uLQSrriPuumbgUpsA
	hERkypyhnb+3jvT2tobgZO8M9rI9qPpvCE0dwv117syWQcf9wnI6354GD49yismdzNEC/KOpfIp
	kIsbqSrlg+DWMNJ3SvLmlgfxjD0gVQGA2fK11P4kElRD2lLuuk862683PmEg/0Qnpn8O7e+i6bw
	KE1Y6JSOWBKk0QbXZNqPNF6dnlGBJReOjdgw1+sF8p1MzYPikcRIZJNBtiYkOu8WKVJzzIVOXbT
	uelD38egyTwiJjxEBf/AVs2RjPkFp8EPFXArZfMEKzpyFWroVUNoI7M2ES43FSz3j7H7+A31rf0
	VmPTcIuxEglec8ERFHV8AFki7AZs/os/rimpMjZcCPzwTeKiCyZkujnlkJ9s7lacC2
X-Received: by 2002:a05:622a:453:b0:51c:1c73:5945 with SMTP id d75a77b69052e-52d8542cb64mr74532361cf.24.1786726387142;
        Fri, 14 Aug 2026 09:53:07 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d83ece83asm24658741cf.6.2026.08.14.09.53.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 09:53:06 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 06/10] meta-gnome: add bitbake-registry configs for nodistro, poky on master branch
Date: Fri, 14 Aug 2026 12:52:46 -0400
Message-ID: <20260814165250.590784-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814165250.590784-1-tgamblin@baylibre.com>
References: <20260814165250.590784-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 17:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129060

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../meta-gnome-nodistro-master.conf.json      | 59 +++++++++++++
 .../meta-gnome-poky-master.conf.json          | 85 +++++++++++++++++++
 2 files changed, 144 insertions(+)
 create mode 100644 meta-gnome/bitbake-registry/meta-gnome-nodistro-master.conf.json
 create mode 100644 meta-gnome/bitbake-registry/meta-gnome-poky-master.conf.json

diff --git a/meta-gnome/bitbake-registry/meta-gnome-nodistro-master.conf.json b/meta-gnome/bitbake-registry/meta-gnome-nodistro-master.conf.json
new file mode 100644
index 0000000000..8071c22174
--- /dev/null
+++ b/meta-gnome/bitbake-registry/meta-gnome-nodistro-master.conf.json
@@ -0,0 +1,59 @@
+{
+    "description": "OpenEmbedded - 'nodistro' with meta-oe, meta-python, meta-networking and meta-gnome layers",
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
+            "description": "OpenEmbedded 'nodistro', with the meta-oe, meta-python, meta-networking and meta-gnome layers added",
+            "setup-dir-name": "meta-gnome-nodistro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-openembedded/meta-oe",
+                "meta-openembedded/meta-python",
+                "meta-openembedded/meta-networking",
+                "meta-openembedded/meta-gnome"
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
diff --git a/meta-gnome/bitbake-registry/meta-gnome-poky-master.conf.json b/meta-gnome/bitbake-registry/meta-gnome-poky-master.conf.json
new file mode 100644
index 0000000000..e9686390ec
--- /dev/null
+++ b/meta-gnome/bitbake-registry/meta-gnome-poky-master.conf.json
@@ -0,0 +1,85 @@
+{
+    "description": "Poky - The Yocto Project testing distribution with meta-oe, meta-python, meta-networking and meta-gnome layers",
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
+            "setup-dir-name": "meta-gnome-$distro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-yocto/meta-yocto-bsp",
+                "meta-yocto/meta-poky",
+                "meta-openembedded/meta-oe",
+                "meta-openembedded/meta-python",
+                "meta-openembedded/meta-networking",
+                "meta-openembedded/meta-gnome"
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
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe, meta-python, meta-networking and meta-gnome layers added"
+            },
+            {
+                "name": "poky-with-sstate",
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe, meta-python, meta-networking and meta-gnome layers added, and with internet sstate acceleration. Use with caution as it requires a completely robust local network with sufficient bandwidth.",
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


