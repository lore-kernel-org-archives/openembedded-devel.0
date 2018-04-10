Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id B9B5074A1B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 00:22:41 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id b6-v6so6214324pla.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 17:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rTWfQbOnxq1JVjNcilgjc/tI86J8GNtibBSH2WmE8Nk=;
	b=S5aDgkBpX9dWwKq7vESC3np0so8H3RPPGpbPsLP0hdCCkPWu1LowGzOhRcHjrr2NSu
	2426kdwk2mTiQcLaOZ1nPie6LFoaqi5TqreywBGdngrVK1T9Hr+2DQKK+9TkgNgURPzm
	FF29ImHCszdZJ+WE8V3t7U/EvpVUfjM648Lmf4bNlAJR/mQix8TrpBPk66s2KwiMgFFM
	kt1I/N8dshFMW6cvkBje66p5/J9ddyoxM8RO5DF20loHTxl9eT884spVktYjOTXUNupR
	vZeWURv2Q/UVblc8CJbdyvexzO+wvBMDj2lGE4bioPdViiUvm2ml5V9j5Rsw2Sop0cWI
	QsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rTWfQbOnxq1JVjNcilgjc/tI86J8GNtibBSH2WmE8Nk=;
	b=BaF93QPZ7xced+Kk8pt/ngQNWMIi6DWUEGXCXQVmdctSoe5uxkOlFLzRl8A5EHtHzy
	daPWo8W5Siuk3G3IYURUWoferI9fdJUj+Q3cUUSgIlJwftRMZvNJfkSWw2oWWYwwB8g5
	tR3ofAIg8+zTEcNAQbAqMOHHTBHF1+yEgxje8d9afRkIU3DsH++vx1iF38qhGjgm61/H
	3uEdlzt5Adh2YEBzDLHYoOHyP/YCZWLpFE6N5G8FZJQGR/04aKal5uJP3snPyGAWEljU
	Kq716P3aI9ApTfplM4GRnHof05rVimae9wtWbhq7NysDjvoORpojKt1JVyMl4QqMRfXU
	RGNQ==
X-Gm-Message-State: ALQs6tDE+YobE0fQjBEEuX+T76asbywtTQznwwiGiTASNPCLUrLF7c1F
	h7+82HFAKTGWpY4wIx8bNPnSjQ==
X-Google-Smtp-Source: AIpwx49PtgYlznHutCciHa3BnYT+FXztn9eCVdtCzh3HqJPHeUrKIUJZG/YWMfNrnGgn1gJXM+3cxQ==
X-Received: by 2002:a17:902:b212:: with SMTP id
	t18-v6mr11822948plr.137.1523319762464; 
	Mon, 09 Apr 2018 17:22:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	a5sm2562046pfl.159.2018.04.09.17.22.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Apr 2018 17:22:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon,  9 Apr 2018 17:22:30 -0700
Message-Id: <1523319756-8431-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
References: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 04/10] libreport: add PACKCONFIG for gtk
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
X-List-Received-Date: Tue, 10 Apr 2018 00:22:41 -0000

needed when no X11 in DISTRO_FEATURES

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/libreport/libreport_2.9.2.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb b/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
index 525437b..e963014 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://abrt.readthedocs.org/"
 LICENSE = "GPLv2+"
 DEPENDS = "xmlrpc-c xmlrpc-c-native intltool-native \
         json-c libtar libnewt libproxy rpm \
-        augeas satyr systemd gtk+3 \
+        augeas satyr systemd \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
@@ -26,6 +26,9 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 
 inherit gettext autotools python3native pkgconfig
 
+PACKAGECONFIGS ??= "${@bb.utils.contains('DISTRO_FEATURES','x11','gtk','',d)}"
+PACKAGECONFIG[gtk] = "--with-gtk, --without-gtk, gtk+3,"
+
 RDEPENDS_python3-libreport += "${PN}"
 
 do_patch[prefuncs] += "do_gen_version"
-- 
2.7.4


