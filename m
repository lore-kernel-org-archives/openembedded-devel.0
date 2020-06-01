Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.48661.1591047931458911936
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nyQBKoTH;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id l11so1347353wru.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=R7Db3WiM7eTePvin6hhGgLhZAHl73gB8K0Fz7ZXiTbs=;
        b=nyQBKoTH9Sw21Vm9r/3IvtuvJbWmP1ktr53FMOjq8/59jOOzRQrV/dXxpTu9Txn9FV
         ap7qYeacEcjrW+tpMgf9VFLfrWNaNp7QRbNx/aix98BS9Ckfypo8y+uTMX4e3i9gLjTC
         UgEggXqgq5VTvqGjD22kKr+JiPO8R8cJVD812MK6Zny4a3ou/CfD4FyrOaTy9wOhXEhZ
         n89driuILg+9QQpHsHFJ56jzSS5h00VPrCwi2KqAEcWgPYWaFAwA7mSMImX1l97Uk5N5
         KKWyHuLNseLB9n8KOSKEa3CVvwiNq9oOwfKd460n1e5vpLItVOZz1C69xymHA3tMB/yL
         IO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R7Db3WiM7eTePvin6hhGgLhZAHl73gB8K0Fz7ZXiTbs=;
        b=A+Twlgsag5qVXk8nfesHReCQA8gGVa9+NbxAreFiN3bmPA7zzI8Xmz4HrxXcS3UiDY
         SdVeOqi4YYX9q16rbkSmb8MDvEfhw8RIHUfqJqmNzai7sDLrK4npOZnYY0da3mco7xIJ
         OYShtc9aeobOctJJ6T/xizLstvS0erXnGMDrX7oEJQ9Ca+GhgtSow0qM1gxLu5VbnmAJ
         WY0csDAgFFIxuWgnRfAauMpfMTYWTCMyOfwXHRDRQtCfmZ7xqbtfng81lg++6SuBBUaU
         EQGSoYRpBzyols5s/haR3euU8U6uP4srI3Fq9Bl7XjcU6AgyyskBN++Rqdtr0IZ84did
         9g3w==
X-Gm-Message-State: AOAM530O4pRJZmhfIiAstnUQB7eGodtIILR2C5zkX9iOt77xj8GgDjSG
	Fl9hOYQOa/4x9eAv4xqNx5XYgPPqFEY=
X-Google-Smtp-Source: ABdhPJwbz8F9LAi3LzQy9Ik46X2/aq0jpTqaNs1me1N3AFRkhjKSHroausf/FlUhqxkGH50rLavsKg==
X-Received: by 2002:adf:dec5:: with SMTP id i5mr20839119wrn.16.1591047929767;
        Mon, 01 Jun 2020 14:45:29 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:29 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/38] gfbgraph: initial add 0.2.4
Date: Mon,  1 Jun 2020 23:44:39 +0200
Message-Id: <20200601214516.26624-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a dependency for upcoming gnome-photos

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb

diff --git a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
new file mode 100644
index 000000000..8cc62240e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
@@ -0,0 +1,22 @@
+SUMMARY = "A GObject library for Facebook Graph API"
+SECTION = "x11/gnome"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5804fe91d3294da4ac47c02b454bbc8a"
+
+DEPENDS = " \
+    glib-2.0 \
+    json-glib \
+    rest \
+    gnome-online-accounts \
+"
+
+inherit gnomebase gtk-doc gobject-introspection
+
+SRC_URI[archive.md5sum] = "c38af63e49f8fe8baad99537956b69ba"
+SRC_URI[archive.sha256sum] = "6065391f35e7335588cc6b0cc4c1abbce7341488573a654551264cb9793b9379"
+
+do_install_append() {
+    # they install all the autotools files (NEWS AUTHORS..) to /usr/doc which
+    # is not a standard path exactly
+    rm -rf ${D}${prefix}/doc
+}
-- 
2.21.3

