Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FBBC5DF70
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 17:04:45 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17470.1786726383841658051
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 09:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=PD5XJoqf;
 spf=pass (domain: baylibre.com, ip: 209.85.160.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c04bf4711so13223201cf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 09:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786726383; x=1787331183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fqCRlnsh/L0uUOPNOxTjOLsQ0hhO9Q3ePwDsKW5FMgQ=;
        b=PD5XJoqf+uLDGCG5YKQuH0nCx0K8TPHMWQmSTmOviNTlI1OvQP1n00gdpK9ROhmFSY
         Bx284QiTk6qckKenvc3u+X2EOiCC6GrAm5wXTwHTjp/4G95vHqioQZZZq/I3FNHDtZaX
         G3GlOlubj/k/ClFKEZZXYrJCA9U33JYX+Qcr2R2+uWz1MCB55c1RBzbdkk6ZgLzCNQXR
         kAL29gtmixfrxv+ccOE6QfBhqXtELtFyUJR/Bm1qhAxXKJUz0wOj9ydUPETc5bgQzWTA
         ZRN0XGXr8oVqj0y/DJ8AZpp/vptYXemFYZ7WChmOJfRM2KHI/xG9oKZa7Xd+OaFwU5Hs
         JfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726383; x=1787331183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fqCRlnsh/L0uUOPNOxTjOLsQ0hhO9Q3ePwDsKW5FMgQ=;
        b=WM7wINkZXHbB2KipBcwZ1BiOXe4uhs5C8MtI2zsGHZlhp0dIIonlUtAV/7rEPfuoic
         W1IYC+/PNIeEHyPE6uFyFbd29WjZdFcwbQJ4k8qLfgaiWgHSqCqIKjH+ruVzOuUucu32
         u1/bR++fXUce2UkGZ6ZsqwaAS0QlZB6/Bc3IfJsA6osQvpSp+mOqP1FO3Qfm3agofzX3
         91jvbYSLzxYB+hYtf/LBHFCCTgmJTcB5GB49+7aUUpjuMXrEcQ+14wsKWbWHnIC8fPNQ
         XP36tvhAY2F9SAfQpTdlvJjy3VeTPbnpGUt/4aOAox3RLk+8Ede/pK7SpgLTJagilwC9
         ZEqg==
X-Gm-Message-State: AOJu0YxylarJdfk5HrJeRDJYr1I6PVs86idA129nfELbFC8bT3UOM5Oh
	KpMz9RAgLYRE/hgDGmpVdBku3w9bQZxwUF2pMOUkQTmVpDKzfGMM7GzaO8KF+suSDyPUoB+95os
	suIBX9rk=
X-Gm-Gg: AR+sD13yi3TrTd6Mq11Jj7JsySacQgm1+VCcIdtTDRrjDUb9H97ghkp3Su46MaUlpZu
	C1vbeyM/lVH4pUh4ljzLEJxunVOveedxkEub0Xp7QifrFYSsVzPGVB/Pa2oNyRmEm8S1uhuzpxF
	yZvBLEuj30QpYrD2gGcdlCX9QAdR6+Zck3tzKExSJiTeDJc0TwVmwNn7hbyddcQxpNToKoFCeWK
	728BjsnZ9BnT18kqRJ9oOHdBQvVxXdEjVTNjwE3LdS3QPpodRy72zOvOfOJrVQyqeAeEQ+o41G+
	xlSBwjdWdsTEkFCb7hLNarX+aMdaZ3VeDcX+42LlSTKxag4PhydUEl/hGEBhXBv3mj8pQ8u6zee
	ph1AZ0Io0qL/iOCdaCm6XdwxBl0hX0UoPPljZzp1Z5ZvwPkL4wxYAzPpuhhi5orPVS5cTN1D3iE
	lZ/cioz1ZgXsoQrFjSg68GIVypC5FIBV4njKLhTQ6ZRYhd4Tw7y9An51qIcu2MRRVQ
X-Received: by 2002:a05:622a:2446:b0:51c:1a11:75cf with SMTP id d75a77b69052e-52d852fda64mr84114881cf.7.1786726382744;
        Fri, 14 Aug 2026 09:53:02 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d83f00957sm24767561cf.9.2026.08.14.09.53.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 09:53:01 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH 04/10] meta-filesystems: add bitbake-registry configs for nodistro, poky on master branch
Date: Fri, 14 Aug 2026 12:52:44 -0400
Message-ID: <20260814165250.590784-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814165250.590784-1-tgamblin@baylibre.com>
References: <20260814165250.590784-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 17:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129058

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...meta-filesystems-nodistro-master.conf.json | 59 +++++++++++++
 .../meta-filesystems-poky-master.conf.json    | 85 +++++++++++++++++++
 2 files changed, 144 insertions(+)
 create mode 100644 meta-filesystems/bitbake-registry/meta-filesystems-nodistro-master.conf.json
 create mode 100644 meta-filesystems/bitbake-registry/meta-filesystems-poky-master.conf.json

diff --git a/meta-filesystems/bitbake-registry/meta-filesystems-nodistro-master.conf.json b/meta-filesystems/bitbake-registry/meta-filesystems-nodistro-master.conf.json
new file mode 100644
index 0000000000..b33bb2f2f5
--- /dev/null
+++ b/meta-filesystems/bitbake-registry/meta-filesystems-nodistro-master.conf.json
@@ -0,0 +1,59 @@
+{
+    "description": "OpenEmbedded - 'nodistro' with meta-oe, meta-python, meta-networking and meta-filesystems layers",
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
+            "description": "OpenEmbedded 'nodistro', with the meta-oe, meta-python, meta-networking and meta-filesystems layers added",
+            "setup-dir-name": "meta-filesystems-nodistro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-openembedded/meta-oe",
+                "meta-openembedded/meta-python",
+                "meta-openembedded/meta-networking",
+                "meta-openembedded/meta-filesystems"
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
diff --git a/meta-filesystems/bitbake-registry/meta-filesystems-poky-master.conf.json b/meta-filesystems/bitbake-registry/meta-filesystems-poky-master.conf.json
new file mode 100644
index 0000000000..0b13141c76
--- /dev/null
+++ b/meta-filesystems/bitbake-registry/meta-filesystems-poky-master.conf.json
@@ -0,0 +1,85 @@
+{
+    "description": "Poky - The Yocto Project testing distribution with meta-oe, meta-python, meta-networking and meta-filesystems layers",
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
+            "setup-dir-name": "meta-filesystems-$distro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-yocto/meta-yocto-bsp",
+                "meta-yocto/meta-poky",
+                "meta-openembedded/meta-oe",
+                "meta-openembedded/meta-python",
+                "meta-openembedded/meta-networking",
+                "meta-openembedded/meta-filesystems"
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
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe, meta-python, meta-networking and meta-filesystems layers added"
+            },
+            {
+                "name": "poky-with-sstate",
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe, meta-python, meta-networking and meta-filesystems layers added, and with internet sstate acceleration. Use with caution as it requires a completely robust local network with sufficient bandwidth.",
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


