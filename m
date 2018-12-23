Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8A6DC6D2BF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:10 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id g9so4868290plo.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xOLWlMoG2f5DHRBSttLol/Sl6nhYoGV3VorSlLadr54=;
	b=uhOcY+MItKZJInwF5BcKClvIsbQqAbaBZzow5kNxB7w48Pqg9qxZ2il9PugiOTxrWQ
	NCYe95QMvXPodsvq25E/O+VQ/E5Q20RQjn4PL/jkqzU/E60MZGIyEm11FvFPeOLQT2gg
	ABv6rP0muZZtcrxrKCZfZSKnmBQ+dbvTeLK6k8FvJn5fin3EIqD5WAqBCdARM1EEHros
	Y1nTxg6QMEmU6udUAaiaNXFrCYBb5/RWAfCwFef5pFrSdWU70YIPHbMc7bgb6szf+2sv
	lRw2RBtaOhr/NNPM4dVn4sOjzgI8d9FJwWGUr8Vqi81pAfqbM+BeZv1PczJkGuNGn1YX
	/K5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xOLWlMoG2f5DHRBSttLol/Sl6nhYoGV3VorSlLadr54=;
	b=FwQMcJpwMpbA+MYDwoo5trtMQO897BPJwv9WY76Fh5fBlUmapO4t7Paqhg+B5TfSoa
	yDS4hefPRWnMszIyJX4ZrlENKGiZPivMDHdDZFKJaUuPepXXb4iVzVcACXbz2hI5n9Lw
	+h+junLf3xwme0RfQPWFUG86wR/WmICVbtU/+lIFTuAYZ64YacRwCAIseSSfLcPQ/oiD
	VYDHKvdzunmuS1r9G3nFaGs5sROmsaLGYIsBCePjv0TDQmsmgTbPWx+39EurLxNw84Ip
	luy/RPdzDZh3yj+N3UytVR2MPRgNhdxYjBQOVRYPWm8Jr0ZyTsd/xVrJ+PhH7tRBgyFL
	zQYg==
X-Gm-Message-State: AJcUukdXV6i+biSqr/kHdzsdqc2xsEITask3Lf/CUu+mgNoUGX21LNnd
	flSkb0/nIk5BmZ4mkW+1IGprXPqHkR8=
X-Google-Smtp-Source: ALg8bN7ZjudCnM390xi80wmKtlZPiOqnBVMLH9+gw5Xv7cSTIDiGR5yUmCNc+6v+EPz37ucS6Uy5ZA==
X-Received: by 2002:a17:902:583:: with SMTP id
	f3mr11123432plf.202.1545600971192; 
	Sun, 23 Dec 2018 13:36:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:42 -0800
Message-Id: <20181223213557.7834-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223213557.7834-1-raj.khem@gmail.com>
References: <20181223213557.7834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 03/18] ltrace: Fix a NULL string use
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
X-List-Received-Date: Sun, 23 Dec 2018 21:36:10 -0000
Content-Transfer-Encoding: 8bit

This case is likely to happen when mod == NULL so print it when
we are computing modname and symname

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...o-same-block-where-modname-and-symna.patch | 37 +++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-move-fprintf-into-same-block-where-modname-and-symna.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-move-fprintf-into-same-block-where-modname-and-symna.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-move-fprintf-into-same-block-where-modname-and-symna.patch
new file mode 100644
index 0000000000..54acaace1a
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-move-fprintf-into-same-block-where-modname-and-symna.patch
@@ -0,0 +1,37 @@
+From 0cad025f80cf090dc16a5b70e21477f5b08a67fd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Dec 2018 11:27:45 -0800
+Subject: [PATCH] move fprintf into same block where modname and symname are
+ computed
+
+In its current state if mod turns out to be NULL then modname and
+symname will also turn out to be NULL and fprinting them as strings will
+be problematic
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ output.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/output.c b/output.c
+index b63befe..5aada7b 100644
+--- a/output.c
++++ b/output.c
+@@ -654,12 +654,11 @@ frame_callback (Dwfl_Frame *state, void *arg)
+ 					   NULL, NULL, NULL);
+ 		symname = dwfl_module_addrinfo(mod, pc, &off, &sym,
+ 					       NULL, NULL, NULL);
++		/* This mimics the output produced by libunwind below.  */
++		fprintf(options.output, " > %s(%s+0x%" PRIx64 ") [%" PRIx64 "]\n",
++			modname, symname, off, pc);
+ 	}
+ 
+-	/* This mimics the output produced by libunwind below.  */
+-	fprintf(options.output, " > %s(%s+0x%" PRIx64 ") [%" PRIx64 "]\n",
+-		modname, symname, off, pc);
+-
+ 	/* See if we can extract the source line too and print it on
+ 	   the next line if we can find it.  */
+ 	if (mod != NULL) {
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index f4033f7c27..83043cd212 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http
            file://0001-Add-support-for-mips64-n32-n64.patch \
            file://0001-configure-Recognise-linux-musl-as-a-host-OS.patch \
            file://0001-mips-plt.c-Delete-include-error.h.patch \
+           file://0001-move-fprintf-into-same-block-where-modname-and-symna.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.20.1


