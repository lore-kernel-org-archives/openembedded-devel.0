Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MBsg5-0000eP-8N
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 17:46:57 +0200
Received: by mail-bw0-f219.google.com with SMTP id 19so72910bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 08:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=hHya8HLoBPv3iTSSzVx8pp2rwrLZRigRzq388lrfb8I=;
	b=QDTzCg/nBJBIx07QxLNzWjNlHSv7VarUbYJj1OsYuOhc4PeAAOH4jmb/55GiEVlak0
	4h0y9FgC6+glBw3ZiLa4Vs7xHwRmaM8moDceF5mj3y7xxhgCvmbCF6+RJBBxT7zSpJVF
	cYk8T5ANhQkyJmtrNnBacZ/bJPtPIimrDawPI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=T5dT3/uhSrBvV0DmkWANsLtcMsHk7QigVM4basp43AOvGuM6GUNDgoSey22k1XEh/c
	tkOUsvxleIwUnhqnGYHZEz8+777wruVrfjBf4ZVvyE1/0apIxJRgtZzUgeo8jU9lnzrS
	lRNhuHMlxWN8T15DDlmFd9HjhuLrtYWn30hP4=
Received: by 10.103.246.1 with SMTP id y1mr704676mur.72.1244043476736;
	Wed, 03 Jun 2009 08:37:56 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 23sm453774mun.46.2009.06.03.08.37.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Jun 2009 08:37:56 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2009 18:37:17 +0300
Message-Id: <1244043442-3868-8-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1244043442-3868-7-git-send-email-ihar.hrachyshka@gmail.com>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-4-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-5-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-6-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-7-git-send-email-ihar.hrachyshka@gmail.com>
Subject: [PATCH 07/12] qt4: fixed regexp pattern for graphics plugins
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
X-List-Received-Date: Wed, 03 Jun 2009 15:46:57 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/qt4/qt4.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
index c17503d..629f5c5 100644
--- a/recipes/qt4/qt4.inc
+++ b/recipes/qt4/qt4.inc
@@ -173,7 +173,7 @@ python populate_packages_prepend() {
         qtopia_split('codecs',        'codec',         '^libq(.*)\.so$')
         qtopia_split('decorations',   'decoration',    '^libqdecoration(.*)\.so$')
         qtopia_split('designer',      'designer',      '^lib(.*)\.so$')
-        qtopia_split('gfxdrivers',    'gfxdriver',     '^libqgfx(.*)\.so$')
+        qtopia_split('gfxdrivers',    'gfxdriver',     '^libq(.*)\.so$')
         qtopia_split('mousedrivers',  'mousedriver',   '^libq(.*)mousedriver\.so$')
         qtopia_split('iconengines',   'iconengine',    '^libq(.*)\.so$')
         qtopia_split('imageformats',  'imageformat',   '^libq(.*)\.so$')
-- 
1.6.3.1



