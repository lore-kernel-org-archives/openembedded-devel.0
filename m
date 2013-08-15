Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 911206B7F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:18 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so180704ead.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=hSXlYZYFbrcvbFBndz8sZsbRyytLUW7ewaYhq41NFyA=;
	b=ks2tINxc3ZF38cX/pZ+Q3GG2IdqJKG2dZ33QvVfIL31XVaGqNr0BnR9t5HaCsqmE2L
	p5q7VJDBwHeGCBFDyEo6lP973rt8apmsCvJc/Ow17HhpBaSbJ7hITULU0P1+oNqcY6Xc
	S7rt+MEMyBsIciBrHBO4AJ4ss4diG5DreJ1erqy+XV2cTiMAMfgWuDw1lLQ6JpcUJROH
	A7wRFveA7/KRaAJ20Zswq6nWXmhhdMtrjAQ892JDCSzlQdGXvkR/HyBdKn29QW4+N+tl
	HjqTTxd86jhpP2Pv46uIFFNSgGOol5l+dXFol+H7Ho5ce29J3wIdl6Q5ALTZUF96WIT0
	0arg==
X-Received: by 10.14.22.71 with SMTP id s47mr105612ees.95.1376551158942;
	Thu, 15 Aug 2013 00:19:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bq1sm81933540eeb.9.2013.08.15.00.19.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:59 +0200
Message-Id: <358df22dd010d12db312afabf21b04db395f17bd.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 19/60] portaudio: inherit pkgconfig
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:18 -0000

* without pkgconfig it's failing to expand PKG_CHECK_MODULES macro:
  | portaudio-v19/v19+svnr1387-r0/trunk/configure:
    line 11721: syntax error near unexpected token `JACK,'
  | portaudio-v19/v19+svnr1387-r0/trunk/configure:
    line 11721: `PKG_CHECK_MODULES(JACK, jack, have_jack=yes, have_jack=no)'
  | Configure failed. The contents of all config.log files follows to aid debugging

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
index a2b25cc..454bd34 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
@@ -4,13 +4,12 @@ LICENSE = "PortAudio"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02df"
 
 PV = "v19+svnr${SRCPV}"
-PR = "r0"
 
 SRCREV = "1387"
 SRC_URI = "svn://subversion.assembla.com/svn/portaudio/portaudio;module=trunk;protocol=http"
 S = "${WORKDIR}/trunk"
 
-inherit autotools
+inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "alsa jack"
 PACKAGECONFIG[alsa] = "--with-alsa, --without-alsa, alsa-lib,"
-- 
1.8.3.2


