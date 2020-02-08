Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 655B560C83
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Feb 2020 11:06:45 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id q8so2029704ljb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Feb 2020 03:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B+uyJFS5y/V7dQWHgzvdBlpSCh/oZZIy9xtcM7LW1YY=;
	b=DNiNG1xCHeWn/nzZ6zK1C7ARDZY6FXU0WI3WoqOAq1D3LoBIduYHd3NzMYg+Ivr80s
	2/7G0UfauPkgSvwEecGu2kREWSub0m5CTQDs5LRVNGQhqJY+sEozdUrr0muMOrgoA/B9
	BjLzRN5QIsCj0E7OZtK9tQZmm8UYoj8AdXG+a/6Y4moXvZUbk5ry5pQAZmihRjQBFJB6
	ruNfpKaaQbXE1EAtoiAdpkwxdE5NB8MyRTQ/RG6seD2Oth49edCWqkOkuBeourEA+eiG
	EXSWmg6SgtCzXyTnmXEXYb2ryOf76JqkD8cnwYPkR85WYsEzSe25sbDFVGl0qifvT6EG
	9+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B+uyJFS5y/V7dQWHgzvdBlpSCh/oZZIy9xtcM7LW1YY=;
	b=R7fynmCxdzR8j55kgUh/olq0K4UW2yyKMaQ6VLFC7ER9lFljTKFFqmtjfuKrmJcdcU
	z3UnuaiUHfGv/8gvSetdpo2mWcdk+42mA0xMX6rKwfB8wn5EnEJhP87z2h+irHkYkbl6
	GKfndMHpS96QOMNO9Pt2BzyHoqW2nzBqfs5Q7Z8PaBcRUVNGZC4cVrlhpKbchInw2RMN
	D85Mo3vacs3HLUjo7gi/GUurqsjuU4P7fPBPegergOwFZi5QS3M22ejgwrg4hKF1s5ed
	Ni9w3haWt9Dhlf1nuHJajppz82l7haApSDqiLJvHzl7vVJwWcFiX8Bv4+r3hGqPL5lDg
	Ub1Q==
X-Gm-Message-State: APjAAAVlk5fHxah1L40wyrGcKd+sHpVjkIKPNLr9kBeYdJ4kkUDU6diq
	mn7Yv9qJAzWGT/eydidm275QxXyN
X-Google-Smtp-Source: APXvYqxWoQordsY4sxVhkod53GWrg905ho7JIlDSXGtVy7XzCdhig6fIqQxD6/63b8Jp/G+sGth9CA==
X-Received: by 2002:a2e:8591:: with SMTP id b17mr2419684lji.249.1581160005550; 
	Sat, 08 Feb 2020 03:06:45 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68])
	by smtp.gmail.com with ESMTPSA id d9sm2861700lja.73.2020.02.08.03.06.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 08 Feb 2020 03:06:44 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Feb 2020 12:06:34 +0100
Message-Id: <20200208110634.250922-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-java][master-next][PATCH] openjdk-8: Don't set TOPDIR bitbake variable
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
X-List-Received-Date: Sat, 08 Feb 2020 11:06:45 -0000
Content-Transfer-Encoding: 8bit

It is used to set the default sstate cache location.
Just export it to the environment.

Richard, feel free to squash this or someting similar into the
openjdk-8 update commit.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 0ef4750..d8b30b8 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -12,7 +12,6 @@ FILESPATH =. "${FILE_DIRNAME}/patches-openjdk-8:"
 
 # for weird openjdk-common.inc
 S = "${WORKDIR}/${OPENJDK_HG_U}-${OPENJDK_CHANGESET}"
-export TOPDIR="${S}"
 
 SRC_URI = "\
     ${OPENJDK_URI} \
@@ -27,6 +26,10 @@ SRC_URI = "\
     ${PATCHES_URI} \
 "
 
+do_configure_prepend () {
+    export TOPDIR=${S}
+}
+
 do_unpack_extract_submodules () {
     cd "${S}"
     # tar --transform
-- 
2.24.1


