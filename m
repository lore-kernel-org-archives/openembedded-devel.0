Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6635C5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 17:04:44 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17468.1786726378898161696
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 09:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Bi+NillA;
 spf=pass (domain: baylibre.com, ip: 209.85.222.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e55b62640so63793285a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 09:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786726378; x=1787331178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t8N+ztNIC24FymCOtp6ewaWUANx57+C8+zCcNsRTGHI=;
        b=Bi+NillANtoJN895WCgOm3wWDPCyEGXcnxgfYJ3f+3iv5ORf5YCttdMD4G0Iyh/+9J
         Bp1GbmT0PMwx+s+mWAcc4YIqqf5ERHu7c20Z1NnJHB6nE96mbDOwALxo50Yt5A6jFXl5
         rhgCa/HbCZcGbubtnlNkCacktWgmOOmhAuMGJRyy331yX9+oB2MKSTj4gCbsNRotOtGp
         ChPWM2qVN5ImuwbO6/d7o99jfmvylFvuQLS5Tfm8CILsroFhu5/0jyNCLUYkiofvgGrs
         zTKs26GDAgBWbtAip1fdnpJTI+iSjYEVI1srr5mil7bfbXCXdci3lkz2qHG1mU/O4rN/
         jL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726378; x=1787331178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t8N+ztNIC24FymCOtp6ewaWUANx57+C8+zCcNsRTGHI=;
        b=NnF5KnanbznugdZcTI/g4mJLMlTHqrOvTE4dEuykaHDHi3wJYAjfL3Ek15KIs0DhMU
         mPc/4bJ7P1L43T6JHUaKhqwQKhlyWAhXjFg8NG07ZaSxNQ0KIJndFohiV6bEdlHg6yHq
         AUPL2o8oejbgIyRhTscQY8mE0efTPa4Dv97Trhe0uh4ubQeHmsh5iQhTJcKo+UWY2lnG
         ZmRHejJNMmOmY9JBRGolQjJcyDYtSCOPRJe/jwes2KsiGUpep3OB54YF7eDZlhJ2YOuG
         oruiA1NETH7NxyswJ+atmx2bIjo2vYJIrYkXjsrE2T4uj+rC/Jk2PTL2CM2cEa+D4841
         nzcg==
X-Gm-Message-State: AOJu0YxOPtBniImlKfaw7PnUuXCuW2HzCQ5Brm+ykXUbYNlDNuuSe/+J
	9TJqBl+eeh46rFoTnfYLlQG47x0v8rY35HGMMvYhC9qneENPInDMxHcQ45Z+QvOz1rvzb74SXPg
	7j1VpU94=
X-Gm-Gg: AR+sD137EBz2XAQbB6+lrzP6whVV4wh7eES3dknwMXysxa02isNC/UzKGIOB0sVKSPU
	4DHNyk5pEem0/obWi/EM6xh72fFNbqq5l1ZvI0cyoTv+mxMx4L1523GDTRUf8pNoKY/EQEMcOWv
	2FmcglX7ewEdl+2h5a20fPHxoi0jrJf2C6iAhSGWrQu/3w1PFIk0tuUocqifVnXjtGjkz79lgma
	9eY9/5iX9+vrZeIh3z/TRhtX374nM1fxVgKInZJBoQZFoS/hRCujLzNRyyDDXBTVgdOxBQgZSMS
	U9aRXsju7hmiNni9zbQN8HMR99hm4UQqS38K06F5rosqhMuKbxl8vMicDUN28uXzxe8pBPNuv16
	yOoX4Ohi63Kb0Iqx3RbyNUJZ06u/02h1tbx+C2mGzQF4kTa5ztsOYIL+QNHLQ5dlQO+ndvMseBv
	ewRs2jr7X+Ut0X/edIp5kF3kpSe6ik+dQnwmk5JTvdiz0z3THaP5A7eAumbvI6qYzD
X-Received: by 2002:a05:620a:a188:20b0:936:9fd4:e2bf with SMTP id af79cd13be357-936d230fc18mr609996585a.37.1786726377678;
        Fri, 14 Aug 2026 09:52:57 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936cdf54cffsm313479685a.9.2026.08.14.09.52.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 09:52:56 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 02/10] meta-python: add bitbake-registry configs for nodistro, poky on master branch
Date: Fri, 14 Aug 2026 12:52:42 -0400
Message-ID: <20260814165250.590784-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814165250.590784-1-tgamblin@baylibre.com>
References: <20260814165250.590784-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 17:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129056

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../meta-python-nodistro-master.conf.json     | 57 +++++++++++++
 .../meta-python-poky-master.conf.json         | 83 +++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 meta-python/bitbake-registry/meta-python-nodistro-master.conf.json
 create mode 100644 meta-python/bitbake-registry/meta-python-poky-master.conf.json

diff --git a/meta-python/bitbake-registry/meta-python-nodistro-master.conf.json b/meta-python/bitbake-registry/meta-python-nodistro-master.conf.json
new file mode 100644
index 0000000000..de848724f2
--- /dev/null
+++ b/meta-python/bitbake-registry/meta-python-nodistro-master.conf.json
@@ -0,0 +1,57 @@
+{
+    "description": "OpenEmbedded - 'nodistro' with meta-oe and meta-python layers",
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
+            "description": "OpenEmbedded 'nodistro', with the meta-oe and meta-python layers added",
+            "setup-dir-name": "meta-python-nodistro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-openembedded/meta-oe",
+                "meta-openembedded/meta-python"
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
diff --git a/meta-python/bitbake-registry/meta-python-poky-master.conf.json b/meta-python/bitbake-registry/meta-python-poky-master.conf.json
new file mode 100644
index 0000000000..466448445f
--- /dev/null
+++ b/meta-python/bitbake-registry/meta-python-poky-master.conf.json
@@ -0,0 +1,83 @@
+{
+    "description": "Poky - The Yocto Project testing distribution with meta-oe and meta-python layers",
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
+            "setup-dir-name": "meta-python-$distro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-yocto/meta-yocto-bsp",
+                "meta-yocto/meta-poky",
+                "meta-openembedded/meta-oe",
+                "meta-openembedded/meta-python"
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
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe and meta-python layers added"
+            },
+            {
+                "name": "poky-with-sstate",
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe and meta-python layers added, and with internet sstate acceleration. Use with caution as it requires a completely robust local network with sufficient bandwidth.",
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


