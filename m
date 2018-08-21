Return-Path: <logyourself@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5479079004
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 11:24:42 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id s15-v6so5552339pgv.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 04:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=J07EsUhDT6JWv3Kwf3uXyLEwn6bBM5duv/vq744D4mg=;
	b=CMbD9zv+rSdbyePcMEyrq3UgPWyMCIldgGfWh7Suv95eW8iD8i5GoCI06iEPa/ICSI
	NaG2Trk6atB6OIdmYkyjCOdR/c0iEtYZ5b3IPhbUV3VhnKYwIa0Bd9el2nGM3UNZs9aG
	gN32C/bKiDvPZJ5xnEWUgE68Iwzb7XVqoW4Z+Yoh1us6M9+6aksPQSK2erxq0Uf1WHxA
	ohCP+sDZNevFLeaBi7OAyTgprWA1uiyhbgwT2bZ0dd3ylL+oglXT1ffbvI1Iw+1fZM/t
	gJoXI3AMSa4Rw/RkOlCUCWpfbXj6hSbMUuDlUHEeZlVMBsE7aBQM7gEH7WXiDG/SaivO
	h1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=J07EsUhDT6JWv3Kwf3uXyLEwn6bBM5duv/vq744D4mg=;
	b=T53IGnXwqZemyxHv3jxbSuzLZqT2eGyc8lw0f8mAZUq+TSLTb279TCuIPZhN1gD3LQ
	06LydgLi4wUGOwjtYF7+U5wQaQz13NH20DNjVZy54bOYSZil4sEzav+xc+S8X7RMuCoP
	X8+SQ+5NeF8Yq9rKHtx7wo1WB+N5TpoqHfiYLhc8hnC6fjOdnQTvApJu2E5cQsk8/sgk
	XsymFde36mvthipnrTsFTi8gxPKLREUe0TzWBs/4ksIEKDOuEJ7c502rXkTihdTJUmbf
	DuNFc0LaTWQhe6zJjh0Wlv+4W+w3aC70hMqNVtP+oTJu9F/kBAET8K0maeoMmAslXFK9
	7Tzw==
X-Gm-Message-State: AOUpUlEOvscaI+ScnBry0G8qY5vXVJgyHewVc/Htq4hQmpt4LaFJ7kpr
	/6mxgwr6hh7vt6Ap0R44jm2mvGIP
X-Google-Smtp-Source: AA+uWPz8WkrLc8hn+c9gNgV6B/pePKNg5+wJsQqErcSm4D1EF8voIGJ8/q4U3Bw4DBomH3rgf5p1lQ==
X-Received: by 2002:a63:6b86:: with SMTP id
	g128-v6mr47250491pgc.344.1534850682998; 
	Tue, 21 Aug 2018 04:24:42 -0700 (PDT)
Received: from localhost.localdomain ([182.212.44.138])
	by smtp.gmail.com with ESMTPSA id
	y27-v6sm26338877pff.181.2018.08.21.04.24.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Aug 2018 04:24:42 -0700 (PDT)
From: Junil Kim <logyourself@gmail.com>
X-Google-Original-From: Junil Kim <jjunil79.kim@lge.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Aug 2018 20:24:35 +0900
Message-Id: <20180821112435.13297-1-jjunil79.kim@lge.com>
X-Mailer: git-send-email 2.17.1
Cc: Junil Kim <jjunil79.kim@lge.com>
Subject: [meta-oe][PATCH] ltrace_git: Update SRC_URI due to inaccessible problem
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
X-List-Received-Date: Tue, 21 Aug 2018 11:24:42 -0000

Existing URI service was closed and fetch error occurred.
Change existing repository to another mirrored SRC URI.

Signed-off-by: Junil Kim <jjunil79.kim@lge.com>
---
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index abe015de2..f4033f7c2 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -15,7 +15,7 @@ SRCREV = "c22d359433b333937ee3d803450dc41998115685"
 
 DEPENDS = "elfutils"
 RDEPENDS_${PN} = "elfutils"
-SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=master \
+SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http \
            file://configure-allow-to-disable-selinux-support.patch \
            file://0001-replace-readdir_r-with-readdir.patch \
            file://0001-Use-correct-enum-type.patch \
-- 
2.17.1


