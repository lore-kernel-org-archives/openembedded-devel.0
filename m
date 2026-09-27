Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BD5C98332
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 15:51:36 +0000 (UTC)
Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38792.1790524296027142764
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 08:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TMDCBwY0;
 spf=pass (domain: gmail.com, ip: 74.125.229.12, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664c2da6so1793877eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 08:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790524295; x=1791129095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8fRScNc5WOUI7O+VTyvxd/NBhadbcOMsouSt0XqM3+c=;
        b=TMDCBwY0yCrXhnsiD98VH3NeRILJIPjtHcBY47g3CiCu5pI4P57pLXW58OK2LWBacF
         rWNNyDeQzzIWuSF5kw/l7yQXzYlfFvyr/N8dp5/jem6tnkDFORXCapKa2X/vu9EYdaf0
         W0xk31v32IQhdsvn4KR/qYLXcIRGjbSfwxOq5hBNGR8oO//f0Q2mBZo2xIjQtXjztJ2/
         BabXNtmYhQiv3lF2W3VYHiMiAdfzS4P98UtIWH1BFn31iKClqF1c0h4FF+7r1XNetL/n
         6DiFxBg3Ouyq6SCNnebc/eHOIOeGAsV0LySEd1GYi8JqZYgWebAyttN5JfWXW0fbq68C
         7Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790524295; x=1791129095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fRScNc5WOUI7O+VTyvxd/NBhadbcOMsouSt0XqM3+c=;
        b=2fm82V4xrwnIIpqnYgwwwuHPUTKwQ5n0jkn9CHgpNZN+wFhsHru+ARMwU7avTt5Oq5
         3L4MBxt1OgAavmsWDRz2tLF7vyKoGjTKcAW2eqgMow6RdJFFkxqalu/YQpRXAPTAQUua
         mCj6KMRsL8NVXRMcdgMNPlAC/cvQ+OuWlxwV/UezBBAIdswZVhjpUC7Nra8b6CsEnnE6
         algZJS0VKJeS4pCOt1Mv0kMn9MRWJo6bi5/NrzQNXBdpZiLNfuxGLesj5X2CBRmAWXq+
         Et8dywTw5xWJJbKFsq3BeacMopdgNSSu7QAEemDOToX2bKYeWpr4/fnEe9DRfSm1OTyE
         NZxw==
X-Gm-Message-State: AFuF++nX3NnXWV9zuH3rbGlvreBfe9RHit7kzg2W1uMmb/PKYqF6ekl2
	7RP05mvE2xjKWjQolsUIgnL0j6+ecF0TCY9JdZRHCB+YXlmfyU2UinQhrJ3ZXf4Q
X-Gm-Gg: AYBFou15kl8I9GV4MJsWnT+4rSEfy/o8y1dc/YFg3yTvMv4CcTpuvyWomQqJDYUAWdF
	9cLhevn0IOHOPUfuz6zo/OhLDdc4q6ZN2GJYa/+MoVvw2klbk/r6TixBw4QScWp8fxigVQsWsMB
	Lc3MAwQAceuktT1aPX5ZYakkc31ykA0YDOZfnzVyaTK/e9s1LySIBD6wvMokQYyLe3feOY9W9Yi
	+IpWvPzQJHRyX7gDpnrPZOuii2EqW9JPC3GGl+5DD6fDRNnJn3ndMBSxXvLHYaGkTkajU/NDIC9
	FCsrRKexbm/1IXh3xGaNmi5q0Jfks+ELbbHqlz2kqlnF13lyP2+cqS/XsC5DZ7msklKaTch9rOq
	etHgrDJnkrFh0Ka5gCX246G62viKmyEwUPj0XH9Yjn8NofGrSPCaaa1g1ez0F2yFI79fahRnpKO
	j5jbvTe54th6rP8KdXoyDHJCwlv0S5VpjymL6F1kTokTyI3DcjDX/40hThJ5XHYTtHn3fLWwQy6
	9NSKAuu5pR+em5P9JCwITbCQL362CLJM5dojyFGZvkasYGxzGv6bhs8Wk3f8tKJN1aWbsfGyY3i
	cwzhtst/IO0ZmKw8D5VQ5tQ0Hgro964CQDL5VACJKxLWIBbXFDPxXqehh70NUurPVIh5qZbzDox
	qRDUyRIDN9Oc4uTmSf2bCM+9k2eA9zzc5y7Lege0xAoS/sSQdI8eT8pl+SjfRprCLRxQDlKyqSf
	YMtIPVchiRgPP/e9ieg61yRfOPk50B1hTdjVR4NpqaEvlAyUqr
X-Received: by 2002:a05:701b:281b:b0:143:8829:5fc6 with SMTP id a92af1059eb24-146cfec8563mr5675746c88.30.1790524295247;
        Sun, 27 Sep 2026 08:51:35 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c3f8sm18790849c88.3.2026.09.27.08.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:51:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/3] live555: Install a pkg-config file
Date: Sun, 27 Sep 2026 08:51:30 -0700
Message-ID: <20260927155132.1277867-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 15:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130372

Upstream ships no .pc file, so consumers have to hand-code the include
directories and library list. Newer v4l2rtspserver only looks for
live555 through pkg-config and otherwise downloads its own copy at
configure time.

Generate live555.pc

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/live555/live555_20260112.bb    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/recipes-multimedia/live555/live555_20260112.bb b/meta-oe/recipes-multimedia/live555/live555_20260112.bb
index 9ea943328c..b6d2283527 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20260112.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20260112.bb
@@ -57,6 +57,17 @@ do_install() {
         install -m 0755 ${S}/testProgs/${i} ${D}${bindir}/
     done
     install -m 0755 ${S}/mediaServer/live555MediaServer ${D}${bindir}/
+
+    # Upstream ships no pkg-config file; provide one
+    install -d ${D}${libdir}/pkgconfig
+    cat > ${D}${libdir}/pkgconfig/live555.pc <<'EOF'
+Name: live555
+Description: ${DESCRIPTION}
+Version: ${PV}
+Requires: openssl
+Libs: -L${libdir} -lliveMedia -lgroupsock -lBasicUsageEnvironment -lUsageEnvironment
+Cflags: -I${includedir}/liveMedia -I${includedir}/groupsock -I${includedir}/BasicUsageEnvironment -I${includedir}/UsageEnvironment
+EOF
 }
 
 RDEPENDS:${PN}-dev = ""

