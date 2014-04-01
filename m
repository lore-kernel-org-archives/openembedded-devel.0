Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 647AD6FA1C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 22:36:43 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id rp16so10490607pbb.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 15:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zYDGeVIOqeAszeAmeQEq3rr6XE6AecnJxsZkXMUWvoY=;
	b=igo+7pMSeamEzzPyizVIf3TY+0eJcjHUUdWCmOr4lxbFVoJO/1wD3h3gMDr9YmWQHa
	ENAUd+evwsh3sFk/bVNljeXoSvxZWc7Vjimt0zrV55TS5GmHAbPGqawq3an1/uhVvc+c
	B66ySTVX35NZWHMRvd8zuzOx3mLTcdJLVoDJHu/pLzTbfKs2HF2+AGq+QUqZdKFq9V7F
	JvUehWoZMJK+/2x0qcRKYhGqFwfgAi2ZJQzCRZQMyPA5CQ+O+jPpQRqkxn1UDdQqW4j0
	Qh59rPr10OUDpofKEFOkSQzua9E415JuQXf0xBHJ4s30e9yHUV7tH97C9rxlgnGHjat+
	JFfQ==
X-Received: by 10.68.178.66 with SMTP id cw2mr33976667pbc.89.1396391803854;
	Tue, 01 Apr 2014 15:36:43 -0700 (PDT)
Received: from archimedes.arnolds.bogus
	(dsl-66-59-252-223.static.linkline.com. [66.59.252.223])
	by mx.google.com with ESMTPSA id qw8sm29251pbb.27.2014.04.01.15.36.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Apr 2014 15:36:43 -0700 (PDT)
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 15:36:32 -0700
Message-Id: <1396391792-12610-1-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] changed gnuplot recipe license to gnuplot
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
X-List-Received-Date: Tue, 01 Apr 2014 22:36:46 -0000

Also sent license file patch for oe-core.  This supercedes previous gnuplot 
patch that incorrectly included the original gnuplot patch changes as well.

Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>

---
 meta-oe/recipes-extended/gnuplot/gnuplot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot.inc b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
index ab3ec3f..6c27e6d 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot.inc
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Gnuplot is a portable command-line driven interactive datafile \
 (text or binary) and function plotting utility."
 HOMEPAGE = "http://www.gnuplot.info/"
 SECTION = "console/scientific"
-LICENSE = "BSD-4"
+LICENSE = "gnuplot"
 LIC_FILES_CHKSUM = "file://Copyright;md5=243a186fc2fd3b992125d60d5b1bab8f"
 DEPENDS = "virtual/libx11 gd readline"
 
-- 
1.9.1


