Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id AF7B772F1B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:21:36 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id x86so45540435ioe.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QdZUp71FV6FXqZpR8xJ4bUl83R8U023B9r6ww2r8giU=;
	b=kBA/xfdvmmxh+WXFNmwvBjZSepgdTlxArEdgzEBApws6KTeptM3HxVGCz+RrfSFFcU
	oSSaKp4KT4pYie6hq+BC2tq6Ged7bnl7tjQHL4toRIdQAdhwWkKqxtbIgbLJOFnLD2JO
	4pmiaBRPVO/aqR8IfEe44DFh5H1zaLbn2Q6qzqVwQaguLfFH2x8ckWHkQ3n/yUwxgz52
	Fgrb83NDtfxeAHzk1nglItVq3GveNMmgV8R/ikycBMJVd4VUyGTvrBpg3YKRpkTNLcAN
	snw9e0dXBS5a3k2O2Q04VYAfYUsFD5MbrJGmVLXmk4oyp1MYRIE1a7KxHdnPnvV+5Cgx
	ywow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QdZUp71FV6FXqZpR8xJ4bUl83R8U023B9r6ww2r8giU=;
	b=TzNk1SEsFlGrg/Ub+iQEL6Ga8mYH12Xwfe536ElEXrOQ8tP/gMhjQGox2c2PAwddQ3
	HHLOuc46Na1N6Qdyhn/wfb2E7ANzNf2pjKzZ4dbCRaHnHr004afR47NYKB6adJlq9RSS
	3s3CH6+OXTS+ubZlk2mtd7o/pcsGn6yC8d4kpHvg/DbMZ63or4BS7x3KZCZfgjxBj2eI
	GDegRWbjBeW5dcVmhco0lvnkUobQ3tiJhfg1YSBfyrCpyg8GPOuWOZDIRfLllENngT7q
	f521SyRiJRVshq9Pgt5PQQE1VATj3S8bgIn2tXmfN0Yo7PEnEPVjKgBtg/3yLyeHD0Sq
	KDXA==
X-Gm-Message-State: AN3rC/4sNmKQw/2OF3nzO8WMqKHdX5Ag8IAsysuvLbIJS6mVBPpz2Nje
	UJ77pif0YiVMQ5dU
X-Received: by 10.98.54.68 with SMTP id d65mr2287242pfa.90.1493011297543;
	Sun, 23 Apr 2017 22:21:37 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v13sm24001176pgo.44.2017.04.23.22.21.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Apr 2017 22:21:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 22:20:57 -0700
Message-Id: <20170424052058.4952-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170424052058.4952-1-raj.khem@gmail.com>
References: <20170424052058.4952-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 16/17] libtalloc: Upgrade to 2.1.9
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
X-List-Received-Date: Mon, 24 Apr 2017 05:21:36 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libtalloc/{libtalloc_2.1.8.bb => libtalloc_2.1.9.bb}      | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.1.8.bb => libtalloc_2.1.9.bb} (93%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.9.bb
similarity index 93%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.1.9.bb
index 0283088ff..d80af50d2 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.9.bb
@@ -2,16 +2,15 @@ SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
 HOMEPAGE = "http://talloc.samba.org"
 SECTION = "libs"
 LICENSE = "LGPL-3.0+ & GPL-3.0+"
-
-SRC_URI = "https://samba.org/ftp/talloc/talloc-${PV}.tar.gz \
-           file://talloc-Add-configure-options-for-packages.patch \
-"
 LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6d5228bfa7825249 \
                     file://pytalloc.h;beginline=1;endline=18;md5=2c498cc6f2263672483237b20f46b43d"
 
-SRC_URI[md5sum] = "6fb70af4174330e4cc139ea63b07c9e9"
-SRC_URI[sha256sum] = "22d14911164d4de67ff76b5269fa5250d01f78c955bc77e28615350996877130"
 
+SRC_URI = "https://samba.org/ftp/talloc/talloc-${PV}.tar.gz \
+           file://talloc-Add-configure-options-for-packages.patch \
+"
+SRC_URI[md5sum] = "19ba14eba97d79a169fa92ea824d2b9e"
+SRC_URI[sha256sum] = "f0aad4cb88a3322207c82136ddc07bed48a37c2c21f82962d6c5ccb422711062"
 
 inherit waf-samba
 
-- 
2.12.2


