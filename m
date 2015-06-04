Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id A456B734DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:09:49 +0000 (UTC)
Received: by iebmu5 with SMTP id mu5so7885203ieb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SAwNZas8XE4bVIYbmYvZIgFu+JTku1zDlcxGlqk10N0=;
	b=VZMka+Z79obSJLKNXS6btsxRCnmh9MBXXamQ13MuBVkRgE2Yh3sD+FxOVmyeGe5pNY
	BVcaDxlwsueEfnk4uGraNKjraTtfRXszB36f3sL3p9Xt7uYxCM6oWuwEcoHGwO2dwUZW
	LFUjZjHL+cCGAj3UjNPLaMLhatAhZfV1H+HC99KQju1tJOb831wYfMcpBZMWnuEwPgZ7
	w5BL22u2QoxLw/xn00WOfAmkc3bQ06YlsCJd9hDWKpoLA3sqbKjO92kBKxNobv+kg8PR
	GClqAk0csYQuegSvVNDJmfW2WWzpHnKQyLIR7zb/zVoNsINbeNliyJSj1u5PIrLzsb/0
	IwUQ==
X-Received: by 10.107.150.73 with SMTP id y70mr33810425iod.21.1433444990889;
	Thu, 04 Jun 2015 12:09:50 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id s5sm3159456igh.6.2015.06.04.12.09.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jun 2015 12:09:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:09:42 -0700
Message-Id: <1433444982-25590-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-qt5][PATCH] qtwayland: Bump QT_VERSION to "5.4.3"
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
X-List-Received-Date: Thu, 04 Jun 2015 19:09:51 -0000

We pin the recipe at 182488129c3f6a67a7e781fdb7c0147777191991
and upstream changed the MODULE_VERSION = 5.4.3 in that commit

Fixes
| install: cannot stat
'/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/q
twayland/5.4.2+gitAUTOINC+182488129c-r0/build/include/QtCompositor/5.4.2/QtCompositor/private/qwayland-server-*.h':
No such fil
e or directory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/qt5/qtwayland_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 065bc3c..0be7afe 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -37,7 +37,7 @@ SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-QT_VERSION ?= "5.4.2"
+QT_VERSION ?= "5.4.3"
 
 do_install_append() {
     # do install files created by qtwaylandscanner
-- 
2.1.4


