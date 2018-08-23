Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id D0BF67933C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 09:41:32 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id e23-v6so3558254lfc.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 02:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=87gbjTI8AkGn8YxBvaPsB9RLIed+GV0UBy4JKasSB8M=;
	b=QQVGnCmI+Gtw8Ju8MGFXGClpGQoPQJkVD0L10QaneoBg094aEsrxKm0FDene6iDelq
	yrg7F48I5yohN+MDyoDH3ti9tIIrJYjhoN1FikYOPXW7cdZLXtR0l5rxw33YhvK/VD+b
	WmFe2eu2OIuUqOvamDpOfNQvutRT3U1j4m+gaT2D0rgcYLoFI3Xgx3iGwECE/5DNgVsJ
	YkH7tLQfju5NpzH2nQL59VknrT3IQapV0eguAUDAAdgehUId7WFEl/rrcBe5OWeYLNKN
	zAUxWey9TOJihajF+S47NRpSGSxgKJVe71fN6SPxkzM0pP0PqMmkV0EYW4CiHwkPDwkr
	JdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=87gbjTI8AkGn8YxBvaPsB9RLIed+GV0UBy4JKasSB8M=;
	b=N4CASj1cu5o7XKI18+NBx2XeqObk5Eq1rslRWR+9upZ0/WyeJZLJ1HLhGn0i6FSFqo
	BUXf5x5jZoIgqQarOQMLL0iJOVWx2sLPXGYZ3k5Dh4GGuqXz/adVWwjRVl7nJLp+xwVr
	5aHxl8eI/Fj9ZAkfI6rkQZ/24W5YwHNsMmPuVKBqp+VI+m4TMYZ7XRLad6ruHVNek8YD
	yf6P/S5Tary0238qMsaXWnNi6Op32OWegXApy65y+wAPY5m11bNuggzmi830IrG1P2qs
	CS189DsOV/lbIOXKMPNCiLsqN08c67VvtwbcBHPiu+Em1UsTPMEutKN3VXbFMjv8ySc7
	AFQg==
X-Gm-Message-State: AOUpUlEHG06bhKHGzIwO4u+JA8ZrPT2CTROI65MV57U7TFLVgkG/b7l+
	kb8+x3Gfr7ZJcvsCBoT7Oi6uqwjRuLQ=
X-Google-Smtp-Source: AA+uWPybqMLF+DfhpDSoTHKSh3uaanm4y6I71finaFJbZT0HFp+tRb3vj/P8W7l6KZE0vzqC40a12g==
X-Received: by 2002:a19:ea52:: with SMTP id
	i79-v6mr12608376lfh.75.1535017293066; 
	Thu, 23 Aug 2018 02:41:33 -0700 (PDT)
Received: from scout.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	n23-v6sm670232ljh.77.2018.08.23.02.41.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 02:41:32 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2018 11:40:57 +0200
Message-Id: <20180823094057.8794-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Junil Kim <jjunil79.kim@lge.com>
Subject: [meta-oe][sumo] ltrace_git: Update SRC_URI due to inaccessible problem
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
X-List-Received-Date: Thu, 23 Aug 2018 09:41:33 -0000

From: Junil Kim <logyourself@gmail.com>

Existing URI service was closed and fetch error occurred.
Change existing repository to another mirrored SRC URI.

Signed-off-by: Junil Kim <jjunil79.kim@lge.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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


