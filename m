Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9C63F77342
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Nov 2015 02:05:31 +0000 (UTC)
Received: by pacej9 with SMTP id ej9so9963658pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 18:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DTh4yBYDv/OnchRi3F/3Mm/D8o7rtlQCmS6bQBGtifs=;
	b=hHjZ3n7NbAHROd6xd+koflrxTUixN6VdnyPvKMkUbDYQbexI33JyLFGFSqye2Ttp+g
	1IbQpz3WvI+F63m1pKXdF9z821V/Pkr1OA/LOEns5RCWKW8qSVbVbkidvM62POdA9boF
	ZJtrOct8XNTpw931UXOnrKzb7P3/oxIU+UTCgz4kuJR+5LTUGO7vIfZG0wpBcNamOwpy
	5I5p4CK4DOvjP/g6Ur99CSO96DiBp9WmnVW7ymrrvrz2eqQU1b/jNrGgFtu4kUIyG1Bt
	6WbvO3oqTj9cp8CDZPrRJnQr3pr7pIsWxDDuSPvxiAczLfw9olVXGmMumF3sPWr4lX0E
	EdIQ==
X-Received: by 10.68.241.41 with SMTP id wf9mr25692454pbc.145.1447466731771;
	Fri, 13 Nov 2015 18:05:31 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	xs2sm22747951pbb.75.2015.11.13.18.05.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Nov 2015 18:05:30 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Nov 2015 18:05:24 -0800
Message-Id: <1447466724-4315-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-browser][PATCH] ninja-native: remove from meta-browser (moved to meta-oe)
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
X-List-Received-Date: Sat, 14 Nov 2015 02:05:33 -0000

ninja-native is now available in meta-oe (jethro and master):

  http://git.openembedded.org/meta-openembedded/commit/?id=d931801de77a9cbb13c916231583b3526a7d3e11

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-devtools/ninja/ninja-native_1.4.0.bb | 22 ----------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 recipes-devtools/ninja/ninja-native_1.4.0.bb

diff --git a/recipes-devtools/ninja/ninja-native_1.4.0.bb b/recipes-devtools/ninja/ninja-native_1.4.0.bb
deleted file mode 100644
index a115c2e..0000000
--- a/recipes-devtools/ninja/ninja-native_1.4.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Ninja is a small build system with a focus on speed."
-LICENSE = "Apache-2"
-
-inherit native
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
-
-SRCREV="63d5b1013cafb2db95687cf446eb5bb68cf6a27a"
-SRCBRANCH="release"
-
-SRC_URI = "git://github.com/martine/ninja.git;branch=${SRCBRANCH}"
-
-S="${WORKDIR}/git"
-
-do_compile() {
-    python ${S}/bootstrap.py
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${S}/ninja ${D}${bindir}/ninja
-}
-- 
1.9.1


