Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id D7F8D60097
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 10:56:38 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id r20so990526wiv.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 03:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3rn+vTw3OM4KGGlkoPW7GMdZ2kyCAH1rOSSN8msV1EA=;
	b=x2TsPqqk1OrMNYFhuy8aCDedpzlEbMXqnCt0Y3UDwtpc//6I8xTYN8xnbGzZi5R2Oh
	dv+kQE38CagSHHh6S3sjUVhOZ+Fv4QRdjV6jruLNwzzCfnhvI7TTy8DdB066U56SfA0k
	sZjA9WL9Ga6OGPfVxA5SouAKqCY/h6LmTvDX63Gl8BknclZ9KIfw+LtIeSNWDi50TAoF
	1kygkGNBL4CT6FmnQnkQgEe6DswKj66ZNo5Xnj1mfTI1AlHwRCIxCt3+0DyhNXN3IKvQ
	E1ZLxW+uNXJATRpCbhfvGXEtmcB0f4DrXH2f+KL58AG2D+A4cyWXzzdynIokfcr1lvoP
	ATfA==
X-Received: by 10.181.27.229 with SMTP id jj5mr4823246wid.64.1413975398405;
	Wed, 22 Oct 2014 03:56:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ko10sm18439622wjb.48.2014.10.22.03.56.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Oct 2014 03:56:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Oct 2014 12:56:37 +0200
Message-Id: <1413975398-1610-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [meta-efl][PATCH 1/2] terminology: upgrade from 0.5.1 to 0.7.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Oct 2014 10:56:39 -0000

* announcements:
  https://phab.enlightenment.org/phame/live/3/post/terminology_0_6_codename_space_shuttle_just_took_off/
  https://phab.enlightenment.org/phame/live/3/post/terminology_0_6_1/
  https://phab.enlightenment.org/phame/live/3/post/terminology_0_7/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/terminology_0.5.1.bb | 8 --------
 meta-efl/recipes-efl/e17/terminology_0.7.0.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/terminology_0.5.1.bb
 create mode 100644 meta-efl/recipes-efl/e17/terminology_0.7.0.bb

diff --git a/meta-efl/recipes-efl/e17/terminology_0.5.1.bb b/meta-efl/recipes-efl/e17/terminology_0.5.1.bb
deleted file mode 100644
index 642b658..0000000
--- a/meta-efl/recipes-efl/e17/terminology_0.5.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "d46cda519cf198cb19970146d31a9e8b"
-SRC_URI[sha256sum] = "ceef9e5a73f1dfdb412d074df1ead684fd31f630414c65eac8cd89fea13315ad"
diff --git a/meta-efl/recipes-efl/e17/terminology_0.7.0.bb b/meta-efl/recipes-efl/e17/terminology_0.7.0.bb
new file mode 100644
index 0000000..0744b09
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/terminology_0.7.0.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "e68d889f343886e11a8e4f4337486452"
+SRC_URI[sha256sum] = "453f49911b090fffc1e5fe695022bd1c51325dde83b8cd3cca22899c604344f4"
-- 
2.1.1


