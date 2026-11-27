Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8074.1795739703098756029
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mdS7HOe1;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso10174411c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739702; x=1796344502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlc+3/0Dz8z1u1l2gyv0Xk4rJGZmSYR2LBxRLi6PVqg=;
        b=mdS7HOe1aFEnSvWB0wWc5AePUrnGj0KcTXfRyES351TPouWndzZo+kokzbFdkC3N4K
         +KPlEU4sOBwD7RDrv30vk6X6S+7ATd787rjn9ySjOsJUxeO39n1RFuZYISm0AveCsd5Y
         drDHyeZrmJEC0JdRGOkEU2LGdCmPbI3qsqr0AFhjtKbUpjwlLy2bN/C4ri4yAfr3z9RY
         dO1mwmAeBuBZiJDZILpB53wqcd79MnD3qNtsb6q94UGwK4RUtUvju8Qvhu7lZ8ODpL7B
         FcaEFeyZZVmhvI6ynURVb+a7WHqdKSWpKa4UtShmCcsOGd00FVAzorqbSmNWPRblsOXx
         /dTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739702; x=1796344502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xlc+3/0Dz8z1u1l2gyv0Xk4rJGZmSYR2LBxRLi6PVqg=;
        b=T41bmjkIENxbj0yx/E1dGOIJxbGMRIouDTCw9MRB9zclkK1D08MBOaXK7HR20FZay4
         jrAEt7oc2RehQgx9vplLAqoy+qi+RumZAS4WkBYCeDa1QWq8HHIVAN6zMw+crmftgpTB
         dH59mzx/mjl7HNYZtpfb2LeR7aMNMKO4XAwPJdk8aQYNUwNuUcnpM+Sqv5DGjULVnGAC
         qjK5VavOmUDygKMSuhPaIK0jfladZR3UARNqjnfM2/JM6GFph7hWb3tt9u7JDH6mU5B1
         Pfy6ZddJ2jIctIy5C6Wg83buILWcZyhudbwixIyOVRwXGaCG53g8cA8c/oBVXHSerpMJ
         jX0w==
X-Gm-Message-State: APuU4Z/sxPUVIE5BmUXO9xlI8qJBNMi1TavOL8UM8qmgxG8gL6WoP5j9
	0K0iLDN/sMPlkK5zpdJgkyJBq//9DoSBggV+ztuHJW4PX9H/1X5XqoaK2ZoisYjH
X-Gm-Gg: AZFdTZc5s+OU62R0GuIR/bdwj+S4whm5hw5yY0FaU9rP/6TuxK15Ory32643cL3TeWv
	99mIBzkHyJVIlUdR9F8CsBEks026gE55jPPy769ptTZsZTjlIPuUNmxuqi3v1Vimb2M7L8x8zkP
	BCWNfkamRtg0evH5fD/ZtgRnGEkkORIJBPEV9KvOlYE0CYUep5cYyGkiBeJR/54RLsN9CXUFWS5
	AAOp+TsW4WxoJ7BOeRbUFSRsuXebzdf+kYJniqLwvSLrmclYeyeP9pewyzgrpEl2MzvuSx3sW5P
	ZfPSE/WlNuV+NHM2IvH2+b4ShHv6xgzIAze1U2rEz4CImsnFL248lObeVTCTCodpybHbAZ/Z2bA
	KrDf9qpK6mjD+PY+akiWuukgEqw2pnZQjjsLDdbpxlpMMpXeRKccIvObCy80UuXZLvFmkbDHpfe
	YtYJ9c6IsQGdk7QSYozI4vpTJSLIAJwKRZwy5CZTiwU8OMV+lrizpTRLqHjHeXfZ8sYFnGKpi3N
	I83NXVxnpA6By1Vufbcm6l1tCCFgUZ24jGsa/ylyxXaEKqhUR2TPKwkx0bo4JwiYA5iKV7BllUO
	f1Z2FBv8vB32Q3j1nPm0+e/dyp/3VdnInEISULVScLDtftuHrV7g24NolkqQQaERkfhXTNeG8ek
	f7iH8C36ybEYHtnJcl3+ULaYT45gLFIMWaSl15Y27ERors4DhkczE/CZaCCMhYOg5OPKjM2QR+N
	aUzpDk9eJChDjWjvQggL1LH68QdaGEpk4DmOmjMiJZP4AdQdqx2c9ZPImPW8qZPyMXa/RYZjJFy
	JbeMgU/cHzeVCVvlb/urPO+3G9mUzmOUrsO5DBUW5tvLOn6Zj2NiiZDhSnbBVLYtlWKgesx1c0G
	lFmdowRql3Xvg7eBU/y8hlVYHQ==
X-Received: by 2002:a05:7022:7f01:b0:1b2:490b:6fdd with SMTP id a92af1059eb24-1b5568aeb2bmr19207677c88.24.1795739702267;
        Thu, 26 Nov 2026 16:35:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 31/69] android-libboringssl: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:47 -0800
Message-ID: <20261127003425.2166632-32-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133131
Content-Type: text/plain; charset="utf-8"

The default regex split the Debian version at the + and reported
45. Match the full X.Y.Z+rN version of the .orig tarballs in the
Debian pool.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../android-libboringssl/android-libboringssl_14.0.0+r45.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb
index 4da1c89dab..bda290c99e 100644
--- a/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb
+++ b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb
@@ -17,6 +17,8 @@ SRC_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-external-b
 SRC_URI[md5sum] = "83d24d2f3136ba6a486b5464369b91b4"
 SRC_URI[sha256sum] = "f9223e8c15ad5d9e3f1cd50861f4c272658864661e2332bea5d60952aa0930cd"
 
+UPSTREAM_CHECK_REGEX = "android-platform-external-boringssl_(?P<pver>\d+(\.\d+)+\+r\d+)\.orig\.tar"
+
 # The Debian orig tarball unpacks to android-platform-external-boringssl-${PV}/
 # with the actual source under a src/ subdirectory.
 S = "${UNPACKDIR}/android-platform-external-boringssl-${PV}/src"
