Return-Path: <uvv.mail@gmail.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5F8F474588
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 06:25:49 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id c85-v6so7280597itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2018 23:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gOUio7oZvqpyor4JukCHwFDEalsKI3zf1BhGMsHmD1Y=;
	b=BDcAuXIKEvbavNUeORiXFqloCmsqNvlwk/W5Ui3yp/tr4mlZ3DU1bsWfgyrpn6WtUL
	5BloF4aWlknMctgCYEHFnqACEnYTYwPbCFX58ceg+K3SDmMUPvqMONf35WgpXmAJkNZv
	ID8GpNJoegTUD0KhA4gcH/vUbGbE9kIUdcr6fwDkKICq4UTPywSRoh7qE4vXbTSeK+gI
	m2QarjSCHaKVGRV7poAzvbLpowH/rl9RFvqqPw5HP97NIKcAt0VauOBwVNTcNQ5FdFNL
	Qhl7XACLQfiborxEbs5xZ6aDlka1HYz3VzxQgUfcQUATLM3ZJiKdBLIvbCRXnfD6l/Ds
	FWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gOUio7oZvqpyor4JukCHwFDEalsKI3zf1BhGMsHmD1Y=;
	b=JxAujfPM3Q83uXeyR/rGYTqT6EDQ+ZcObSfNdDRfkyQjNYJ3KKA/mGbKLGu2tDXmSs
	S+YsDPw7gl+bNuGIUY/R7WtM0mv5S/HJBwvDdnbS5Ka2fShWGON8PF31DyBeHwWI4LIk
	oraRvS/XFVB458Iq7/X29tVQIEg6R5PT6Vka+f9zLdjd3ddfw5lJRGYJm8HOTwkfFwt5
	rrzvTc0ESv0hgQJ60X9SKEisVRJ2O7mF7dygRtYSzHnud+IEWogYByy6+eYPBmacIXyT
	Nqzqswk5v6ycb1wKaDlYC2einbFktjZvzD3HzsYmO3yC4wByaJVqm+fJAuE0dz1qSQLw
	VvKQ==
X-Gm-Message-State: ABuFfojCJgyYPVsUV/y9rVN/TyLvZAuJPvF/zbMbbOmH1Z2IEz8BpFO3
	TBCyGtEnkjeBBAeeIGPAI2aWKB7nECw=
X-Google-Smtp-Source: ACcGV61O+CS/YnDYw7yiEwfkH3/wT250h6tELLsj4Rjea/6q52+FNYjk2X2w0a0IALqmjLzuSaa2Ug==
X-Received: by 2002:a24:4f8b:: with SMTP id
	c133-v6mr278391itb.106.1538547950032; 
	Tue, 02 Oct 2018 23:25:50 -0700 (PDT)
Received: from slackware.local ([67.215.13.230])
	by smtp.gmail.com with ESMTPSA id
	n198-v6sm325511itn.36.2018.10.02.23.25.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Oct 2018 23:25:49 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2018 08:24:22 +0200
Message-Id: <20181003062422.35229-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-oe][PATCH v2] libeigen: allow empty packages
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
X-List-Received-Date: Wed, 03 Oct 2018 06:25:49 -0000

libeigen is header-only library.
All headers go into dev package, therefore the main package is empty.
Dependency on the dev package doesn't work, so you have to allow
empty package for build to succeed for recipes that depend on libeigen
(e.g. ceres-solver). Otherwise an error occurs that empty packages
are not allowed.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
index 31a42a9d6..a59320655 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
@@ -18,3 +18,4 @@ FILES_${PN}-dev = "${includedir} ${datadir}/eigen3/cmake ${datadir}/cmake/Module
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
+ALLOW_EMPTY_${PN} = "1"
-- 
2.17.0


