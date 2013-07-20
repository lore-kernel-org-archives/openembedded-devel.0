Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 576316B32B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 15:08:23 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d49so2887639eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=45EYsR+YJaqso446MNfyRtSHXFlbVJVHprWhgmiY7cg=;
	b=Rwp6ux5KZgVd/drb2+BgjByfgjvkdT7/TMVH1uHM7uWl88jXxYxv54Eyt9lT+MRSZf
	cH+O3EVi7Dce4EHXw/ddsld3l8qlEmOAX4POtr5OaRf1GvZB3Z0JixmLAqNZl/qb4SwU
	BpJXgJLX/yRF74jyOpwqR1PHS5cpEl0ODAyBpb2HddMPMlHl0DR9X1cnl1rYRT5ELPuw
	NDualCQxbgi6yki7MoSBmdYmUhv5CMrDotfNO2F4MuwmMrjTV/pYnaT6/1unJSUQbuun
	dvoX6AlgSF9wODqbR1kDKgtk9N8O428k6s/56gvoSAwWYtFWW5v8M65L7j0XVdWkdopo
	To3A==
X-Received: by 10.15.110.10 with SMTP id cg10mr20702227eeb.57.1374332903627;
	Sat, 20 Jul 2013 08:08:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m1sm35846255eex.17.2013.07.20.08.08.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 08:08:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jul 2013 17:08:29 +0200
Message-Id: <585cd80db41fee94844f54c3908559235397a694.1374332866.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <e15f15a2dcc1291e2cfb749c92f1a5918ae0920a.1374332866.git.Martin.Jansa@gmail.com>
References: <e15f15a2dcc1291e2cfb749c92f1a5918ae0920a.1374332866.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374332866.git.Martin.Jansa@gmail.com>
References: <cover.1374332866.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/11] jack: add dependency on libsaplerate0 and readline
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
X-List-Received-Date: Sat, 20 Jul 2013 15:08:23 -0000

* they are autodetected from sysroot and configure doesn't have option
  to explicitly disable them, so PACKAGECONFIG won't work without improving
  configure

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/jack/jack_0.121.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb b/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
index e3d5e7e..b255cef 100644
--- a/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
@@ -10,8 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c030468238b2cf89925a57f2780396a7 \
                     file://COPYING.LGPL;md5=e77fe93202736b47c07035910f47974a \
 "
 
-
-DEPENDS = "alsa-lib"
+DEPENDS = "alsa-lib libsamplerate0 readline"
 
 SVNPV = "${@'${PV}'.replace('.', '_')}"
 SRCREV = "4484"
-- 
1.8.3.2


