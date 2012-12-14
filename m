Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjRZJ-00009L-VJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 10:28:34 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so2050612pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 01:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=yDdDWhYQYF4Dx41S2Hi/B4TBNUWWYB5DsbrA5L+vewA=;
	b=M7o4/Xu5YznQYBmAUU3BbdlQTyxw9NbCWObU8CLZIvAIsZLtBJ3DiIaihuk6dQlezz
	cyuSqEcOXMjycJJek/5FSRfGFr21vJ7jXQX31Of0McEMkFc5mz09HQPQsgfb2imaTEQb
	/luQTHKdD/SlZF/dc6eqj6mNc71qYCNPLBmvfzUHbn370QfSwcP3Cs5dkVDmSWUU9Q5c
	nscCUdV0PaVi3Akm4JUTWcVF6bNfjDz3g79Wu9HfVVejxuwpNxxPyIbhF/zeIPky8K1v
	fJGNsiKPBcsio8xQgMmyaLVniPuM16hrjaV4oofcMQ30I9wqEFLuY4MZpWuNNnfXoXm9
	zuqA==
Received: by 10.68.135.133 with SMTP id ps5mr13654898pbb.132.1355476437357;
	Fri, 14 Dec 2012 01:13:57 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id kl5sm2611585pbc.74.2012.12.14.01.13.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 01:13:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Dec 2012 10:14:04 +0100
Message-Id: <20451cebde875e580265906d0416c5de7b17f6f9.1355476399.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355476399.git.Martin.Jansa@gmail.com>
References: <cover.1355476399.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 12/12] emotion: disable generic-vlc backend
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
X-List-Received-Date: Fri, 14 Dec 2012 09:28:34 -0000

* we don't have vlc in DEPENDS, but when it happens to be built before
  emotion, it causes undeterministic builds and unpackaged files
  emotion-1.7.3: emotion: Files/directories were installed but not
  shipped
    /usr/lib/emotion/utils/em_generic_vlc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/emotion.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/emotion.inc b/meta-efl/recipes-efl/efl/emotion.inc
index 134ef40..a4ef02d 100644
--- a/meta-efl/recipes-efl/efl/emotion.inc
+++ b/meta-efl/recipes-efl/efl/emotion.inc
@@ -4,11 +4,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69f44058245ce5c596d56bb622d5dabd"
 # we no longer build the libxine backend, since the gstreamer backend seems more promising
 DEPENDS = "eet eeze evas ecore edje gstreamer gst-plugins-base eio"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 inherit efl
 
-EXTRA_OECONF = "--disable-xine --enable-gstreamer --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
+EXTRA_OECONF = "--disable-xine --disable-generic-vlc --enable-gstreamer --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
 
 PACKAGES =+ "emotion-backend-gstreamer"
 FILES_emotion-backend-gstreamer = "${libdir}/emotion/*.so"
-- 
1.8.0.2



