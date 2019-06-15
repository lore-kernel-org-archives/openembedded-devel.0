Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id E02287EA4B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:38 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id j2so3332838pfe.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KQGeDVttLlvr78wBMIF0QxlYvfsbzP56LXl5erj9BwM=;
	b=EEb0uqsFD9eWg/Q+5h/jFbjAw8J7V1QgAGtqMcFlUZpSovUXdlrpJ51RKgZaRfjYgu
	ptpZ65u2CRJllM9ZqswlvpIrgTflxcAgExNeVYk8af6FsDhWiZs5YSDbkVni5J+4PcXP
	xwpZ/xz3j95Lzlmbk0OxyaR+48X4JyZk2PkfY8NRMz46klg7/HVi8qnqe9jQYiBQT/G8
	QhtRRDnrci7GHpPTF9mtJVoUVFGxN4aisBMVt4fNrBCGVwln3yOqR+HC3X4/2Se2YL58
	cppumnhal75sOfa9H62sepvrnemuSXfkWDCS6vovpHKvmzDVAFhDZp6Yo7DyBeAUd8Kq
	fLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KQGeDVttLlvr78wBMIF0QxlYvfsbzP56LXl5erj9BwM=;
	b=GBllSWGuR2LCVhwVq7W/E9UvDdW+XT5kNiL9rLwHh+z6jTO5M4ACCbNrFZLykklbgd
	v73NJeESPsVF2wiuzw6WEYLGpRENsir/93aw4EbBhBxIPmSchUL6yK4tBEWa4pvUHzHV
	0xQgGxu5+V9zFg/X5WMvqVJun88T+V/ceReYDc8j9FmJoWaK5zaTjHj6qQBiR1fkhlif
	5Ww9iv3SkwIMYIiqf7+8t3S4hOg5ICNwmueH+knOQ7fLBsn/IA6aQT6L5XPjJJ2LdLnC
	9U10ZdvOB1eD12i39Dnecy0pA+zF5UZvQhia4rhw+3Ec5OsrCGr52ioxzFBdXC2o4usL
	Thyw==
X-Gm-Message-State: APjAAAWRLuXa93SQLJRQQCHNPsQSTRYsDjoST1Nr0oTnQIkPBZxnvyDm
	a1J+CCCSrMozqytMxsWYh2Akkyk4
X-Google-Smtp-Source: APXvYqymTKLKwLJzapRaw3ZiNV2b3rm3nZopHaxVwHHuss58PlyvWU0cUsrK+QiAMbLsksbuQFE0HA==
X-Received: by 2002:a63:6105:: with SMTP id v5mr41380838pgb.312.1560621459800; 
	Sat, 15 Jun 2019 10:57:39 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:12 -0700
Message-Id: <ebc2170183b3f9246ed2611064c73d3f84b7b222.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 08/23] opencv: use the same package name in PACKAGES and RDEPENDS
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:39 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.4.5.bb b/meta-oe/recipes-support/opencv/opencv_3.4.5.bb
index fa6e06a..ce60698 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.4.5.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.4.5.bb
@@ -176,7 +176,7 @@ SUMMARY_python3-opencv = "Python bindings to opencv"
 FILES_python3-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS_python3-opencv = "python3-core python3-numpy"
 
-RDEPENDS_opencv-apps  = "bash"
+RDEPENDS_${PN}-apps  = "bash"
 
 do_install_append() {
     cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
-- 
2.7.4


