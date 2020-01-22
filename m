Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 05E197FD4E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 23:08:11 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id w62so545611pfw.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 15:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Tfng5gd2YY/oV62j9aqt6Jj35zD9N33UeYHpbCLRkIg=;
	b=FgBcaobb8GPUI66afalIXT7+EMe6N7gvqjjF3W2TjQNOZkmCZoKe+83/939mjU1Q5t
	/RGY6L2zrg1jBljOAbVkCjaSh6dsKx0vfZ9y6D5feoqX6xNuv4N4EBXdqJoHNFQv5J/D
	5cQbCK3LOqiBAhf8lkywVjUCeD9YfpZpBpvD+5vedvqXgDpTA2IPv53aKzJARHSz5s+R
	s7QDyO4Fehmt7WdWtyJtLWQYZl7qFJUiv3N686f5Hcr8PIcDWP29Zgr/nNCafRmAlw8O
	rUzhykR3GfvfKK8VyR8cjF7Y0SJ7K3CRsgKUhK2TFtDAu4YFXJ4OlmjreEVfbpZNZAeZ
	6Vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Tfng5gd2YY/oV62j9aqt6Jj35zD9N33UeYHpbCLRkIg=;
	b=B5CUr4DLlN2stpp44Tw3+AuaS0Sa0gtJeJ0HNpWuKr6UlumJlduv5nPt6Gwblw6ouc
	IFL487rAcYrmsbdujIy6IquAfCGapE1Vyhgr+4AxJCGMNVQ1CewEkp8yDf15BeNcP0cx
	voNS38mW5blVCZmMmTH1iX8OK5QXNI1NAQwcV71gfE4jpqylU1UJlLe2aOH/ksKmvJ7r
	Mc0FCkHxmUWTO2mjS0NkWP+6nITcQUfdLuTRDDjRefQwuqTAYBNwELxsY2NLUKpcM3PY
	uLps0nvKO19kwxNxNJlF66DyRA9OGOkjhPF/Y6rNNofz03Gd7Qqq5qd1JJd/+htn6dCG
	/pnw==
X-Gm-Message-State: APjAAAW+B0lQmSRn2KDQhqK2ciablZmPpcrbDG9KXLRKPk59+3jUu6Sn
	5dur8lwYz5aJ7eKrOCPFyXyHhfQiK24=
X-Google-Smtp-Source: APXvYqwwEm1fWr5plpw8FO/QGgldvRjWofaxbsyTpBHY1yv/3rtVQaA0VUoet35PrixEmANsabB3Dw==
X-Received: by 2002:aa7:98ca:: with SMTP id e10mr4841338pfm.24.1579734492380; 
	Wed, 22 Jan 2020 15:08:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id z130sm136892pgz.6.2020.01.22.15.08.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 15:08:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 15:08:10 -0800
Message-Id: <20200122230812.2223255-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/3] telepathy-python3: Correct rdep to use py3 dbus module
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
X-List-Received-Date: Wed, 22 Jan 2020 23:08:12 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
index 11ac0d93a1..d92e6577af 100644
--- a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/utils.py;beginline=1;endline=17;md5=9a07d1a9791a7429a14e7b25c6c86822"
 
 DEPENDS = "libxslt-native"
-RDEPENDS_${PN} += "python-dbus"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-python/telepathy-python-${PV}.tar.gz \
            file://parallel_make.patch \
@@ -32,3 +31,4 @@ do_install_append () {
     rm -fr ${D}${libdir}/python*/site-packages/telepathy/*/__pycache__
     rm -fr ${D}${libdir}/python*/site-packages/telepathy/*/__pycache__
 }
+RDEPENDS_${PN} += "python3-dbus"
-- 
2.25.0


