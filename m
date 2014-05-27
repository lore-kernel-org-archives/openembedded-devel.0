Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f47.google.com (unknown [209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2F9976B15C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 14:02:54 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id lf10so9139660pab.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 07:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=a2TCQ6EYi7sADDIX4PiiS87QnsxYWr/8zX0HUZDsrWw=;
	b=tCElHYUCocoNQMJSytsT8OvnB8RuypotNVB89WImqeCpZqfxlfkdFWUo7TnVmp3vtD
	VY2QaDac1E66aBmgMLvaX4cgyWyXx5bdveweTgnx7lD9lGfYZS9RLP3W4fd42RYlMpvB
	6vNvf81KmslzajfStu4h7eQ4TjuEzguNLP9cPO6OI+tn8Xi7w8lGxCIFqWRgLswuT7Pu
	FApHSVjt23hXtPEI+6kjsHYFxIVW/mW8o2s5uuNjIOHQFrcSyYnBFelxXS99wpFNzBLm
	JgL7Etn83TSoDOBB8suJutQJVnjVtTTHGovOPusIWU732M+4neasQVOgvtdEztLdSKt6
	qs6A==
X-Received: by 10.68.89.4 with SMTP id bk4mr36353759pbb.153.1401199374376;
	Tue, 27 May 2014 07:02:54 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	io8sm23508079pbc.96.2014.05.27.07.02.53 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 27 May 2014 07:02:53 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 May 2014 07:05:40 -0700
Message-Id: <1401199540-29123-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] libpostproc: fix S!=B failure
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
X-List-Received-Date: Tue, 27 May 2014 14:02:55 -0000

From: Tim Orling <TicoTimo@gmail.com>

Fixes:
[...]/libpostproc/0.0.0+gitAUTOINC+3b7053f46d-r1/temp/run.do_configure.3652:
line 109: ./configure: No such file or directory

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb b/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
index 148d169..6abb268 100644
--- a/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
+++ b/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://git.videolan.org/libpostproc.git"
 
 S = "${WORKDIR}/git"
 
-inherit autotools lib_package pkgconfig
+inherit autotools-brokensep lib_package pkgconfig
 
 FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
 BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
-- 
1.8.3.2


