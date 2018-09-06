Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 754607949C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 21:16:16 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id s17-v6so5545620plp.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 14:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gL8OePuwXhvD2YZWhvI1vQvsSyi8diOJZ/fD3GfB2os=;
	b=XLnuEYWsh53HWGN7GdIYqWkE5e7tooDUoRgE+QvPnNU4PsAJl1hfonhWEK3El9hOdx
	jajtn3UrkOhl1GBuuJfjxN70W7W2wkDnjCYXIBq1WLNOmvtHDb2WBPg9AOyyhiL0T4J3
	+JC6Rs0pJ0E1+KYtnj6k40e6kgakhQUID5G9iA7apjMKUWBBdUbNzoxRU2yQW1T4YHL6
	qgJLRL6qNLtHLICoXM2ULncRNahmIH84kGWha6AEsmW7zxQlqlbqL7swDMQ6fgK0ZZ1A
	DpC+yoMGmiJmutR2KprdX2JG3f5eNhTco76JuI8ckYMlEI8ibLvKTcQtGqTt10iqGFLQ
	bkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gL8OePuwXhvD2YZWhvI1vQvsSyi8diOJZ/fD3GfB2os=;
	b=IR2kTxzgJcpz4RUviDvsUQq79G6r7gpT7Uoxrlf8bWGhp/6VJXMfellP4Z/dD/wE0p
	hTWLXjjN/jQC6JbHIyIdwUW6Hc8ce2WafxTrBZl52XVi37YfDER2ON3RDbEctcu5Bnwj
	ZoVBJoBqUtsgW3JwK7ahLt7qm4lxcrs41RqoCywFFB1f9Bl91NzbNtkqjdkzO0MI6vW1
	xnN0UkdXUPLleaQ0xCSBG0e/J4JErxHrpvxfewfduKgaCvzrpzjDaIjhJLuDbkQtA2m1
	4VsaoVwz3freyBFTnUYLRZJZd2RL2sIz5bwJY1oobwnI7t3Ho+qN6rcxGfbFHxx0Bmk6
	YBkw==
X-Gm-Message-State: APzg51BuaTdOT1Lt6NUNDr9yMReRgR8r/u68o+iCLbl3UABBrRnrNDHV
	INtmxWQYOUX/dRgyqJAckwT6AnOa
X-Google-Smtp-Source: ANB0VdZl0OJvqEL/+W79wqAnTaN0T7440SX0n3F74U8q8a4/IAfrFeZRHY2hAkpLhf88Pn3VLPly5g==
X-Received: by 2002:a17:902:6ac5:: with SMTP id
	i5-v6mr4772150plt.232.1536268576938; 
	Thu, 06 Sep 2018 14:16:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	r18-v6sm7375776pgj.51.2018.09.06.14.16.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 14:16:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 14:16:04 -0700
Message-Id: <20180906211606.4910-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-oe][PATCH 1/3] uftrace: Upgrade to 0.8.3
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
X-List-Received-Date: Thu, 06 Sep 2018 21:16:16 -0000

* Deliberately provide a non existing path to with_elfutils so it does
  not copy libelf.so into its staged install and become a provider for
  that library while elfutils should be the legit provider and this
  package should just list it in its rdeps

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uftrace/{uftrace_0.8.bb => uftrace_0.8.3.bb}          | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.8.bb => uftrace_0.8.3.bb} (76%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.8.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb
similarity index 76%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.8.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb
index 82b179521c..a489f4a5d5 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.8.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb
@@ -10,15 +10,17 @@ DEPENDS_append_libc-musl = " argp-standalone"
 
 inherit autotools
 
-SRCREV = "5af9ff9fa89c340617e52c8ed05798b352a7145c"
+# v0.8.3
+SRCREV = "8b723a6fae2ef30495cd6279774fba9c95cd9c88"
 SRC_URI = "git://github.com/namhyung/${BPN}"
 S = "${WORKDIR}/git"
 
 LDFLAGS_append_libc-musl = " -largp"
-EXTRA_OECONF = "ARCH=${TARGET_ARCH}"
+EXTRA_UFTRACE_OECONF = "ARCH=${TARGET_ARCH} \
+                        with_elfutils=/use/libelf/from/sysroot"
 
 do_configure() {
-    ${S}/configure ${EXTRA_OECONF}
+    ${S}/configure ${EXTRA_UFTRACE_OECONF}
 }
 
 FILES_SOLIBSDEV = ""
-- 
2.18.0


