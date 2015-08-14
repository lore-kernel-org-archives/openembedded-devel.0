Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0D10372A78
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 03:50:41 +0000 (UTC)
Received: by ykdt205 with SMTP id t205so59346089ykd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 20:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=BRymg7iFqXNHwmUO0VtH77VfcjKE6b97LCISmINJYSw=;
	b=Yu3f4wXM/AD8QTdISq1ua5IENjrLLE8ynsOP+RFKFb8fm1/2t2vlgYUV3px9ra3ZZy
	xGMNUJLbIudDQqzS6ESjndgV406jBIBrUdLA8LD3UVW+HaK3w5J9Z6pHFO7qfOs7UKD0
	61x8k0SeCmWnM4rQNY5TeItsMESGuPhY7NUunPVsANkVjdrpEXZqDabDsr41mLbdudXV
	UjPEYLUxSI0sjmHm2fHG9D3tyve1PHXDI9Bh74Sq9MlUfFVQnmX9kSSUVA+vjX1xbkDK
	YxYqwP5rSBa8P9an89PeUbdobVT6e5c+HT45JkK9STK67zV3mo7yL1ZG32BUxrMItCcR
	hWQQ==
X-Received: by 10.129.86.5 with SMTP id k5mr16548129ywb.156.1439524241555;
	Thu, 13 Aug 2015 20:50:41 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id h7sm4123021ywd.28.2015.08.13.20.50.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Aug 2015 20:50:40 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2015 20:50:30 -0700
Message-Id: <1439524230-16953-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-perl][PATCH] libencode-locale-perl: add 1.05 recipe
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
X-List-Received-Date: Fri, 14 Aug 2015 03:50:43 -0000

* Based on:
  Paul Eggleton <paul.eggleton@linux.intel.com>
  http://github.com/bluelightning/public_bb_recipes

* which is forked from:
  Emil Petersen <erp@movis.dk>
  http://github.com/EmilRP/public_bb_recipes/

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libencode/libencode-locale-perl_1.05.bb         | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb

diff --git a/meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb b/meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb
new file mode 100644
index 0000000..748f746
--- /dev/null
+++ b/meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Encode::Locale - Determine the locale encoding"
+AUTHOR = "Gisle Aas <gisle@activestate.com>"
+HOMEPAGE = "https://metacpan.org/module/Encode::Locale"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;md5=14e8006c2134045725fd81292a323d24"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/G/GA/GAAS/Encode-Locale-${PV}.tar.gz"
+SRC_URI[md5sum] = "fcfdb8e4ee34bcf62aed429b4a23db27"
+SRC_URI[sha256sum] = "176fa02771f542a4efb1dbc2a4c928e8f4391bf4078473bd6040d8f11adb0ec1"
+
+S = "${WORKDIR}/Encode-Locale-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} += "libencode-perl \
+                   libencode-alias-perl \
+                   perl-module-base \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.1.0


