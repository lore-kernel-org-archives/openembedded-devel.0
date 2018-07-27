Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id E4DEB78CB8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 12:34:12 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id y5-v6so4801600qti.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 05:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dDSp6JpwjSjt7uC4CS2sV3npcmenbaahbURYTg9bHfI=;
	b=EC1Ji55sBadLSx75SuvsOnWkqWm/qnuJ83J/k7Ed5v5J770G9jw6FoDvoQpqKEROA9
	IoB6Rrzv6uw/pTvkls9u+gxxpv3STcSb1un/LKns42YgMgAZUyXXo/EOdtwxR8Xp9mVp
	mHhmbTOatmQTf4Jkc8COdPSmWnwBdc+3mvojhJTbrgwHhXeq4AYt9mkO05MDDVK01qxx
	phKGLNbaP0tVzAADFEa0gZe38sEPr3dxXIt3qGGogfTpxCYvAcGf7YoxjMyKMYqZ/qjS
	7J4PMzsq38Xx7ARtBd3hbxXkaWAiGJP8hzRd1h0eaH/akTrIT0wyKMHTYj63AKrlDeuK
	eFPw==
X-Gm-Message-State: AOUpUlHNOqF5bLyl/g84Cwt6Dp+nbJe9y1I/mV11okNs75AlzKiS4X3i
	wTO1PoSyjjknR0stD3GIxcU+vUl5
X-Google-Smtp-Source: AAOMgpeyA6dnklfPN+hk8dFWeqZWMMOPImdMNw/DNEGNucaxisQeVhEFNUGOiAet+MIvrkSd80V3/w==
X-Received: by 2002:a0c:8441:: with SMTP id l59-v6mr5417625qva.5.1532694853597;
	Fri, 27 Jul 2018 05:34:13 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	q195-v6sm2298514qke.13.2018.07.27.05.34.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 05:34:12 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 08:33:56 -0400
Message-Id: <1532694836-25777-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-stevedore: add pbr-native to the build dependencies
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
X-List-Received-Date: Fri, 27 Jul 2018 12:34:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-stevedore.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-stevedore.inc b/meta-python/recipes-devtools/python/python-stevedore.inc
index b23fb4c..a50c0e8 100644
--- a/meta-python/recipes-devtools/python/python-stevedore.inc
+++ b/meta-python/recipes-devtools/python/python-stevedore.inc
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "f1c7518e7b160336040fee272174f1f7b29a46febb3632502a8f2055f9
 
 inherit pypi
 
+DEPENDS += "${PYTHON_PN}-pbr-native"
+
 RDEPENDS_${PN} += "${PYTHON_PN}-pbr ${PYTHON_PN}-six"
 
 BBCLASSEXTEND = "native"
-- 
2.7.4


