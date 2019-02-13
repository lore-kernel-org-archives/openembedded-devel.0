Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0D56BCA9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2019 17:31:25 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id p4so1480933plq.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2019 09:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=i41+8O1NHcKN8t9vqZBh5QvBWlJ4eftOK41i3bhQkxw=;
	b=s2nTWP0ATah6x+AqHKbJJg7NOCMEm88+FG7ncLtyH9iQ+OOsvkvJ0l2m1AzXHwCn1m
	XpM69AAEel+fPC/f0ihdf8OSFFQzoto5QpwUWrrmIBkGAYEzM2EZ/bOsQaZiMexeInZe
	yB85syWTTH4kVlMOzRS4qUP6pM3IeSYyLLTam+1P8DiyZh55ohLQaEF0QONB8tag8IQZ
	TW95EIn0jVDjDhmtEl8FGnVI1q9u9bSK331o0zhIIhrx2CMzthpi5oxPPzyL3dis13qn
	sOwLK2IsNHjAUmC5jqKzP8J+Ob/ECt0hhxHX+KqeKSrVfElbUeVGYcu9sDcnnDr4/zu3
	z32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=i41+8O1NHcKN8t9vqZBh5QvBWlJ4eftOK41i3bhQkxw=;
	b=nYtJnw19Jjyrxq9SesyACzMrXbifd6u3eR1ec4hvkzBDLj6czrPRowp/LaijfN4Ff0
	ABuPlGnbma9WCqnREXmSoxiCrtbVGU3J/XkGaJBW4fAeIEUh/JKC/K2VeUwXVcNPfw9d
	7mKdXE02qocswJvEZkhu13oaT3SrPTCGMtFFeCqqIPag7wOaQPMboHB300Ma9JP9neEf
	a8nF2HuDLm/sNrHh5Xo3nkZxJfqIRsEZqZc3+muA2GjkbvFcBzfkmJaoQlRmMvPLesP+
	6vpbMEnzGCLS0hAo7SdxYQPyJyrqVl3PGWNgB3AA0GulhQod+O+ZS6z2EP0UumN+4GeK
	mzxQ==
X-Gm-Message-State: AHQUAuabW7LK8TWBv+Qk73X1LvZRE8sDgVxOq1AA92NNGbv9tzdVB9Lb
	FiZ4ZQ++KDnMULW8T6jrBFRdN/oI
X-Google-Smtp-Source: AHgI3IasOuBUeuVNt+HOMOdLV/ehEbx84rj8swuS1PI7XtDIsB+Ht0/KBAfhLnvWZ732gykIz/nAGg==
X-Received: by 2002:a17:902:a50e:: with SMTP id
	s14mr1569742plq.311.1550079086172; 
	Wed, 13 Feb 2019 09:31:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	h15sm21528945pgl.43.2019.02.13.09.31.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 09:31:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Feb 2019 09:31:14 -0800
Message-Id: <20190213173118.44597-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190213173118.44597-1-raj.khem@gmail.com>
References: <20190213173118.44597-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/6] gperftools: Use ARM ISA when using clang
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
X-List-Received-Date: Wed, 13 Feb 2019 17:31:25 -0000
Content-Transfer-Encoding: 8bit

It seemingly needs to be fixed in application, chromium also force ARM
ISA for internal gperftools

also see https://bugs.llvm.org/show_bug.cgi?id=31058

Fixes errors like below

| ../git/src/base/atomicops-internals-arm-v6plus.h:228:8: error: instruction requires: arm-mode
|       "ldrexd  %1, [%3]\n"
|        ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/gperftools/gperftools_2.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
index e9fcc4cc98..c8b91278da 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
@@ -26,4 +26,5 @@ COMPATIBLE_HOST_mipsarch_libc-glibc = "null"
 # {standard input}:434: Error: lo register required -- `ldr pc,[sp]'
 # Makefile:4538: recipe for target 'src/base/libtcmalloc_la-linuxthreads.lo' failed
 ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_toolchain-clang_arm = "arm"
 
-- 
2.20.1


