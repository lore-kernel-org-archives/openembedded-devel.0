Return-Path: <scott.branden@broadcom.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 92FB16177F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:41:13 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id z12so51988pgl.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9ULtLh4OTERTjJoufRXFzR9djVxjiX6Nei3LLtusuLE=;
	b=Pi7X+G0zAVVCfE8wFoTg0OFiNTdJK+5DOkxVqMU907HnjKKPHqTCa0dXfJPvlCDsxb
	ErPFP7xIpgy+8ZjGaGp30Sv30E5wnBqBZw3oaCPZpXnyJ6ieWa3fFh5SKkeAoQ1jK0d8
	mbgcSstJuThErdnLuvIBzUMZpceOFVTKLNJfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9ULtLh4OTERTjJoufRXFzR9djVxjiX6Nei3LLtusuLE=;
	b=PMDLrfWY1wGll05hthTr3mvINIAV0rDr98tgXt1kz66sARukof9cMD9sfyl2OW0BlI
	gevRr9F4sLOp5gmQTciMMSf+O12LRm1doDsvxZP57MHcGBrsdiSNOC9bolDPgLUAmIfW
	/vtSdAUBQsGzYhrzo2V/mSO4Z9tEXzUOCVzLeQ4/4towb0HrE4jOJNHyzz6UFtJd57hn
	TbxgWr6SVKNgOZmnz/oNwctoJZiMmGCNUkB4HrXbw0QI06dda0laSQ82aBl+xiLlpAtE
	a+jwClkqpeSGCJgL/DOmsp3mT22cFyr4rZnB7NYYvdPhMjsjX9CpNAQfKYyIJH95Cfk+
	stsw==
X-Gm-Message-State: APjAAAWGl0xNhLwuAwORgp4IYzfVDivmOetABdIczFTFeRGUZQCfyKz+
	JxARf3aIYP8VWLRSizQRu1vZjv4dmldyBm1cHGu/1XvDu4qYUE3+RAkHllqr6kB0py6hOYsK9Ek
	wuDIr5xI/q3BA/63clPRM9/1xx8k3dXbpGxDXMMGNtcmSc3pgALteQ2qz4KrtRr215ANIDyirS4
	9alihKdYHdOTrluEksxAuO3AUoWVcp
X-Google-Smtp-Source: APXvYqwejkosH2XRFoTTWMC359JCBIo35fCJvtd6rsL6ETfLdtC3L6IlESKbFhBNtS+MYdDqBjupwA==
X-Received: by 2002:a62:1b4f:: with SMTP id b76mr297064pfb.163.1582659673922; 
	Tue, 25 Feb 2020 11:41:13 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	j21sm4058266pji.13.2020.02.25.11.41.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 11:41:13 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2020 11:41:03 -0800
Message-Id: <20200225194103.4581-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Mircea Carausu <mircea.carausu@broadcom.com>
Subject: [meta-multimedia][PATCH v2] fdk-aac: add initial fdk-aac recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Feb 2020 19:41:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mircea Carausu <mircea.carausu@broadcom.com>

Add Fraunhofer FDK AAC Codec Library recipe.

Signed-off-by: Mircea Carausu <mircea.carausu@broadcom.com>
Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 ...aunhofer_FDK_AAC_Codec_Library_for_Android | 92 +++++++++++++++++++
 .../fdk-aac/fdk-aac_2.0.1.bb                  | 22 +++++
 2 files changed, 114 insertions(+)
 create mode 100644 meta-multimedia/licenses/Fraunhofer_FDK_AAC_Codec_Library_for_Android
 create mode 100644 meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb

diff --git a/meta-multimedia/licenses/Fraunhofer_FDK_AAC_Codec_Library_for_Android b/meta-multimedia/licenses/Fraunhofer_FDK_AAC_Codec_Library_for_Android
new file mode 100644
index 000000000..05b32bdea
--- /dev/null
+++ b/meta-multimedia/licenses/Fraunhofer_FDK_AAC_Codec_Library_for_Android
@@ -0,0 +1,92 @@
+Software License for The Fraunhofer FDK AAC Codec Library for Android
+
+© Copyright  1995 - 2018 Fraunhofer-Gesellschaft zur Förderung der angewandten
+Forschung e.V. All rights reserved.
+
+ 1.    INTRODUCTION
+The Fraunhofer FDK AAC Codec Library for Android ("FDK AAC Codec") is software
+that implements the MPEG Advanced Audio Coding ("AAC") encoding and decoding
+scheme for digital audio. This FDK AAC Codec software is intended to be used on
+a wide variety of Android devices.
+
+AAC's HE-AAC and HE-AAC v2 versions are regarded as today's most efficient
+general perceptual audio codecs. AAC-ELD is considered the best-performing
+full-bandwidth communications codec by independent studies and is widely
+deployed. AAC has been standardized by ISO and IEC as part of the MPEG
+specifications.
+
+Patent licenses for necessary patent claims for the FDK AAC Codec (including
+those of Fraunhofer) may be obtained through Via Licensing
+(www.vialicensing.com) or through the respective patent owners individually for
+the purpose of encoding or decoding bit streams in products that are compliant
+with the ISO/IEC MPEG audio standards. Please note that most manufacturers of
+Android devices already license these patent claims through Via Licensing or
+directly from the patent owners, and therefore FDK AAC Codec software may
+already be covered under those patent licenses when it is used for those
+licensed purposes only.
+
+Commercially-licensed AAC software libraries, including floating-point versions
+with enhanced sound quality, are also available from Fraunhofer. Users are
+encouraged to check the Fraunhofer website for additional applications
+information and documentation.
+
+2.    COPYRIGHT LICENSE
+
+Redistribution and use in source and binary forms, with or without modification,
+are permitted without payment of copyright license fees provided that you
+satisfy the following conditions:
+
+You must retain the complete text of this software license in redistributions of
+the FDK AAC Codec or your modifications thereto in source code form.
+
+You must retain the complete text of this software license in the documentation
+and/or other materials provided with redistributions of the FDK AAC Codec or
+your modifications thereto in binary form. You must make available free of
+charge copies of the complete source code of the FDK AAC Codec and your
+modifications thereto to recipients of copies in binary form.
+
+The name of Fraunhofer may not be used to endorse or promote products derived
+from this library without prior written permission.
+
+You may not charge copyright license fees for anyone to use, copy or distribute
+the FDK AAC Codec software or your modifications thereto.
+
+Your modified versions of the FDK AAC Codec must carry prominent notices stating
+that you changed the software and the date of any change. For modified versions
+of the FDK AAC Codec, the term "Fraunhofer FDK AAC Codec Library for Android"
+must be replaced by the term "Third-Party Modified Version of the Fraunhofer FDK
+AAC Codec Library for Android."
+
+3.    NO PATENT LICENSE
+
+NO EXPRESS OR IMPLIED LICENSES TO ANY PATENT CLAIMS, including without
+limitation the patents of Fraunhofer, ARE GRANTED BY THIS SOFTWARE LICENSE.
+Fraunhofer provides no warranty of patent non-infringement with respect to this
+software.
+
+You may use this FDK AAC Codec software or modifications thereto only for
+purposes that are authorized by appropriate patent licenses.
+
+4.    DISCLAIMER
+
+This FDK AAC Codec software is provided by Fraunhofer on behalf of the copyright
+holders and contributors "AS IS" and WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES,
+including but not limited to the implied warranties of merchantability and
+fitness for a particular purpose. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
+CONTRIBUTORS BE LIABLE for any direct, indirect, incidental, special, exemplary,
+or consequential damages, including but not limited to procurement of substitute
+goods or services; loss of use, data, or profits, or business interruption,
+however caused and on any theory of liability, whether in contract, strict
+liability, or tort (including negligence), arising in any way out of the use of
+this software, even if advised of the possibility of such damage.
+
+5.    CONTACT INFORMATION
+
+Fraunhofer Institute for Integrated Circuits IIS
+Attention: Audio and Multimedia Departments - FDK AAC LL
+Am Wolfsmantel 33
+91058 Erlangen, Germany
+
+www.iis.fraunhofer.de/amm
+amm-info@iis.fraunhofer.de
+
diff --git a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb
new file mode 100644
index 000000000..d7911681c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "FDK-AAC audio codec"
+
+DESCRIPTION = "The Fraunhofer FDK AAC Codec Library for Android \
+(\"FDK AAC Codec\") is software that implements the MPEG \
+Advanced Audio Coding (\"AAC\") encoding and decoding scheme \
+for digital audio."
+
+HOMEPAGE = "https://www.iis.fraunhofer.de/en/ff/amm/impl.html"
+
+LICENSE = "Fraunhofer_FDK_AAC_Codec_Library_for_Android"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://NOTICE;md5=5985e1e12f4afa710d64ed7bfd291875"
+
+SRC_URI = "git://github.com/mstorsjo/fdk-aac.git;protocol=git;branch=master"
+SRCREV = "d387d3b6ed79ff9a82c60440bdd86e6e5e324bec"
+
+S = "${WORKDIR}/git"
+
+SRC_URI[md5sum] = "fef453b5d6ee28ff302c600b8cded3e7"
+SRC_URI[sha256sum] = "07c2a64b098eb48b2e9d729d5e778c08f7d22f28adc8da7c3f92c58da1cbbd8e"
+
+inherit autotools
-- 
2.17.1


