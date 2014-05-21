Return-Path: <ticotimo@gmail.com>
X-Greylist: delayed 460 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 May 2014 07:49:22 UTC
Received: from mail-pd0-f180.google.com (unknown [209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 34EE76A4B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 07:49:22 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id y13so1150613pdi.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 00:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Qsl5z4rG0jW23vkYvtOHznssl/zPII75EI/as33Rfe0=;
	b=FQ3CRcpKD0MJN1fr5qYK2RXRlh4c9Mfh+ghcvJVxc+UoXigScpE/mXLYHwFtzKGARM
	lhogaCVyeCiC5mj5YXnmUX++SjobYyE1EGe1u337pN1AGZMSgVqGEzPh98p8y0qsDbT2
	t2wxMFJseZ1mHi97Ooo6DLB7ZoUWKPW8r3bEq+LFTxQDRQwveoWwFZMeZ++J2zL+J2Eg
	2YXHKJ/A0hOcVFQae2KBEqme/KFiPuobJAdnijqsd9M2aQBE4JS3C1nVy/9hAziMaJQW
	N0fZW0+B3O9U6tdLbF26PfCrJEokm3kGAmMxiv8dlrrMfRj315leWYr/eIv2+cVq8zJ2
	bI8w==
X-Received: by 10.69.19.140 with SMTP id gu12mr56013878pbd.111.1400658123840; 
	Wed, 21 May 2014 00:42:03 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id it4sm6669337pbc.39.2014.05.21.00.42.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 21 May 2014 00:42:02 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 May 2014 00:43:43 -0700
Message-Id: <1400658223-15804-11-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
References: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v4 10/10] libtest-harness-perl: add 3.30
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
X-List-Received-Date: Wed, 21 May 2014 07:49:23 -0000

From: Tim Orling <TicoTimo@gmail.com>

Test::Harness - Run Perl standard test scripts with statistics

* Uses ${CPAN_MIRROR} option
* RPROVIDES based on v3.28 recipe:
        Paul Eggleton <paul.eggleton@linux.intel.com>
	http://github.com/bluelightning/public_bb_recipes
* which is forked from
        Emil Petersen <erp@movis.dk> repo
        http://github.com/EmilRP/public_bb_recipes/

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libtest/libtest-harness-perl_3.30.bb           | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libtest/libtest-harness-perl_3.30.bb

diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.30.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.30.bb
new file mode 100644
index 0000000..169931b
--- /dev/null
+++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.30.bb
@@ -0,0 +1,79 @@
+SUMMARY = "Test::Harness - Run Perl standard test scripts with statistics"
+DESCRIPTION = "Although, for historical reasons, the Test::Harness \
+distribution takes its name from this module it now exists only to provide \
+TAP::Harness with an interface that is somewhat backwards compatible \
+with Test::Harness 2.xx. If you're writing new code consider using \
+TAP::Harness directly instead. \
+\ 
+Emulation is provided for runtests and execute_tests but the \
+pluggable 'Straps' interface that previous versions of Test::Harness \
+supported is not reproduced here. Straps is now available as a stand \
+alone module: Test::Harness::Straps. \
+\
+See TAP::Parser, TAP::Harness for the main documentation for this \
+distribution."
+
+SECTION = "libs"
+
+HOMEPAGE = "http://testanything.org"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=29;endline=30;md5=b08db4360eec119e875dddd7cb8a5ddd"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Test-Harness-${PV}.tar.gz"
+SRC_URI[md5sum] = "c1ff25da5dfdf77adea13dc3465638dd"
+SRC_URI[sha256sum] = "ff1900f3b3e61321d3c4b3283298f3106d43d55446605e9cfcf1dcec036acec1"
+
+S = "${WORKDIR}/Test-Harness-${PV}"
+
+inherit cpan
+
+RPROVIDES_${PN} += "libapp-prove-perl \
+                    libapp-prove-state-perl \
+		    libapp-prove-state-result-perl \
+		    libapp-prove-state-result-test-perl \
+                    libtap-base-perl \
+                    libtap-formatter-base-perl \
+                    libtap-formatter-color-perl \
+                    libtap-formatter-console-perl \
+                    libtap-formatter-console-parallelsession-perl \                                 libtap-formatter-console-session-perl \
+                    libtap-formatter-file-perl \
+                    libtap-formatter-file-session-perl \
+                    libtap-formatter-session-perl \
+                    libtap-harness-perl \
+		    libtap-harness-env-perl \
+                    libtap-object-perl \
+                    libtap-parser-perl \
+                    libtap-parser-aggregator-perl \
+                    libtap-parser-grammar-perl \
+                    libtap-parser-iterator-perl \
+                    libtap-parser-iterator-array-perl \
+                    libtap-parser-iterator-process-perl \
+                    libtap-parser-iterator-stream-perl \
+                    libtap-parser-iteratorfactory-perl \
+                    libtap-parser-multiplexer-perl \
+                    libtap-parser-result-perl \
+                    libtap-parsser-result-bailout-perl \
+                    libtap-parser-result-comment-perl \
+                    libtap-parser-result-plan-perl \
+                    libtap-parser-result-pragma-perl \
+                    libtap-parser-result-test-perl \
+                    libtap-parser-result-unknown-perl \
+                    libtap-parser-result-version-perl \
+                    libtap-parser-result-yaml-perl \
+                    libtap-parser-resultfactory-perl \
+                    libtap-parser-scheduler-perl \
+                    libtap-parser-scheduler-job-perl \
+                    libtap-parser-scheduler-spinner-perl \
+                    libtap-parser-source-perl \
+                    libtap-parser-sourcehandler-perl \
+                    libtap-parser-sourcehandler-executable-perl \
+                    libtap-parser-sourcehandler-file-perl \
+                    libtap-parser-sourcehandler-handle-perl \
+                    libtap-parser-sourcehandler-perl-perl \
+                    libtap-parser-sourcehandler-rawtap-perl \
+                    libtap-parser-yamlish-reader-perl \
+                    libtap-parser-yamlish-writer-perl \
+                    "
+
+BBCLASSEXTEND = "native"
-- 
1.8.3.2


