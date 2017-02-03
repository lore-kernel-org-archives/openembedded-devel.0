Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 167C573173
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Feb 2017 17:51:28 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id u25so750376qki.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2017 09:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AkBdVH9ETzWQc80k6+WZ1jxPtK5WX63tZvtwPxCvits=;
	b=D8pFE1usFRo8Y3olpQCPberDly7pXEXueeM5X+BoCPbFpolUwsjeALLWGAGq4MBf1v
	N6DdH6fUuWGaJlAAgHQU8aLqTZk4JntKL3WYLCLSJoG+TM+fMzMG/jf0aBwWdbVAZe93
	R8Z8JM8WkNr2WB4NlTPBz5CKLZSmNNSHPZJA1hDefnQPU14i4dbVvWz4VtqA9Xx4m/qw
	kyRkqXmB2CQ9mi4i5ZlyieVaqbOQ6gko2Fk970qX2QVsj71kVu3d93lDmvEw7ea3aUKC
	3uw9p9Vjz/hffpOwEMmrwk/gcZxmZ5zJU7LbBbYxJ23XvHoKMVmUt44RsF751A3rwzIl
	TyFw==
X-Gm-Message-State: AMke39kjXWCS+ZVFng9tXdf9rgupYhQRIHZME4MnI/YWj4F8G8d4IWX0u1yeqBUqKjGVJg==
X-Received: by 10.55.126.4 with SMTP id z4mr14254270qkc.218.1486144288928;
	Fri, 03 Feb 2017 09:51:28 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	v187sm7867764qkd.20.2017.02.03.09.51.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Feb 2017 09:51:28 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Feb 2017 12:51:16 -0500
Message-Id: <1486144277-7201-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486144277-7201-1-git-send-email-derek@asterius.io>
References: <1486144277-7201-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/3] python-ndg-httpsclient: add to the DEPENDS rather than replace
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
X-List-Received-Date: Fri, 03 Feb 2017 17:51:29 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-ndg-httpsclient.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
index ae2bca1..1b77a3b 100644
--- a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
+++ b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
@@ -8,11 +8,8 @@ SRC_URI[sha256sum] = "580987ef194334c50389e0d7de885fccf15605c13c6eecaabd8d6c4376
 
 PYPI_PACKAGE = "ndg_httpsclient"
 
-DEPENDS = " \
+DEPENDS += " \
     ${PYTHON_PN}-pyopenssl \
-"
-
-DEPENDS = " \
     ${PYTHON_PN}-pyasn1 \
 "
 
-- 
2.7.4


