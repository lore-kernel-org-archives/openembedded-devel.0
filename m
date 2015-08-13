Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5C93673231
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 15:32:20 +0000 (UTC)
Received: by ykaz130 with SMTP id z130so44332809yka.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 08:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0wZQ4gfWrLbFxUIKafxlPIW9YbW/rqRj+P6Vyqm2n0M=;
	b=EFQxON21z7FljFoT2HyKFtFq4RtbPdDQU9WNjE0Uw/SXQ0Cok6okQ0nGHHnseoGCgP
	Vbq3PNzzcBbmJ65XjusoWf5CM2F5GK4i3twyAswy3ejUblGpZhVXBBBLVete+WLaSBIB
	+XrG9uvRHZtkze9pek/365uZEkFEPZNC0igIu8gAVfkz0LFF266MCUoItWoxYQKE9jlC
	+hyH1/vQwhcR/Ah4WmbAeeGfE556zMQMw3RwhrrDgJ/hvAAbe4wiJWhpA7mqGmqFLLpg
	n1w+wyDENKyLj9c72xe4QJ3NclHEGqcvHjZLFrdnBeGkqlXWIswSOGsVEbu4a2LUOfJ1
	WNkg==
X-Received: by 10.170.121.9 with SMTP id n9mr29148505ykb.54.1439479941032;
	Thu, 13 Aug 2015 08:32:21 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id
	m132sm2315913ywb.34.2015.08.13.08.32.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Aug 2015 08:32:20 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2015 08:31:57 -0700
Message-Id: <1439479918-5557-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-per][PATCH 1/2] libsub-exporter-progressive-perl: add 0.001011 recipe
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
X-List-Received-Date: Thu, 13 Aug 2015 15:32:22 -0000

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libsub-exporter-progressive-perl_0.001011.bb   | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001011.bb

diff --git a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001011.bb b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001011.bb
new file mode 100644
index 0000000..a2a1305
--- /dev/null
+++ b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001011.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Sub::Exporter::Progressive - Only use Sub::Exporter if you need it."
+DESCRIPTION = "\"Sub::Exporter\" is an incredibly powerful module, but with \
+that power comes great responsibility, er- as well as some runtime penalties. \
+This module is a \"Sub::Exporter\" wrapper that will let your users just use \
+\"Exporter\" if all they are doing is picking exports, but use \
+\"Sub::Exporter\" if your users try to use \"Sub::Exporter's\" more advanced \
+features, like renaming exports, if they try to use them."
+
+SECTION = "libs"
+
+HOMEPAGE = "https://metacpan.org/pod/Sub-Exporter-Progressive/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=51;endline=53;md5=a171d2e9f8688a44e5f1b6dcc62029e6"
+
+DEPENDS_${PN} = " perl-module-test-more"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/F/FR/FREW/Sub-Exporter-Progressive-${PV}.tar.gz"
+SRC_URI[md5sum] = "bb50b3ba1538902b197c04818a84230a"
+SRC_URI[sha256sum] = "0618c6e69c6c0540c41e7560d51981407a6a0768f1330bef6d6ac3c6f1fa7c06"
+
+S = "${WORKDIR}/Sub-Exporter-Progressive-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} += " perl-module-carp \
+                    perl-module-list-util \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.1.0


