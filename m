Return-Path: <sjl@vctlabs.com>
X-Greylist: delayed 528 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 19 Sep 2019 01:50:45 UTC
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id E35377FFCB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 01:50:45 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 7551428048B; Wed, 18 Sep 2019 18:45:47 -0700 (PDT)
Date: Wed, 18 Sep 2019 18:45:47 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20190919014547.7nchdno3cq3o2fs7@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org,
	Armin Kuster <akuster@mvista.com>
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][PATCH] wireshark: remove restriction to ARM ISA
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
X-List-Received-Date: Thu, 19 Sep 2019 01:50:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The restriction to ARM instruction set came in the original
wireshark recipe, which was 2 major versions ago (and also
a few toolchains ago). Wireshark 3.x seems to be building
fine allowing thumb instructions, at least on cortexa9t2hf.
---
 meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
index efcd5e4..6de188d 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
@@ -19,8 +19,6 @@ PE = "1"
 
 inherit cmake pkgconfig python3native perlnative upstream-version-is-even
 
-ARM_INSTRUCTION_SET = "arm"
-
 PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"
 
 PACKAGECONFIG_class-native = "libpcap gnutls ssl libssh"
-- 
1.9.4


