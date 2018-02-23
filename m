Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id E1F7D77DB5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2018 04:34:11 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id v186so1683953itc.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 20:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Ta94HtLXfFVD0uuesEfy046cIKWdRMQrMMwN+pr/aEg=;
	b=QrcALautzhtiz2S2cdELDmW7fMMLjywKmIj2sXlVamPJPmBnr3eVtRRLbYxoixLZPb
	NFHUkdiuoFMGwiaySiunfDFX6y81vxVIrzdj51aOKW/fZras/gtR/gMlVCGZASbSo8tv
	STcXRxGBDWklD5ir+yVMT4FvXVaT5VFAwPUwqeHvPk7/likAeSBJtU35fOkMpPaFvlAd
	Z48HXrayHYG10rf8n1qrqXTF5fpLIfEikB3aXZPeQEBre1LU1ptwJCFIBeBuZaJIgerY
	3d3RBc4H1irZAWztcJbO+2KQMARebgAgePECsvd7ArCZLMxe6nx9xiddxEXVh3NEiGpa
	8srQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Ta94HtLXfFVD0uuesEfy046cIKWdRMQrMMwN+pr/aEg=;
	b=TO184VfJtL0Aind/PTXHS+8VPDGjncxPjjGo0dsYsRVSl1HMalFoSoTBTidV+z8vQA
	Gd9EjZj95zSPLKfA1MD4sZ+jcthxoDPA5qlv9hXqdrmCM107pKBg7Q9xTeWXzdkwP36K
	sJX+THGru3ZfDFMQ0SPSKymduB6JjdGnT3+vfm8Fsh6LUqq5nG463gfO+Zw/IjF2/hCB
	y3uSFVINQg7umKqKT+HMCUuDR2rMtcFBLRRNmyPyDdUUzWqrBV6WalA56qbOBv8yllee
	dN2Uf+sQmfQ3SmzwLWr5Bo0OMHhCtjKVMEjL+SZXMeXXvmwQtbRWHoDOXaQNM4niqmkb
	ODBg==
X-Gm-Message-State: APf1xPD4D0ik7CoYuOobS1KNBeV7HqElR7VeaxAee7CGdpQ+J5zEUfdg
	EaC4LeTJYZDNuAOA7xlyD4uZtyCu
X-Google-Smtp-Source: AG47ELtfm2Iv0b8uqKYC9V6DLGmD+nbq6+sK7Rr3NUx36xvvl+lk3B8YcX1dE6dgsWpOqdL1kDpLTA==
X-Received: by 10.36.89.19 with SMTP id p19mr950569itb.80.1519360452668;
	Thu, 22 Feb 2018 20:34:12 -0800 (PST)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	k199sm681134itb.35.2018.02.22.20.34.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Feb 2018 20:34:11 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Feb 2018 23:34:02 -0500
Message-Id: <20180223043402.10149-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.14.1.459.g238e487ea
Subject: [meta-oe][PATCH] nodejs_8.9.0: add RDEPENDS for building
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
X-List-Received-Date: Fri, 23 Feb 2018 04:34:12 -0000

If you want to perform an "npm install" and a module needs to be compiled,
these additional packages need to be installed otherwise the following import
errors may occur:

	ImportError: No module named compiler.ast
	ImportError: No module named filecmp
	ImportError: No module named multiprocessing

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_8.9.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.0.bb
index 1cab6a4978..a4e50f142f 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.0.bb
@@ -80,7 +80,8 @@ do_install_append_class-target() {
 
 PACKAGES =+ "${PN}-npm"
 FILES_${PN}-npm = "${exec_prefix}/lib/node_modules ${bindir}/npm ${bindir}/npx"
-RDEPENDS_${PN}-npm = "bash python-shell python-datetime python-subprocess python-textutils"
+RDEPENDS_${PN}-npm = "bash python-shell python-datetime python-subprocess python-textutils \
+    python-compiler python-misc python-multiprocessing"
 
 PACKAGES =+ "${PN}-systemtap"
 FILES_${PN}-systemtap = "${datadir}/systemtap"
-- 
2.14.1.459.g238e487ea


