Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 525DE7EC47
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 19:33:53 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c14so632406wrn.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 11:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G0cNAmnAmBRPKNIV2lRD9D/1BR/Z4xMDwz6oSaJ9gd4=;
	b=npM4h788kEc/GpU/AB8fBaupp6xP1nZPwbpPCPXa6Uefw/oc+Go++0G56iWmvg8plp
	1j8pjcEkIkH8oGXkcXT6zGwt9Gq28FiytnA6Yq/dFWQ9WqPxASRVl0em5ZV32jmmtR+v
	Z35LjLRJaGHPO5oWmWvhCSB9/aAWo4onD66S/Jcz6K4Bm5zVNNuK8z4gCSHn8vpMFEyp
	M7wl4IU4E6hDMxlXQx/F+UieuEVEpS9TgsKrpkAqboI108u3dv+mlFmgwKNbJgR2pMcG
	aBQhHNXYdn/vhtbdYrvnjDyLiH6ML5HjGpU41hrPKu+1NjA2LAdZoknlQ7aIxqPezgbZ
	ZBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=G0cNAmnAmBRPKNIV2lRD9D/1BR/Z4xMDwz6oSaJ9gd4=;
	b=RygR+KkRkNz/Gm5WQeUx2txxpBfRK+8nCXNqUNnyI+UZ6BmAf7vF0GHYQ4Z678mOPu
	iC2sd8GcVIeXK2p4cWSc4rz8UlVUV8NUv/VLbbxm5ai2RUnueczxo/GGEuvXS2IJPGW+
	Sh5N1W91HMmiucadopq1/WQA/3pNUZDDF5T2N3zu2MNBxX/qFHN6XztU3q9iJeIs1gEH
	X6mFTWpuTxnJ7mTvRQ0tcVVRl0f7R/rbT0GaQ5AfTtuVotfZhpKE34lqpfrOpVb96rkL
	bo2UlIaS3dwVMGyvztA893uszLeOZg/jqF2pIkAQjaRzNKHJ63JKh4dl+HdICNAZ3NOL
	OApw==
X-Gm-Message-State: APjAAAXP5zCUphNLshNc4cUfHJyyMDUdAXDWQp+bbKSfQ12jjvmESkeG
	FXnnkWTI3btNCHajOVESaG9keqxy
X-Google-Smtp-Source: APXvYqz5GcYRop4mzkc1rLFB/DihO5WcjxQYoH2k5aJamurMI98pjnxWz2uiEPEOkye2iKBPgeJUQA==
X-Received: by 2002:a5d:5403:: with SMTP id g3mr714089wrv.302.1575315233844;
	Mon, 02 Dec 2019 11:33:53 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	y139sm465420wmd.24.2019.12.02.11.33.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 11:33:53 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Dec 2019 19:33:40 +0000
Message-Id: <20191202193343.12298-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202193343.12298-1-alex.kiernan@gmail.com>
References: <20191202193343.12298-1-alex.kiernan@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe][PATCH 2/5] ostree: Drop tests for soup/xattr with ptest
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
X-List-Received-Date: Mon, 02 Dec 2019 19:33:53 -0000

When ptest is enabled, both soup (for trivial-httpd) and xattr must be
enabled for all tests to pass. Rather than forcing everyone to enable
these, just document this and remove the tests since a subset of the
tests are still useful.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-oe/recipes-extended/ostree/ostree_2019.5.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
index b2bfaaf0514b..ac1e49048098 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
@@ -42,6 +42,8 @@ inherit autotools bash-completion gobject-introspection gtk-doc pkgconfig ptest-
 
 # Package configuration - match ostree defaults, but without rofiles-fuse
 # otherwise we introduce a dependendency on meta-filesystems
+#
+# If running with ptest, both soup (for trivial-httpd) and xattr are required
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd libmount', '', d)} \
@@ -185,8 +187,4 @@ python __anonymous() {
     if bb.utils.contains('PTEST_ENABLED', '1', 'True', '', d):
         if not bb.utils.contains_any('BBFILE_COLLECTIONS', 'meta-python', 'True', '', d):
             raise bb.parse.SkipRecipe('ptest requires meta-python to be present.')
-        elif not bb.utils.contains_any('PACKAGECONFIG', 'soup curl', 'True', 'False', d):
-            raise bb.parse.SkipRecipe('ptest requires soup enabled in PACKAGECONFIG.')
-        elif not oe.utils.any_distro_features(d, "xattr"):
-            raise bb.parse.SkipRecipe('ptest requires xattr enabled in DISTRO_FEATURES.')
 }
-- 
2.17.1


