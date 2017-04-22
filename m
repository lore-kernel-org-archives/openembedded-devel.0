Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id B3B3377BFF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Apr 2017 00:00:23 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id e132so1039406ite.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 17:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3KjPTKIaH/D1YWrjoidteh4zxmi2bbAMWCFr7K5xJYc=;
	b=nSix9VDd9/qVXc+FORnnhRW0ESUuJmL3EaGGj5QFDFZmwoDwga/1utMFOvf/3aLqI3
	gKy+Q2Eb5oKi0kRVA1NL3eT0GZ+oMkeDx5PWSQ9U/CjUODP2A8VRc6Q2VwAYRKJq8bPG
	PQaWEVT22Arc5iOUJEpotlWeCa1HMZSl5N4tIMPYtY8f64iUEKuNWlUCIGL4QGwhD1Kw
	3ubgf35aEhvey2jjc22DgvKyHLd12E3Gq1N3nzLXrxPb9F99GzJOQZNA/cqmtt1ohhgO
	YureuBDY8PMVu0Jq55DHbCqj9fYZg/vHUe5mjDMz2RBN1Qpjy2mZAb2t49mua5quOp9F
	Mo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3KjPTKIaH/D1YWrjoidteh4zxmi2bbAMWCFr7K5xJYc=;
	b=AetA/4ZfxzVIAlXZIO/CP12iWrn54qzdq666QuqOzYkhijiZKoHv/1zo1zpizUdQ/0
	JpUxSTMTSzIDZscWvHj7zZFsYXUCIrEXv5sDFZsRFqZx1VsPgBR+vG518ILXO5XXeLrZ
	dtssJFDoCF0BIkDWg2FyVVrIF471jlZrMGN3YRmSG9uYRcDpWxOT3Npkm4U9U/g94DFh
	yjI8/A4Lxs6DW396oRBun98JZj8offY5cNQ4kVzWKPUgc7/UArDvDz7kwKSJ615R5/bB
	MwDdGaKhyc516We7zlDcPJ45Qyk0k+9HQHziCvT1PDdcenRgJx1OP39yytkhLxoakY1g
	BCow==
X-Gm-Message-State: AN3rC/7ryFOvsRYMWJdg0fXl8TMIgIsSNzvRsdOuOG9pToSPg3HyUanL
	NneFYVwuxPNQuA==
X-Received: by 10.84.224.136 with SMTP id s8mr18716268plj.93.1492819224682;
	Fri, 21 Apr 2017 17:00:24 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	c64sm17920377pfa.110.2017.04.21.17.00.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Apr 2017 17:00:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Apr 2017 17:00:14 -0700
Message-Id: <20170422000015.27420-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [meta-oe][PATCH 1/2] jack2: Fix build errors found with gcc7
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
X-List-Received-Date: Sat, 22 Apr 2017 00:00:23 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-typecast-input-parameter-to-int-for-abs.patch | 32 ++++++++++++++++++++++
 meta-oe/recipes-multimedia/jack/jack_git.bb        |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-typecast-input-parameter-to-int-for-abs.patch

diff --git a/meta-oe/recipes-multimedia/jack/jack/0001-typecast-input-parameter-to-int-for-abs.patch b/meta-oe/recipes-multimedia/jack/jack/0001-typecast-input-parameter-to-int-for-abs.patch
new file mode 100644
index 000000000..c119f1981
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/jack/0001-typecast-input-parameter-to-int-for-abs.patch
@@ -0,0 +1,32 @@
+From 8ec6f75bf7a318a3a1e352df7c97630cfaba537a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 21 Apr 2017 16:18:39 -0700
+Subject: [PATCH] typecast input parameter to int for abs()
+
+Fixes
+../tests/test.cpp:482:73: error: call of overloaded 'abs(jack_nframes_t)' is ambiguous
+
+because the signature is int abs(int) and its passing
+unsigned int to it.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/test.cpp b/tests/test.cpp
+index 8a8a8117..9655742e 100644
+--- a/tests/test.cpp
++++ b/tests/test.cpp
+@@ -479,7 +479,7 @@ int process4(jack_nframes_t nframes, void *arg)
+ 	jack_nframes_t delta_time = cur_time - last_time;
+ 
+ 	Log("calling process4 callback : jack_frame_time = %ld delta_time = %ld\n", cur_time, delta_time);
+-	if (delta_time > 0  && (jack_nframes_t)abs(delta_time - cur_buffer_size) > tolerance) {
++	if (delta_time > 0  && (jack_nframes_t)abs(int(delta_time - cur_buffer_size)) > tolerance) {
+ 		printf("!!! ERROR !!! jack_frame_time seems to return incorrect values cur_buffer_size = %d, delta_time = %d tolerance %d\n", cur_buffer_size, delta_time, tolerance);
+ 	}
+ 
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_git.bb
index ba52691d3..b85ba8a02 100644
--- a/meta-oe/recipes-multimedia/jack/jack_git.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
@@ -14,7 +14,9 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "libsamplerate0 libsndfile1 readline"
 
-SRC_URI = "git://github.com/jackaudio/jack2.git"
+SRC_URI = "git://github.com/jackaudio/jack2.git \
+           file://0001-typecast-input-parameter-to-int-for-abs.patch \
+          "
 SRCREV = "2d1d323505585d406a7e64fb932953baefc5945e"
 PV = "1.9.10+git${SRCPV}"
 S = "${WORKDIR}/git"
-- 
2.12.2


