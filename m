Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id CF82465D0D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 05:33:51 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id kq14so910623pab.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 22:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fr52uQS/r6HOZ51EvMoTlpHxWrFs5W2XWgdyExqN6tk=;
	b=mbFgYUjTBTPs2e5gzISM0jC+bMYIGFygXowOwLBPkMKqTSTP2wpdBNXEr99/ePJXQT
	pHp96A0p5mbcbQCzRu7HLO8MPX9VObCRG1qDqlCE9P0H1SLpTUjyJXmWYkXTRYUgP2Ge
	W3ZYJkboPDTjw+YUNdaRywCCIICSXA5XyottXssdT66GTJbElA76BXpoJLw2CsyiWERO
	GZYXMQJQANufMkSKMtcqcXgtg3+g+Q9WVH5tjUcMHO38TuUoEGpZsttxh/M+26mj3A8C
	vGAa1XD7L44INpbRSU+Bjq/NnK8rP6O5F+MIG5bFJ5EBTkqCwFpc6SzSAW0E69vdnEqu
	SxvA==
X-Received: by 10.68.159.228 with SMTP id xf4mr61641456pbb.74.1398317632624;
	Wed, 23 Apr 2014 22:33:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id lr3sm15001297pab.4.2014.04.23.22.33.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Apr 2014 22:33:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Apr 2014 22:36:04 -0700
Message-Id: <1398317764-25741-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1398317764-25741-1-git-send-email-raj.khem@gmail.com>
References: <1398317764-25741-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] imagemagick: Update to 6.8.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Apr 2014 05:33:53 -0000

Add ImageMagick to known licenses
The license checksum is changed due to year change in license text

--- LICENSE     2013-11-18 05:03:16.000000000 -0800
+++ ../../6.8.6-r0/ImageMagick-6.8.6-10/LICENSE 2012-12-07
05:14:16.000000000 -0800
@@ -38,7 +38,7 @@

 The legally binding and authoritative terms and conditions for use,
reproduction, and distribution of ImageMagick follow:

-Copyright 1999-2014 ImageMagick Studio LLC, a non-profit organization
dedicated to making software imaging solutions freely available.
+Copyright 1999-2013 ImageMagick Studio LLC, a non-profit organization
dedicated to making software imaging solutions freely available.

 1. Definitions.

Add suffix .im6 to binaries, this avoids conflicts with other packages
e.g. lmbench provides stream utility and imagemagick does too so when
both packages are being part of image we have conflicts. This resolves
it by renaming stream to stream.im6 to make it distinct

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/licenses/ImageMagick                       | 103 +++++++++++++++++++++
 .../remove.dist-lzip.patch                         |   0
 .../{imagemagick_6.8.6.bb => imagemagick_6.8.8.bb} |   8 +-
 3 files changed, 107 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/licenses/ImageMagick
 rename meta-oe/recipes-support/imagemagick/{imagemagick-6.8.6 => imagemagick}/remove.dist-lzip.patch (100%)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_6.8.6.bb => imagemagick_6.8.8.bb} (80%)

diff --git a/meta-oe/licenses/ImageMagick b/meta-oe/licenses/ImageMagick
new file mode 100644
index 0000000..9141668
--- /dev/null
+++ b/meta-oe/licenses/ImageMagick
@@ -0,0 +1,103 @@
+Before we get to the text of the license, lets just review what the license says in simple terms:
+
+It allows you to:
+
+  * freely download and use ImageMagick software, in whole or in part, for personal, company internal, or commercial purposes;
+  * use ImageMagick software in packages or distributions that you create;
+  * link against a library under a different license;
+  * link code under a different license against a library under this license;
+  * merge code into a work under a different license;
+  * extend patent grants to any code using code under this license;
+  * and extend patent protection.
+
+It forbids you to:
+
+  * redistribute any piece of ImageMagick-originated software without proper attribution;
+  * use any marks owned by ImageMagick Studio LLC in any way that might state or imply that ImageMagick Studio LLC endorses your distribution;
+  * use any marks owned by ImageMagick Studio LLC in any way that might state or imply that you created the ImageMagick software in question.
+
+It requires you to:
+
+  * include a copy of the license in any redistribution you may make that includes ImageMagick software;
+  * provide clear attribution to ImageMagick Studio LLC for any distributions that include ImageMagick software.
+
+It does not require you to:
+
+  * include the source of the ImageMagick software itself, or of any modifications you may have made to it, in any redistribution you may assemble that includes it;
+  * submit changes that you make to the software back to the ImageMagick Studio LLC (though such feedback is encouraged).
+
+A few other clarifications include:
+
+  * ImageMagick is freely available without charge;
+  * you may include ImageMagick on a DVD as long as you comply with the terms of the license;
+  * you can give modified code away for free or sell it under the terms of the ImageMagick license or distribute the result under a different license, but you need to acknowledge the use of the ImageMagick software;
+  * the license is compatible with the GPL V3.
+  * when exporting the ImageMagick software, review its export classification.
+
+Terms and Conditions for Use, Reproduction, and Distribution
+
+The legally binding and authoritative terms and conditions for use, reproduction, and distribution of ImageMagick follow:
+
+Copyright 1999-2014 ImageMagick Studio LLC, a non-profit organization dedicated to making software imaging solutions freely available.
+
+1. Definitions.
+
+License shall mean the terms and conditions for use, reproduction, and distribution as defined by Sections 1 through 9 of this document.
+
+Licensor shall mean the copyright owner or entity authorized by the copyright owner that is granting the License.
+
+Legal Entity shall mean the union of the acting entity and all other entities that control, are controlled by, or are under common control with that entity. For the purposes of this definition, control means (i) the power, direct or indirect, to cause the direction or management of such entity, whether by contract or otherwise, or (ii) ownership of fifty percent (50%) or more of the outstanding shares, or (iii) beneficial ownership of such entity.
+
+You (or Your) shall mean an individual or Legal Entity exercising permissions granted by this License.
+
+Source form shall mean the preferred form for making modifications, including but not limited to software source code, documentation source, and configuration files.
+
+Object form shall mean any form resulting from mechanical transformation or translation of a Source form, including but not limited to compiled object code, generated documentation, and conversions to other media types.
+
+Work shall mean the work of authorship, whether in Source or Object form, made available under the License, as indicated by a copyright notice that is included in or attached to the work (an example is provided in the Appendix below).
+
+Derivative Works shall mean any work, whether in Source or Object form, that is based on (or derived from) the Work and for which the editorial revisions, annotations, elaborations, or other modifications represent, as a whole, an original work of authorship. For the purposes of this License, Derivative Works shall not include works that remain separable from, or merely link (or bind by name) to the interfaces of, the Work and Derivative Works thereof.
+
+Contribution shall mean any work of authorship, including the original version of the Work and any modifications or additions to that Work or Derivative Works thereof, that is intentionally submitted to Licensor for inclusion in the Work by the copyright owner or by an individual or Legal Entity authorized to submit on behalf of the copyright owner. For the purposes of this definition, "submitted" means any form of electronic, verbal, or written communication sent to the Licensor or its representatives, including but not limited to communication on electronic mailing lists, source code control systems, and issue tracking systems that are managed by, or on behalf of, the Licensor for the purpose of discussing and improving the Work, but excluding communication that is conspicuously marked or otherwise designated in writing by the copyright owner as Not a Contribution.
+
+Contributor shall mean Licensor and any individual or Legal Entity on behalf of whom a Contribution has been received by Licensor and subsequently incorporated within the Work.
+
+2. Grant of Copyright License. Subject to the terms and conditions of this License, each Contributor hereby grants to You a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable copyright license to reproduce, prepare Derivative Works of, publicly display, publicly perform, sublicense, and distribute the Work and such Derivative Works in Source or Object form.
+
+3. Grant of Patent License. Subject to the terms and conditions of this License, each Contributor hereby grants to You a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable patent license to make, have made, use, offer to sell, sell, import, and otherwise transfer the Work, where such license applies only to those patent claims licensable by such Contributor that are necessarily infringed by their Contribution(s) alone or by combination of their Contribution(s) with the Work to which such Contribution(s) was submitted. If You institute patent litigation against any entity (including a cross-claim or counterclaim in a lawsuit) alleging that the Work or a Contribution incorporated within the Work constitutes direct or contributory patent infringement, then any patent licenses granted to You under this License for that Work shall terminate as of the date such litigation is filed.
+
+4. Redistribution. You may reproduce and distribute copies of the Work or Derivative Works thereof in any medium, with or without modifications, and in Source or Object form, provided that You meet the following conditions:
+
+  * You must give any other recipients of the Work or Derivative Works a copy of this License; and
+  * You must cause any modified files to carry prominent notices stating that You changed the files; and
+  * You must retain, in the Source form of any Derivative Works that You distribute, all copyright, patent, trademark, and attribution notices from the Source form of the Work, excluding those notices that do not pertain to any part of the Derivative Works; and
+  * If the Work includes a "NOTICE" text file as part of its distribution, then any Derivative Works that You distribute must include a readable copy of the attribution notices contained within such NOTICE file, excluding those notices that do not pertain to any part of the Derivative Works, in at least one of the following places: within a NOTICE text file distributed as part of the Derivative Works; within the Source form or documentation, if provided along with the Derivative Works; or, within a display generated by the Derivative Works, if and wherever such third-party notices normally appear. The contents of the NOTICE file are for informational purposes only and do not modify the License. You may add Your own attribution notices within Derivative Works that You distribute, alongside or as an addendum to the NOTICE text from the Work, provided that such additional attribution notices cannot be construed as modifying the License.
+You may add Your own copyright statement to Your modifications and may provide additional or different license terms and conditions for use, reproduction, or distribution of Your modifications, or for any such Derivative Works as a whole, provided Your use, reproduction, and distribution of the Work otherwise complies with the conditions stated in this License.
+
+5. Submission of Contributions. Unless You explicitly state otherwise, any Contribution intentionally submitted for inclusion in the Work by You to the Licensor shall be under the terms and conditions of this License, without any additional terms or conditions. Notwithstanding the above, nothing herein shall supersede or modify the terms of any separate license agreement you may have executed with Licensor regarding such Contributions.
+
+6. Trademarks. This License does not grant permission to use the trade names, trademarks, service marks, or product names of the Licensor, except as required for reasonable and customary use in describing the origin of the Work and reproducing the content of the NOTICE file.
+
+7. Disclaimer of Warranty. Unless required by applicable law or agreed to in writing, Licensor provides the Work (and each Contributor provides its Contributions) on an AS IS BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied, including, without limitation, any warranties or conditions of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE. You are solely responsible for determining the appropriateness of using or redistributing the Work and assume any risks associated with Your exercise of permissions under this License.
+
+8. Limitation of Liability. In no event and under no legal theory, whether in tort (including negligence), contract, or otherwise, unless required by applicable law (such as deliberate and grossly negligent acts) or agreed to in writing, shall any Contributor be liable to You for damages, including any direct, indirect, special, incidental, or consequential damages of any character arising as a result of this License or out of the use or inability to use the Work (including but not limited to damages for loss of goodwill, work stoppage, computer failure or malfunction, or any and all other commercial damages or losses), even if such Contributor has been advised of the possibility of such damages.
+
+9. Accepting Warranty or Additional Liability. While redistributing the Work or Derivative Works thereof, You may choose to offer, and charge a fee for, acceptance of support, warranty, indemnity, or other liability obligations and/or rights consistent with this License. However, in accepting such obligations, You may act only on Your own behalf and on Your sole responsibility, not on behalf of any other Contributor, and only if You agree to indemnify, defend, and hold each Contributor harmless for any liability incurred by, or claims asserted against, such Contributor by reason of your accepting any such warranty or additional liability.
+
+How to Apply the License to your Work
+
+To apply the ImageMagick License to your work, attach the following boilerplate notice, with the fields enclosed by brackets "[]" replaced with your own identifying information (don't include the brackets). The text should be enclosed in the appropriate comment syntax for the file format. We also recommend that a file or class name and description of purpose be included on the same "printed page" as the copyright notice for easier identification within third-party archives.
+
+   Copyright [yyyy] [name of copyright owner]
+
+   Licensed under the ImageMagick License (the "License"); you may not use
+   this file except in compliance with the License.  You may obtain a copy
+   of the License at
+
+     http://www.imagemagick.org/script/license.php
+
+   Unless required by applicable law or agreed to in writing, software
+   distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
+   WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
+   License for the specific language governing permissions and limitations
+   under the License.
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick-6.8.6/remove.dist-lzip.patch b/meta-oe/recipes-support/imagemagick/imagemagick/remove.dist-lzip.patch
similarity index 100%
rename from meta-oe/recipes-support/imagemagick/imagemagick-6.8.6/remove.dist-lzip.patch
rename to meta-oe/recipes-support/imagemagick/imagemagick/remove.dist-lzip.patch
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
similarity index 80%
rename from meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
index 9ff03c3..e261eb8 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
@@ -1,7 +1,7 @@
 SUMMARY = "ImageMagick is an image convertion tools"
 SECTION = "console/utils"
 LICENSE = "ImageMagick"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b1bf06a8d02cb00b02dea7d03ef9525f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5d84c6ddd4028aa53d028b4c50f9361e"
 # FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
 
@@ -9,8 +9,8 @@ PATCHSET = "10"
 SRC_URI = "http://www.imagemagick.org/download/legacy/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
            file://remove.dist-lzip.patch \
 "
-SRC_URI[md5sum] = "9034ab5bf6d63fe72230779f1f590691"
-SRC_URI[sha256sum] = "95b487bb0e4ebf97dd06b6d61f421a05e2666f253ae06352cb3262b34603b2a3"
+SRC_URI[md5sum] = "a3a0fa301965d6fde68fccd066f62b0b"
+SRC_URI[sha256sum] = "8c0982b2bc0c1cea8ac9627b4e1e5d37f8171ef8282ee09aef32529cf68e1820"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
@@ -18,7 +18,7 @@ inherit autotools binconfig pkgconfig
 
 # xml disabled because it's using xml2-config --prefix to determine prefix which returns just /usr with our libxml2
 # if someone needs xml support then fix it first
-EXTRA_OECONF = "--program-prefix= --without-x --without-perl --disable-openmp --without-xml --disable-opencl"
+EXTRA_OECONF = "--program-prefix= --program-suffix=.im6 --without-x --without-perl --disable-openmp --without-xml --disable-opencl"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[jp2] = "--with-jp2,--without-jp2,jasper"
-- 
1.9.2


