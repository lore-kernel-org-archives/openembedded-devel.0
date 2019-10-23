Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2A54F7F89D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 16:14:04 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id b128so13253912pfa.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 09:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4w8LqB7ULwsrj10L3ig27XqKTzLDW/sJ1wmmEm7luTg=;
	b=P+nVw+Xz8fCQH7fn4ktSu4LOTXPslKnd9+vXNU+jqhzUQz/UGjlKFlLHpoZtAjHb+7
	K7NvcUlGS5EVzkvx0dIzaaKUNTHwR+7zSmtCQAsBmKnwJp6HaUqG+Nl3u0MVD/lCdjIV
	YdEpiLBzFleqpOPW/jCIqYsVgenkJIPOrjXwDYybHa4stI+UlGLlJw4i1aj4XWVsT8Gk
	4PC9rrZD53/l3on++TBsKpoznKGSGyZwC9cA7eqXDVCK2Jgt+oacFhuosE2AaVx1c1oS
	XuMYcRx6S8QdU+RntDqRXjStHgdxgIeTdgN+AfXYtseaYWDrsItoVKfzH4Z8vj3bMYpB
	VXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4w8LqB7ULwsrj10L3ig27XqKTzLDW/sJ1wmmEm7luTg=;
	b=mUhzA2wVGzes7MePVBUAnPj+TW6/bZWYZEuzD0mR0pKTrraYU9Mldl8byI7Bvr1qhK
	pI6aqoqzU1Jr5SM9oh5/t1Nt20HdIoCbsJ9/RgoaS8ZFfqMpN+XmR4tch013gfVPATw8
	4OyTfiZALWlz6HKX7Zj8F23Gxo9EUblJp8SBaNqERzun63IBPk5NffPpK/yp1qePQMkx
	JGYuUogqh1jtSDqw/ApQZATjKyZ/FO/N8i26J7M++pAFIxaFQVu2cLcFLXY18+VeBX54
	4q9YvtnEbdd9AFqjzoCwJ8wfu6x48qRUrJ7FRPfPgKDsffYCgVdfaHpsXM61tJbyh11u
	X5Ug==
X-Gm-Message-State: APjAAAVVIbhGcf98WguKnk1FSMap+dKZGqibXZlvz2f2dkIba15UCxUn
	CjNMDfXRqVhaPyFx1A6lFiO1lGJW
X-Google-Smtp-Source: APXvYqy+hT68Sg54P2DgYVCWzoY+KLGK4S4EIQzitnFs9AnFwqG6Raw1iQrmZhmprLWA2Q6/e+wkEQ==
X-Received: by 2002:a17:90a:bb0a:: with SMTP id
	u10mr1017455pjr.14.1571847244834; 
	Wed, 23 Oct 2019 09:14:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d998:942e:6613:6ef4])
	by smtp.gmail.com with ESMTPSA id
	d19sm23179067pjz.5.2019.10.23.09.14.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Oct 2019 09:14:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Oct 2019 09:13:51 -0700
Message-Id: <b0478316a19814a79c030640e7d45eca6971d0a8.1571847041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1571847041.git.akuster808@gmail.com>
References: <cover.1571847041.git.akuster808@gmail.com>
Subject: [warrior 06/10] kconfig-frontends: Retrieve the Git repository from GitLab
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
X-List-Received-Date: Wed, 23 Oct 2019 16:14:04 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The ymorin.is-a-geek.org site has been down since September and there
is no indication of when, if ever, it will be back. Retrieve the
repository from GitLab instead, recommended by the maintainer, Yann E
Morin.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
index de9a6eb..fae80a7 100644
--- a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
+++ b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
@@ -7,13 +7,13 @@ the effort of keeping an up-to-date, out-of-tree, packaging of the \
 kconfig infrastructure, ready for use by third-party projects. \
 The kconfig-frontends package provides the kconfig parser, as well as all \
 the frontends"
-HOMEPAGE = "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
+HOMEPAGE = "https://gitlab.com/ymorin/kconfig-frontends"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
 SECTION = "devel"
 DEPENDS += "ncurses flex bison gperf-native bison-native"
 RDEPENDS_${PN} += "python3 bash"
-SRC_URI = "git://ymorin.is-a-geek.org/kconfig-frontends;branch=4.11.x \
+SRC_URI = "git://gitlab.com/ymorin/kconfig-frontends.git;protocol=https;branch=4.11.x \
 	   file://0001-Makefile-ensure-frontends-exits-before-writing-into-.patch \
            file://0001-Switch-utils-kconfig-diff-to-use-Python-3.patch"
 
-- 
2.7.4


