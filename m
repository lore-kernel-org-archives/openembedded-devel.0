Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0B109607F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Apr 2017 18:37:35 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id w43so35897757wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Apr 2017 11:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IcFcBhqKKzwSJZUjQPk8vJT7YPy4DymLQCKKO2ZpXsg=;
	b=NIltrMhIzlQKE6R6D2V+4NqRtmu02BK/TjpYrKFTIFPOCSAPGQMzBUlkfFcEOQwAAl
	fHCE64Exo/4tVTKReDC1Gy/6WL381f284oMY7LIY+RlWW2OkEJ+fem6GgiEeGF0APLNV
	ui+wMbbXgTGni3eZfmgpnCRlPrBwzx4cluHx7ReuEyM6jJ8v5N2YFHcGrrNA6OIgVRvW
	ed7sUMsGCmQ0BtkxTwkzJ3gdnnvRsYJXpQAnymrkbMD0ld+SfYh02H5+koRrdAPmsswy
	ZyFyfvenz5SKi79nGCePyYUPThhEEMwk1Cwa3DBUKLX8rOJCx3urTUlUklkeLvR2J2tI
	E/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IcFcBhqKKzwSJZUjQPk8vJT7YPy4DymLQCKKO2ZpXsg=;
	b=A1ipkMc0puISNnwu2vYVvEgfuItYvF/TlJBtHeqtFlzV+8+3zNVdE3H7bszTtlURML
	Zr7zOOBOyhLOxS5ys58UKEOYjF+zXChIdkuiFK1NT+QfaJV1KI73ynz4Buam7nRADpzv
	oFr0eawlYXrIeb1UJnMa4iqCOsxWk/uINL5IdR+Y4o2M4nGOS8aneaG0fwJVBh2j8zoS
	ZFI3175UBXFmISWYEpS5T/IGkn3RkocBUeVAjzBiRu+GIc+CW4g6+v1E4zCb5iwS2Hak
	PgKku3Pa3gI7Y4ucxCzHGJB2ich7LeC7Z+qr2XPucVra71zGeVU/R5PY37Pt1BePu0jp
	imDQ==
X-Gm-Message-State: AFeK/H3011Amhmz3mRLUq7T9xg3O3ij/VfPIezmuKjqyItx4ThHn0xHwhMwHfbWvxEAe0Q==
X-Received: by 10.223.150.88 with SMTP id c24mr15791108wra.202.1491244656267; 
	Mon, 03 Apr 2017 11:37:36 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 55sm8432648wrz.27.2017.04.03.11.37.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Apr 2017 11:37:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Apr 2017 20:37:34 +0200
Message-Id: <20170403183737.14791-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170403183737.14791-1-Martin.Jansa@gmail.com>
References: <20170403183737.14791-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/5] logfsprogs: Blacklist, doesn't have proper PV, doesn't respect LDFLAGS
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
X-List-Received-Date: Mon, 03 Apr 2017 18:37:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
index 32ebec83d..7a00e0c21 100644
--- a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
+++ b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
@@ -24,3 +24,6 @@ do_install () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# logfsprogs-git: No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/logfsprogs/git-r0/packages-split/logfsprogs/usr/bin/mklogfs' [ldflags]
+PNBLACKLIST[logfsprogs] ?= "Doesn't have proper PV, doesn't respect LDFLAGS"
-- 
2.12.2


