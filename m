Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4261D72EA2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Aug 2018 16:36:27 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id r1-v6so3074468pgp.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2018 09:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=W2RNHDsHvS715IjlgfjA93Js8s/V++NT3feZHBU65MM=;
	b=m5lIRKZK55/+bTPwFpmhvLwtU5Sc2bF53uxtXcLAEBjocJyXvW4OJzAB2sz8hz3Ane
	bk+/UZnnlCcnDreNZTYpv8+C66/lcO0bWRcgC5RoK367WNCy7miGK5gxlZpmwx11RE3V
	rl7iYMQ5Sc4fC6aqEUhDbwG0Cq2qq0ijlLcNauvQgAkBH8mGPgM9el9dKmrYyFPr5nbB
	M5JoZ4uoiBMeK+sOR0ZLYxYRNTKOPfVAN7EO6/+D+4XODZsPnzOBy5eTeiinSAX6vsQr
	rr/VnnW7ZoAsmPoBgV7kevYQ9JhD6ybWgUWTwND7WyJCFe4WFiIeNACVIc4UWnhAXVoh
	eq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=W2RNHDsHvS715IjlgfjA93Js8s/V++NT3feZHBU65MM=;
	b=hL/Md+QjZutzAZqr2XlQOaigqx6E39KORyKdbtm4tBfHov5lJPsmwM5JXqW/XxlwTt
	T462hHFY06SK/fwInreGzgldiWFcu9ajQFK3RKo/e0xxZPtYC9f07acHfJD2tP+ilbf7
	5LWPjnxKSjtMg2IH4WTW56swVxfmGZh7e+eFCt+gy9c8IixxQEI1MtvnkRfLI8R2VV+X
	71ikPngz75/0hLkAWc7P5O0vPAeJsKGd29s3kpf3X6F6bxHcGSnW3clEHVD6tvz3v7vi
	OyFd2rmBAjxvKH1fhqE2aJm4dAF/Z9fgIxFhfyfrc6lmZaR/P5tk6CNQqbiQfzR38qq8
	a/hQ==
X-Gm-Message-State: AOUpUlFUER6AfiONCZsY5XsUyUEH5R/xYPRps1wukr87c9jjuW94pvoT
	sDgMKX1dIUxlZu3ZrT8ACX7jl+jh
X-Google-Smtp-Source: AAOMgpf226s1KTcyn9EREstL0iFfE5GWeuhlf/bdS9+l3qyV3JiFxwguq23YeY+BFHSyJyC3dW3BVw==
X-Received: by 2002:a62:444d:: with SMTP id
	r74-v6mr5325959pfa.96.1533314187986; 
	Fri, 03 Aug 2018 09:36:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::5b3b])
	by smtp.gmail.com with ESMTPSA id
	r83-v6sm12583587pgr.8.2018.08.03.09.36.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Aug 2018 09:36:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Aug 2018 09:36:18 -0700
Message-Id: <20180803163618.7359-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-oe][PATCH] openlmi-tools: Fix setup.py clean during build
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
X-List-Received-Date: Fri, 03 Aug 2018 16:36:27 -0000

setuptools bbclass now runs clean target before configure
therefore create the setup.py before main configure task

secondly, all action happens inside cli subdir so mark it
default S

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/openlmi/openlmi-tools_0.10.5.bb   | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
index 05dc854fca..419b3ee6e8 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "Set of CLI tools for Openlmi providers"
 DESCRIPTION = "openlmi-tools is a set of command line tools for Openlmi providers."
 HOMEPAGE = "http://www.openlmi.org/"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=75859989545e37968a99b631ef42722e"
 SECTION = "System/Management"
 
 inherit setuptools
@@ -14,13 +14,11 @@ SRC_URI = "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
 SRC_URI[md5sum] = "e156246cb7b49753db82f4ddf7f03e50"
 SRC_URI[sha256sum] = "292b8f5f2250655a4add8183c529b73358bc980bd4f23cfa484a940953fce9e4"
 
-do_compile_prepend() {
-    cd cli
+S = "${WORKDIR}/${BP}/cli"
+
+do_configure_prepend() {
     sed 's/@@VERSION@@/$(VERSION)/g' setup.py.skel >setup.py
 }
-do_install_prepend() {
-    cd cli
-}
 
 python() {
     if 'meta-python' not in d.getVar('BBFILE_COLLECTIONS').split():
-- 
2.18.0


