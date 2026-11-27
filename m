Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10263.1795753007816206696
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=a4C2crfs;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2af4c8d00so7953825c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753007; x=1796357807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXBsWoBdmCubuoipMcDYP4yf5vJzGUPf8MORI7KSTEg=;
        b=a4C2crfsCm6pbWk9iM16+lqg29QCbtMOS+nBwiU4QydFhFojHDLQdOHAf/Ko/E+hhC
         heIquma8/2me02A+cv3DVla/1YiOl6TbQ8NGoRR9qAODolViHweOCuwm5SGVGRjGuIAb
         0Eueutc4GtHWuytAsiikds+LkltoaBFqzNh4YmCC4H/qin8VyG1/e7SWiEgZz1b0Qszu
         2At01zl8XIav2Gx5nMs3Ai+Dg5+a+rmJraG6hpGX1akGaQjZK2stnODzkjq7gN50UX1L
         vuYicqwsPFN8MteElqvUSSomuiwJKJTixFosmYzWjThpkoxGc07KDthHyW04G7pWcYJj
         EEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753007; x=1796357807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xXBsWoBdmCubuoipMcDYP4yf5vJzGUPf8MORI7KSTEg=;
        b=ZBskHxJ11uDdVJ4dxzmyU4/KPr7PaAmY6trLfsll1MEHb7g9aPblRsrPbCVH9qOoan
         CpzgmexlnUB6n78N4TBGcGEl5PjLmAodjdYbtzMECKxZmMBySFnxc7imjQD5CJV9NW/O
         O9fCEI1uGZDNAUOQDI35qonPGEUc2AYE3pTEc4ox0ExLwdnmC0UxqCCVgv2QnEpX5TA3
         SrSLuvfxEK0RB+ZHcsyXIzMZAjE25a8jdxZaq6C0p9cxccGk0Sh43sGkVNJplYB9GEN7
         FLauqFuxLdu9RD6++bO4vRQ6caEKHg4EoJyAkgSEOlxxCwxH4z18FuAnjEjL3OHdCBpH
         u7lA==
X-Gm-Message-State: APuU4Z/dPn7iCH/UI1Kmu0Q13tAJinW7RuMAjGPRL2aaykpEaeJ5uvEO
	mkJKLtoMJj4dNaRwCQY7VRgiSv3Bhax7eD6Jv/arILxCrdTRNggOrxtf7+YcGOFS
X-Gm-Gg: AZFdTZcQDU0DAvR8fyRGLmv+aWC7zZjNc/+m4lsmsClXpT1ihaOqHpmZ9ik3KcHNjJk
	TdHA0GE3FHLZq+WXBw5gNiCtWAf5zEWuoKx0+/FveMjIhJpwo8xZltoa/kcq8AjkdPLqExn8ls+
	+T8FvQusyHuVCZsQOR7rKWuJfwEBS0K1O+lYuoyQZjvdv/r8vzKsJd1IapFnCqwmlrDn2kQ/xtO
	Dt/xxEsXbUXVzR6eKiT5S8i2Gl6sl1IKO/3p/IA3ZyPtSEjlwqIXa0lhEqBUWGqfDqEXbD87F1N
	NorUDPf+FmmOaRWt5jOw7IiMlPapHQa65BQX6/q6js6DCw0TNte+t01Uy4KQNH6NvH9HzAbvkwN
	crajNr3k0lsIMO+sMvQuhmcHa0goGnpFsmESdGJ3EFzhZnUoHiS+rqM44dN8pD5Zkg1IcDGKfDz
	2EJ653coYbHj4tetYbpu06o1wVvABYBmePL4k3wRie9NDceOQha4XzJWB3Eb6u4jTzaiwSuoazU
	X1PkejYIApxZwRM0vcvFWn2PuzUb3vj8IdsWFxLVq+bNW/DQ/Bwqleo0YyxNvKI8LKoUcSiY6+4
	Ic7EKNeCSa8bEWY4oQGh/Ozohd5raAZ2nKrwBFNZGKjcJ/dNsBkmp59fZNIIZ5wzgKtacmePfWn
	EI4yXGlZrr7n9gN9FnsqjgmaajStbkNcGMA6DIgV+fPLFkmY73VD0dQb5ajQmeSQAojupUYlnou
	CdaKVpP0nyB9iuTfb3N4E42fu4SknXhXGqfyAlk5IcoUIgTOZK/tuKFMtVcEyMX6vuqGPrVPaFV
	YCoRLyoyiGfSCKATx6zd1/odRtcTW4WHpBZKkA0p9cUcEJfL9x3Znk2JmHe2Vg91p8ZfQ5s4mq4
	AqD6
X-Received: by 2002:a05:7022:2207:b0:166:b307:5855 with SMTP id a92af1059eb24-1b556688160mr33012228c88.0.1795753007187;
        Thu, 26 Nov 2026 20:16:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 28/32] python3-virtualenv: upgrade 21.15.6 -> 21.15.13
Date: Thu, 26 Nov 2026 20:16:10 -0800
Message-ID: <20261127041614.1775064-29-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133247
Content-Type: text/plain; charset="utf-8"

- Honor VIRTUALENV_NO_DOWNLOAD and no_download over download = true;
  keep version specifiers with commas as one value in
  VIRTUALENV_PYTHON; accept multi-line activators; fix bash/zsh
  activation with a pydoc alias defined.
- Stop the bash, csh and PowerShell activators from adding an empty
  PATH entry when PATH is empty.
- Harden permissions: owner-only app-data cache parents, read-only
  seed images in app-data, isolated custom-index seed wheels, and
  interpreter search path checks for copied POSIX environments.
- Run the pip seeder with the embedded pip matching the target Python.
- Wheels now carry a PEP 770 SBOM written at build time by python-sbom.

The build now requires python-sbom[hatch] with the python-sbom hatch
build hook, so add python3-python-sbom-native to DEPENDS.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...n3-virtualenv_21.15.6.bb => python3-virtualenv_21.15.13.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_21.15.6.bb => python3-virtualenv_21.15.13.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.15.6.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.15.13.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-virtualenv_21.15.6.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_21.15.13.bb
index 4f11ed9333..8414f67235 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.15.6.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.15.13.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36ef9437b761b314fa717c786c5ca460"
 
-SRC_URI[sha256sum] = "c8b65c7d206ca6ef18de9352c160b3f04f66fff9f6b0ec8fd31f14688eba52c4"
+SRC_URI[sha256sum] = "f3ad23551343034e613f9c4d8279f282958a19729f5fc2bcb758afcf95fe3a01"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
@@ -12,6 +12,7 @@ inherit pypi python_hatchling
 DEPENDS += "\
     python3-hatch-fancy-pypi-readme-native \
     python3-hatch-vcs-native \
+    python3-python-sbom-native \
 "
 
 RDEPENDS:${PN} += " \
