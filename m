Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOKY-0006rL-UG
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 15:01:55 +0200
Received: by wibhm17 with SMTP id hm17so5195003wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 05:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=KBFXRkLfKjufuaaUDxTup+A1YrS5e1PM0hjKafICx8c=;
	b=yK7PdlxPk+u61Mbx/erCLA2/A/YSg22h65luVLbKS5ani2oB1YblgXm6gmtBsEiQ8W
	7AkPW8a0GhN2qR9BKQBQMXj2l9YfN5caeZLyvpR+tcLaa6zUgotZ+WAyKWNdTGxsZ5Ez
	R1B4+1HZRHOCjSm7XUwU+/9LrJUdIqn4SvFjXsqnASQ3R5PEb/8aGYh2OuCnHbrbyX/x
	3YZyvad/fgdnZwx7QFXRH49TXlkfcc5X/k3TT1a8rrOiod3kmHnBzZs19CHeeYJjwazO
	hd1h4sCvOelCUeapcATDbSczO/tYgthWFm27F689WNM3k+87eAM7fONgTiI4yK3/aIj9
	scKQ==
Received: by 10.180.78.9 with SMTP id x9mr16247113wiw.18.1335444738189;
	Thu, 26 Apr 2012 05:52:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b3sm44580285wib.4.2012.04.26.05.52.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 05:52:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 14:50:20 +0200
Message-Id: <2bddcd183b9edce8334bcc6cd779373bc8e00c7f.1335444528.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
Subject: [[meta-oe][meta-efl] 15/15] pango: native support and --disable-introspection moved to oe-core pango.inc
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
X-List-Received-Date: Thu, 26 Apr 2012 13:01:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/pango/pango_1.29.4.bb |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-graphics/pango/pango_1.29.4.bb b/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
index b14430f..ea79a63 100644
--- a/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
+++ b/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
@@ -1,8 +1,5 @@
 require recipes-graphics/pango/pango.inc
 
-BBCLASSEXTEND = "native"
-DEPENDS_virtclass-native = "glib-2.0-native cairo-native"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 SRC_URI[archive.md5sum] = "a5ee785f4f31d6bdd8625a09ea3f8b4b"
@@ -11,5 +8,3 @@ SRC_URI[archive.sha256sum] = "f15deecaecf1e9dcb7db0e4947d12b5bcff112586434f8d30a
 SRC_URI += "file://no-tests.patch"
 
 PR = "r4"
-
-EXTRA_OECONF += "--disable-introspection"
-- 
1.7.8.5



