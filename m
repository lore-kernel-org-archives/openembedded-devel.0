Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AE1C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:18 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24366.1786747576197862084
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Hq2cBcSs;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1539011a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747575; x=1787352375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9KjjhWuNiwc+olKf6I5xYjiEKAl8wGqHNoR6oiknskw=;
        b=Hq2cBcSs7/hZUhg5QKwN4i36Y+k7jkEIxRAnjgtroYgfkusON/UqkbWTGMwAgO+FO7
         cKaIVqwG8eRyILHJMgV0z+QEKOT/0N6t5eyqoheNMj/MSmtKWNr9sxlDzg+xGwTmZa79
         fKP4cBuys33HGIUuqLhOsv+BgEGGRtGnBAdUjuJqRfnH4OkafiR8M+GW17b5QO4mUStn
         QCZgQAM5/pN3JoCw890qy5FnN9whML+9J1nwQACs1BW6cRoPB96V4KV1sbVdNuU9hjxB
         mdVEzFNWo8Nl51Y9fYli2ytZWa1qW/bDZhelRuO0u4Ga4NTCB+POnsfclIEcleYXsLoW
         uBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747575; x=1787352375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9KjjhWuNiwc+olKf6I5xYjiEKAl8wGqHNoR6oiknskw=;
        b=HTNp0RasmVUwgzdw9AHdJR0SghcEs/Dz0KgVjQ46+MVoBc/myWNHOK6jAePkJe4URW
         9FEbFHPkb6aEt+JRXofvWPSRw/q7aphK/BzCc2vlYkwL0RXz4QWDjezunJd9BV0rq+xi
         cGuel0tqMqFXr9s5DN3DuqRDI6pF646zgO6x2wlZhfGwIKm/+P/5NCH9YhGS6TBqF0/n
         1JFGFrQ+UcI8NGykrxi0nyuHCgP6qjnwafiqwwtV4IIqzkF67dY+c9/AVRN6QmDkegSQ
         mDKNnrgox9Ej30e/5tr3jwvuJbw6MSV2h540ylQDAZfzhO0GH5I31a+p7z3Nxf0M772o
         edkA==
X-Gm-Message-State: AOJu0YyxQYgb8icZWQhxmmH8I3NhU5g4X/9V4/DZjQ+lPH0pRNJkrTZp
	Yf79B6gtZm/3h8b8CYkBnxg0VGDVAvryrZHwf2nObzmtrhz3JNsSqIjyCCzGXQ==
X-Gm-Gg: AR+sD131J/LZbv5vVNUbEKnfVcx9B92VIRfEanaG+6I9Q6JZ3rAmcgb1xOU2+WR0zE5
	N2JvkDBNyPtgSvDWsy87dUaA+fPlFfDBPAGIcgcwQadfn99yuhWaoZTY0VvmlPTFNZlNBLS3vV/
	CkhlQCB4YlK6BAU/KvwSacUA73S18HTTrgj5qgS1Iv93Q2s1WuF7U+2iNngbV9ibQYk2IsXWNNi
	g5Q1ilK4eL1FiD+7ptk6/9RUsbH2WC/sd7+TzMLQKzCp5AmWEvFSGgwp1n/0dsKj+CyohOCR7cU
	t8Q2IUjtI0LQD+AqlVyyGtbIjMQYmnUcotcBHWmn/Q1ZnXD2MoKbjyQafMnzEVB7oYWS+0nnDIl
	ZxESCmOrDBEN2yyVhtoA0HKWEWIqGLtlHdc0fPSfMDW173fFDkdIDMv2/WnN1HBUrVezSCoCIbv
	o/Ia/IwKLidtn75rsnmtwlVWkUGQiXkBHAqNjSCWJrPb/h13uHsGT38N7NoaAKdtz4pJLoRrHop
	dzoUDR8a1ZbFYWgbrmFxyYEDlHNkBZ+DNwVpF00wsejflyWIKB2UBuDOghzE9kylm70MiM0UDGn
	O3NO1J/MM2alyoP+svihRwZH1PrRu6OBDSIWI0LW6hnkmE2+MMVVUgWFTF6B2BCqyOTUelx9Fqe
	RdNyDvUCTg+lIEeMaT2vxqjLbJRmnhcrD7AVnn/huuYzuXA==
X-Received: by 2002:a17:90b:5624:b0:38e:7f1b:efa with SMTP id 98e67ed59e1d1-3933e5c4f30mr10564421a91.11.1786747575544;
        Fri, 14 Aug 2026 15:46:15 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 030/109] libcec: upgrade 8.1.3 -> 8.1.4
Date: Fri, 14 Aug 2026 15:44:16 -0700
Message-ID: <20260814224539.1523174-30-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129094

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libcec/{libcec_8.1.3.bb => libcec_8.1.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libcec/{libcec_8.1.3.bb => libcec_8.1.4.bb} (96%)

diff --git a/meta-oe/recipes-extended/libcec/libcec_8.1.3.bb b/meta-oe/recipes-extended/libcec/libcec_8.1.4.bb
similarity index 96%
rename from meta-oe/recipes-extended/libcec/libcec_8.1.3.bb
rename to meta-oe/recipes-extended/libcec/libcec_8.1.4.bb
index dd118753cd..4513bf502c 100644
--- a/meta-oe/recipes-extended/libcec/libcec_8.1.3.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_8.1.4.bb
@@ -9,7 +9,7 @@ DEPENDS = "p8platform udev ncurses swig-native python3"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11 libxrandr', '', d)}"
 DEPENDS:append:rpi = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', ' userland', d)}"
 
-SRCREV = "bfc6a5fe0425d09f02e282f676113cc3150c118f"
+SRCREV = "0b7bb7bcb64ed256c9e427420e21247bb7fa20a5"
 SRC_URI = "git://github.com/Pulse-Eight/libcec.git;branch=release;protocol=https;tag=${BPN}-${PV} \
            file://0001-Enhance-reproducibility.patch \
           "

