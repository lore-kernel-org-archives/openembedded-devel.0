Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0918B70671
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 13:50:12 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6HDnJNX024169 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:50:08 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9dkhG4HpxIE8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:50:07 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6HDo3KL024197
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:50:05 +0100
Message-ID: <1405604998.26348.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Jul 2014 14:49:58 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] fluidsync: Fix build
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
X-List-Received-Date: Thu, 17 Jul 2014 13:50:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Resolve build failure with out of date libtool macros by removing them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
index 965b927..b0bc824 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
@@ -17,3 +17,7 @@ PACKAGECONFIG[sndfile] = "--enable-libsndfile-support,--disable-libsndfile-suppo
 PACKAGECONFIG[jack] = "--enable-jack-support,--disable-jack-support,jack"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse-support,--disable-pulse-support,pulseaudio"
 PACKAGECONFIG[portaudio] = "--enable-portaudio-support,--disable-portaudio-support,portaudio"
+
+do_configure_prepend () {
+    rm -f ${S}/m4/*
+}



