Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1QvbSH-0004mi-VZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 22:50:46 +0200
Received: by mail-ww0-f43.google.com with SMTP id 32so4439808wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2011 13:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=CCSypkRZuCQALBbTu3YB9+4H8ujcAafeD9rd5tmHfXc=;
	b=DN2pi6tBPYoOJZRbSB+6PtjgqQkVWhOw1fGcoMQ1OFfflVfPx/HfW23LzUJF/E9Oqg
	aeZUGg6UfBlWX9KSWX5YkRLlP/i8OTeEdU60NwvGzQojx3xNM6VUBej1YmKHhk4d0IVQ
	rhghYFyq6Xod0fLJVux/nPiLM2CgcifYC8lvs=
Received: by 10.216.14.234 with SMTP id d84mr943555wed.80.1314045963871;
	Mon, 22 Aug 2011 13:46:03 -0700 (PDT)
Received: from localhost.localdomain (169.pool85-50-86.dynamic.orange.es
	[85.50.86.169])
	by mx.google.com with ESMTPS id j11sm4192267wed.18.2011.08.22.13.46.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Aug 2011 13:46:03 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2011 22:45:06 +0200
Message-Id: <1314045908-21970-2-git-send-email-pespin.shar@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <1314045908-21970-1-git-send-email-pespin.shar@gmail.com>
References: <1314045908-21970-1-git-send-email-pespin.shar@gmail.com>
Subject: [meta-efl][PATCH 2/4] enjoy: Add inherit gettext
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Aug 2011 20:50:46 -0000

* Without this patch bitbake fails to build this recipe, and it says this line should be added to recipe

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta-efl/recipes-efl/e17/enjoy_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb
index d3fea32..90eb318 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
@@ -21,7 +21,7 @@ RDEPENDS += "\
 	lightmediascanner-test \
 	"
 
-inherit e
+inherit e gettext
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
-- 
1.7.6



