Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9501379785
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 15:44:29 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id az3-v6so3675597plb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2018 08:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=0bDTJDJEv+uWwvIR8PEcVap7hqUFfU8z2svLHdIxeTU=;
	b=S4FpDwabDUVY1CEU9niyWWiDiDN8OgSRc9EGqpc6VtNV0bck2MV8GDQOcuuTprRsqw
	+LwdRTDwUF/CCZJ10XovoE5eB4+4cAMUK/CZg9/NXU0sreuLiA5EJSRLAGOPRiNkpEPH
	QEq5Ks6XZdqfzcMpICVyraaYNxq8k9Q3ry56SCwCLu0RJ5BGjYY6r/MnbQMeHJzfkDgU
	kcnIpsY4YPQKPUFjUdNtR9ruLOkmYns71F8VZYG3rHcRk/C07HlL8i3/GDodk4ocjz48
	H8v0aa9ordg+gHdaW1dICOxSn8uRwFIvbFSkmToRmJG4cL/KWs+mgi/9NOqRj2ZmGDLm
	/J5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0bDTJDJEv+uWwvIR8PEcVap7hqUFfU8z2svLHdIxeTU=;
	b=kRamFYtPsDqujk6A5bD4JWlf0BfCOkaSUrotGccpJnRE78hsXpp8zR8ovIiWwnKR87
	Gn9n4KP8aq8Aovf+1QWDQ1frEf7uUD/9B01BXtcklE9ps6aaIEDiDeaFg3B2p01/IInd
	VQ2Cl2JyoFOswRcxplQs3ED9/1+J4Tg3DskEoI+zkoCHI5b7LfsHTEnmlitc02UOKYnQ
	tsR02f/9zbLRu2NQDu1ZBiAWNLdf9ra5PFr2TuVSYTb9IQRr+e6UH4kSEU9z2TWeJTol
	hvpjHVWwP6xX98PNm5kBilKKG12ZH7yjNt3GpUfrsj4RwpOsSFdwebvpUnEUrzJZksmE
	pV4w==
X-Gm-Message-State: ABuFfoiYVkoKG/o7iv6k7j6eVSaDXWZOSzceoJ/PkLpujReZEJQAAblw
	0K+7sYWjt8EIbiziXtlpok0l7jcUsHI=
X-Google-Smtp-Source: ACcGV62OWqN/ZIzhUBHhUnAS9aoay9u+chCx93MWvFBn+RsstDUwydvIamlQWscD+dyZFyxT2kSFrQ==
X-Received: by 2002:a17:902:d20a:: with SMTP id
	t10-v6mr2247315ply.256.1538581470413; 
	Wed, 03 Oct 2018 08:44:30 -0700 (PDT)
Received: from ankit.iind.intel.com (fmdmzpr04-ext.fm.intel.com.
	[192.55.54.39]) by smtp.gmail.com with ESMTPSA id
	o62-v6sm3009248pfb.0.2018.10.03.08.44.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Oct 2018 08:44:29 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2018 21:10:23 +0530
Message-Id: <1538581223-13647-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] opencl-headers: Initial recipe for OpenCL headers
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
X-List-Received-Date: Wed, 03 Oct 2018 15:44:29 -0000

Add generic recipe for OpenCL API headers.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 .../recipes-core/opencl-headers/opencl-headers_git.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb

diff --git a/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
new file mode 100644
index 0000000..16bc247
--- /dev/null
+++ b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
@@ -0,0 +1,19 @@
+SUMMARY  = "OpenCL API Headers"
+DESCRIPTION = "OpenCL compute API headers from Khronos Group"
+LICENSE  = "CLOSED"
+LIC_FILES_CHKSUM = "file://CL/opencl.h;beginline=1;endline=27;md5=687394644e8c4ec4fd3d77f2f86bc042"
+SECTION = "base"
+
+S = "${WORKDIR}/git"
+SRCREV = "40c5d226c7c0706f0176884e9b94b3886679c983"
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install () {
+	install -d ${D}${includedir}/CL/
+	for f in ${S}/CL/*.h; do
+		install -m 0644 $f ${D}${includedir}/CL/
+	done
+}
-- 
1.9.1


