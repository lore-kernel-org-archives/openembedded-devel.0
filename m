Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4B76F71A88
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:31:04 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id ay10-v6so3597797plb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qXAYJB5zOXsCsxeiOBfQtW7lycFCd/6c6tMlZWwTfSQ=;
	b=Muxv9jX8rgGbKrHJt5X84VZPagpSfaeWQqli3pCkn+rL5sl/KpGWqcC/nvS6qsbavB
	X+8bn0+qpyijcoJKHDjmPLxgzXZtG/TY6n79ONcCOvWf/JsjQXKSyREYlg9eWcTr+vs4
	ERq8oxXcLB+2Imn23NozUmKOysKjkpmD9ptS3ymAuAC0+a8NjyHWCoF1usML4e+iJ9q5
	YJ1du5GBpyif0djruR4V0MuNeuFuZ4qWuCqW7H3x0AmgvaV8eg+2PkbJtr3TuGmeuxEA
	a1P9DlaZ9DbJVFmqTiFlki563SG/9dZXi3+f0spJQkSpTLb4v+ZaeUbpADAU5GR0NR0S
	YI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qXAYJB5zOXsCsxeiOBfQtW7lycFCd/6c6tMlZWwTfSQ=;
	b=P/W50q3m+ZZyVYWfBTpBgipuplVCwR+P0mSvHP9bJjnz6jWlWlJRRRjEU0xvnMsVmQ
	hXQuFGuO5KLU0wLBk5l/OrBRFnf6FjZ+ge1dYtqY85gmq0MDOmWMWpvFSHtI2rV881Ve
	gwSHu+cUKqkEqgu5gqGeQ/8DCe+4CHB2RXAk4+H5sN+HBhpkAbHRYpKyEB/HLPqOLDEZ
	rZvjbqGe9oPZxOyaIUB4uXr/B2Z00O+T7xEKoIuud8x4pUaxTaBxQzC2YakscHbZpMJ3
	lyQ2ANJG30P+fnPGpJMg2lS5BfGOAtqHcH73Afeio1A+jBKe6/P/7INvGRIJwj8I064d
	ByqA==
X-Gm-Message-State: ALKqPwdee7IZPmlyWqt7qxQS+ng+3YqjW7m8dGAsH+Vvkk3Y9CQ2r+ic
	i5skbsUFOWo8TDZdO3ORVjrW/g==
X-Google-Smtp-Source: AB8JxZopRS0SY7Kig0CQrsrit/JR4Y+jYEKdMopUzNlIWzJU15jOK7eH7DTgP93Es/FDnvW5Apk28g==
X-Received: by 2002:a17:902:6687:: with SMTP id
	e7-v6mr7640342plk.242.1526607065936; 
	Thu, 17 May 2018 18:31:05 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm9428562pgd.5.2018.05.17.18.31.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:31:05 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:30:32 -0700
Message-Id: <1526607046-8081-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 03/17] rocksdb: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:31:05 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 1e6cbae..16fc180 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -28,5 +28,3 @@ EXTRA_OECMAKE = "\
     -DWITH_TESTS=OFF \
     -DWITH_TOOLS=OFF \
 "
-
-FILES_${PN}-dev += "${libdir}/cmake"
-- 
1.9.1


