Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3720.1795810343721776586
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 12:12:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sWu0imkW;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-497614c95f0so4832298f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 12:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810342; x=1796415142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81AqKGy+zwQmnfavH2PORgA0XZcyN0FLzFEAUDXjpGY=;
        b=sWu0imkW1qKiEzQ7k8PShXGyYicE780QaZDGacXBZpBZGzZV7mwcwM5BEEfWoEPq6Y
         Awkq6BO9/MbWh5MuMk+cedm2lqa83Z7Gnd/ao6gjBsMocm/clNsMYqOAlDPUSK5r598Q
         D9uFtEbEc/N3P4jGgHW//+JhY7j9Pi+leLzwljO2L6LqFTQaCEcIbVeVJQaDeteX1d3b
         AKStzOvDHCezvP+mceXUUo3SlK998b217zc2HU9Act1IQNe6vscOv75jfNzxkKmBQDcj
         GeayRBHF2DfMiJY4YHwYbUTPbl9roHaJX2vJM/jkV9k6ZfRQ0SYPMP9cpHYFvlMtayEd
         wFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810342; x=1796415142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=81AqKGy+zwQmnfavH2PORgA0XZcyN0FLzFEAUDXjpGY=;
        b=uVKrnaRlf2UCiNTpU+IIJ/GEcpb/ORq47JUYZRdg03fgkBfrKqRw25VLQtiIGHujXe
         qAzU8tJ3igH6lr6zpcBYM5Genog6HixCbTWD991UGj6lGMPdqVY9Fhjhfe2HVBzD2n9D
         BJaGmfrcqKKRlNLjh6Fgug2Qf/4KasxyFqiKZoUXkIKT3nW6usdGhTR2BhBir0bhTPpV
         FRLcNS30NtwejH0tkLgh+obUEnTRjxsQnVWY6ddimpuPYQ7yLZ5dmCxv2WOAFqsJUxZx
         BJCWixvsP+1xd//k6BMsVDxQceJc//5HFvLYhsxxbC2yOtQCY3C+7ETIbSt2WxWc1U3R
         671Q==
X-Gm-Message-State: APuU4Z9L4UF+CdGT9HF1CdY8CVAXrz5vODGmu0fiL4VbAqS9kDmwYyg/
	10H0zjYtsrj+Lj5wKIp3z6+e7iPaPJBpuBhtaHlvqs1FCkWwAFI6C9TbDcAAKQ==
X-Gm-Gg: AZFdTZdXsPI7aSIPTLXe0U10lSGsl8M51UVDivOr+JoptPHLENOjLUuNNPwGbGl62x8
	QQ1YKK0jACXKRMnDZxqR5z0namPrD1F+YeMg8Bg/oNIIFXB3aTeLH4RwHzKbQ3mrsWtLF5r040O
	u0vZyKxgurxIQI3QyO80SO0BZF1gmOIBvuWRDDbUQUJbDTcs4en8kw0v75PaP5QLp0mKnMevi+J
	S9DZbsl27KKjRF1aUCnnUOYl2NUcDulMMvvp2Q9ygaWcAcT1JiiXP1BKtusiO/HlImu2vEJEeut
	s0cvqX08XSaHl4NBUHnOq+aKutOhzhjnesPKMjU/V6Sn3NiVOJmLA9JPL0BcpK6fKMCc+DshELl
	HH5pVRF+ics6q5bdMTk6KVC9npkQXcS5Phs31IqcIPpOhHYcQOqgtenQ0wF1xIAy5291EKXXKIx
	nB10zL9OsyRwxi+VwoSOQGkFRCdn94spp3kiVnK2cPz634/Acycfrcl+6gXG1lPHPswf+5C2epc
	aWJlUbyJiYE5TsdwCS4b9CA1KqbLGEVBchwm38I4iGO54JWYY0JHBCPdrcItxvjmYqw7i5/pnWt
	ellg4sWS/6KYpP8TaBATLAA4ool//CS8dSJm69Yddjga0MhfJxBkn2FbT1IstdaEZA==
X-Received: by 2002:a05:6000:4812:b0:4a4:f86e:d90 with SMTP id ffacd0b85a97d-4abb5db5c7fmr47038863f8f.52.1795810341825;
        Fri, 27 Nov 2026 12:12:21 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm51460047f8f.29.2026.11.27.12.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:12:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/4] doxygen: move to oe-core
Date: Fri, 27 Nov 2026 21:12:11 +0100
Message-ID: <20261127201213.914864-2-alex@linutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127201213.914864-1-alex@linutronix.de>
References: <20261127201213.914864-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 20:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133386
Content-Type: text/plain; charset="utf-8"

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 .../doxygen/doxygen_1.18.0.bb                 | 37 -------------------
 2 files changed, 38 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 90446efaa0..adf9db1793 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -239,7 +239,6 @@ RDEPENDS:packagegroup-meta-oe-devtools = "\
     debootstrap \
     dmalloc \
     ${@bb.utils.contains("PACKAGE_CLASSES", "package_rpm", "dnf-plugin-tui", "", d)} \
-    doxygen \
     flatbuffers \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany-plugins geany", "", d)} \
     giflib \
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb
deleted file mode 100644
index a9c82be929..0000000000
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION = "Doxygen is the de facto standard tool for generating documentation from annotated C++ sources."
-HOMEPAGE = "http://www.doxygen.org/"
-
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-DEPENDS = "bison-native flex-native"
-
-SRC_URI = "\
-    git://github.com/doxygen/doxygen.git;branch=master;protocol=https \
-"
-
-SRCREV = "8e760943e5d9581a444cf327f43a0b4d20d29482"
-
-
-UPSTREAM_CHECK_GITTAGREGEX = "Release_(?P<pver>\d+(\_\d+)+)"
-
-inherit cmake python3native
-
-EXTRA_OECMAKE += "\
-    -DFLEX_TARGET_ARG_COMPILE_FLAGS='--noline' \
-    -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines' \
-"
-
-do_install:append() {
-    find ${B}/generated_src -type f -exec sed -i -e 's;${B}/;;g' -e 's;${S}/;;g' {} +
-
-    sed -i -e 's;^#ifndef.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED$;#ifndef GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED;g' ${B}/generated_src/mscgen_language.hpp
-    sed -i -e 's;^# define.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED$;# define GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED;g' ${B}/generated_src/mscgen_language.hpp
-    sed -i -e 's;^#endif.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED.*$;#endif;g' ${B}/generated_src/mscgen_language.hpp
-
-    sed -i -e 's;^#ifndef.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED$;#ifndef GENERATED_SRC_CE_PARSE_HPP_INCLUDED;g' ${B}/generated_src/ce_parse.hpp
-    sed -i -e 's;^# define.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED$;# define GENERATED_SRC_CE_PARSE_HPP_INCLUDED;g' ${B}/generated_src/ce_parse.hpp
-    sed -i -e 's;^#endif.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED.*$;#endif;g' ${B}/generated_src/ce_parse.hpp
-}
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

