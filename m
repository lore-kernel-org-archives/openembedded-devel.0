Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5DEF96057B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 13:15:06 +0000 (UTC)
Received: by wmww144 with SMTP id w144so238048781wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 05:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=rxFwSrJFRF9l2FgocgFmG9sl31lGQuhkaToyuy9XLlM=;
	b=NSoETSS8KQbuBO4I+ti6ksq8bjOkz3kGE17kld8VkkwPzu/2aZj3bA8M76zjbRzR2V
	ScgqIZ08OVe2P70nFPiQ9CtUd+Eju9kNUzO0JVc8X6XPdiEIYjLHsl8a6NHu9tMf2bsb
	0Ocqsc4QAyGaE1bQfNT0lz3uSbKK0cYj42jXA+3m5pULAcOg4nN/UlXlKryy3k8NfxMf
	Py9OkejIeONQRJHIz8Eg7mwvETuRZ6hn+MWf3S7X9pYsJL23zbEAhEG9RpiXjYue4Zl6
	AiY+qAPFxjbGv+jRrX+63Pm9q7KrimSKch5nIUaZin6KlHk5mRB9mo0Xpe0WIQZ9bNvw
	ZTWg==
X-Received: by 10.194.200.134 with SMTP id js6mr9486413wjc.114.1447938907457; 
	Thu, 19 Nov 2015 05:15:07 -0800 (PST)
Received: from localhost.localdomain
	(lns-bzn-47f-81-56-255-191.adsl.proxad.net. [81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	m135sm3169617wmb.0.2015.11.19.05.15.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 05:15:06 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Nov 2015 14:14:54 +0100
Message-Id: <1447938897-26171-3-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1447938897-26171-1-git-send-email-funman@videolan.org>
References: <564DC01B.4000103@videolan.org>
	<1447938897-26171-1-git-send-email-funman@videolan.org>
Subject: [meta-multimedia][PATCH 3/6] VLC: explicit PACKAGECONFIG for fontconfig
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Nov 2015 13:15:07 -0000

Enable it by default
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 0d0baed..f93daf0 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -43,7 +43,7 @@ EXTRA_OECONF = "\
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
 "
 
-PACKAGECONFIG ?= " live555 dc1394 dv1394 notify"
+PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
@@ -71,6 +71,7 @@ PACKAGECONFIG[dv1394] = "--enable-dv1394,--disable-dv1394,libraw1394 libavc1394"
 PACKAGECONFIG[svg] = "--enable-svg,--disable-svg,librsvg"
 PACKAGECONFIG[svgdec] = "--enable-svgdec,--disable-svgdec,librsvg cairo"
 PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+"
+PACKAGECONFIG[fontconfig] = "--enable-fontconfig,--disable-fontconfig, fontconfig"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
-- 
2.5.0


