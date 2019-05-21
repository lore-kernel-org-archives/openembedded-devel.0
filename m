Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id BA21E7E14E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:56 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id 13so8302823pfw.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XKdHuM6ZM+z7oVnLCAPnbF5m5oESBQd/PIFbYQgZNbg=;
	b=nOVZkD3zAhUSuA0472XXdM+mE//2TJahrET4URy6XlG1rN9HVezhYi9W1QfnnPpyfE
	hUm9jtE4oXuSDOS4rlNVyJgtkBX7aY0krGWgz1eFgXN6emNRP8LR6VEj85vBy43CYXS4
	ya4XP4DQAF8zmPdXzcOSd3qJ23ti6LIeXi75YZAq0+FRk8+5jZP5DjoR2OGVnkVcpRqf
	ZvFyP/LP7xFp4krBDsQ3r8z5F8Cq2k8KqR6QJzO+U29qXLwE59ob1kbDlir2g4tEZCye
	WIQy9kz4RTfod12TXw7v/A/eYySEn3IekEE7m0N2Qb+/dqKohTZjljEP/Zj3XLYM49EB
	HH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XKdHuM6ZM+z7oVnLCAPnbF5m5oESBQd/PIFbYQgZNbg=;
	b=Jt5F+6ETV+FYFBJmpRYSCMA2a5BAcgCLAp1WHBKCHXQiisG3Ebn+NXY/jyuoArE1vR
	jPNeSXwVzxB89l/X+LZH1Ai5QOH81hkN+90HzPvr+s7/TzJsvfPrzQ2s3iFlcng4xX3M
	7QH+GLjyJW/tEH8QURPu+HxSXlg1eA/5OKvmYr9/6PCLHrbA2fkbf4oA8xZD16o75C6A
	FSpCMdGNJJUtg9/AZ1aWcy4JX3PJXpWEGrJ0x4BGvV2VskCuDXh4CNngMNr6kBzAKZvE
	G7eY2YOrlKyocnQLHzxbMdZkg0gCtfX76NYpx1rCboJnbPZNRZlt6K1pG1YSAGJ9movo
	MDXA==
X-Gm-Message-State: APjAAAXxb431pgHD6Eikgh+jbVJ3aKnRZIYlenXMSjK0KMtMUOWMenmI
	UwO6PXKFnhEp4KgaUvun2kD3nNhB
X-Google-Smtp-Source: APXvYqz7RutshOFPb1xEp3ZNbxA4tZZ63ZtFvh+7VhuA0Fj6QMyyMb4LBMfNymJvM3iQXr6ucDM/5Q==
X-Received: by 2002:a63:a08:: with SMTP id 8mr79015393pgk.46.1558411017808;
	Mon, 20 May 2019 20:56:57 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:24 -0700
Message-Id: <c16c6de66118d324376f9528294766436f7946c5.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 24/34] mongodb: Fix build with gcc
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
X-List-Received-Date: Tue, 21 May 2019 03:56:56 -0000

From: Vincent Prince <vincent.prince.fr@gmail.com>

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
index 53a9f66..0f90003 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
@@ -21,12 +21,16 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.0 \
            file://arm64-support.patch \
            file://0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch \
            file://0001-Support-deprecated-resolver-functions.patch \
-           file://0001-asio-Dont-use-experimental-with-clang.patch \
            "
 SRC_URI_append_libc-musl ="\
            file://0002-Fix-default-stack-size-to-256K.patch \
            file://0004-wiredtiger-Disable-strtouq-on-musl.patch \
            "
+
+SRC_URI_append_toolchain-clang = "\
+           file://0001-asio-Dont-use-experimental-with-clang.patch \
+           "
+
 S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST ?= '(x86_64|i.86|powerpc64|arm|aarch64).*-linux'
-- 
2.7.4


