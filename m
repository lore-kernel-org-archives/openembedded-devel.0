Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.10434.1601976439537821423
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2020 02:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: siew.hoon.lim@intel.com)
IronPort-SDR: bRJRs3NTxiiYBDud0Y4ES10pkpAs1PQ59XAKr/LQ8/FsDo7923QKNgSdnDNyMWDE5fhtzQjOBe
 ngzskuiiy5hQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="161033424"
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; 
   d="scan'208";a="161033424"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2020 02:27:18 -0700
IronPort-SDR: nBAO85vUim1uW3s/pIe3YWbPu0osKePs+uoUGAq4iVG6mfw4uirO02DXB6MUK81n002UPS10Bh
 UA7eIggmspyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; 
   d="scan'208";a="460713879"
Received: from unknown (HELO slim50-desktop.png.intel.com) ([10.221.79.121])
  by orsmga004.jf.intel.com with ESMTP; 06 Oct 2020 02:27:17 -0700
From: "Lim Siew Hoon" <siew.hoon.lim@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH v3] Alliance for Open Media: new library
Date: Tue,  6 Oct 2020 17:26:42 +0800
Message-Id: <20201006092642.6482-3-siew.hoon.lim@intel.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
Signed-off-by: Lim Siew Hoon <siew.hoon.lim@intel.com>
---
 .../licenses/AOM-Patent-License-1.0           | 108 ++++++++++++++++++
 .../recipes-multimedia/aom/aom_2.0.0.bb       |  20 ++++
 .../packagegroup-meta-multimedia.bb           |   1 +
 3 files changed, 129 insertions(+)
 create mode 100644 meta-multimedia/licenses/AOM-Patent-License-1.0
 create mode 100644 meta-multimedia/recipes-multimedia/aom/aom_2.0.0.bb

diff --git a/meta-multimedia/licenses/AOM-Patent-License-1.0 b/meta-multimedia/licenses/AOM-Patent-License-1.0
new file mode 100644
index 000000000..493f61637
--- /dev/null
+++ b/meta-multimedia/licenses/AOM-Patent-License-1.0
@@ -0,0 +1,108 @@
+Alliance for Open Media Patent License 1.0
+
+1. License Terms.
+
+1.1. Patent License. Subject to the terms and conditions of this License, each
+     Licensor, on behalf of itself and successors in interest and assigns,
+     grants Licensee a non-sublicensable, perpetual, worldwide, non-exclusive,
+     no-charge, royalty-free, irrevocable (except as expressly stated in this
+     License) patent license to its Necessary Claims to make, use, sell, offer
+     for sale, import or distribute any Implementation.
+
+1.2. Conditions.
+
+1.2.1. Availability. As a condition to the grant of rights to Licensee to make,
+       sell, offer for sale, import or distribute an Implementation under
+       Section 1.1, Licensee must make its Necessary Claims available under
+       this License, and must reproduce this License with any Implementation
+       as follows:
+
+       a. For distribution in source code, by including this License in the
+          root directory of the source code with its Implementation.
+
+       b. For distribution in any other form (including binary, object form,
+          and/or hardware description code (e.g., HDL, RTL, Gate Level Netlist,
+          GDSII, etc.)), by including this License in the documentation, legal
+          notices, and/or other written materials provided with the
+          Implementation.
+
+1.2.2. Additional Conditions. This license is directly from Licensor to
+       Licensee.  Licensee acknowledges as a condition of benefiting from it
+       that no rights from Licensor are received from suppliers, distributors,
+       or otherwise in connection with this License.
+
+1.3. Defensive Termination. If any Licensee, its Affiliates, or its agents
+     initiates patent litigation or files, maintains, or voluntarily
+     participates in a lawsuit against another entity or any person asserting
+     that any Implementation infringes Necessary Claims, any patent licenses
+     granted under this License directly to the Licensee are immediately
+     terminated as of the date of the initiation of action unless 1) that suit
+     was in response to a corresponding suit regarding an Implementation first
+     brought against an initiating entity, or 2) that suit was brought to
+     enforce the terms of this License (including intervention in a third-party
+     action by a Licensee).
+
+1.4. Disclaimers. The Reference Implementation and Specification are provided
+     "AS IS" and without warranty. The entire risk as to implementing or
+     otherwise using the Reference Implementation or Specification is assumed
+     by the implementer and user. Licensor expressly disclaims any warranties
+     (express, implied, or otherwise), including implied warranties of
+     merchantability, non-infringement, fitness for a particular purpose, or
+     title, related to the material. IN NO EVENT WILL LICENSOR BE LIABLE TO
+     ANY OTHER PARTY FOR LOST PROFITS OR ANY FORM OF INDIRECT, SPECIAL,
+     INCIDENTAL, OR CONSEQUENTIAL DAMAGES OF ANY CHARACTER FROM ANY CAUSES OF
+     ACTION OF ANY KIND WITH RESPECT TO THIS LICENSE, WHETHER BASED ON BREACH
+     OF CONTRACT, TORT (INCLUDING NEGLIGENCE), OR OTHERWISE, AND WHETHER OR
+     NOT THE OTHER PARTRY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+2. Definitions.
+
+2.1. Affiliate.  "Affiliate" means an entity that directly or indirectly
+     Controls, is Controlled by, or is under common Control of that party.
+
+2.2. Control. "Control" means direct or indirect control of more than 50% of
+     the voting power to elect directors of that corporation, or for any other
+     entity, the power to direct management of such entity.
+
+2.3. Decoder.  "Decoder" means any decoder that conforms fully with all
+     non-optional portions of the Specification.
+
+2.4. Encoder.  "Encoder" means any encoder that produces a bitstream that can
+     be decoded by a Decoder only to the extent it produces such a bitstream.
+
+2.5. Final Deliverable.  "Final Deliverable" means the final version of a
+     deliverable approved by the Alliance for Open Media as a Final
+     Deliverable.
+
+2.6. Implementation.  "Implementation" means any implementation, including the
+     Reference Implementation, that is an Encoder and/or a Decoder. An
+     Implementation also includes components of an Implementation only to the
+     extent they are used as part of an Implementation.
+
+2.7. License. "License" means this license.
+
+2.8. Licensee. "Licensee" means any person or entity who exercises patent
+     rights granted under this License.
+
+2.9. Licensor.  "Licensor" means (i) any Licensee that makes, sells, offers
+     for sale, imports or distributes any Implementation, or (ii) a person
+     or entity that has a licensing obligation to the Implementation as a
+     result of its membership and/or participation in the Alliance for Open
+     Media working group that developed the Specification.
+
+2.10. Necessary Claims.  "Necessary Claims" means all claims of patents or
+      patent applications, (a) that currently or at any time in the future,
+      are owned or controlled by the Licensor, and (b) (i) would be an
+      Essential Claim as defined by the W3C Policy as of February 5, 2004
+      (https://www.w3.org/Consortium/Patent-Policy-20040205/#def-essential)
+      as if the Specification was a W3C Recommendation; or (ii) are infringed
+      by the Reference Implementation.
+
+2.11. Reference Implementation. "Reference Implementation" means an Encoder
+      and/or Decoder released by the Alliance for Open Media as a Final
+      Deliverable.
+
+2.12. Specification. "Specification" means the specification designated by
+      the Alliance for Open Media as a Final Deliverable for which this
+      License was issued.
+
diff --git a/meta-multimedia/recipes-multimedia/aom/aom_2.0.0.bb b/meta-multimedia/recipes-multimedia/aom/aom_2.0.0.bb
new file mode 100644
index 000000000..c5ad1f806
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/aom/aom_2.0.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Alliance for Open Media - AV1 Codec Library"
+DESCRIPTION = "Alliance for Open Media AV1 codec library"
+
+LICENSE = "BSD-2-Clause & AOM-Patent-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5 \
+                    file://PATENTS;md5=e69ad12202bd20da3c76a5d3648cfa83 \
+                   "
+
+SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https"
+
+SRCREV = "d1d1226af626a61f7ca664b270dd473b92228984"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+DEPENDS = " yasm-native"
+
+EXTRA_OECMAKE = " -DBUILD_SHARED_LIBS=1 -DENABLE_TESTS=0 \
+                  -DPERL_EXECUTABLE=${HOSTTOOLS_DIR}/perl \
+                "
diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 2bf8877bb..0fed24733 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -21,6 +21,7 @@ RDEPENDS_packagegroup-meta-multimedia = "\
 
 RDEPENDS_packagegroup-meta-multimedia = "\
     alsa-equal \
+    aom \
     caps \
     cdparanoia \
     dcadec \
-- 
2.17.1

