Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id C192D74AFA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 00:19:47 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 80-v6so691755pgh.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2018 17:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A49ueBh7E+jpxUg0Um69VFTx/kmp8DDYlGRaVDOhV9E=;
	b=FTF9CcNYmUaOazmMue20vHWDy5eDcNRjf1rj/gi7szSNc2vsy/wEhnT7YRZRh8m3UO
	56EjvB1STVLmNghMnMWwQNnt6e656tn5RuBb9skLSCJjjrZvjYEvGSDscST2ykaHe+bc
	vurKE7tVXC6uZxOmbJyIhSooh5d8AKkzkdYbj4AZ+AchE45PPffCQTuwk2H7ae4nVUoM
	WdSKm5t4Nt0bz/VOFrdS4mNdwKlXU7Mt6Z8WH3kTLQCbcAW/ISsN6Mv13K4IpiF1P5EI
	1398b4T/IMaGK0tD3E+dx/w9faV4dcCgfaOvwfmJOKfsUS706kzAc5tIMvHDZCDdQmeo
	mMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A49ueBh7E+jpxUg0Um69VFTx/kmp8DDYlGRaVDOhV9E=;
	b=qeo20wjWDyd1PjDQJTCuetkDrSksTjyeujaUqUwztLERV85jmyCkE93nxXiSMCrezO
	kECPmDKQwaptAAWZv0/cQ4aRN+7jTSaOBtiCT164Sp45uJ1SlXQmB6DdTjD7Ba6V9QGp
	I4cf4gUVNCG0UZEBKOfTR29qsFZOdWG9VIaVRDRFXVRtjwz2V/O3uLkm8nvgSiEf6BN+
	oIE2Zq+RoCCIq4cGAWx5YncHfzbh5LveOt1mxga2I/+J0qBu/4Yjx/qPEQEcqn+Ki0ye
	7eM2OZy8Jc9ev9vKU0siIi4PtKlchKjIsUbJCqCSmYbM8yBP3eFhrq9rpH0DZCDK6IIU
	YXRQ==
X-Gm-Message-State: ABuFfoi0pQGbU/BebVI+y2mpvRJMK0HtZgb12bABXU/KYqii3dssJo2y
	V/2qmbwbGrR2JWNn3CaVCUmd3Qyf
X-Google-Smtp-Source: ACcGV63RQwoKMfLi8vxYsnXdMLoAc0obGG1QeJf4pu5G8C91UVluJ9vzQuGax6pH7a9DCT1nRV1Ezg==
X-Received: by 2002:a63:3507:: with SMTP id
	c7-v6mr16215033pga.158.1538525988304; 
	Tue, 02 Oct 2018 17:19:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::fd07])
	by smtp.gmail.com with ESMTPSA id
	g3-v6sm21876937pfi.9.2018.10.02.17.19.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Oct 2018 17:19:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Oct 2018 17:19:40 -0700
Message-Id: <20181003001940.31658-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] yasm: Use 1.3.0 release
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
X-List-Received-Date: Wed, 03 Oct 2018 00:19:47 -0000
Content-Transfer-Encoding: 8bit

* latest master might have issues, so revert to using 1.3.0 release
* Disable parallel compile

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Disable parallel build and add missing deps

 meta-oe/recipes-devtools/yasm/yasm_git.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index b685b42412..b20d4c05ca 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -4,14 +4,19 @@ HOMEPAGE = "http://www.tortall.net/projects/yasm/"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a12d8903508fb6bfd49d8d82c6170dd9"
 
+DEPENDS += "flex-native bison-native xmlto-native"
+
 PV = "1.3.0+git${SRCPV}"
-SRCREV = "35af9720e36df19382a57be26643b0d6bb48a363"
+# v1.3.0
+SRCREV = "ba463d3c26c0ece2e797b8d6381b161633b5971a"
 SRC_URI = "git://github.com/yasm/yasm.git"
 
 S = "${WORKDIR}/git"
 
-inherit autotools gettext
+inherit autotools gettext pythonnative
 
-export CCLD_FOR_BUILD = "${CC_FOR_BUILD}"
+CACHED_CONFIGUREVARS = "CCLD_FOR_BUILD='${CC_FOR_BUILD}'"
 
 BBCLASSEXTEND = "native"
+
+PARALLEL_MAKE = ""
-- 
2.19.0


