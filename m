Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id E7DE474C18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:31:21 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id e6-v6so3580534plt.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SopqI7tZUlhRko8PlSVpdnhjG5OZv9HjOEYw4VVfcYk=;
	b=X9Dw8wM8wa2GsBrgEZB1yL+If5tJRU0fXQtk8TvDluntDjoWyE1hmicfo0BDakmQxk
	2Ky0FxmaKSSi1v5UbQJjov0oh1TToZ2G4oQOv0QbuAALEkeCw9LLLJZskoziOktIBv6N
	GE8iL/i9Mr+q7oaj1WAfmJDPzZimP+uugrnjhY82rl4f/15UlTIm/rWEfYbMdtV7SKKZ
	XA6r9L47i7onr+/cKGhltba1YJ1YTezWviUs/piWA2YfDttgSLsfsoa4D6fD0VUTCM49
	PqjRIzMOAcMc9Z3aKhojmCZNEu4a97fH0oA+Tqj79gF9bjkdcbQ4yRcagInuw4BB0pbj
	utzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SopqI7tZUlhRko8PlSVpdnhjG5OZv9HjOEYw4VVfcYk=;
	b=CN9wtuuC8e/pdfCV0Tt8zds9pqsQIMyz7E1cgtvknlLpZ/a7yPzlh0ETw/SHFmak+p
	NKzVToy8k+x110qBAygCbceUZUtpwR6WXU74AY+w+VHeyuloCdGmmQsyKrZgSCD24hJL
	tWvj72uM8ja/Pvkd6p9nJpQid7elHtXsumUr+35VCVYzXZ+Qmi1WovHPfKANfjkGLEDE
	L0B2qpIcXp9/Vf/c4QzJBkPTuZBuxLyZuUbDIPzG9cOQ4O2TlU+Cg0rhXfmcoVwMTbSM
	b+ZjbHGKIi84VbJEij8DlsKL/9BQOGnKT/r1IAO7cM4DVl4DrzXkHq7hcX3zojb7SAKx
	l4LA==
X-Gm-Message-State: ALKqPwepDM2sV12NTIYvxZjvFh2H7d5pkHhfor9X8S+Eru4dSrnfklVd
	sctKdEZmsEdjcb+z2mwErjGoIA==
X-Google-Smtp-Source: AB8JxZqybNhuJWOlQXajzxvH0JieptcWBG8wVzBB4fgHluKQlregUUy+JrTOxsoyZ7omyuaUb+p6Ig==
X-Received: by 2002:a17:902:6505:: with SMTP id
	b5-v6mr7416777plk.147.1526607082907; 
	Thu, 17 May 2018 18:31:22 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm9428562pgd.5.2018.05.17.18.31.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:31:22 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:30:42 -0700
Message-Id: <1526607046-8081-13-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 13/17] gflags: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:31:22 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/gflags/gflags_2.2.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
index 28b652a..834a9f9 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
@@ -1,7 +1,5 @@
 DESCRIPTION = "The gflags package contains a C++ library that implements commandline flags processing. It includes built-in support for standard types such as string and the ability to define flags in the source file in which they are used"
-
 HOMEPAGE = "https://github.com/gflags/gflags"
-
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
 
@@ -10,8 +8,6 @@ SRCREV = "f8a0efe03aa69b3336d8e228b37d4ccb17324b88"
 
 S = "${WORKDIR}/git"
 
-FILES_${PN}-dev += "${libdir}/cmake"
-
 inherit cmake
 
 EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF -DLIB_INSTALL_DIR=${baselib}"
-- 
1.9.1


