Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id DCEA0766EB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 02:26:07 +0000 (UTC)
Received: by ykfw73 with SMTP id w73so4672615ykf.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 19:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zfZxQ2fVyyhtgG4AjXzpWRUogxp8MZZMtxWOKY3jwZA=;
	b=hP97dOkFxjdv0zFbgXvomOxXrrohuQqX9jnCN0W0wwuxIvX3uIZAyn/Kq0ZZVlnEKu
	3YWDL1S2NE5axciIpuZZ0EROIFMjj1Ee7alOhjPvQPvqfCQCUDvdanXPPSRHj78f1ZGe
	hlSwXzcXRHgjtMHhmdNnnrv4f/FNwq/CqziWo+gU4kNo2fxPLUcQG2YMNhqccVrLaOlx
	Nvh2aBpoyHMTMZtMhmmZOx4kYrrRbbe+IKOdoQ/NGgWZZ/H6D2N6tYLx0yjTLycnRs0s
	gsk3esrb7ckX0GeOyYTjQqu6lCTP5ZT5v0ZBhpqQdOnMSYrlsuHhkgk1b87WIbATqpXm
	TxtA==
X-Received: by 10.13.246.70 with SMTP id g67mr40615399ywf.75.1439519167490;
	Thu, 13 Aug 2015 19:26:07 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id
	d70sm3921885ywe.52.2015.08.13.19.26.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Aug 2015 19:26:06 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2015 19:25:43 -0700
Message-Id: <1439519143-5659-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-perl][PATCH] libencode-perl: add 2.76 recipe
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
X-List-Received-Date: Fri, 14 Aug 2015 02:26:08 -0000

* Based on v2.52 recipe:
  Paul Eggleton <paul.eggleton@linux.intel.com>
  http://github.com/bluelightning/public_bb_recipes

* which is forked from:
  Emil Petersen <erp@movis.dk>
  http://github.com/EmilRP/public_bb_recipes

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../recipes-perl/libencode/libencode-perl_2.76.bb  | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libencode/libencode-perl_2.76.bb

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_2.76.bb b/meta-perl/recipes-perl/libencode/libencode-perl_2.76.bb
new file mode 100644
index 0000000..9939962
--- /dev/null
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_2.76.bb
@@ -0,0 +1,54 @@
+SUMMARY = "Encode - character encodings"
+DESCRIPTION = "The \"Encode\" module provides the interfaces between \
+Perl's strings and the rest of the system.  Perl strings are sequences \
+of characters."
+
+AUTHOR = "Dan Kogai <dankogai+cpan@gmail.com>"
+HOMEPAGE = "https://metacpan.org/release/Encode"
+SECTION = "lib"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://META.json;md5=bb6a09a95259f80fbf2855c8f9dc3e85"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
+SRC_URI[md5sum] = "90ee2160d40ade6cc4c4aa1b1ff4745e"
+SRC_URI[sha256sum] = "0fa01359d34d1d129e9bcacb0b9bb821e36e9fb5f1404cfb557dfa680368f265"
+
+S = "${WORKDIR}/Encode-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} += " perl-module-bytes \
+                    perl-module-constant \
+                    perl-module-xsloader \
+"
+
+RPROVIDES_${PN} += "libencode-alias-perl \
+                    libencode-byte-perl \
+                    libencode-cjkconstants-perl \
+                    libencode-cn-perl \
+                    libencode-cn-hz-perl \
+                    libencode-config-perl \
+                    libencode-ebcdic-perl \
+                    libencode-encoder-perl \
+                    libencode-encoding-perl \
+                    libencode-gsm0338-perl \
+                    libencode-guess-perl \
+                    libencode-jp-perl \
+                    libencode-jp-h2z-perl \
+                    libencode-jp-jis7-perl \
+                    libencode-kr-perl \
+                    libencode-kr-2022_kr-perl \
+                    libencode-mime-header-perl \
+                    libencode-mime-name-perl \
+                    libencode-symbol-perl \
+                    libencode-tw-perl \
+                    libencode-unicode--perl \
+                    libencode-unicode-utf7-perl \
+                    libencoding-perl \
+                    libencode-internal-perl \
+                    libencode-mime-header-iso_2022_jp-perl \
+                    libencode-utf8-perl \
+                    libencode-utf_ebcdic-perl \
+                    "
+
+BBCLASSEXTEND = "native"
-- 
2.1.0


