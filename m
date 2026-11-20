Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1805.1795162109018878574
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2026 00:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RYlie6Dn;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38587f3de36so678253eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 00:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162108; x=1795766908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HvxW9WLJFuV3ZUJJLVd1ybhjPWRsf3o1+U4lA+L4l+Q=;
        b=RYlie6Dn2ts0gOU8N4Bo+Lz64j8MwaxAYwMhtli+11MatzEMBgwqyd+Pq2GgbipZKg
         tV/fFQBrqotGYkrnHAoMRiujBAXamNic/M0nkeukaZWDXnT1r7dafP40PCYNq1GDC+LO
         UlS3q36WtpvT/nCMVBkbCBX5zgo/ITiBgq4jY5AaxzGY1N3+uq1A6HVUpHuIkxFiHJiJ
         Pk6H6RPcn9FtHc/SAM+6oPkLvmB4gJ0r6d07mB7BFZ6ompsx3wPcRv0IdbL7dtU/4km8
         R7tlERA+z+BBjghcSqEZ0z97v44rG8GNWSHvypywQKJ/EgUQwZrma7StzDpjdXLLZtQ/
         EYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162108; x=1795766908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HvxW9WLJFuV3ZUJJLVd1ybhjPWRsf3o1+U4lA+L4l+Q=;
        b=BQVEM6gjRDflTYte+cCmsLxMpHq7qszSDoS6L2NKPfggFxQHuMXsdfWRr98wsgmLrD
         ur/cX0T9ZtEAOTqtYPMimv4TqtphH1fn3p8uHkMs2RYQuJb7nwt8vy1qgcRJHHN6A5jO
         Og/ARZkYabIXOWeBXniX96TVFtzwdmZrcJkXDzYm3xfNzgT+6eiSAsIR66xd+KUqXTaJ
         raFWsWvhBW3w3ePEfb+T2tk28L8EZ+VfJdCa9GmccFQdtJwhRb1ZcpQOKZ+c5hkdFOQy
         whRDyNae2Tz5dA9CPw1yFaRXIpZjZ09+ReTn5JkNeEYsvH7jHRASHFRt8WxY66Mi1k0f
         Ucmg==
X-Gm-Message-State: APuU4Z+48pPu0jyUKOMMjcWGk0zDJ9CR0uVdiPsGH1PeloEAI6/8BMQ7
	o7+TAiZk0dfX3JMbpWFbPu8SKNto5MNP4+ZFYfeipg8wQh66hIVZawpNYKnpBEJY
X-Gm-Gg: AZFdTZdIWbhdmOomxbvPAMy/09QgCNeR/Lf1ELbhM56Na19P29mC2szVH2iEs2UZZG4
	KP7fr/XeRYd3nzrSob0m8cNfDvO+rbzJ6sq+aPH6TokXe9PFoBR45lz9emzYbFS+YD5B+TTG765
	cZGsHUMpLrxvexYGrHzZfiQ3BfZ9O5TwIU1sGaUz0DLoWiXIB3byDjJhVoz8OeDyxF25tOpM1xw
	13YBW+TwD8Rbm59aCwBc++0TpWbQNCSC5ucdNjeT15agI/ejGSIhTopfjBTWHzpRE057UvaPPGV
	SwxJnwp3BcRoB9YDoGSuLF2YY/MtmwHojHmAvA9Npe1CKNFfQlpF8aDuVWS421CptVUYftzNw6g
	Y8GxbfK4ErJ6jTqqKqsQjzUbQS1kQJeKZcovwZJ3QZ/bCJGFmX9nRmUfntoY8P+aQTI93eDnTVA
	8UCQieKyQYi/vJzQpd3IKlYe1H1NiK8CK5AQ0QrUakQnWK4PyxVYHFd2yV7QoJpf2um0hpDXCzZ
	onydYhf5QaVbBILHf3KMiSy4yD5XXkQemGvADzLL3eUEGYynE2af5oUbFb2LLwsfA1/XkqegTnK
	2sbb4GhsNPQikrirpSGNdkIV9gpDMCLN062pmyqIM5ZNi2nX9fn7jcCUYxXzNsEPUKUkQaaZUKw
	XF/UnTkG1L12VTXeuy5fgxO6p670V/IG5GqaUDTCcMvF1e9W88dDrwgzfMBIETIfPA6fuXAtVOf
	AImBelAkD6BfropiJoOX9X+fetIql+ULZ46ahgmpTqLlP5yKLYYW0HwVSAkDO4EudJ2Vama3gmF
	yZe24JSvk7zIgsN2UO5fAyE3FHoC3l3Lxhse3gkpJpcwRoYtE2JqKKCmBeNcnEXUYCQAJ4xjG92
	sD6a
X-Received: by 2002:a05:7300:dd0c:b0:36e:3ebb:7ef3 with SMTP id 5a478bee46e88-3857093f95emr1698676eec.39.1795162108101;
        Fri, 20 Nov 2026 00:08:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm5947954eec.14.2026.11.20.00.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:08:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 4/5] librust-cxx: Install crates from cargo's new build-dir layout
Date: Fri, 20 Nov 2026 00:08:20 -0800
Message-ID: <20261120080821.1085842-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120080821.1085842-1-khem.raj@oss.qualcomm.com>
References: <20261120080821.1085842-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 08:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132768
Content-Type: text/plain; charset="utf-8"

Since cargo 1.100 the new build-dir layout is always used: compiled
crates are placed in build/<crate>/<hash>/out/ and deps/ is no longer
created, so do_install fails with:

  cp: cannot stat '.../release/deps/*': No such file or directory

Build script OUT_DIRs live under build/<crate>/<hash>/out/ too, so only
pick up the .rlib and .rmeta files from there.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/librust-cxx/librust-cxx_1.0.205.bb   | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.205.bb b/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.205.bb
index 695f9b4043..7a2788cb83 100644
--- a/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.205.bb
+++ b/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.205.bb
@@ -26,11 +26,9 @@ require ${BPN}-crates.inc

 do_install () {
     install -d ${D}${rustlibdir}
-    # The cxx deps directory also contains dependency files (.d) generated
-    # during compilation. These files are only needed for incremental builds
-    # and are not required when installing the cxx libraries.
-    rm -f ${B}/target/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/*.d
-    cp ${B}/target/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/* ${D}${rustlibdir}
+    install -m 0644 ${B}/target/${RUST_TARGET_SYS}/${BUILD_DIR}/build/*/*/out/*.rlib \
+                    ${B}/target/${RUST_TARGET_SYS}/${BUILD_DIR}/build/*/*/out/*.rmeta \
+                    ${D}${rustlibdir}
 }

 BBCLASSEXTEND = "native"
