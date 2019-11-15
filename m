Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id AAA257F76B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 08:06:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47DrXs6yZCzQ7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 09:06:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573805214;
	bh=T53SP6tKM/j6FRm2y/zyJOmVXVMhi+7pJ18ocwL2oWM=;
	h=From:To:Subject:Date:From;
	b=P5qScGeCI2A/X8CF0/lbl23Ne27rtGMvrXlZn7qlBJ+fp3Bx7wRL8QQwvwq32gh+J
	uEaef4Q83y+dDRrkcQEOf3/LLJrqAsTh2gKVVUhIqW2pNLzy4VPk6aNLWq1CazlRMo
	TcK9Or9/78hdeCRXQpd4Qsvj3Y0mkyW98aqXn1Psyv97pVmmwv+3Fc3jjg+ehDcp9C
	UYTsY75L5nngQPRVQnPuZzB0g+2oL0BF2QvQWIvEURXrUKyvizMkRRyTlCvUUxTuIs
	vO0maWLIAF3+MHndyu8ixsJ/Z8uCbzlR4Zv3or/cKL85MBa8oTaNhQduV4thq+twdk
	T83khy7AsmtixyihNNmLvVWB0yVHJc+gBd9fP+iu88cJXcO97KW6oiXE+4aNwkMnWK
	3YVneFx9WyaOOdR2lNfb0x5nSv9X5JWjxc2ynkDmruwlydKPmDEz8O49HPddXY4vP2
	RuyMSezFXTm+O9VSZ69VhPyrptAgEq5Jtnqw2AtZEijymGOMINMJ+dVP2tQPydWZ7V
	PrRTlDAXHvo/RuoYwCUT8AJkrJSr07lDe6wxL+g3KuZ9zNSR9PgT+9JhBExpy1wmO0
	TAv0eMLlTn2jHz/qvoQC3bCgxBnw4IvSu0au9Vh1WKBDdJwtPBkp8fhEibnOj6Z8Fn
	s7xMzdtQfbvhEC+LA37mTc0Q=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Nov 2019 10:06:53 +0200
Message-Id: <20191115080653.1994-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] ltrace: Remove RDEPENDS on elfutils
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
X-List-Received-Date: Fri, 15 Nov 2019 08:06:56 -0000

It was added without a rationale and seems unnecessary.
A runtime dependency on libelf is already automatically generated.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 5c4e7c5b8..bb21cbca8 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -14,7 +14,6 @@ PV = "7.91+git${SRCPV}"
 SRCREV = "c22d359433b333937ee3d803450dc41998115685"
 
 DEPENDS = "elfutils"
-RDEPENDS_${PN} = "elfutils"
 SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http \
            file://configure-allow-to-disable-selinux-support.patch \
            file://0001-replace-readdir_r-with-readdir.patch \
-- 
2.17.1


