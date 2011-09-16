Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Scr-0000Wp-I7
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 09:14:17 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so1430885fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 00:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=B22115No4Mgh1J4UtDGnzy78xx3/7CdWaGzYCMdKfaI=;
	b=ZiGBHfh7jPF8SM/du6uuMEGZprxS2D5M6sfgnsuVRo3ASNqywS7UQMRoufFnEEE051
	smpjva7DY9QLY0HnUB5fBQQQfY7hcJhjpImUrRiJ1BgaW0Stvs5v6DqdomG6Gfkse9Xq
	EU9QE/UruMhwAkJbRtkgTxLtk++LjXTAK8MlQ=
Received: by 10.223.88.83 with SMTP id z19mr1059150fal.11.1316156947489;
	Fri, 16 Sep 2011 00:09:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n12sm6040825fan.9.2011.09.16.00.09.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 00:09:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 09:08:47 +0200
Message-Id: <69b2aa946ad6eec475f28dad4cc02d399a4aad5f.1316156746.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <11e808e3b3307d12b7c6c8f02a9bd4d7a0a14da6.1316156746.git.Martin.Jansa@gmail.com>
References: <11e808e3b3307d12b7c6c8f02a9bd4d7a0a14da6.1316156746.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1316156746.git.Martin.Jansa@gmail.com>
References: <cover.1316156746.git.Martin.Jansa@gmail.com>
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
X-List-Received-Date: Fri, 16 Sep 2011 07:14:17 -0000

From: pespin <pespin.shar@gmail.com>

* Without this patch bitbake fails to build this recipe, and it says this line should be added to recipe

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
1.7.6.1



