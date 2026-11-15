Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10671.1794762004664293208
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 09:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=XmxWsMXu;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so3073779c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 09:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762004; x=1795366804; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VbTvCotWBENFiXu7ayCAs70VTeSaYY0/LWapk+x8khM=;
        b=XmxWsMXuxoCwY3WVEyfvGnFoTVnNJmTL7x4c7pTrydcNvktx1bVMjfgrDoQrqWDDUM
         HAak4VfA/6KBkG8LTm4IUxPADhN6zs51xy4AulSSXovDo2O0tEByohy0iljUYVS1+MkH
         g70w34UEnnCIWZZ5RYqsgNNVQvgN8qqnTjuekHpwnuiiiWZfWpi0aPNgP2zm/GqlfJj4
         16WK74xoMeNN2PpHgCu/eficahcsjXCyzcbWVMfBlKaWKKkYkeomJsxGNzq4nC2h1lao
         jBWu1g7x7nk97q7WiMmlJilngybfCJzu1GALTK8hoNsqpUQIZ57xnI8NvjwAveSIjkw1
         gRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762004; x=1795366804;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbTvCotWBENFiXu7ayCAs70VTeSaYY0/LWapk+x8khM=;
        b=rZitM4hpakCe4vdO+gAd/0+tx5XtkvaEImCBV4+OkMrW2PEKT61uPeUJ+yYYmkB62Y
         uofu3Rn0NEpkxIcnxklwo7iiMdNO7vNgPytq2p1IGTOviZY97YvjZAeNMcnT1KXUpW5Z
         R4qTFhTawebke6cNTgxYhJzJVhUKRpGzno7PV/f0FFuFvzZOmANhMM2jS3sUK7VzvleI
         wglbgEGJurrNDxRUJyTThimQG0k1IrUTN7Vp9jyuVlRlxVNWT288dWOneZWWtw9h3wQY
         TYrPq9XFWXZ2YgY1wKSimHj654CA6XP3003HY+1U/rbwkGC1yXsOdPMqYmgNFneRq8Nh
         tSVA==
X-Gm-Message-State: APuU4Z/gdzMqGbEJXIqBfgllOlN8veRFSKvdRv41fZBH+4j0IjBbgmy1
	gBJJ47QHtnLKDYgmWfqC0CWgPYN7kdTa42vMIq51c6mLh3SlHKNh+E+zFpXhhTS7
X-Gm-Gg: AYBFou0t7Gv+ScDJBWYEl86hk7uvikUwvF0+EjIQzXIA/BV160orRngusK9mgMsl8wQ
	9tlQcVgutm4Ze61fa8EdUl4mzFrQ+ktSAGvFR1s1tbkIHjL4Kjs6svH3JFTfmmGwWNaxpzvKziR
	lFMstyfOUGQIZ+5uASJkF+X8TyqrNiw2QSVfxE3GUP4T8/sn7skomQoRZE++XKF4CL4thzfFj2L
	cJ6DNDBgauT5zmAC9FEGQn9ll2CwQfmq7JpBCUaIDg/KAenE32mJ5JQHlLyDPR+d/ORHVKR/slX
	7EKDyy/OhCsz5KddLxFXVoBY3k4c/Ivx1bD7+VxPI4ApV4PVbY2Izqvdm3Xh1O4KSCz9Cy2SGoj
	eKjUzpMAV8pC3dOeBhlKuyojMzyRJDPGoo7cJoNinTzdrjm8DMyw15LxDzpfvY4J5pGNp3oqZoT
	8eMetRiU5UKOSPUnxYApyLZxbdb8enXD0G2kRKOiZBZlvMznu7vV5z46O/Igr4PhTN//D9JWK5V
	Ow8ig52QjeMYgUGJYaAVsr3qTWiGZUX8TXamCX3/c07LVwNjByCQ1OQBBOjZp0hrLwIf41AZANn
	AqK6c4zM6u6vBlgGhbQPKBpsCSenuTQl4bVpKqBeNHHCu4fwgIJOzT0AvAmiz1pP4hEk8OqfbOF
	/lSGPU8Hhoke91HrCLxWDiuhfbfgchB34oVUB6GjZkEtHMf5oIf3NRJLVq1ul2txWpoqfzG2nqc
	Ejo0X/VbSQsxmRQEs9hLwE/RhidCcG+IW7GasKlsIxo0eyd89P5BQcrl37DjYlCvpI8GgOOGzS0
	3dnFBPDrBeZHjGOxkeSel8Oqkpay3RuewBmRRJLwXKWGBt6prhsmi0WSJzt8RTOuVp9cK5gBoHf
	6rd0
X-Received: by 2002:a05:7022:ea81:20b0:155:7721:3a4c with SMTP id a92af1059eb24-1b50312b26emr7658924c88.35.1794762003815;
        Sun, 15 Nov 2026 09:00:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm29442397c88.5.2026.11.15.09.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:00:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 04/15] fdk-aac: upgrade 2.0.3 -> 3.0.0
Date: Sun, 15 Nov 2026 08:59:43 -0800
Message-ID: <20261115165955.3485789-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
References: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 17:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132370
Content-Type: text/plain; charset="utf-8"

3.0.0 adds a separate library, libfdk-xhe-aac, for xHE-AAC encoding,
which comes with its own Fraunhofer license (xhe-aac/NOTICE). Add that
license to the layer, list it in LICENSE and ship the new library in
its own libfdk-xhe-aac package. libfdk-aac keeps its soname.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...Fraunhofer-FDK-xHE-AAC-Encoder-for-Android | 96 +++++++++++++++++++
 .../{fdk-aac_2.0.3.bb => fdk-aac_3.0.0.bb}    | 13 ++-
 2 files changed, 106 insertions(+), 3 deletions(-)
 create mode 100644 meta-multimedia/licenses/Fraunhofer-FDK-xHE-AAC-Encoder-for-Android
 rename meta-multimedia/recipes-multimedia/fdk-aac/{fdk-aac_2.0.3.bb => fdk-aac_3.0.0.bb} (61%)

diff --git a/meta-multimedia/licenses/Fraunhofer-FDK-xHE-AAC-Encoder-for-Android b/meta-multimedia/licenses/Fraunhofer-FDK-xHE-AAC-Encoder-for-Android
new file mode 100644
index 0000000000..d529786ef4
--- /dev/null
+++ b/meta-multimedia/licenses/Fraunhofer-FDK-xHE-AAC-Encoder-for-Android
@@ -0,0 +1,96 @@
+
+/* -----------------------------------------------------------------------------
+Software Copyright License for The Fraunhofer FDK Extended High Efficiency AAC
+Encoder Software for Android
+
+© Copyright 1995 - 2025 Fraunhofer-Gesellschaft zur Förderung der angewandten
+Forschung e.V. and Contributors
+All rights reserved.
+
+1.    INTRODUCTION
+
+The Fraunhofer FDK Extended High Efficiency AAC Encoder Software for Android
+("FDK Extended High Efficiency AAC Encoder") is software that implements the
+encoding of digital audio according to the MPEG-D Unified Speech and Audio
+Coding (USAC) standard and MPEG-D Dynamic Range Control (DRC) standard. This FDK
+Extended High Efficiency AAC Encoder Software is intended to be used on a wide
+variety of Android devices. It is technically not suited to encode content for
+digital radio broadcasting services, including DRM and similar standards.
+
+Patent licenses for necessary patent claims for the FDK Extended High Efficiency
+AAC Encoder Software (including those of Fraunhofer), for the use in commercial
+products and services, may be obtained from the respective patent owners
+individually and/or from Via Licensing Alliance (www.via-la.com).
+
+Fraunhofer supports the development of Extended High Efficiency AAC products and
+services by offering additional software, documentation, and technical advice.
+In addition, it operates the xHE-AAC Trademark Program to ease interoperability
+testing of end products. Please visit http://www.xhe-aac.com for more
+information.
+
+2.    COPYRIGHT LICENSE
+
+Redistribution and use in source and binary forms, with or without modification,
+are permitted without payment of copyright license fees, provided that you
+satisfy the following conditions:
+
+You must retain the complete text of this software license in redistributions of
+the FDK Extended High Efficiency AAC Encoder Software or your modifications
+thereto in source code form.
+
+You must retain the complete text of this software license in the documentation
+and/or other materials provided with redistributions of the FDK Extended High
+Efficiency AAC Encoder Software or your modifications thereto in binary form.
+You must make available free of charge copies of the complete source code of the
+FDK Extended High Efficiency AAC Encoder Software and your modifications thereto
+to recipients of copies in binary form.
+
+The name of Fraunhofer may not be used to endorse or promote products derived
+from this software without prior written permission.
+
+You may not charge copyright license fees for anyone to use, copy or distribute
+the FDK Extended High Efficiency AAC Encoder Software or your modifications
+thereto.
+
+Your modified versions of the FDK Extended High Efficiency AAC Encoder Software
+must carry prominent notices stating that you changed the software and the date
+of any change. For modified versions of the FDK Extended High Efficiency AAC
+Encoder Software, the term "Fraunhofer FDK Extended High Efficiency AAC Encoder
+Software for Android" must be replaced by the term "Third-Party Modified Version
+of the Fraunhofer FDK Extended High Efficiency AAC Encoder Software for
+Android."
+
+3.    NO PATENT LICENSE
+
+NO EXPRESS OR IMPLIED LICENSES TO ANY PATENT CLAIMS, including without
+limitation the patents of Fraunhofer, ARE GRANTED BY THIS SOFTWARE LICENSE.
+Fraunhofer provides no warranty for patent non-infringement with respect to this
+software. You may use this FDK Extended High Efficiency AAC Encoder Software or
+modifications thereto only for purposes that are authorized by appropriate
+patent licenses.
+
+4.    DISCLAIMER
+
+This FDK Extended High Efficiency AAC Encoder Software is provided by Fraunhofer
+on behalf of the copyright holders and contributors "AS IS" and WITHOUT ANY
+EXPRESS OR IMPLIED WARRANTIES, including but not limited to the implied
+warranties of merchantability and fitness for a particular purpose. IN NO EVENT
+SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE for any direct, indirect,
+incidental, special, exemplary, or consequential damages, including but not
+limited to procurement of substitute goods or services; loss of use, data, or
+profits, or business interruption, however caused and on any theory of
+liability, whether in contract, strict liability, or tort (including
+negligence), arising in any way out of the use of this software, even if advised
+of the possibility of such damage.
+
+5.    CONTACT INFORMATION
+
+Fraunhofer Institute for Integrated Circuits IIS
+Attention: Division Audio and Media Technologies - FDK Extended High Efficiency
+AAC Encoder
+Am Wolfsmantel 33
+91058 Erlangen, Germany
+
+www.iis.fraunhofer.de/amm
+amm-info@iis.fraunhofer.de
+----------------------------------------------------------------------------- */
\ No newline at end of file
diff --git a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.3.bb b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_3.0.0.bb
similarity index 61%
rename from meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.3.bb
rename to meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_3.0.0.bb
index 1168161a93..22fd88f9fc 100644
--- a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.3.bb
+++ b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_3.0.0.bb
@@ -7,15 +7,22 @@ for digital audio."

 HOMEPAGE = "https://www.iis.fraunhofer.de/en/ff/amm/impl.html"

-LICENSE = "LicenseRef-Fraunhofer-FDK-AAC-Codec-Library-for-Android"
+LICENSE = "LicenseRef-Fraunhofer-FDK-AAC-Codec-Library-for-Android AND LicenseRef-Fraunhofer-FDK-xHE-AAC-Encoder-for-Android"
 LICENSE_FLAGS = "commercial"
-LIC_FILES_CHKSUM = "file://NOTICE;md5=5985e1e12f4afa710d64ed7bfd291875"
+LIC_FILES_CHKSUM = "file://NOTICE;md5=5985e1e12f4afa710d64ed7bfd291875 \
+                    file://xhe-aac/NOTICE;md5=096ee69e4afc742d2f471c565d72ebb5"

 SRC_URI = "git://github.com/mstorsjo/fdk-aac.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "716f4394641d53f0d79c9ddac3fa93b03a49f278"
+SRCREV = "a68a51aa45d86a43c7b228e3d45624af09dcdd8d"


 SRC_URI[md5sum] = "fef453b5d6ee28ff302c600b8cded3e7"
 SRC_URI[sha256sum] = "07c2a64b098eb48b2e9d729d5e778c08f7d22f28adc8da7c3f92c58da1cbbd8e"

 inherit autotools
+
+PACKAGES =+ "libfdk-xhe-aac"
+FILES:libfdk-xhe-aac = "${libdir}/libfdk-xhe-aac${SOLIBS}"
+
+LICENSE:${PN} = "LicenseRef-Fraunhofer-FDK-AAC-Codec-Library-for-Android"
+LICENSE:libfdk-xhe-aac = "LicenseRef-Fraunhofer-FDK-xHE-AAC-Encoder-for-Android"
