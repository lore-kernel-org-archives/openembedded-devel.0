Return-Path: <rafael.carre@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id D49E773A76
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2015 14:20:26 +0000 (UTC)
Received: by wibgn9 with SMTP id gn9so15816353wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2015 07:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=LbPu6mKALO4+7dwVj7qO+VGGfK5mKecY5WRhfbkgCnI=;
	b=oXZMIffj8Nkc2VTIA5njOoicvlfJzBh+kS3m6AE1hOmQolh2kcsoMcAiG+fFkFb6m4
	lstfKxVES84KIKEiJDgte+Tf2QOyvfuWm7VLGEcIYFycXwi2AZEVl/b8SnhjOkQ0Zv6S
	Pm0spNQJ1TXHkG0O6nnvUzS16vz1BxFmdzPi/HqyAqAKWG68G4NEp/C2dIcfMXb1lU4W
	UICEniyrYK0jdYLEJ6EmE341XzmdzvU04b1eYKHysCTW6tuHBqItC7Gz2WTjHgciB99/
	1N3EpiN//JJ3lEPKpkM1RtXB4mmX68EFUXY57nEUYSnOPWD0hmunV8gbvE7iOoAAhxqt
	Hd9g==
X-Received: by 10.194.23.39 with SMTP id j7mr164873968wjf.9.1426861226219;
	Fri, 20 Mar 2015 07:20:26 -0700 (PDT)
Received: from localhost.localdomain
	(lns-bzn-49f-62-147-165-143.adsl.proxad.net. [62.147.165.143])
	by mx.google.com with ESMTPSA id ch6sm6581513wjc.3.2015.03.20.07.20.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Mar 2015 07:20:25 -0700 (PDT)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Mar 2015 15:20:20 +0100
Message-Id: <1426861220-30221-1-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH] vim: add checksum
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Mar 2015 14:20:29 -0000

---
 meta-oe/recipes-support/vim/vim_7.4.481.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recipes-support/vim/vim_7.4.481.bb
index afdea84..ac59077 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
@@ -10,6 +10,10 @@ SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
            file://disable_acl_header_check.patch;patchdir=.. \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
 "
+
+SRC_URI[md5sum] = "5fd5d754581a673a25733c12367cf9d2"
+SRC_URI[sha256sum] = "e2cc416dabea503e9e5631afc21bb00dcbfb9d05481641b75f247fd89ff4d7e8"
+
 SRCREV = "v7-4-481"
 
 S = "${WORKDIR}/vim/src"
-- 
2.1.0


