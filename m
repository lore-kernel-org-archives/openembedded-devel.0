Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 96805769A7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 17:57:42 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so146184294pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 10:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=jU/UoIw1xJ6GDEX7sPlUCuMCi9yRgyGBOwqitDSqpyc=;
	b=C7r3hKCkG8ll9EOCjc0h4AAfi5fckt6HhEaSwPrDjnhcPz1ZjVrvNDzwJjKMAcC2lz
	LvPec0lhdL+gLgvv9302UYYMMKUy3exvVmiW3CQLWN/5tA2tzNDAXGwqSi/Ok3Lu7tFp
	Ik14u2HlapAMmOIV0Rf8+9HDynaWNroolegBiVCBZWFH/YQJDopOIdOrAEb/t6Ub1CRv
	bitZoTCiLE/hmTFsad2N8wGgv9raCHzQzwv4pr4jJhcezAarBN5mrDgEwfyHA3O0LOeY
	SHYJL+QVPS0wm8Mg4Wvm8hinuprBz5zhmzllN1NeoRAfdnorp+jX0BHziU6jd/TEhb7V
	MLSg==
X-Received: by 10.66.167.232 with SMTP id zr8mr12272269pab.53.1445709463520;
	Sat, 24 Oct 2015 10:57:43 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id bz1sm559948pab.20.2015.10.24.10.57.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Oct 2015 10:57:40 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 01BE1FC66DB; Sat, 24 Oct 2015 10:57:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 24 Oct 2015 10:57:23 -0700
Message-Id: <46868057ca21979fa59acacd50d77c6fcc757f44.1445709055.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1445709055.git.akuster808@gmail.com>
References: <cover.1445709055.git.akuster808@gmail.com>
In-Reply-To: <cover.1445709055.git.akuster808@gmail.com>
References: <cover.1445709055.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] vlc: fix for libtool error
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
X-List-Received-Date: Sat, 24 Oct 2015 17:57:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Changes since v1:
  typo caught by Andreas Oberritter

Patch recommended by:
  Rafaël Carré funman@videolan.org

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 0362f39..ecf0d90 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -61,7 +61,7 @@ do_configure_prepend() {
 
 do_configure_append() {
     sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${B}/include\ -DSYS_LINUX:g ${B}/modules/gui/qt4/Makefile
-    sed -i -e s:'${top_builddir_slash}libtool':${TARGET_SYS}-libtool:g ${B}/doltlibtool
+    sed -i -e s:'${top_builddir_slash}libtool':'${top_builddir_slash}'${TARGET_SYS}-libtool:g ${B}/doltlibtool
 }
 
 # This recipe packages vlc as a library as well, so qt4 dependencies
-- 
1.9.1


