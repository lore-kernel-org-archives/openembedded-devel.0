Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id B2312731CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Apr 2016 21:46:57 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id d184so5360110pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2016 14:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hkfZ86Ol9r49AifThiIOb7pjMRSaf5oDbR6SPkFBR9M=;
	b=lPCSYl+CgYQwKKtH0Fns+CXbDJ1/G0bSs/dMA9psOkHcnOjgERZk/TaBmv36Bxm/aw
	K9XgPlFgeiOW973omTYByFWQtIVFtEU9xgj15YLxlYUvaHt+wtpHC8GdahjB4MOXziGe
	HZw2rfQBb0SDlvNBqP162at0OC6OO5VFhAT/Zcaom8H5ZrOhysi/DD5j878rtnD8n2c1
	FryCqu8K3szs/oH47WWNgKWYUl9ggj+XOG1mHovyWlOF+sY5hNR6fmy3nfo9nNtml+ZU
	RoCzekFVHpNTK96jpq0LNpDfKVojUE1A7aHseMoys1q0pnb8A9Zv0iq2LmDdUD2BInel
	sw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hkfZ86Ol9r49AifThiIOb7pjMRSaf5oDbR6SPkFBR9M=;
	b=CFcR6kn+6GJbUu4WEgUAZ4d1PowS6OncXOrEOnLu3kxOA6SWayTOHQ6khKAAHiivyI
	cXnHaojpiZfETOcwwe/GrIIi9SQOqnca/fWQOkA1KN5t8PYMz3gNM1ax7eRfRrw/u8RX
	jKu8IG7HuPoMm2dIRA73BpD7npgPVhcHGZidV/80nXeCBatkmX/lho1TS5YvFyftOOy5
	u0PMeleH6I5kOHC+wqNso+FUCxXRaA76aPj9zXQ/XtCLEr2Hn0AG+AABCOKLmjAzClho
	AgoSEc4UEIBs2VbZ4v9TPMyyiQQZhNQCcZllhM1FF2cLMjaSmENvjqLFiuOUoq7zVEhy
	SX5A==
X-Gm-Message-State: AD7BkJLtH99QBPsZHIVRE3HWAsH+AWrxsJ5Wg/dalP6MBzAlEhe6A53+U8wTmZRl+WZf8Q==
X-Received: by 10.98.43.204 with SMTP id r195mr41665645pfr.49.1459979218385;
	Wed, 06 Apr 2016 14:46:58 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	l81sm7091069pfj.21.2016.04.06.14.46.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 14:46:56 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2016 14:46:51 -0700
Message-Id: <1459979212-16117-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1459979212-16117-1-git-send-email-kergoth@gmail.com>
References: <1459979212-16117-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 2/3] ctdb: rdepend on procps
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
X-List-Received-Date: Wed, 06 Apr 2016 21:46:58 -0000

From: Christopher Larson <chris_larson@mentor.com>

ctdbd_wrapper requires pgrep.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
index 66c966d..232546c 100644
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
+++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
@@ -28,6 +28,9 @@ PARALLEL_MAKE = ""
 
 DEPENDS += "popt libtevent libtalloc libldb"
 
+# ctdbd_wrapper requires pgrep, hence procps
+RDEPENDS_${PN} += "procps"
+
 do_configure() {
     oe_runconf
 }
-- 
2.8.0


