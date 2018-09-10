Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id A49AB65D00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 05:06:41 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id t84-v6so7974791pgb.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 22:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4yT7tDqHVlENlk3my+LpXGHTJnBVc3smPsg9VCu3Upk=;
	b=TmW39JSEP1aG8vYHzslIlTm5njtCwS2iGcCzQnWfcxZJ19Vyi6RXCRsCKQFFwioV+K
	DezZy6o7igEORVGGeugEe5YT8K/57VZFRNl9bPKpKuXBxTLzQJqoQEIcmP79RZT5BbkA
	GcUsOONdYDS6JwA3Z2iKHVtssneZ/XpsWdc5YSxPeqOdTzbG45ygUcXf1nvOb1RglGM9
	pndLkAAgCBVJfCoxCdVQK9o4kOMaedQPviugDDwWXA1/f72jo6wnVxiOzyo1QePFz+Ch
	AJt7Ig45uWoCm/Vh+LrLVHF/faNaQaJ+AMEaq6g+lPmNg0+xeaakybtmMa66xQyhylNO
	kbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4yT7tDqHVlENlk3my+LpXGHTJnBVc3smPsg9VCu3Upk=;
	b=BNmuG8kctHvUQeKPk8q/TYqov7w14ytG1eH9owXPFb9jw6HwtBrnYuysz/pJCp4U2q
	VZH56Z8ZawqRrR09EV0juGleHEYMMzgnaSRfznKLA8+VphsRm/HhH9Xjn1D0+uOSjwVN
	cT/rjLCwtFPmqHsS+XzMx1wFMY2fqJ95eefuRIhVKejAf971YJNo9sEfx/CH78ktdPlu
	3i1DD6aa3Usf5qcvPpj7Glo9lmv8gL1XHMaxvYUetzjlceiOP9iwiQuR9jDrucBB6akT
	CmIBB67M8uVPzsZvRhgPLF5TN6hF2dKRx9WxW6WtNqkMe9jIEFk3ELlARPPE6ciMgjN+
	4P9g==
X-Gm-Message-State: APzg51AvxHlGwgkArdL0mS/p5CAST19DpOnQg4azxQIpYCq+vD2ThQMk
	j55s2SS9HufSwyB2zwqHLtCei175
X-Google-Smtp-Source: ANB0VdZPIt2xezGvNQjNHTvXgGxlH4qsF1EcNusuxFK1Z2QR9szQ5N9zpRyh/9rnWXVbzLLrPlLNmA==
X-Received: by 2002:a62:6948:: with SMTP id
	e69-v6mr21570970pfc.166.1536556002390; 
	Sun, 09 Sep 2018 22:06:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	x24-v6sm18819188pfh.67.2018.09.09.22.06.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Sep 2018 22:06:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Sep 2018 22:06:24 -0700
Message-Id: <20180910050629.16170-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180910050629.16170-1-raj.khem@gmail.com>
References: <20180910050629.16170-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 05/10] openflow: Fix build with openSSL 1.1.x
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
X-List-Received-Date: Mon, 10 Sep 2018 05:06:41 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...generate-not-static-get_dh-functions.patch | 33 +++++++++++++++++++
 .../openflow/openflow_git.bb                  |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow/0001-generate-not-static-get_dh-functions.patch

diff --git a/meta-networking/recipes-protocols/openflow/openflow/0001-generate-not-static-get_dh-functions.patch b/meta-networking/recipes-protocols/openflow/openflow/0001-generate-not-static-get_dh-functions.patch
new file mode 100644
index 0000000000..4acae80fa7
--- /dev/null
+++ b/meta-networking/recipes-protocols/openflow/openflow/0001-generate-not-static-get_dh-functions.patch
@@ -0,0 +1,33 @@
+From 0fe6770b617af7e400abc6f8652c1417d4c3575e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Sep 2018 22:49:15 -0700
+Subject: [PATCH] generate not static get_dh* functions
+
+Fixes build with OpenSSL 1.1.x
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/automake.mk | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lib/automake.mk b/lib/automake.mk
+index bfbeb94..b53909a 100644
+--- a/lib/automake.mk
++++ b/lib/automake.mk
+@@ -113,8 +113,9 @@ lib/dhparams.c: lib/dh1024.pem lib/dh2048.pem lib/dh4096.pem
+ 	(echo '#include "lib/dhparams.h"' &&				\
+ 	 openssl dhparam -C -in $(srcdir)/lib/dh1024.pem -noout &&	\
+ 	 openssl dhparam -C -in $(srcdir)/lib/dh2048.pem -noout &&	\
+-	 openssl dhparam -C -in $(srcdir)/lib/dh4096.pem -noout)	\
+-	| sed 's/\(get_dh[0-9]*\)()/\1(void)/' > lib/dhparams.c.tmp
++	 openssl dhparam -C -in $(srcdir)/lib/dh4096.pem -noout) | 	\
++	 sed -e 's/\(get_dh[0-9]*\)()/\1(void)/' 			\
++	     -e 's/static DH \*get_dh/DH \*get_dh/' > lib/dhparams.c.tmp
+ 	mv lib/dhparams.c.tmp lib/dhparams.c
+ endif
+ 
+-- 
+2.18.0
+
diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b/meta-networking/recipes-protocols/openflow/openflow_git.bb
index eceb45e94f..b6cef0730a 100644
--- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
+++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
@@ -6,4 +6,5 @@ PV = "1.0+git${SRCPV}"
 SRC_URI += "\
            file://0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch \
            file://0002-lib-netdev-Adjust-header-include-sequence.patch \
+           file://0001-generate-not-static-get_dh-functions.patch \
            "
-- 
2.18.0


