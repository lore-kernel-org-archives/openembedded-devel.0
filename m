Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi3q-0002l7-0e
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:16:38 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926297eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=nd2jav1ZLKrDYllRhdg0cyISV3IF3dZHBpXOzUE5Meg=;
	b=Gve9eoiBCnzvKgMngaSEo8M2LStAbEa29ZSLwLYWg/6GaK/8ksozjvrZXALBlBktbr
	T5pNgItaaGsV0A4s27LlsphnksQ6nY2UbqexDBsJlFZHVSkQx5UisMfELIXQNmfjlBxB
	G/M1j8q1vFYBRAIoB7vhNTmYc1mdnI440H8I8nawINWCP0YX6L4Sm4nuuPvNto2JeRmG
	FhnWgMaLRUO7ZDoUKeI1j7hnYwhTFxHFq+FdhY5cURqPMhJr6or/qout97OJd5dGMLs5
	gMjVgWFEJMRezBj8ZRcX4y7W5EMAJ6CKGKT25MzVetbenP0be9EYT9lejbeotoWbhOjk
	Z0yQ==
Received: by 10.14.172.195 with SMTP id t43mr43000590eel.17.1354586536373;
	Mon, 03 Dec 2012 18:02:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e1sm34808228eem.3.2012.12.03.18.02.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:02:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:52 +0100
Message-Id: <576fe18103f57c11aa45f4176109457ab963b5e8.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 19/58] diskio: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 04 Dec 2012 02:16:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/diskio_svn.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/diskio_svn.bb b/meta-efl/recipes-efl/e17/diskio_svn.bb
index f748a29..01a6576 100644
--- a/meta-efl/recipes-efl/e17/diskio_svn.bb
+++ b/meta-efl/recipes-efl/e17/diskio_svn.bb
@@ -1,9 +1,8 @@
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
+                    file://COPYING-PLAIN;md5=68be76d8126face2fbbecdf1bcbe2b10"
+
 PV = "0.0.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 
 require e-module.inc
-
-
-
-
-- 
1.8.0



