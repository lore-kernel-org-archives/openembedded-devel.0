Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id C6D677F88D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 05:40:10 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id a2so1433726pfo.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 22:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=0o5DWPtex4MLpx5B452uxh3OEdfofXEw07y9rkxX1ns=;
	b=X2PrPhM1H7vekgqayht90t6rPi9Gd9+A8yDjltKQeINAjsKwUF8eVIPFSL8WihLg9V
	C7CMArRzO2QwnanymvVD7di++gQyGiHfqqOgI8jFVDYcV3PV9Nvfs6fAmpfGqcM4wfPu
	vDSRlp5FY919Oz60Q1mnOcn6Xb5GfXEz+0VyDlHlIMHixBnJZ+Dlw7e1O48ksAGKP77W
	BzR1c/e+v5aUHHP3tkbdfDupGMUYC0XoQ9T5TdaP5LKEsgtN0TVL1NsbUBaH8IOCv4mt
	fiT0CNduzjilLLa0cTgQ9mp/NNirIU7NigjMs94nJAR2BBlvt+Bo6LgT0L8JbV0UWErP
	RNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=0o5DWPtex4MLpx5B452uxh3OEdfofXEw07y9rkxX1ns=;
	b=q1qA0d17QdtRh3o3pBpVfpmTDmSlJ7KmNNg403yOKW3r6lkAZ8jVh9fnQW/GsedquP
	mSW7vRtfAL4VKITjypXboWLIUxiVyn6acuSBnNXggvQRdJHuEAWELKQS1hLkB0Qy3wU0
	m9v0xqg1q9RExqicUC4Dmxx1uOhYVoVamlKWVCsS/CmsFZouhQeCsXFxwbshjRz9iDGS
	UP0lGM6eQ7baGpgaemSgGAShiOLUaVDOXChrQ3l/X9J/5JZzawvVIz6oHx5UcdHquoLy
	YggsD9faa/6gYTTf54byCoSowp+CHj2qP66uaOArs0hKHuBc+ER5Trhip1iSwqZpmzgc
	9qfQ==
X-Gm-Message-State: APjAAAXJYUNwgt6fkhlRdK1sAnqHGJPKTMt8rWmpJWck9YT3dJbl+2mn
	/OguiPPhvRHNTE3wIfu7fYuyXRLDMz3HKw==
X-Google-Smtp-Source: APXvYqyZT8/EzRa5JNPUxl5KHW97Tja14Hu8fNqOvUxyJ2jNWjXWyVqGDD+Gt+mOXzhP4SoviLbVlQ==
X-Received: by 2002:aa7:9f0e:: with SMTP id g14mr2390009pfr.100.1568698811552; 
	Mon, 16 Sep 2019 22:40:11 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	r23sm899990pjo.22.2019.09.16.22.40.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Sep 2019 22:40:10 -0700 (PDT)
Date: Tue, 17 Sep 2019 05:40:06 +0000
Message-Id: <20190917054006.20179-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libeigen: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Tue, 17 Sep 2019 05:40:10 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
index e1deb662ae..f638848d15 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
@@ -18,3 +18,5 @@ FILES_${PN}-dev = "${includedir} ${datadir}/eigen3/cmake ${datadir}/cmake/Module
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
+
+BBCLASSEXTEND = "native nativesdk"
---
2.23.0

