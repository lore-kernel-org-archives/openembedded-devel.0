Return-Path: <pbarker@toganlabs.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6082D782D3
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Nov 2017 22:08:17 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id 15so6918060wrb.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Nov 2017 14:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nh01BepDYkPL0CAa6H/+NLgoThCLNLvVvbfoAvan9oU=;
	b=nTwFEUG9NGPaw+oc5J6jDzthiqCpScENdjUQz7KR3M7RgYH+gAMmKeFl78YN1Wyk9d
	KzOYya2Grn1UXpcTyTiWjh45tRqpkHPsAeursH25VMQzH/xR58X5JhCC/gvt/whSBUwQ
	LoCGOM5au56N9GrKaPS00iQDQSkKNGo+qRv2w0YztdCFaiPAPBbRRhbsbVVNFRReVwyq
	fF/Ot4R7wRu1yAatpsaxgMmuBD6LEDn9GNp8z63a4uuS+5vJNovLwXbrLxfzp88ZtSJT
	forDgZE6YR2Hf3aSNLNIJ9OJNh2RQx5OLo7owv/vtBdZpDarNlAP/wkjQiAgxAi6yJ9k
	AMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nh01BepDYkPL0CAa6H/+NLgoThCLNLvVvbfoAvan9oU=;
	b=PCTimhxRwPaFNS1CTyqRP3hN2SaIJlYqaKp7AeETMqHHL4TosyYu2IasiWEIE6ustE
	vJB+Ci/3OcINlImXjTboxOU7H7ixZfndtIbAcPan/lnaq1kGuzZdpROtk49DoR7d4yda
	gx2EXIh21ficf32YU+rGc2XBbhwPUZISWik8dgoCTr/UYgZDFuGKbJSm8nR814NXUueo
	FE6EEP2brnB7H2DG0S+9dRyU1kzY+o0oEulhyMU4NqYszdw54Cdf+U9qWDeFLzQs7n2K
	nd6qavc7Q9rgZ8lCL0t9ncFpVV+jRQWhApdxNpi3HVcMt+6ZWo9U/Nmu1+/tG1ZYS+5p
	qpAA==
X-Gm-Message-State: AMCzsaXf2AEM3teDyu6PXnGLwg9RmnGpNUADfuoncEZCNS1DU63P0o3Y
	ZNM2mJm16qDgXrINnC5CfXgJ/Nd9
X-Google-Smtp-Source: ABhQp+Tlhx/bsPmDdxgR3PRs8eEzVT3V43RWmXzajK8P4RZayQYZ9H1N7W36XgMTTSG8xN89hghS7w==
X-Received: by 10.223.177.139 with SMTP id q11mr12008541wra.77.1509919698954; 
	Sun, 05 Nov 2017 14:08:18 -0800 (PST)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	q124sm13845688wmg.18.2017.11.05.14.08.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Nov 2017 14:08:18 -0800 (PST)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Nov 2017 22:07:25 +0000
Message-Id: <1509919652-31388-2-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509919652-31388-1-git-send-email-pbarker@toganlabs.com>
References: <1509919652-31388-1-git-send-email-pbarker@toganlabs.com>
Subject: [meta-oe][PATCH 1/8] toybox: Switch to v0.7.5 release
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
X-List-Received-Date: Sun, 05 Nov 2017 22:08:18 -0000

The commit we needed to use has now been incorporated into a release.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 meta-oe/recipes-core/toybox/{toybox_git.bb => toybox_0.7.5.bb} | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-core/toybox/{toybox_git.bb => toybox_0.7.5.bb} (90%)

diff --git a/meta-oe/recipes-core/toybox/toybox_git.bb b/meta-oe/recipes-core/toybox/toybox_0.7.5.bb
similarity index 90%
rename from meta-oe/recipes-core/toybox/toybox_git.bb
rename to meta-oe/recipes-core/toybox/toybox_0.7.5.bb
index 08f9715..347c285 100644
--- a/meta-oe/recipes-core/toybox/toybox_git.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.7.5.bb
@@ -5,13 +5,9 @@ DEPENDS = "attr"
 LICENSE = "BSD-0-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0b8b3dd6431bcaa245da0a08bd0d511"
 
-PV = "0.7.4+git${SRCPV}"
-
-SRCREV = "78289203031afc23585035c362beec10db54958d"
-SRC_URI = "git://github.com/landley/toybox;protocol=https \
-"
-
-S = "${WORKDIR}/git"
+SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "a8bb502a1be941f06dd2644fff25f547"
+SRC_URI[sha256sum] = "3ada450ac1eab1dfc352fee915ea6129b9a4349c1885f1394b61bd2d89a46c04"
 
 SECTION = "base"
 
-- 
2.7.4


