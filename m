Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7D40060CD1
	for <openembedded-devel@openembedded.org>;
	Sun,  9 Feb 2020 16:17:25 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id b35so2510763pgm.13
	for <openembedded-devel@openembedded.org>;
	Sun, 09 Feb 2020 08:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=no2YQvXPUiokMBAEgmeGIrPLKLHLRW3zTt4g3O087jA=;
	b=JFilM4JdLy/SXNz8+BOIDYxsJhbGgqQShCZQ477VrhOZMJhkDTPCendQi29eHXjgp5
	ezgooahXVa9DLQRhngWduvbx7K5Lb9p+Pc78XCMIybWFROvZs9NWrghgKpAfqWgKx1D4
	VHi91llibOZU+Rd3dHWx/5gLM7zVUxjeSeTjwpAxgaqTctx7PkyIYPMKTLuwcWlhStAW
	n2ToumMIvMHGfC6+J+2QpFv6N6MrFrPPqeEG0QjG6eirC1wqvrXl6FKa0HzffXFQyl74
	SjGkk5vM8jo5F5tTj4geE3hIBShANAFYf1Y+BV3pRHrgptxLBSHxozdFYwSzhJq1T6T3
	ZqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=no2YQvXPUiokMBAEgmeGIrPLKLHLRW3zTt4g3O087jA=;
	b=lUxy6HPJYzSI2tLfd7s4D2MOIXA4+Qml2AsxWsH8vXqrtMIzv9wIwQ1t9FbG4/fNN1
	qCrg+rWwqaVv7yuDfYUl+dHmq+hGL/4a8UXXz08hpgCd+7WoYihPVL8P0ZizMPfbYHzA
	WcIzg50IIrSUm6hw0VjvhXCkVia+NU1nWtMqUFKpsuyOklXj9SwukciXCU+IyBXzohEm
	AlU/xq9bYmvwH4Wlc2Nf/JgvLqMOcaoGPq/YKX0Hiy+9KIrO018RAbW364pDGVxrpk+i
	jicmU70GUA8U+naPQ/gdZ46J+RhL+vw3WttI4hDc25amLqCgJiPt5VUOWgxjOkRjPGUx
	NcPg==
X-Gm-Message-State: APjAAAUvN3bQb2rh8wcbh+MR9yIk942fixiVXCmZqrmo/eDEo8TU7xsM
	W8QFEL5SfZXqik4Hffh9zsD9IH6q
X-Google-Smtp-Source: APXvYqyyX53XINbPDEVxsJBowzFnooQZQYkFeFf5Ih2uZUN2UWUZzNIz8DscGrmQyVtBhzb6pLBSfA==
X-Received: by 2002:a63:214e:: with SMTP id s14mr9779188pgm.428.1581265046390; 
	Sun, 09 Feb 2020 08:17:26 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	a19sm8831737pju.11.2020.02.09.08.17.25
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:17:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun,  9 Feb 2020 08:17:11 -0800
Message-Id: <65996296fa09e62642b2fe5ea76f154cb19d383d.1581264950.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264950.git.akuster808@gmail.com>
References: <cover.1581264950.git.akuster808@gmail.com>
Subject: [zeus 03/11] python-twisted: add required RDEPENDS for twistd
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
X-List-Received-Date: Sun, 09 Feb 2020 16:17:25 -0000

From: Trevor Gamblin <trevor.gamblin@windriver.com>

python-twisted is currently missing some packages for its /usr/bin/twistd
executable to function. Add these to the RDEPENDS list, and also clean up
formatting since the list is getting long.

Note that a similar patch has already been submitted for master branch,
but the python2 version of twisted needs more explicit RDEPENDS than the
python3 version submitted to master in order for /usr/bin/twistd to work
properly.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python-twisted.inc | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index d70104dc26..f55bbb0330 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -56,7 +56,23 @@ RDEPENDS_${PN} = "\
     ${PN}-zsh \
 "
 
-RDEPENDS_${PN}-core = "${PYTHON_PN}-core ${PYTHON_PN}-zopeinterface ${PYTHON_PN}-incremental ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperlink ${PYTHON_PN}-automat"
+RDEPENDS_${PN}-core = "${PYTHON_PN}-core \ 
+                       ${PYTHON_PN}-zopeinterface \
+                       ${PYTHON_PN}-incremental \
+                       ${PYTHON_PN}-constantly \
+                       ${PYTHON_PN}-hyperlink \
+                       ${PYTHON_PN}-automat \
+                       ${PYTHON_PN}-pyserial \
+                       ${PYTHON_PN}-pyhamcrest \
+                       ${PYTHON_PN}-debugger \
+                       ${PYTHON_PN}-unixadmin \
+                       ${PYTHON_PN}-pkg-resources \
+                       ${PYTHON_PN}-misc \
+                       ${PYTHON_PN}-pkgutil \
+                       ${PYTHON_PN}-plistlib \
+                       ${PYTHON_PN}-setuptools \
+"
+
 RDEPENDS_${PN}-test = "${PN}"
 RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
 RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
-- 
2.17.1


