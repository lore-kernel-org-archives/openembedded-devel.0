Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7686.1795060356624966850
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 19:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vFaQpOME;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3ada81853so2053020c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 19:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795060356; x=1795665156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gmDxMr8E7xQ95mfwcI0ul2q+hZBY4NSw5m3noMi1C8=;
        b=vFaQpOMEfmNw2xB1jQaSUrgHfTGW0A7iIyaaYLTv2E51Yk42dvZpTZDkIGmERRPwdI
         uxuVi3CSKND7OtVpVWu9Zf7wqHLzQRAAMyuS2lY/3AdF8b+kLOxrXQptijPgVraVFfw+
         iiF38qq7438d55PJx7UQ9cis6dSJTeI4yLRUyT6sm0I1trcYYpqTFwi9PzZrX3pDASKG
         QM1RjIzA7J1pJ3rlzUDPnYnCF8hbnF7ywH22iBgwoQi6JnRT/RwdoaFdJTmvfMTdK1g4
         uEGtMzX1ZpIsfEx5H4xUxvNXc1nxazGybvnpOoH4V4H3KFTTgH4ivOdZuL0yfx/Jlk0U
         FhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060356; x=1795665156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gmDxMr8E7xQ95mfwcI0ul2q+hZBY4NSw5m3noMi1C8=;
        b=zGQTf0ureIWRoHyvS8mGmm5/UHvDeUzadsctz9IFiNlxVK42o3Nz1s+Gz3hCV5Gkbv
         X20D5R7vZ1H6JeNIUYhz+TyAbWkyFkrbY4TRBqM0gOcM4CwoXHel6MnbA6QKaaAs6S4+
         8RKO1tDifFyJG41dhpcbkIec/ZcounUFzar+YBwdOfqLa1s+Msvz+Nf1g9iP7v0G4k6+
         aghZZnDRg+uhVEekl+F6DfriAQ1wbbXTk9DImNAkgUGgETOBiNfMa8CJ1b0gIDknaJos
         opFECflRLnLMix5aB+VnMt4gbgvfwwN4aWVPnnVOwe6Ha7Kmnb9ONlORYO7bllAl6pUk
         rKXw==
X-Gm-Message-State: APuU4Z9PUcORRj/KzbKMG0lM6gc4jiSL1NkKxKRZHiLYfHG2I8rYtHEp
	v3qmrivKRzsVRlpZjDeLX4Lh5XctQPdZPkEnc+/vTBRTmxfcnAFsqxuntuTwsYO9
X-Gm-Gg: AYBFou1eQV17A3MfqZjEtdQUEMxrc7T/a/b7YXmb2zqd2kqyM40j5a9C6+dmBodkZer
	sZDb779BHHVLWAsiMG+51O4Eg1ulVXPMGolSeqk7RuaXBwgiQ1Qb1SfcdPMVrxyCCEDAFykGcrb
	vAM/MOAuJpnCVb+IHxfqgeLokcEmezpv/YJ+WcpTVByhhJ+H9ugH2cRmpmdHns3UemXssMbfWAu
	Ovc30dCWVEyXwdvId/GwtLNjFwew/j+2NwNHOJ3MC6ES8rA+1akgKAC0ZssDUysClfGdHShurN3
	P2mH+hoZlGa2exH2jDAAJ6NZezTdMuYwQzU8DCM+u8eWc8AwvgLBSmAP746xYjKLgUxxsEw8X7O
	WKB+HVynTxHnUr4VP96+69IHGJW80Y9XjEdjqgncl+TV1IwoEeVDI/tf6wdwWmyMkLvUSf0hJCt
	vwLutPcpH+/DaXtHSFMumNcweV1MzZb8UGXsRE+qaeFsSu2Dn0vp0AvkoyGXOTcJ3Mj/JbxW7MC
	n6RbUPsNPKVYkV3O9kHgr0+v6/V52+IM8DYEsYr5WoP4anl7S2m4Iurj8NAoeCbX9IAUblHLKCg
	2/rOw5CcBMPjmiOWyF2UOznle+EVuYxexLJITXEu9iZp4VbG5TeteFF6/T630KUsbYxTU7yLPXI
	qZCr0cwkkqIFoDt8z6/a1Nv/gXgfO/8UJDNwrFnch7f2jEpnREqNV+oXaCdEEmw0biO0w4xRAxP
	r4KdK8sGvioLUjRu1EoBlxVTyVjdZ//94XKFmqHH9kxVQwwJpCrxZzyNlsPyyvh/fYryQN3tync
	bcO0lFumX9rR7n2nn0ob7xGkedcidtbqc9piu5MLPkt8qlc59fbujecSpcFZzR4kldSnWQjJ/ih
	9q5z
X-Received: by 2002:a05:701b:2051:10b0:15a:4155:3d9d with SMTP id a92af1059eb24-1b543cf29c7mr4357820c88.31.1795060355885;
        Wed, 18 Nov 2026 19:52:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm15342139c88.13.2026.11.18.19.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:52:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 4/4] neon: Enable linker version script and drop stale map entry
Date: Wed, 18 Nov 2026 19:52:28 -0800
Message-ID: <20261119035228.1759400-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119035228.1759400-1-khem.raj@oss.qualcomm.com>
References: <20261119035228.1759400-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 03:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132669
Content-Type: text/plain; charset="utf-8"

configure's linker version script check links an empty program with a
script that assigns versions to an undefined symbol 'sym'. lld defaults
to --no-undefined-version and rejects it, so with ld-is-lld libneon was
built without the NEON_* symbol versions, silently changing its ABI.
Enable version scripts explicitly instead of relying on the probe.

neon.vers also lists ne_sock_writev, which has never existed (the API
is ne_sock_fullwritev), and lld fails the link on it. Remove it.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-neon.vers-Drop-ne_sock_writev.patch  | 31 +++++++++++++++++++
 meta-oe/recipes-support/neon/neon_0.37.1.bb   |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/neon/neon/0001-neon.vers-Drop-ne_sock_writev.patch

diff --git a/meta-oe/recipes-support/neon/neon/0001-neon.vers-Drop-ne_sock_writev.patch b/meta-oe/recipes-support/neon/neon/0001-neon.vers-Drop-ne_sock_writev.patch
new file mode 100644
index 0000000000..94f63cf299
--- /dev/null
+++ b/meta-oe/recipes-support/neon/neon/0001-neon.vers-Drop-ne_sock_writev.patch
@@ -0,0 +1,31 @@
+From ef1f415170cfbb891a04af68852c9ea85c63d2c3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Nov 2026 01:52:06 -0800
+Subject: [PATCH] neon.vers: Drop ne_sock_writev
+
+There is no ne_sock_writev() function; the vectored write API is
+ne_sock_fullwritev(), which is already listed in the same version
+node. GNU ld silently ignores the stale entry, but lld defaults to
+--no-undefined-version and fails the link:
+
+  ld.lld: error: version script assignment of 'NEON_0_29' to symbol
+  'ne_sock_writev' failed: symbol not defined
+
+Upstream-Status: Submitted [https://github.com/notroj/neon/pull/255]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/neon.vers | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/neon.vers b/src/neon.vers
+index c2a4dcb..ce5339a 100644
+--- a/src/neon.vers
++++ b/src/neon.vers
+@@ -3,7 +3,6 @@
+
+ NEON_0_29 {
+     ne_iaddr_raw;
+-    ne_sock_writev;
+     ne_sock_fullwritev;
+     ne_sock_set_error;
+     ne_sock_proxy;
diff --git a/meta-oe/recipes-support/neon/neon_0.37.1.bb b/meta-oe/recipes-support/neon/neon_0.37.1.bb
index 53790e6ac2..0516ca9be7 100644
--- a/meta-oe/recipes-support/neon/neon_0.37.1.bb
+++ b/meta-oe/recipes-support/neon/neon_0.37.1.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://src/COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a
 SRC_URI = "https://notroj.github.io/neon/neon-${PV}.tar.gz \
            file://pkgconfig.patch \
            file://0001-Disable-installing-documentation.patch \
+           file://0001-neon.vers-Drop-ne_sock_writev.patch \
            file://run-ptest \
            "

@@ -30,7 +31,7 @@ PACKAGECONFIG[openssl] = "--with-ssl=openssl,,openssl"
 PACKAGECONFIG[webdav] = "--enable-webdav,--disable-webdav,"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"

-EXTRA_OECONF += "--enable-shared --enable-threadsafe-ssl=posix"
+EXTRA_OECONF += "--enable-shared --enable-threadsafe-ssl=posix --enable-ld-version-script"

 do_configure:prepend() {
     echo "${PV}" > ${S}/.version
