Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R0qS6-0000AJ-JG
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 09:52:14 +0200
Received: by mail-ew0-f47.google.com with SMTP id 5so2463833ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2011 00:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZlkA60vgviToa0QoO5puyR7/UC4sGFhY2ldiGc524Zo=;
	b=Qr4rsDV30rRSUn225BvlvCcf45uBzNjwEPqnAw/4J6jN3annvewVF9Bl7AnSDaDObq
	qCTw5xAkUj5fRFQus1Ge3EzXXLt84AHK62kdKeKpjWO2TcFt5pHeUarXbCHlBi0K5yKv
	/GAetB0kEQ0IL6tpYhshk7grEa0vab5PoH+7o=
Received: by 10.14.3.195 with SMTP id 43mr1569187eeh.28.1315295235957;
	Tue, 06 Sep 2011 00:47:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b3sm13147424eec.7.2011.09.06.00.47.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Sep 2011 00:47:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Sep 2011 09:46:41 +0200
Message-Id: <79f9b3bba4d5fbc588cd98a9241a1c3a0a40e558.1315295094.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d8844ea29a966dcba6a0bf1c0c9827ba24b00861.1315295093.git.Martin.Jansa@gmail.com>
References: <d8844ea29a966dcba6a0bf1c0c9827ba24b00861.1315295093.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1315295093.git.Martin.Jansa@gmail.com>
References: <cover.1315295093.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 4/6] e-wm: ignore autopoint errors
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
X-List-Received-Date: Tue, 06 Sep 2011 07:52:14 -0000

| autopoint: File config.rpath has been locally modified.
| autopoint: warning: File mkinstalldirs has been locally modified.
| autopoint: *** Some files have been locally modified. Not overwriting
  them because --force has not been specified. For your convenience, you
  find the local modifications in the file '/tmp/gtAHz0tp/autopoint.diff'.
| autopoint: *** Stop.
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 38257b5..cb7f445 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -25,7 +25,7 @@ EXTRA_OECONF = "\
 "
 
 do_configure_prepend() {
-	autopoint
+	autopoint || true
 }
 
 do_install_append() {
-- 
1.7.6.1



