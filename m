Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 41A386FFE2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:34:37 +0000 (UTC)
Received: by padhk6 with SMTP id hk6so65306849pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=dXZ60ag0sLZJpEatsaZOgCCYLP3KqiBKG8yX2qplK/8=;
	b=Z7SGqUUd9RPQXRIri/PGoJlbZ9QT4nPfB9XC6IyMeuyfXkLq4IJEHFoiVZc5ntDp+h
	gmdXlvzSY1cdn8OkSoT589JoG99ad42nViozAXca68IxgJ6jTwJXVKXP7mO6t1MxiQU3
	FosLv6EoFfNZ4x71P3hEDYewYFLPDfncmKkrjOVuL4YmsXa3YgrsuiQqBm9Vt4QN+K/C
	GRbUnEXDZziVyjua2+fYK8/mtR79wNwfbjLnKFGrShGITK5xRH57q5QJgNZkqsF3eeoh
	mp6Jn417oossw4avsJ9fqSs0cChx0t+98wnHFWaulUihkREM8Evtjcyh9cqV7C6EwdDG
	r7sA==
X-Received: by 10.67.6.1 with SMTP id cq1mr46343351pad.78.1450107278338;
	Mon, 14 Dec 2015 07:34:38 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	wo3sm43746479pab.25.2015.12.14.07.34.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 07:34:35 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 4DA80FCC846; Mon, 14 Dec 2015 07:34:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 07:34:01 -0800
Message-Id: <8b031e906c6e2ecde87c8543a795240936e0d69d.1450027640.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
Subject: [PATCH 08/14] ctdb: rdep on bash
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
X-List-Received-Date: Mon, 14 Dec 2015 15:34:37 -0000

From: Christopher Larson <chris_larson@mentor.com>

onnode is a shell script with bashisms and bash #!.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
index 3731efd..5718c5f 100644
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
+++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
@@ -41,3 +41,6 @@ do_install_append() {
 SYSTEMD_SERVICE_${PN} = "ctdb.service"
 
 FILES_${PN} += "/run"
+
+# onnode is a shell script with bashisms and bash #!
+RDEPENDS_${PN} += "bash"
-- 
1.9.1


