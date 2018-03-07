Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id AF77478A48
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:35 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id i6-v6so1857148plt.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WlzFwjqgs5g1OWTqyxG16/FvV97a87KBUAdj1vuyT70=;
	b=o+DBUdAy6rCZZWPaaWR/q6BjvnEZgUoGsHtGXCY717Iu0fSrCthqIyEOM9k4lHekYB
	9LO2pIcu0488HU52b7Cs2fc4Tzd50hZeDB2eK7nzTygeRadX/bDf1PATelMWSwc8CEvK
	ToaZ1bFRNO3Ybyducfhpiu3mEJn4fNywbg3sXJl2fI/ZKIRatJUulvJLf+RRJJVcPuIa
	pw3A8nlFLu6FfRbOdluuHlDQwLx60QwDCnUP5OABwB01IxIGLB78q/0ZqNzvirblvYIr
	rHXWkUDywrrW6kOV5vXG1GsS5n1XWE5XQ8FAGgeGJK6+kIEY1P9uGIGDxrPHK3cOfk3N
	cIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WlzFwjqgs5g1OWTqyxG16/FvV97a87KBUAdj1vuyT70=;
	b=BdCAdSajTQnaxkmPThkJy8RDwLTDZpRRijEDzvp336i6qP0YJQVOKF+ovMqQuboGvv
	CR0aM4AUZpID+lJ5v25UkN1FK281zdHP3KyaqLWDiWTzjcKqekYyNRpc5xn1wJpTb6eb
	S+oqglRNfcuO9L80FQB+iD1H1yIC/DC4i5+jc6XZITMyrqkXS7v6mzGGJ5FxYDaWM0IU
	lAgacQW9w+l3zOcFrBuXoVcAc4VQ5MLgh+/Z1tyQ6HN70xQodS1OKZRMBL/F8ulcmX6F
	oRnPgNgQ8wHPjtFn54/z+V1iCDdK/kRMXMo2CHiP6Cp5QeM0dSp2piArpifUGO0Cj0Ur
	F/sg==
X-Gm-Message-State: APf1xPD8mju3H3XITI1fryt/tKlNPGZMUDk7cvhFqJUDE954DlUozKcq
	UGsHrl5Lblf0eyQULOoOCuU=
X-Google-Smtp-Source: AG47ELvNGo0ek/DTN2y/QfO4lNEV6DAm7/Wvr5bY7tsWFJz8jlnh/MsrUXUy6dXlBnTsAGn/BCqLUA==
X-Received: by 2002:a17:902:2863:: with SMTP id
	e90-v6mr21950129plb.232.1520449297025; 
	Wed, 07 Mar 2018 11:01:37 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:01:07 -0800
Message-Id: <1520449275-29492-15-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 15/23] gedit: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:36 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index 5d244de..ba425ad 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -7,7 +7,10 @@ DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 gtk+ gtksourceview2 iso-c
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit gnome gettext pythonnative
+inherit distro_features_check gnome gettext pythonnative
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0001-workaround-void-pointer-arithmetic.patch \
            file://0001-Remove-help-directory-from-build.patch \
-- 
2.7.4


