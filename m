Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3806.1794728992551327037
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ThuyHelJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36f8cdd30beso3150400eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728992; x=1795333792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBHn+ciDdXBOlnWZ5GiRKOpkjQGaXKkP6kXhqmDHcKg=;
        b=ThuyHelJWOKBeHuGqH+B/TIbZ3XXfcw29noKk3BOmpW3gTwaoRUk2V4aSAvkwTTSpR
         pNXbt/psclcv/l6wR55OpOIUuPX0kMDHQWmaaQNB7la5s95ehbGWtuXwTfZYWTqSF8en
         Db7JY9hUKG3OewuQw+Nz2PbrZGTN02jhJpRUZMOCqI1HFlIv/rLFsCTTKPaq196KFTCd
         FUBRDObY2fryRL62aX8l+akRjqmw38Mfrt7IFZCzoB7CZjjswwtJ4UJ2mKqL21WwJcS8
         hm0c/7R4QWPr3WpTolOScFwuVmj6O7V/gcpIFy9ZT5U2i4qnYZ0CgboizivZdPaNM5s9
         sdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728992; x=1795333792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TBHn+ciDdXBOlnWZ5GiRKOpkjQGaXKkP6kXhqmDHcKg=;
        b=ANU4QqCrYUY7HHtJykveMh5MEt4GCr6r8l3Dsu2a8Yz42RGNxkitirhdMDdx6XHUGo
         oRiCI6BzJHDx7hS6gqktKGEqVYLtYKoUTmIQTgxB/ep2+4adqXmg1F6CPUWIqXq5uhU1
         /6ORnflYkwOjI7xpva8XQrOtV7/3+3NY1125Bj3+yUNp7LVcW4sbx5CH9qae20ZCboZv
         Jy803NKFut8sDfXqw9Cau+/n2MK0SxzIy7ZK43PryrD10ytSgJm28Xnc4Sau56A1Kd8l
         w2HjNQGI0poCcEXNcARvt8eZO4hkGKDAR3aD38G7ur47s+NzPP+tei5oNUqhUEuTWkqq
         0W1g==
X-Gm-Message-State: APuU4Z+bXPaMIx9yeVwd7KvGTnwD+3WzYnm78dZ8CHHssOhFvYTUNyQ2
	iSwCecp0SE+wNULR448lB0YfuiUiLfX4l4XcyanwRu/ZWfLw9+nmi2Rn3YVPXpqR
X-Gm-Gg: AYBFou0+xQzomUUEtKRElaUUcsMY6ArhJvHyq8xL/bLrXfRDsLiLgLkrssYjNxEAgb9
	O/xDqX+BeO7WpLQCsIH01VGPvDHjmlcQiQFMdpwSQn+A2Hg3ogY2KAo0iXeXGbHOqTcwFN5aOwB
	PJrM6JU2kXFfGmTRYV4F++N4HTtFk8yQnaCzfzwUefauZpki/KCxGe910HX9rlF11TX4uQ6ShQ7
	JaYSHcyx7JR+5mon8jkukLiC5nsv2vPY7hvUFppdYn5pU6DLyNXSmWt+6A934IH1fxXW8cMyvIZ
	MD94vH7J5U3Sl8kmVsBojj/XgMB3IzPDcxtmv0ke6g6KiB9sYR3KUpO9Ha37pcHkFlszP0MVWvx
	q+/epiqygf2jpPKQ61BsnA0V0Q4xqKn5HYIS33z+aJRn8Xm4NDB6jFJHc4U6r9jTo6tRB7DnZ/8
	rnvwiGXdF0fKxOIB7qpeCwIffyK4bJD+KhsfGblqv1kEBdkUXd67d9j56LvR78+0VTOI6gN+LZ1
	0VhFIqrAym1C7KC214YHbZhvBN6K4T5Zr9+SU364z/AFRLyR7hAMM7zGJ957WXPRVJl8KZQjCkt
	kNgMKjckqIFgfzrRMV4pmtxVTFSxNuSYgkyNPEiVysobFS/lvOrs3RwhregHd/QsX9ARcwYSyEj
	xfZaTp7HaqmhnO2W5r2NwrKVGZqJUmNWYU0jmNIKCxBFAiuS/D+8CJwTOFwHu8miuYccfTuSfum
	0RAGq1wEovw88phHr+vAEpXX5wJ2JC7yOBeJxYPdXljqNHvCL8wKNc00wBLQVcmJKcIruc6dhMd
	9mOeAaTQDLpkh33S7BwBUQnCI/MYEa5OfvTIAIB8pWYJRW9PSjVHmisAcYnsDzenFuu3c3xOi1k
	ge7w
X-Received: by 2002:a05:693c:2a0a:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-37965daa77cmr6452129eec.8.1794728991797;
        Sat, 14 Nov 2026 23:49:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 19/96] libcec: upgrade 8.1.4 -> 8.1.7
Date: Sat, 14 Nov 2026 23:47:57 -0800
Message-ID: <20261115074918.2932593-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132289
Content-Type: text/plain; charset="utf-8"

LICENSE.md now documents that the bundled AMD Display Library headers
(src/libcec/platform/adl), compiled in on every platform, are under the
Expat license; add MIT to LICENSE.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libcec/{libcec_8.1.4.bb => libcec_8.1.7.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/libcec/{libcec_8.1.4.bb => libcec_8.1.7.bb} (90%)

diff --git a/meta-oe/recipes-extended/libcec/libcec_8.1.4.bb b/meta-oe/recipes-extended/libcec/libcec_8.1.7.bb
similarity index 90%
rename from meta-oe/recipes-extended/libcec/libcec_8.1.4.bb
rename to meta-oe/recipes-extended/libcec/libcec_8.1.7.bb
index 4513bf502c..70a9bddd25 100644
--- a/meta-oe/recipes-extended/libcec/libcec_8.1.4.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_8.1.7.bb
@@ -1,15 +1,15 @@
 SUMMARY = "USB CEC Adaptor communication Library"
 HOMEPAGE = "http://libcec.pulse-eight.com/"
 
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=b3a719e97f49e4841e90573f9b1a98ac"
+LICENSE = "GPL-2.0-or-later AND MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7e2296699f9e8b8a60c83540688ae774"
 
 DEPENDS = "p8platform udev ncurses swig-native python3"
 
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11 libxrandr', '', d)}"
 DEPENDS:append:rpi = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', ' userland', d)}"
 
-SRCREV = "0b7bb7bcb64ed256c9e427420e21247bb7fa20a5"
+SRCREV = "d68c4b2c7b1e657be827856ec5d9ca90d8d988c7"
 SRC_URI = "git://github.com/Pulse-Eight/libcec.git;branch=release;protocol=https;tag=${BPN}-${PV} \
            file://0001-Enhance-reproducibility.patch \
           "
