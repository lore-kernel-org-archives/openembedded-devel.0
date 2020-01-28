Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 82BD57FF2F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 19:31:34 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id d9so5492398plo.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 11:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=k1HcN6VuogQUYHN0kKuOuqxD0gGmMMa566q11PxSvpI=;
	b=FYouvH3R6s8rvIwIeEGaTM59SxoWUjQWsg+LUnSKDNzBAevbb9fN9zRU5ffn7rS1jY
	KcNWRg5qYsORAlWA9MX+NWan1aNynxnd9r0aC4fW3b6yE/0HHFj2iMFqiEnZopELyuTi
	EdgbSwqFQWIg3cpgmAM7uHKmybNPo9kklZ6RbEjPzUtL05Nj4uoVMa/g824fi2eiLx3D
	PGKcIPdjfMXfoV54jJAh2RFjHjob4/XoIAzZ9IamOHG8VE51RReDCE/Av+nbiMpBBgyq
	5awsMY9U0rbD+14iQuQUbVtZsVv7Oz00qhTwk22m8EACG3tmtt6PE6wVq8vPoxJBRsZb
	EDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=k1HcN6VuogQUYHN0kKuOuqxD0gGmMMa566q11PxSvpI=;
	b=YI4x6RLd84HIytyPiLx3xW/rRPaREgoMQwZIuSbODfYHVa7NThatKJCw3L3ScCXQ16
	DcQBr/ORO4O7EfKPsFCqjNKiGGrh4heSTXSz5H5KjO07xl4SoQ0d/d+bjZOcEmUSgCkY
	liN9tQD9ZeZGWg/mfUWrJn77TEqRSoRlO0Co4SLCsW1obo0XYz+LSVAVUM8QkO9gWHqj
	eONz6FmXc4i8/o/O0mvryUU7jTKvGvdBKpkCKAToEFMHQQLWimquXTGUOkU9SsAgGC9L
	lsQ+s8O7n5+b4HS1Vf78Bxuj1GpFEuYYpwrwBovacsG43GNTvwpHp67BqGUBV+z74whp
	NJYQ==
X-Gm-Message-State: APjAAAXTrgq3/5cZAs8W0lKB0hp/T2Wccz8EGTEZu3fLtDFD2rLdAaTw
	4ZcOYWoHFNSS2JvXQwWGCupHKlJrsZE=
X-Google-Smtp-Source: APXvYqxwmBQHDH7YQCoApqpntItHxeDm85X4ty8b+pbfuT1+RbRnK8KTkBSD1Ci+SlFGPogbvjJTKA==
X-Received: by 2002:a17:902:8647:: with SMTP id
	y7mr24395912plt.224.1580239894914; 
	Tue, 28 Jan 2020 11:31:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id y23sm3840860pjj.3.2020.01.28.11.31.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 11:31:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2020 11:31:36 -0800
Message-Id: <20200128193136.903751-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] daemontools: Disable the chkshsgr tests
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
X-List-Received-Date: Tue, 28 Jan 2020 19:31:34 -0000
Content-Transfer-Encoding: 8bit

Running the chkhsgr test during cross compile fails

./chkshsgr || ( cat warn-shsgr; exit 1 )
Oops. Your getgroups() returned 0, and setgroups() failed; this means
that I can't reliably do my shsgr test. Please either ``make'' as root
or ``make'' while you're in one or more supplementary groups.

All OE based targets have working getgroups()/setgroups()
implementation, so its a safe assumption and therefore make the test
to be a dummy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/daemontools/daemontools_0.76.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
index 35251cb8dc..d674e03781 100644
--- a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
+++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
@@ -33,6 +33,7 @@ DEPENDS += "daemontools-native"
 DEPENDS_class-native = ""
 
 do_compile() {
+    echo "int main() { return 0; }" >${S}/src/chkshsgr.c
     ./package/compile
 }
 
-- 
2.25.0


