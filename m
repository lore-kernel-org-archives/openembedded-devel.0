Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TRAzm-00057u-Kb
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 02:08:22 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so558262wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 16:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6FkeEcSBpzdBFXF7heNW+8114+Q7vsxNlIzcM4iTseY=;
	b=LYZWsTIiNj0+cAkUTo6C51rGvXZshDoy4nZg8DdwQBxRzZTXkVoL7va07kLi6OqISN
	4U/4OWRhZgBe2c87B8kGXFNhgqg7Y7TKkBAWQBJAZIPZMKW3NzH+4h/nFwZaReF+ZG37
	825nMUpF6acedf72tP/9LTjBuYPFa2GB/ZicTdSbZLl+cLBwjkULBFt51xKUmDNisYUI
	v2pmBshNQU3Dibn03WCPdaQ78anbsp4gket06rU8YxHWmyXcUBpWhruNVpq7MCEtP5RB
	BcZw/B9dGJqsEv1KI4piL/didBU0U/7GBxZon25BQ4UmhMc+aILdExTbc3jJSmfGK+mY
	EOsg==
Received: by 10.180.85.99 with SMTP id g3mr9406950wiz.5.1351122896583;
	Wed, 24 Oct 2012 16:54:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm6983361wiz.3.2012.10.24.16.54.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 16:54:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2012 01:54:27 +0200
Message-Id: <e723863e23a0aea6e2aff6f9910c42a05719649c.1351122431.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1351122431.git.Martin.Jansa@gmail.com>
References: <cover.1351122431.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1351122431.git.Martin.Jansa@gmail.com>
References: <cover.1351122431.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 6/8] loudmouth: depend on libcheck instead of check
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
X-List-Received-Date: Thu, 25 Oct 2012 00:08:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
index 87852ee..8375386 100644
--- a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
+++ b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "http://www.loudmouth-project.org/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c4f38aef94828f6b280e00d1173be689"
 
-DEPENDS = "glib-2.0 check openssl"
+DEPENDS = "glib-2.0 libcheck openssl"
 
 inherit gnomebase
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "file://04-use-pkg-config-for-gnutls.patch \
             file://glib-2.32.patch"
-- 
1.7.12.4



