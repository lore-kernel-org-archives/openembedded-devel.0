Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BA1C5CFDB
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 17:04:45 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17300.1786726395691620396
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 09:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=j3+y9B13;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e57a753f9so106625985a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 09:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786726395; x=1787331195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=np1smPiCzE1PEmWFdxC/fsyPGV1/NMYLGECX82wW19U=;
        b=j3+y9B13cwOXtZkGxzIGmYAnptKEjkEsH64tBO/Bcm0zInC7q4Mo2MccLwTPeXOy72
         PzajIlVbyYFMJdImSwLnoFscFbIu/t4TR9fAsPQhLPWJMTccccA9b7SV8laiizd5tUvd
         hTWtcmPjDp6cNEkIS4ktbIoEapzKBdYcOFCFEvIv5/M6ThDdJYUsWCZaJpNubTtbTP3E
         H1JzduwnqXUBth6r+AGadeSlWK4BHljKLpzMoz8iwXaGpAu6zoy3sRFP+8ptw7Z4i0Gh
         OP1oh5iU/a190hRgY4sCCg8Q0sH528Eb0dzpCObPBwhllxSzAgzyggy7v8JxzCKt2zTo
         KSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726395; x=1787331195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=np1smPiCzE1PEmWFdxC/fsyPGV1/NMYLGECX82wW19U=;
        b=k7kCTZdHpytZXrvz4dssv2qStMgYrJETGcVmNdTTioFeBvkA+tY5BwR3eef8EFjXY9
         /eWLb5aVFKhBNC7JT2gL+DSxsP6wJL2SsFnmYmWzXAP4BjOouVQbJqo21AShxkxoIPJ1
         bSPe4zZWL2WW1J1kb1nBWEnHIeXWJzzVZGKP1gWLHu1dKXkqF/75NtLA7+9RVMtSiYzr
         waUTniYwreRCavAICNhZvXzvdJg4AqAgsrRlZJYTSwv3iZBUD+4pH41vzvZmq+hlZPSE
         u+WJIfHzBUbtxGaM2yeAYxRRfe6tYkBVfHvoPxO0J/lEqk5dDPHbdhfYyriLsd8x4EpD
         dUSQ==
X-Gm-Message-State: AOJu0YxWmPgx6d+NfL5lvfq7AcNGEtiR3gtRJ0DV3xa4FrQ9F2MaHGTA
	0UXnoRJ6FA+3Ep7ZYZDVgAIlpZ+XP2ShQS+dyuD9eTt63VPT+oQlanhAOPUBsJe0i8bV5sKVXcm
	zYcJ/aNM=
X-Gm-Gg: AR+sD13MHmQcmjVGbZlK8tKdiVkbZxpEqtC6+QGz+g0DNumoMloZMoZjfqV6gSjj0MS
	BVTydXhO5PbQDJPen72Lo9Zpeb6gKtu5OyiefFCIaMHX0tarbZbu4lZLcZDkr+ymGEHe10dNav5
	vpX9z1pjDocz85JWVLV5BLYJbyxK1QUXAMLUHY3X9llX/Hz2T7aOhZiqOcpWaj8GM3jzpHBOrCq
	6VKp9UCOnU5yEHSJRj5OmQ2u4HXbJREK7pdr7wq9YKIFj/mXT+Nc6G8OUL/rnKl3WT0FdMV423q
	DglhS6J/1eUo9U0GuoEhoVnPHNqBor3Yweb7pij7xBsoVSPyHRR6NhRdTHX7ZuxwXefPcXH4Nwu
	0x8aXrnU+FTIs7aCsIPHm+v+z1qNgdfnKi3kyErOwvLqqUEeRFAHUScNfn1GeFstjjbJaRPdaMV
	RPtiLa+M6lNjFSPD2FGLwf2/IqYqrtXmYkaNMFhwXY77elcJvGBwTW/9Si1qTlBsjP5VAC2qF/Z
	Nk=
X-Received: by 2002:a05:620a:6609:b0:92f:362:80a0 with SMTP id af79cd13be357-936d1fd6997mr861589785a.6.1786726394589;
        Fri, 14 Aug 2026 09:53:14 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936d02b0a91sm258567385a.42.2026.08.14.09.53.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 09:53:13 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH 09/10] meta-webserver: add bitbake-registry configs for nodistro, poky on master branch
Date: Fri, 14 Aug 2026 12:52:49 -0400
Message-ID: <20260814165250.590784-10-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814165250.590784-1-tgamblin@baylibre.com>
References: <20260814165250.590784-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 17:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129063

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../meta-webserver-nodistro-master.conf.json  | 59 +++++++++++++
 .../meta-webserver-poky-master.conf.json      | 85 +++++++++++++++++++
 2 files changed, 144 insertions(+)
 create mode 100644 meta-webserver/bitbake-registry/meta-webserver-nodistro-master.conf.json
 create mode 100644 meta-webserver/bitbake-registry/meta-webserver-poky-master.conf.json

diff --git a/meta-webserver/bitbake-registry/meta-webserver-nodistro-master.conf.json b/meta-webserver/bitbake-registry/meta-webserver-nodistro-master.conf.json
new file mode 100644
index 0000000000..045106de05
--- /dev/null
+++ b/meta-webserver/bitbake-registry/meta-webserver-nodistro-master.conf.json
@@ -0,0 +1,59 @@
+{
+    "description": "OpenEmbedded - 'nodistro' with meta-oe, meta-python, meta-networking and meta-webserver layers",
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
+            "description": "OpenEmbedded 'nodistro', with the meta-oe, meta-python, meta-networking and meta-webserver layers added",
+            "setup-dir-name": "meta-webserver-nodistro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-openembedded/meta-oe",
+                "meta-openembedded/meta-python",
+                "meta-openembedded/meta-networking",
+                "meta-openembedded/meta-webserver"
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
diff --git a/meta-webserver/bitbake-registry/meta-webserver-poky-master.conf.json b/meta-webserver/bitbake-registry/meta-webserver-poky-master.conf.json
new file mode 100644
index 0000000000..9718bad8ea
--- /dev/null
+++ b/meta-webserver/bitbake-registry/meta-webserver-poky-master.conf.json
@@ -0,0 +1,85 @@
+{
+    "description": "Poky - The Yocto Project testing distribution with meta-oe, meta-python, meta-networking and meta-webserver layers",
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
+            "setup-dir-name": "meta-webserver-$distro-master",
+            "bb-layers": ["openembedded-core/meta",
+                "meta-yocto/meta-yocto-bsp",
+                "meta-yocto/meta-poky",
+                "meta-openembedded/meta-oe",
+                "meta-openembedded/meta-python",
+                "meta-openembedded/meta-networking",
+                "meta-openembedded/meta-webserver"
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
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe, meta-python, meta-networking and meta-webserver layers added"
+            },
+            {
+                "name": "poky-with-sstate",
+                "description": "Poky - The Yocto Project testing distribution, with the meta-oe, meta-python, meta-networking and meta-webserver layers added, and with internet sstate acceleration. Use with caution as it requires a completely robust local network with sufficient bandwidth.",
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


