Return-Path: <mario.goulart@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8DED073CB7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 13:23:14 +0000 (UTC)
Received: by qgfa8 with SMTP id a8so13871303qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 06:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=0kO1EPoWZaVFyuyeMejFeexNuJp06P9kkplRhSaRGKY=;
	b=nWUOEejXg1PnzL8IX3vmIZLh5k83MSAQ5Xe4e3nYrgQJnSdUOtvt/HikOqHbcMD7BV
	k0ttoavEOFjO8P+AYwRKHC6xNqddJhe1LLt23obOKkLaHTPa4T9jmCwVB8psgZwJNIwF
	vliNr4NNJwrklP0sXxA3jiYXyXMLpWJk8urRvDpBPS8DXa6qM+vBkdC0u4gCZio3fwG5
	Y1rRdn/K1bctuCzmzHtEB7FjdaZ332tL1S7y/hitVjn2P/kbbi2iIwz51w33t+G/woEW
	WXWUHXagG/lkJk4Z9P48Mj/G3M1CHEvwXfEP0ocUOXj97mFZJdjQR/XWp23mfZnZG71O
	GUVA==
X-Received: by 10.229.71.72 with SMTP id g8mr49747808qcj.25.1427808195362;
	Tue, 31 Mar 2015 06:23:15 -0700 (PDT)
Received: from centrium.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id q129sm9859631qha.4.2015.03.31.06.23.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Mar 2015 06:23:14 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Mar 2015 10:22:38 -0300
Message-Id: <1427808158-16502-5-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1427808158-16502-1-git-send-email-mario@ossystems.com.br>
References: <1427808158-16502-1-git-send-email-mario@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-java][PATCH 5/5] icedtea6-native.inc: remove --disable-npplugin
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
X-List-Received-Date: Tue, 31 Mar 2015 13:23:15 -0000

Fixes:

WARNING: QA Issue: icedtea6-native: configure was passed unrecognised
  options: --disable-npplugin

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 recipes-core/icedtea/icedtea6-native.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-core/icedtea/icedtea6-native.inc b/recipes-core/icedtea/icedtea6-native.inc
index df1be9c..43377ce 100644
--- a/recipes-core/icedtea/icedtea6-native.inc
+++ b/recipes-core/icedtea/icedtea6-native.inc
@@ -28,7 +28,6 @@ EXTRA_OECONF = "\
 	--disable-docs \
 	--disable-pulse-java \
 	--disable-plugin \
-        --disable-npplugin \
 	--disable-xrender \
 	\
 	--with-ecj=${STAGING_BINDIR_NATIVE}/ecj-bootstrap \
-- 
2.1.4


