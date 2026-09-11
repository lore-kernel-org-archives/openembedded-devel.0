Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66507C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:41:26 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41062.1789137685486042426
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 07:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PFEkRZ1y;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: raj.khem@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb750so952836a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 07:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789137685; x=1789742485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=myHoCbeo30UdBc0wg/IZI3NNFoS+ukd8ilf41M9YsX4=;
        b=PFEkRZ1yJ2BolWsW2m9v9/tOL/ndWK1i4njfcnXarjothSFizfgJRpDC9Eja4bcqLL
         gf3FoXkFLntL/emw4UCiQncwtlgPCm1qc3S8c23wNUEk/UqmMM9VModbTRMB/HatmpEj
         CKtRo27lQ5RiDFkurFjLI4YufH4BwKr4wldf9yWLwoPnoBoqNMQ8GTaAYw+WQb2S0NZU
         kdxp5XzIxA/lX2XTx46w+965uqhIQZ51EwLP17HSYdFMWESE5QS4AZbAj9Pria2nc1d5
         k3ENRh4d2QPRZqKvk+YdiXD5owIxbdAvvVnZeTJmRr9nZ+wad4E6ESp+8Nn0wqvE8Wv1
         Dyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137685; x=1789742485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=myHoCbeo30UdBc0wg/IZI3NNFoS+ukd8ilf41M9YsX4=;
        b=j1LWnIiwh8x1CPkdOIbrC7XVAeIyMnAFoP2Wbt1KkS9qJ5TKRS9mahbdwKhJMOgzAG
         ccPmz1HBlvqwQagP9x+DNU4ZcTXNDWwCa2CwomjZ7+IAp+Xct6Hs1Hkjr5tvVetaoUM2
         a7tWyxJs4gbbiHZUHY4gVTZrSZR21H+BYO3GgDvcplJx3qcyLE4RFfTqndqMx05tY6EU
         tc+BgZQ+xM6JPoYn/uXOLcUXbAMAKGwLmuQsN14tOM6bVGKDWpP1dXvPe183oBbYj6+y
         NZisRzaBwLXJupoVrGbB4o8AvKkbeGx+H2UOIIKEMUD1zU8iJhuim0r4j0mIhts9q82L
         KFpg==
X-Gm-Message-State: AFuF++nKaZkAMC+nQynmeIraxmvHUkU9zf9YfwRpyw0R5j5HEtFZWD3H
	E1u6YBV69922FZdAYevnvUVVvNzFf+T/H/uj328UJAk+AI4J7OCfzm4PUxtVyw==
X-Gm-Gg: AYBFou1yno/lv++BGK/0pXXGbpc3UvzI81Ji199trmZOddu1G+p5ScVoyEdmfmti3aX
	Ud00s3c8YObIy1w1kCj46lFbE9PqtGBMNyUVQHUk7j1bvNhCGHGG3Psyc4rHwmJCgL9fTIR8Bya
	6cxOhKuau/vCx+TxPsgb1SOyDf+hrL1ebfe1YZj+12UDsZig5ZULNeNU0XCxK2qJBMYXgSu01S1
	xkMMov1//GC9Aq7KP+9l6ibeXej81kEIxfkdJv8QCl78OO49+iOvVXOycw4zwmhFthdg3MDwmZp
	2GVDf4unCpR72SMmv4v1+KgyXvUPKw3i2i8IgmreTNgSqBD/2tlQaFSptWXRr8hDrveNioM2f2B
	88b6rVIcgdvybWzH7CqBGGXx92qyyWBDVwMP2E/wYVryY9f6pKdE2lS3KZeShJQIW/wDGLKgkE3
	fqe59tI4rHeUB9jkuAdATi+fgqFlNBiPcUNJSUmR+TWxzLeYPpxcdF7LWYPO2khJnxJee49rd5L
	I2NeYKltrj1IgPzNGg2g0+PkgXWVRL3njG6k1vJz1LtH31WIIBh/4HVn6eYd7EIYvO039sC5yby
	NNWGI1xAowJ9UHcpmBqBG/X2xa4boeKlru0Ld7G5nnWAU2Rea6WEc4bE1yYZ+2tPpCudvc22g5V
	grMxMuHOLdudE1GhBI593+4ginrmzY/JUcVNuwN7AUiA8rNgzB7sa1lZ+zys828vpFQU=
X-Received: by 2002:a17:90b:57ce:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-39d9c1dbb3emr8499502a91.12.1789137684728;
        Fri, 11 Sep 2026 07:41:24 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f739b5sm7183662eec.25.2026.09.11.07.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:41:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] opensc: Fix libopensc link picking up build host libraries
Date: Fri, 11 Sep 2026 07:41:21 -0700
Message-ID: <20260911144121.2278670-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 14:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129972

libopensc failed to link:

  x86_64-yoe-linux-ld.lld: error: unable to find library -lgio-2.0
  x86_64-yoe-linux-ld.lld: error: unable to find library -lgobject-2.0

  libopensc_la_LINK = $(LIBTOOL) ... --tag=OBJC ... $(OBJCLD) ...

with OBJCLD = $(OBJC). The ENABLE_CRYPTOTOKENKIT conditional only keeps
the .m file out of the sources, automake still picks the linker
statically, so this happens on Linux too. AC_PROG_OBJC detects a bare
"x86_64-yoe-linux-clang" with none of the toolchain options, hence the
link ran without --sysroot:

  OBJC = x86_64-yoe-linux-clang
  CC   = ccache x86_64-yoe-linux-clang -target x86_64-yoe-linux ... \
         --sysroot=.../recipe-sysroot -std=gnu23

Point OBJC at the full CC

Also fix floating gio dependency: opensc's
--enable-notify defaults to "detect" and enables glib2 notification
support whenever gio-2.0 happens to be staged in the sysroot by some
other dependency

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/opensc/opensc_0.27.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.27.1.bb b/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
index 05b7a58be5..a1930744ea 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
@@ -29,11 +29,15 @@ EXTRA_OECONF = " \
 "
 EXTRA_OEMAKE = "DESTDIR=${D}"

+# Point OBJC at the full CC, helps computing AC_PROG_OBJC correctly
+export OBJC = "${CC}"
+
 PACKAGECONFIG ??= "pcsc"

 PACKAGECONFIG[openct] = "--enable-openct,--disable-openct,openct"
 PACKAGECONFIG[pcsc] = "--enable-pcsc,--disable-pcsc,pcsc-lite,pcsc-lite pcsc-lite-lib"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
+PACKAGECONFIG[notify] = "--enable-notify,--disable-notify,glib-2.0"

 FILES:${PN} += "\
     ${libdir}/opensc-pkcs11.so \

