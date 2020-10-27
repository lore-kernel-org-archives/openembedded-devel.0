Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.12404.1603796870341714944
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2020 04:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=alha51lm;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id k18so980165wmj.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2020 04:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ib56n2XVjmKTCXrtAjIqtkkrBnhJuszHIWBQflOrNco=;
        b=alha51lmf287syzz1RwOj1qaO93mVTp3Ddk+yT1zpWTFhZkHYDF/uqpTnPZjUsRbuQ
         BnJuJgfATM3y11i2wUtSJF2qpPLjMjDRldrGN5TyMHeZGAoqumPLS7GAaWYOokbdBAx+
         jNErTBGev+iae1lc6rgFl6D5I44cDCv9EbTqbzG1iCsZGdUfb4V0ifPi+gNiUpaHfgQK
         t4hCfwmwNzqmeEV0iqKn/BCUTXjnvgSp3mz6dMoBW70lIDy8Rgx2mway7PCDFHpZEOcs
         ZFcGcXmcFVMsCqt/9zYyF00tMnou1+0yfKFHGt1pmDdB8g9L51VCF58vfByfCsdWMhGM
         ZcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ib56n2XVjmKTCXrtAjIqtkkrBnhJuszHIWBQflOrNco=;
        b=MIrCm5XBgMD1vu8oBJka25wzdu8HeoD4HipQP1cBZyMqG6T5YcY51IZQOicw8oSuCk
         Q0oDHYEKXYjIzzA2gnyPDLLuQWdnvIcXzuHvFR7N6OfQFyRPTMvcVIj3Gq5emh8jkvmL
         kCZbILPDKOi+TIZ3yfaCj3yUzuJXUw3+fFOJaw5ApAQDdDkECliG2xdmcGiFj9sU/BW/
         g1rvsXCq4ezrXXxjLNulnTzWWkiR+2VVGWWUffL8T87HHgimT3dq57YkYWixEep2RRUs
         TFqk42+TmfN1VbUWhRF3Whm2Qjlb+7Y8Riuraz9ME9MkByXyYBwI1UCmiglDtEiBmM7m
         9/Dw==
X-Gm-Message-State: AOAM531EjOzLQV/Fn7gXCmo69+Fp8Le0S7/OGKJl+W7haOjb25kkmQ4k
	TeA4uTZAyM94YI6trqw//kTu0voxNeIn0Q==
X-Google-Smtp-Source: ABdhPJxPBPdxwmc4dKKzx11eBEfjqK10FxYpFE50XmDVQkWP9H0mf96ierVs4H/ca3VDEXNrImbL/A==
X-Received: by 2002:a7b:c00a:: with SMTP id c10mr2104861wmb.119.1603796868492;
        Tue, 27 Oct 2020 04:07:48 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id d3sm1235559wre.91.2020.10.27.04.07.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 04:07:47 -0700 (PDT)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] Add new recipe for squashfs-tools-ng
Date: Tue, 27 Oct 2020 11:07:45 +0000
Message-Id: <20201027110745.3367863-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

The main difference with squashfs-tools is the availability
of a shared library and a programmatic interface, rather
than just command-line tools.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
Rebased to meta-oe from oe-core as indicated.
Added back zstd in the default configuration since it's available in meta-oe.
Added to devtools package group.

 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 .../squashfs-tools-ng_1.0.2.bb                | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 72421f29f..4d86ef977 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -275,6 +275,7 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     python3-distutils-extra \
     rapidjson \
     sip3 \
+    squashfs-tools-ng \
     uftrace \
     libxerces-c \
     xerces-c-samples \
diff --git a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb
new file mode 100644
index 000000000..6e2606be6
--- /dev/null
+++ b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb
@@ -0,0 +1,32 @@
+SUMMARY = "New set of tools for working with SquashFS images"
+SECTION = "base"
+LICENSE = "GPL-3.0+ & LGPL-3.0+ & MIT & BSD-2-Clause & Zlib"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=c0de2c0aca56349dab98e97992316f7e \
+                    file://licenses/GPLv3.txt;md5=1ebbd3e34237af26da5dc08a4e440464 \
+                    file://licenses/hash_table.txt;md5=874823605326caeaabaa95bfbd0f9fb0 \
+                    file://licenses/LGPLv3.txt;md5=3000208d539ec061b899bce1d9ce9404 \
+                    file://licenses/LZ4.txt;md5=ebc2ea4814a64de7708f1571904b32cc \
+                    file://licenses/xxhash.txt;md5=f042a9be092bd6d7fe6f217d8d00f4ca \
+                    file://licenses/xz.txt;md5=1c389b9610ccfdb25f7abaea6a0bb5a4 \
+                    file://licenses/zlib.txt;md5=ae27c72096606131f760e5f59cf98b06 \
+                    file://licenses/zstd.txt;md5=8df8137b630239cbdd4c0674124cb0c8"
+
+SRCREV = "b96f0fc154feef531be76034bf6e38925636146f"
+SRC_URI = "git://github.com/AgentD/squashfs-tools-ng.git;protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= "gzip xz lzo lz4 zstd ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
+PACKAGECONFIG[gzip] = "--with-gzip,--without-gzip,zlib"
+PACKAGECONFIG[xz] = "--with-xz,--without-xz,xz"
+PACKAGECONFIG[lzo] = "--with-lzo,--without-lzo,lzo"
+PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4"
+PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
+
+PACKAGES =+ "libsquashfs"
+FILES_libsquashfs = "${libdir}/libsquashfs*${SOLIBS}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1

