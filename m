Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id B392379980
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Sep 2019 16:59:40 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id d15so9515648pfo.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Sep 2019 09:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cQIrgpSRT2IjWFdoid9as23H6WFP9o3qZsSmTTreXb4=;
	b=udWAxeyWLFh9GEnVvOzoEYH7pw3kQkClCfJeIgfht1tiTHq7zgVv55j8fujF3m6Ow4
	CB/rWgxZFM/B7L6Fj4RomuILq1txmvOjzXBdTYUUIyuptzdR3i7ssqHMuh5fVVHBwB3F
	LipUXK2nxn0N/AA0Zea8jWJxfNajur5H/eNt1R7tzJ7rEOBYRto2KfH/X5j6XP1Ar5mv
	yVNJLVYGqIjM/cFNT5DjlHsKziP10bV28Ri8oWfx2RQuFDDjybxu5AzyJNgr5tGhmxMa
	rXXu6pLLS9vdbFkxeuIqReAnpu+Ca1LI80ZAMJ5Aj5Ye1YX4ifhBBoESuRscQAMwzFkq
	m3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cQIrgpSRT2IjWFdoid9as23H6WFP9o3qZsSmTTreXb4=;
	b=iVLYGWW8M8hTpjIuCzESCwbxjh5rN27bB803b1EkVR93WPsMkq6kdZan/qZ0gwh/KU
	JmieRyYXd1/8XQni3F8JdGLfhgHrcRW27CFsL6sf4M/eM/1nXYskJpJa0N73ujwNLT4Z
	B6FpmedHGV2FSeNnOcfuPDMktb4p2DblCE4wwFA1FOyDRtCu6QjX4+Eyi4ij22g6R5P/
	UYTZtx+dxH5oSrMYfpcvSkwTqhWRP7L28hzSmhAk2Hlo4k8KLKGO7QznOf5IlBWTuW7g
	MSabeZOzg+eWRye0jpL7gsbMdQUClytqV5LcTTXKp4CDY6uJWs5ofOR9aFEFLUSrfw6M
	8/iQ==
X-Gm-Message-State: APjAAAXxmoGhRAs6XmRBvqpPhj26IwTMqxSep+5ZRiuyzvi+Q4TMHW3p
	njGSgw555/EO/CNfWzo3iKckM9R81VY=
X-Google-Smtp-Source: APXvYqx9dsZwjcRjSY2gAeNL93UXMdLMJG6mNpAPNB7Djs3pOn1EQapSUr8pWhA09SpTEek9HzPZfw==
X-Received: by 2002:a63:205f:: with SMTP id r31mr15325180pgm.159.1568048381270;
	Mon, 09 Sep 2019 09:59:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	d69sm18437181pfd.175.2019.09.09.09.59.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2019 09:59:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Sep 2019 09:59:33 -0700
Message-Id: <20190909165933.3132376-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] kernel-selftest: Needs error.h which is missing in musl
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
X-List-Received-Date: Mon, 09 Sep 2019 16:59:40 -0000
Content-Transfer-Encoding: 8bit

prog_tests/flow_dissector.c:3:10: fatal error: error.h: No such file or directory
| #include <error.h>
|          ^~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index ff9720f8d0..fb4534dca8 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -115,3 +115,5 @@ RDEPENDS_${PN} += "python3"
 INSANE_SKIP_${PN} += "ldflags"
 
 SECURITY_CFLAGS = ""
+COMPATIBLE_HOST_libc-musl = 'null'
+
-- 
2.23.0


