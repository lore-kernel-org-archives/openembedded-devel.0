Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id EA45E606A8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jun 2017 04:58:42 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n23so14633443pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jun 2017 21:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KyWMd7P/WDhfuGAjHwz7d3ZefVg+cOC9Y163hTqYMOQ=;
	b=VaP/UmJ4yHBAM0FZD4yv7/LwfxnLi1FI48gJ1Yjo323IxrP7ZxO0myMlhukbfEQAjO
	tpTlmeBBNLURYdw2q5gjsg8pZrSdJXqZEKNqR8cypE6CQl7njwAM9+eAzmtoSYaMfMcG
	xu4Y9QFeXgXglPTwCK9qDNlzFyzepe9kUS90uNC3LSNNslHKjnUI/D8HyWZkEltbGOuZ
	kkThm1Y/Zky4y5fCy6J+yykmUMQAkkZ3mMGjW2baQagA5NRuMN3I6eG1IO8Ma6anhi8y
	FLUXa4/Ec0Y7moh+a/2fjX/jcJseRKSuK486lSGzj/A50PLs9EeOWHdVXF6O2EwH8TVa
	GTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KyWMd7P/WDhfuGAjHwz7d3ZefVg+cOC9Y163hTqYMOQ=;
	b=jG1n7kaOnBzXP8JYIsiE/ehrKUYXDrfKMY7ALSksvJFS8uRebX2LDR36nsELiAJ4Mt
	K46m2GfWTY5gjMLtEhf4OmWwXs3OSnBI7nR7JGuxPm49UvCmSdAfoGChnC6+55AyHQiU
	Tx5S0L0Q8MvL9RxjKgEtyDBTI5o+QMZjF9hiomfg3teq8hGpZ0y+/PBxB4xoFP7umpn3
	ZZFwW0xtVNPKc70W8B5qEu7Dqc3L9UwmVWcXuySAluYRQAiYKZtoKZgQhDRFMDlCH/87
	7wbG0if7VmKxOKUqW9ITYcGIyC7Xz5Hvg7KP5NL90iSIkh0MUbNwSy6Y4UNFSeAM54AB
	qNjQ==
X-Gm-Message-State: AODbwcAcKRBO/nYIg20KIeFHEtL07h/BoHLFjnaCIDRxYwEYC3bQkbf6
	5opLg16cG7Qjc5Mu
X-Received: by 10.101.85.196 with SMTP id k4mr10358312pgs.172.1496465923778;
	Fri, 02 Jun 2017 21:58:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	o29sm40732836pgc.27.2017.06.02.21.58.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jun 2017 21:58:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jun 2017 21:58:30 -0700
Message-Id: <20170603045833.8120-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [meta-multimedia][PATCH 1/4] caps: Fix buld with -pie
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
X-List-Received-Date: Sat, 03 Jun 2017 04:58:43 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/caps/caps/append_ldflags.patch  | 18 ++++++++++++++++++
 meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/caps/caps/append_ldflags.patch

diff --git a/meta-multimedia/recipes-multimedia/caps/caps/append_ldflags.patch b/meta-multimedia/recipes-multimedia/caps/caps/append_ldflags.patch
new file mode 100644
index 000000000..3abd38189
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/caps/caps/append_ldflags.patch
@@ -0,0 +1,18 @@
+Change the order of linker flags such that -shared is appearig after -pie/-fpie
+this helps in building the package when secuiry flags are enabled
+
+-Khem
+
+Index: caps-0.9.24/Makefile
+===================================================================
+--- caps-0.9.24.orig/Makefile
++++ caps-0.9.24/Makefile
+@@ -14,7 +14,7 @@ STRIP = strip
+ -include defines.make
+ 
+ CFLAGS += $(OPTS) $(_CFLAGS)
+-LDFLAGS += $(_LDFLAGS) $(CFLAGS)
++LDFLAGS += $(CFLAGS) $(_LDFLAGS)
+ 
+ PLUG = caps
+ 
diff --git a/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb b/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
index 90a28360c..d7887635e 100644
--- a/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
+++ b/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "http://quitte.de/dsp/${PN}_${PV}.tar.bz2 \
            file://Avoid-ambiguity-in-div-invocation.patch \
            file://0001-basic.h-Use-c99-supported-stdint-types.patch \
+           file://append_ldflags.patch \
            "
 
 SRC_URI[md5sum] = "c1d634038dcb54702306c0e30cb1c626"
-- 
2.13.0


