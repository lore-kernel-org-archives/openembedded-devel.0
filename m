Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 741EB77DDD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 15:18:42 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id p52so21400432wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 08:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DyKBle2mCCpufyAD/i5FOv97tpdGSyhp1kqCPyzAesM=;
	b=Pwf7YuYumGLRYxvMqs0ur9o2XzgumrxRwivrJHNEK+cygC/DEuFladW7LJqQ7mLPdX
	RMWdGj3c8YAbL4rl9RExiEyfWraGu5GjTTy8Gr0ydDxosPXafcKHFO1J2Q1Ow6ZcbzoQ
	Q1Hg50gpLWww1UiB1OFRTDd7R+uYAVV74v3A7A3dthziQUxWWadjW/7SYubOVGb6dbZf
	QDicn0BCbLOm/NUl0qUC3RMnS7aODPJlrfAW/pLhIyAVN3uNK0CyD2q5tdBmtrTO5a50
	0QFVeoerG2IJBFCGMMCKW2XIeqwWEEVDslx2f5huWeSdbc9Gf+m9PwvnYE9kqqdmIDn3
	+Baw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DyKBle2mCCpufyAD/i5FOv97tpdGSyhp1kqCPyzAesM=;
	b=XlxRILjYmGgtSUsWTzESSohf9cJY4XrRwiEe7gwyAJpCcqMOxM75C0Qi//46ARN1sG
	W0G79vuR3Yp7tevrHStmZ+zNpnpy/KA5KvaHMSo1nWnebwzctqmfVD0msXvhaBmNN/yH
	ky7mZ2YmxPBLAIR16mP/ezPA/CrLj2o+e9EymFbonJxZcXAxr8mjcwn+mnHQi34a7UcK
	lsgdJtLHSUV+/s/PQjZsUtgBWHKL8GT/P75mLJVPG2NNwEeK7eHTGTemnvnqYoiyPAxw
	KQ4+xPyki+nXlBGKCC4chqYm6x12vduVV8gS/TmUvTqKDPp8WYKbgX6/1sPBBSdu+Zju
	9ojQ==
X-Gm-Message-State: AFeK/H2aRAkQfDjXLfR4j+8+LoK4ACJEGs9UJZMrTAPJZ+/KQQqcX4xtBjXWySn3E9l35g==
X-Received: by 10.223.176.204 with SMTP id j12mr3702225wra.10.1490973523679;
	Fri, 31 Mar 2017 08:18:43 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	s27sm2309081wra.69.2017.03.31.08.18.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 08:18:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 17:18:27 +0200
Message-Id: <20170331151828.25907-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170331151828.25907-1-Martin.Jansa@gmail.com>
References: <adec7310-ce23-cef8-0c06-ea4b5bf9036c@gmail.com>
	<20170331151828.25907-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][morty][PATCHv2 6/7] mailcap: use pagure.org instead of retired fedorahosted.org
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
X-List-Received-Date: Fri, 31 Mar 2017 15:18:42 -0000

* https://fedoraproject.org/wiki/Infrastructure/Fedorahosted-retirement
* cherry picked from master:
  commit 23361dfa39c2356b57e8b25baf08bde62454fcb4
  Author: Martin Jansa <Martin.Jansa@gmail.com>
  Date:   Wed Mar 29 10:14:33 2017 +0200

    mailcap: use pagure.org instead of retired fedorahosted.org

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb
index 7d87a5f1d..58b8f029e 100644
--- a/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb
+++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb
@@ -12,12 +12,14 @@ by several applications e.g. to determine MIME types for filenames."
 
 SECTION = "System Environment/Base"
 
-SRC_URI = "https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BPN}-r2-1-46.tar.gz"
-SRC_URI[md5sum] = "eee03824bf86480dc1db20be4f78237f"
-SRC_URI[sha256sum] = "309059163fa3ef368f8a43fc38f7a45d9345fd725970d5b437ba175a0ee7ebc9"
 LICENSE = "PD & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=100fcfb84512ccc03ffc7d89ac391305"
-S = "${WORKDIR}/${BPN}-r2-1-46"
+
+SRC_URI = "https://releases.pagure.org/${BPN}/${BP}.tar.xz"
+
+SRC_URI[md5sum] = "d865a1baf574ae5d309f5c1f79315800"
+SRC_URI[sha256sum] = "c68eb3b531d731476d5980c9b7cc287bd64c2a13bec5a537009a2c4af63f9bb0"
+
 do_install() {
     oe_runmake install DESTDIR=${D} sysconfdir=${sysconfdir} mandir=${mandir}
 }
-- 
2.12.2


