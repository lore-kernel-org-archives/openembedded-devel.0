Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id A270A7F939
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 21:13:15 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id q70so15271218wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 13:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/VF1GYIGius9Y6T62hBaIp+Gwlghg6keQF6FksQgmlo=;
	b=AL1J5IpkNsme2dqN0jScudVrvfZxnlfpGLUYQRmjSvBgj1qL56YMhdSzI7sQ2QgsE+
	qnKNU9oRVcUiVPpcrIaedpBW1XNK9vh5gkV6bEN1aaHVZT5vP8mhADd6+yXNxmMoTJIp
	ck0mZ9kIUsPhyZKSkDQaWXv9Pjzx+hlJKeFC+t5qFiRSd4KP4ZTEX7yjhcfX9HcbP4qD
	qcyGkxJsOBJYmFkIS7dFK1CjWhOaT+Kd+PmpSTm76p+Kbc3SvArTTcDb5HMRVOqBmGb3
	Z+Sp+4Zy89eI+N/jdcEqSlG7FGJmglpx+2QClrmcN3tg1c5nm5t0KDwPiZlC4UxAKZdd
	LTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/VF1GYIGius9Y6T62hBaIp+Gwlghg6keQF6FksQgmlo=;
	b=ALzY9DM5ukecqAxuWpBpO5NbHnIRvC47J+ka7fTbfeLhfEPddGh5ZBZGSMa9o5Mjmj
	2wcWmOuwdYTx2kKXWST8AZVH/pT36I7ZMNHwZ6INDDyX+ojYcsxur1hOT0YnOTly/+Xz
	jqYbpi6HGC3ukIZ0j4Oq3BS/S9XUyMbV2rIA7J5UcyF+vZWKgI6hwgrkYBCLS2hmimF/
	MtWv5tnwY00Whxfh6Qn1rI0gelCGZMdjDdnGOaXdwGitBk/AgS5TuH1jLO10B2uFvgQL
	/Vi+y6t6SG26JsGArvW9JgAp4BLxyOKDFbfAioRguIt03cxmlHnasSFGT3JeZgrB7JGc
	kDvw==
X-Gm-Message-State: APjAAAXUbyJU2uYjAzUHJnigb1ahpPK2Ct5fZszqXiNTl0fOjNFdUUFc
	GEGAgCG8nRjMG62QH1revOQhwrLe
X-Google-Smtp-Source: APXvYqzEgJLx5Ly2TWwN2u/eZ6YTps842IHT72jUGjb3Vt+Eju/b3QSsedfxYOnn8OviPuqFWVOd0g==
X-Received: by 2002:a1c:4089:: with SMTP id n131mr27051701wma.86.1574025196166;
	Sun, 17 Nov 2019 13:13:16 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F081983E6CF71012ACD6C9A.dip0.t-ipconnect.de.
	[2003:f0:7f08:1983:e6cf:7101:2acd:6c9a])
	by smtp.gmail.com with ESMTPSA id
	g5sm18564687wma.43.2019.11.17.13.13.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 17 Nov 2019 13:13:15 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Nov 2019 22:13:02 +0100
Message-Id: <20191117211306.27233-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191117211306.27233-1-schnitzeltony@gmail.com>
References: <20191117211306.27233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] gnome-terminal: Fix build for musl
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
X-List-Received-Date: Sun, 17 Nov 2019 21:13:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...EXITCODE-macro-for-non-glibc-systems.patch | 35 +++++++++++++++++++
 .../gnome-terminal/gnome-terminal_3.34.2.bb   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
new file mode 100644
index 000000000..a69390eb2
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
@@ -0,0 +1,35 @@
+From f231cecc151930fd5b6309da317a8c5bc6001f38 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sun, 17 Nov 2019 15:55:54 +0100
+Subject: [PATCH] Add W_EXITCODE macro for non-glibc systems
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/terminal.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/terminal.c b/src/terminal.c
+index d06ce35..6284e4c 100644
+--- a/src/terminal.c
++++ b/src/terminal.c
+@@ -47,6 +47,12 @@
+ GS_DEFINE_CLEANUP_FUNCTION0(TerminalOptions*, gs_local_options_free, terminal_options_free)
+ #define gs_free_options __attribute__ ((cleanup(gs_local_options_free)))
+ 
++/* fix for musl */
++#ifndef W_EXITCODE
++#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
++#endif
++
++
+ /* Wait-for-exit helper */
+ 
+ typedef struct {
+-- 
+2.21.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb
index d688176d5..ffbabbf88 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb
@@ -21,6 +21,7 @@ DEPENDS = " \
 
 SRC_URI[archive.md5sum] = "13fa9f5f459481c7f05b6964c470ef16"
 SRC_URI[archive.sha256sum] = "3bd723f4058ec014da4715db4181b7d73eccc797b85ad5e6236996951c01803d"
+SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
 
 EXTRA_OECONF += " \
     --disable-search-provider \
-- 
2.21.0


