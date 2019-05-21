Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0BC7E12E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:42 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id z28so8335560pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=g7+nnl4NtjNXTrD2PZDWW6iRQg1pXDgIacDT1r6LTSs=;
	b=TgxP1zDzfmqbpQzzCkjKCnXD38/tGq8q38AUx3tPUwOyyJGI0qjN0Vatf4rQYKrPoU
	DjTL+Xfv+1QFAw2fIlzP0vR6tohEs8k5msdORQ8M/YoJTQUkuiF7LeAuI8Ynnpc371CI
	29e8xdR8QjVpuQYT3PzfxJDITFOPq5rKIS5+18R4Ul7sLDGv0AUdMLeLpV2NAfj3Tvoo
	083nMLUeCgdT1nMPHWeVf5DCG3B9zRaSPFMwQHu8iZEwsEJx8dC+t8lpd2sozJBmmXTN
	bS8aG2jUukZqqSoc3Vd+ZLo9tNaT/qgJyOiBbvTH0pPb0xa2OyGamWRXkl/U9pwx3lud
	RFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=g7+nnl4NtjNXTrD2PZDWW6iRQg1pXDgIacDT1r6LTSs=;
	b=e/4Rt7ssjXt0nLcaYEoF1CbVuIjQAZ8rxufr20JjIEVKmA8H/8alg3eHTFMxFs3S4B
	/yxwiSiFq5FRu7qht+H+OjExQLiQZEAi6daQxxUx/Ejzc1AULApIzt4RedsVWbjtA08a
	LQ9FaHEcEcgHYSMjFU0pgQ2TUE9dxbhuYkN1yAtw5zir59rRfRxwre4tmw6acL+8n0p6
	dRD/Mu+Gyv0i+e2WajsTEtM+c/a+vVPT62rl2gF02T9mx8zafwMhmQjPqU1pEvi59iQ4
	6WKdSeCTGws6TVDLcQKFT8js7TdLhr3Gil7dJmTROcoawkDp0A/L5kQPoKFS3wnCMG52
	EUTg==
X-Gm-Message-State: APjAAAVi3YGyQINy+SCUcNUa3rS76LrnA8NEsOdSBI4rkYpG/kiU5pWa
	z7AUi514tO497YHZB23sJxSm5kM8
X-Google-Smtp-Source: APXvYqyczQIFrp+1f6FcLqdyg4iBYKg7JBiizs3RLbBCoUz4s9UMNxgD+jsGu0oJI2zO6amspbzexA==
X-Received: by 2002:a63:950d:: with SMTP id p13mr79947534pgd.269.1558411003339;
	Mon, 20 May 2019 20:56:43 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:06 -0700
Message-Id: <7207a2559f5239b62792bb06638941c67ef2c13a.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 06/34] phpmyadmin: upgrade 4.8.3 -> 4.8.5
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
X-List-Received-Date: Tue, 21 May 2019 03:56:42 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../phpmyadmin/{phpmyadmin_4.8.3.bb => phpmyadmin_4.8.5.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.8.3.bb => phpmyadmin_4.8.5.bb} (91%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.3.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.5.bb
similarity index 91%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.3.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.5.bb
index 975f631..99678e6 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.3.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.8.5.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "c8a603f4b78d1dbcefc191b8ae598c79"
-SRC_URI[sha256sum] = "95f2692094d31c2c323d4767023583ab112ad54fff9e3af372710fcb676151af"
+SRC_URI[md5sum] = "e3737a28fff076003e56a83fe1920d04"
+SRC_URI[sha256sum] = "d7ab5df4e464d7ba17bf2a42da7d7f26dad45c34bf321ac8ae7d2ed748413913"
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
-- 
2.7.4


