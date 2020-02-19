Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 796F561515
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 00:50:52 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id gv17so1774665pjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 16:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=U+o+aWjf5KlQw5xRrlnCt0Eaflif+OSCvmfmBxYtwS8=;
	b=pmcjucpKER2i4iwNhv1p8IlzvR/de8u4zW7qpD0C9pvSMtMQuJkGbao65QtIZzQgSn
	2qLF3akZutvGMi44HgzJVmMve2yFelDkjABuro6SXrlWbc+gi0CmONB24KDnCXsWgDQC
	lsVH9gE04imeP+gW5IyC3//USO/D0r3XebzL4RYXRsh8+dpGTrEVaj1yQTK7RwxHPTZA
	pT8X0FYnYVtwVoCDHbbEAG+mgDfUPcUYZdN2wQ8Z3yzUq8iv5uqQlPpJj72XrcYDPqrk
	Tn7K7YXq8s21hiVhesMEB1RqoiECRc8Jgo52kZkhR1Q/FjtLRiVbnRgydt8e1MtTcEuA
	uRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=U+o+aWjf5KlQw5xRrlnCt0Eaflif+OSCvmfmBxYtwS8=;
	b=TmrZchW+vck9VWxhsIL4pI2KUW0oFMqypqw3Namnnl2QOLwssJSNu7KawEP0AWqLsL
	wFyQjbU40HafLcsV0O0cyywvZaTU5BfFxEnUYlXLUTqGnYyL1GEWHLbeEHzRG1zm7oUq
	DdsA36+nWia41Odtp8/P3sm+m3vVoSCc08gKzJNzveaYAWf9aqy9uRUXZBlYHEQJYEvC
	lLrsOJLOpNN1cElvxleE6BxLseb9OlJpsmtvNp6sa9koeE+idBRv3x4HhS2CKIn2u1bQ
	TicOfaMKgMeXSApZkczO/CPZyzgHlVdyfhepRFJrHPRuQqzTYu10c6xAKMVDEfMzUgHw
	a+jw==
X-Gm-Message-State: APjAAAXxObp+RNvoeCuNlJoVtn/v4JcJk5avFC2Ht6IqQ5ua2DJE7szD
	aOsIabCjuU5/D+zb/Z1zOyR5OdH9dPk=
X-Google-Smtp-Source: APXvYqxSRBX8QEudX+6hnBUjgW8MHll7UTW3SrTa3YJWRnsrMXc3R/pc+HziLMLx0/QVsE4ins55ow==
X-Received: by 2002:a17:90a:33a1:: with SMTP id
	n30mr5697240pjb.6.1582073452988; 
	Tue, 18 Feb 2020 16:50:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id c5sm207276pfi.10.2020.02.18.16.50.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 16:50:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Feb 2020 16:50:56 -0800
Message-Id: <20200219005058.2921658-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200219005058.2921658-1-raj.khem@gmail.com>
References: <20200219005058.2921658-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/4] pm-graph: Renamed from analyze-suspend
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
X-List-Received-Date: Wed, 19 Feb 2020 00:50:52 -0000
Content-Transfer-Encoding: 8bit

Moved to tip to get py3 support
Point SRC_URI to new location
Adjust for name changes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pm-graph_5.5.bb}                                 | 12 ++++++++----
 .../packagegroups/packagegroup-meta-oe.bb            |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-benchmark/{analyze-suspend/analyze-suspend_5.5.bb => pm-graph/pm-graph_5.5.bb} (74%)

diff --git a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.5.bb b/meta-oe/recipes-benchmark/pm-graph/pm-graph_5.5.bb
similarity index 74%
rename from meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.5.bb
rename to meta-oe/recipes-benchmark/pm-graph/pm-graph_5.5.bb
index bb0aad3413..4f6f3bd40c 100644
--- a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.5.bb
+++ b/meta-oe/recipes-benchmark/pm-graph/pm-graph_5.5.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Analyze Suspend"
+SUMMARY = "Analyze Suspend/Resume"
 DESCRIPTION = "analyze-suspend is a tool for system developers to visualize \
 the activity between suspend and resume, allowing them to identify \
 inefficiencies and bottlenecks."
@@ -14,10 +14,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 #   - CONFIG_FUNCTION_TRACER=y
 #   - CONFIG_FUNCTION_GRAPH_TRACER=y
 
-RDEPENDS_${PN} += "python-core python-datetime python-stringold"
+RDEPENDS_${PN} += "python3-core python3-datetime python3-stringold"
 
-SRC_URI = "git://github.com/01org/suspendresume.git;protocol=https"
-SRCREV = "cf59527dc24fdd2f314ae4dcaeb3d68a117988f6"
+PV .= "+git${SRCPV}"
+SRC_URI = "git://github.com/intel/pm-graph;protocol=https"
+SRCREV = "3a8cd2fa9aee3afbc7f7e844885ffdcfaf5a1097"
 
 S = "${WORKDIR}/git"
 
@@ -27,3 +28,6 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native"
+
+RPROVIDES_${PN} = "analyze-suspend"
+
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index bad4aa769e..3933619add 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -46,7 +46,7 @@ RDEPENDS_packagegroup-meta-oe = "\
 "
 
 RDEPENDS_packagegroup-meta-oe-benchmarks = "\
-    analyze-suspend dhrystone iperf2 linpack phoronix-test-suite \
+    pm-graph dhrystone iperf2 linpack phoronix-test-suite \
     tiobench bonnie++ fio iperf2 iperf3 lmbench s-suite whetstone \
     libc-bench memtester sysbench dbench iozone3 libhugetlbfs \
     nbench-byte tinymembench \
-- 
2.25.1


