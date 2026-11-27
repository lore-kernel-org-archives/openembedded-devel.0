Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11769.1795762890516660380
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pRUKAzsg;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15dd124bbe7so11424757c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762890; x=1796367690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AI9GenLjTae+i23az1rj5B4ks2QvMeCYO4mniwNE3NU=;
        b=pRUKAzsghRGDugCGX283Ip1yamOwLSz+7lv7exFFq9fcJjcMsZI/IRmIb3YsGsvOKR
         q1h+ILjQeIHFJiHM8ejGQ+OOycyWS79b8Vtcu6p+PpevoHrrNVFILjz6IyuF5xVCJiRx
         QlVWwsnTICQFwcW/TN/QPPDReC8v8j6j7O/yaDxGndkZJR/na184q7IEDbL/JFZQ3UqD
         EKrtKO/gyDP0Gpo/z2t8Zza4cFeVkyBzTYzK93Y1obpHbyDcoEKr4OxY8vMQ7EVKXy3B
         nMXt7I9j6OW9njL2n+jOjuveQmFnQok7hbb1LJGm72eQvg4PVmhQL1eAgE0lmC608z7S
         VoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762890; x=1796367690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AI9GenLjTae+i23az1rj5B4ks2QvMeCYO4mniwNE3NU=;
        b=PfnmDcZ4BGJiXt3yQhErWjMww8adt5gQdVhMpmLV0glo82nce3bYFhVhlTLGz6NUlX
         7ft7t9RT21Vxcr9AkXCfDqjABS1KhqQ/K8QKZg2iGnPIdEcaLsgzv9Ur9+lfiP48rtyI
         lAEHSyOHDpISN100ibpfmvaZxmnarto/Xakzh5dqOL/fbp2BMPGvKQ/hi0di0snReWVQ
         OBubV4IVoNU00zs2WKBbOBvmcLHFzV7LU5nETol7Ub0CD+edi/LTwT2MiK7Y3HU6pub9
         smytDgOMEFzcsa4bbCOaf7wevNDdv1HhVh6umTYDtgUSiAJWZe4hOoKgd98WyiIviOR4
         IAmw==
X-Gm-Message-State: APuU4Z/N0XKw0PkYk88iKmqEdpikJlGmZ5KCKB05XXfMf/12sjxagkZy
	NODF1xmmsF1BaxL5wBjRww7nFmqPx3rjKrZ/XtQHZgKw4lzC3NUTFSW4zIfz7sWx
X-Gm-Gg: AZFdTZfHpA6YgTUeVSzG4LDNXrUJ6b4vq/heNUJHEpSZvokY+xeoxKAwCAJv2wyNMZG
	HuktzqvyB6b1lWxkAmDh1KdFSpBt4x25XZga7P8hQkPA6dM31EptaM+118Bpwra483Ev9pXh5NV
	mci3jk6cc7+0CHHfS10cn46HEM9lcsy1QUiwO/Ks1Ue+m0OhlUZnIUrK+nml0BvHHc1S2v7H3FW
	Y8rp20pZLaaa7BOYX/d4jYRZjExw8CjzrtlRgTveBZtDi1CaJB6Huv/y5oMyDYscCJ2aHf8Dd/F
	uI7m/K4QiQwwdA1fTNEd8yVuUMPEbrOzp0IuNRISsWzhCYZ9NwMIaf9J7+/3sZ7dYSvD0JXfm9L
	mUpG9rmf1TMnmrjlIrWLlyirHgvU0+WIQBcx25aGnfhJG5tvoddMdwBhln6vddLhZVyirrZIFC8
	+bBB1Dd8gCLHBcvcKZay+JYiWBMl6Rcjc/cA33/UpRog03Ez4nLMDtA4sUXOWIWluh26k26n0Kp
	kSiGUnaTH2/NQdugtWNu9Tw7iHKPxQH3cJ0RUBchlMD1BHatJ6RRGPttBB5A5xQ7unPGxHafPqY
	7vNp5GIKK1Z8oNa0aPpQAjw0LaPmipPBa+Xvnx9MFf8vYYRmHZzXAUI5HtCWG8wXluYhU4paqX1
	NoOblmcnvaaf3RLcRm6Hg/T5vWe0+px9aedxIdIYQpJA0s0Ju+dT1n98Kgrr36YyN2LDS+z/+nL
	5Lq3BUZgk7AZWbAbNtuyrkbzpYJ6833c5WsLGRljzCaHibiscRGgKo3DVY9NmfjYGLcBBK5o5pH
	FxRgv1lH8wUUvIO9liPmSAjfaenq9xyJZYwFgu78KbXS+dkRZ9Nml8u+E9HNz91Jbj+A+pEtLoE
	ypuJbr5DF8pHkQkR7AOT7zpxNQ==
X-Received: by 2002:a05:7022:e80e:b0:1b5:3b6e:e1ed with SMTP id a92af1059eb24-1b55690bcf3mr27485051c88.32.1795762889811;
        Thu, 26 Nov 2026 23:01:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61309643c88.13.2026.11.26.23.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 13/14] librav1e: Fix the upstream check
Date: Thu, 26 Nov 2026 23:01:11 -0800
Message-ID: <20261127070112.2273685-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
References: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133318
Content-Type: text/plain; charset="utf-8"

get_recipe_upstream_version() only looks at the first SRC_URI entry, which
was a crate from librav1e-crates.inc, so the check reported a crate
version (0.27.1). Set the git SRC_URI before requiring the crates file and
match the p<date> tags the recipe follows.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/rav1e/librav1e_p20250902.bb       | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb b/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb
index 13f417008b..00dbc7418e 100644
--- a/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb
+++ b/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb
@@ -5,6 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6a960f542b01a3e538903e87236b3668"
 
 inherit cargo_c pkgconfig cargo-update-recipe-crates
 
+SRC_URI = "git://github.com/xiph/rav1e.git;protocol=https;nobranch=1;tag=${PV}"
+SRCREV = "a2f01b3e233f531c28a20b4c29fb5c9e5d29fa6d"
+
+# Follow the p<date> prerelease tags, not the v* releases
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>p\d{8})$"
+
 require ${PN}-crates.inc
 
 CARGO_BUILD_FLAGS += "--no-default-features --features binaries,asm,threading,signal_support"
@@ -12,8 +18,5 @@ CARGO_BUILD_FLAGS += "--no-default-features --features binaries,asm,threading,si
 DEPENDS:append:x86 = " nasm-native"
 DEPENDS:append:x86-64 = " nasm-native"
 
-SRC_URI += "git://github.com/xiph/rav1e.git;protocol=https;nobranch=1;tag=${PV}"
-SRCREV = "a2f01b3e233f531c28a20b4c29fb5c9e5d29fa6d"
-
 # TODO we need to pass -fdebug-prefix-map to the nasm calls
 INHIBIT_PACKAGE_DEBUG_SPLIT:x86-64 = "1"
