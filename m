Return-Path: <twoerner@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 81AA37317E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jan 2016 19:45:39 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id 6so140795599qgy.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jan 2016 11:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DwOYNf4UdSTXdmtTTmEDOlqBwaaepgU3ZBiCLEZr9sI=;
	b=v7Hgb/OFiNNpMMZMNBLVYkSxixNByln7Rkz3IBZakxrfo5dagvZbKC6pt1nwRgZf8M
	IQ3QtfGahhzrEr/Scoo+6uZEkW20ZCnH0MoVie+/zeXxwuy7YHWnlCNBuaA/ZoRhwLjm
	VoQYgeT7qSkZqGao8D7nZgnimxubVb650a4UPQZjS1NvKDsb0090vIIfQD21a1PD8zNH
	k2cCIFHctvY1qDDaJY6snSqp8CkwGaGA7YecwQ+bmXpBMjAnltH2JoxOKSu/7XqfMQXG
	ZW3Vz4SBG4YIy8rURO6ftex3IwpcmNUF2BZEG+Ti1TxfTqf/XFrLvl3P6VbQGQqGc3L2
	Kp/g==
X-Received: by 10.140.159.131 with SMTP id f125mr104743659qhf.72.1451677539916;
	Fri, 01 Jan 2016 11:45:39 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	m127sm25483037qhm.43.2016.01.01.11.45.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jan 2016 11:45:39 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jan 2016 14:45:08 -0500
Message-Id: <1451677511-7346-2-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <1451677511-7346-1-git-send-email-twoerner@gmail.com>
References: <1451677511-7346-1-git-send-email-twoerner@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Gary Thomas <gary@mlbassoc.com>
Subject: [meta-browser][RFC PATCH v1 1/4] chromium.inc: fix typos
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
X-List-Received-Date: Fri, 01 Jan 2016 19:45:39 -0000

The gl PACKAGECONFIG is "use-egl", not "use-gl".

Adjust comment to include a space after initial comment delimiter (#). Close
parenthesis at end of comment.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 recipes-browser/chromium/chromium.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index 03141db..716988d 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -24,7 +24,7 @@ PACKAGECONFIG[component-build] = ""
 PACKAGECONFIG[disable-api-keys-info-bar] = ""
 PACKAGECONFIG[ignore-lost-context] = ""
 PACKAGECONFIG[impl-side-painting] = ""
-PACKAGECONFIG[use-gl] = ""
+PACKAGECONFIG[use-egl] = ""
 
 GYP_DEFINES += "${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
 
@@ -71,7 +71,7 @@ do_install() {
 		fi
 	done
 
-	#Chromium *.pak files and CEF pak files ( prefixed with cef_
+	# Chromium *.pak files and CEF pak files (prefixed with cef_)
 	for f in content_resources.pak keyboard_resources.pak chrome_100_percent.pak product_logo_48.png resources.pak \
 	         cef_100_percent.pak cef_200_percent.pak cef_resources.pak cef.pak \
 		 locales/en-US.pak; do
-- 
2.7.0.rc3


