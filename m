Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2376D7F307
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:39:55 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z11so1099125wrt.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 03:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LmtFwa+tLkY/Xntgw2lZ373ExQUNi48nbaSvT6Lyw+o=;
	b=u8ic3rYR+Mdqdd4YSSQHXqzJxFMsyrj+HMWWnmymb39ijTfmjoZ6vow/GB7FVwnhES
	kaDTFzJlp/62isyciDAqhCcnPu6xhl2gHGrqGeQAb1whxeTKucwClTyH2da0UDZxJr+r
	TyHhHa3VXIN3nNn+2OxlLeR8BXdlbw+zHzPMl/Tz24Ucl726tAcEIZi5BCuce0QwjhAT
	yE5mc8xjp9qRz8naVhu2c60Pj/OOELtqDzx5/nN4aahsMV744L/Nbx1xG6Jxaf2UarkJ
	5alaPNBLMO+DACc2gLij6EKPd8BgKVqFqe7X+8Xs9J0Ux5H7ARIuur1YIFP+NS/MHIm0
	yAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LmtFwa+tLkY/Xntgw2lZ373ExQUNi48nbaSvT6Lyw+o=;
	b=Nmbd0fNRLwyzrI+t64Rx8BQOskNuiHmMfMuvuHI0uQK2RZRobHmcbf673+QmRs1XYz
	n09n8wGItbpa1o6Eds3AjPleeHzEUsRnUo5ZQuAVk0Cu3aKK3/UxzAqhDv0j5toBiH7R
	071L+boYRPatr6xRHxFNor1vBc8Z3GJoDMlRqBReAaBIXcfsCw5jbTynXY5FAd6DvgcO
	TMqyIkbobbesR4gkqWDxnfUMucCebGah3b2Clp4CX6K8AQ6E1eNerkYJ7u45QlZkaUhA
	tAu2dtC3kVIoZoiVY9cSBSm3ZoYq5UVTL1nBVDPQKmZGjb6dwMGiGBA1ALs7VXPIztb9
	B/TQ==
X-Gm-Message-State: APjAAAV+6qVeubkeoisepmTIuNuxEYvZ7UWhtraoV7UTVuujZGWJaY+X
	1BqB76FMOZoGTywhgb7dc0lEsFUgfGc=
X-Google-Smtp-Source: APXvYqxTRig/3W8nGBp8i6yYe8l6zZUE85o8tWYGM30VZJTWE9Me8S0ZjthQhVQ7nYsTd2ezaI+W/g==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr9825390wrs.347.1565951995539; 
	Fri, 16 Aug 2019 03:39:55 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	g65sm2162111wma.21.2019.08.16.03.39.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 03:39:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Aug 2019 10:39:54 +0000
Message-Id: <20190816103958.2701581-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190816103958.2701581-1-Martin.Jansa@gmail.com>
References: <20190816103958.2701581-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/7] libcec: add runtime dependency on python3-core
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
X-List-Received-Date: Fri, 16 Aug 2019 10:39:55 -0000

* fixes:
  ERROR: QA Issue: /usr/bin/pyCecClient contained in package libcec-tools requires /usr/bin/python3, but no providers found in RDEPENDS_libcec-tools? [file-rdeps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libcec/libcec_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bb b/meta-oe/recipes-extended/libcec/libcec_git.bb
index 26664255d2..eaf6b9b437 100644
--- a/meta-oe/recipes-extended/libcec/libcec_git.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_git.bb
@@ -22,7 +22,7 @@ inherit cmake pkgconfig
 # Put client tools into a separate package
 PACKAGE_BEFORE_PN += "${PN}-tools"
 FILES_${PN}-tools = "${bindir}"
-RDEPENDS_${PN}-tools = "python3-${BPN}"
+RDEPENDS_${PN}-tools = "python3-${BPN} python3-core"
 
 # Create the wrapper for python3
 PACKAGES += "python3-${BPN}"
-- 
2.17.1


