Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id ECADF6FFED
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 05:53:04 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b184so6661288wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 22:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+hdB9w6IkohgYXHKmrov0sRgET0rWJdPVbtW7ZMf2Q8=;
	b=aZKplQJ0nYEZUfbdUaNAUZynE4TixiDS9pm+d7gp4cD93mH+8ABYkGJLVUQQ30rBBk
	zj7dSgx6+Esz7DzqkFoftbPIu50aaFLYMCSAnUho71YjZxRa1InA+aT1Ta9mIJPGHfYf
	BPuZSjWvs7ncIEMkEiGkewrdFh62nNCwhZ6e+Fy1HvuquuK6X7aV75NWni/jwgOGXTnR
	3CI2nek6xnwDwhB5mOpDzsg5nusBGWNyvO87zPbBc5XefjwT0CDopkp0MgOX4CJJdsM1
	Hwf34JPrm92P7MEs04Zf+6dbS9gl/fy64XNu03jPkVhtedWpgYw5V/YlGnFGbDn+ReMP
	8H5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+hdB9w6IkohgYXHKmrov0sRgET0rWJdPVbtW7ZMf2Q8=;
	b=TktGBxrjJP4Mx2MXgprZB9KPL3eF8RI3pg0xeo6NcgJzkNthAywhvL10lE+2a3FTQ3
	36ofaayGLjAuigi7lUrUEMrty2TgzNUPzzUOW8Am0n7edaorldR1j9M9kVd4iChxLTyK
	3eR4t451ygA8uMuckHnnvSSGv8U+x/A2tDecEmwiumI+HFKdsy+E9FL/+6IARjMQ7WR8
	Nvyw1KqkPu3K7VNNERdKEqznZjEMW23HQWVjvefsNifQGtKo+aAdLea+mDy9p72dXKhw
	jQASQzn9cVWqqJb1q/bBgmQ5WvdPV6tCeFAM5dEtJOl/P5qjRJHO5njymyPCkh64h1ug
	zxmg==
X-Gm-Message-State: AE9vXwP8pEqH6aGmeK0QtfVraIP0XAMSxY34xmb0FrOmd8ylEI/PEQdVtgh3R3lEim3++Q==
X-Received: by 10.28.134.8 with SMTP id i8mr1288355wmd.59.1474437185123;
	Tue, 20 Sep 2016 22:53:05 -0700 (PDT)
Received: from localhost.localdomain (p4FDF06F5.dip0.t-ipconnect.de.
	[79.223.6.245]) by smtp.googlemail.com with ESMTPSA id
	b128sm30776307wmb.21.2016.09.20.22.53.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Sep 2016 22:53:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2016 07:52:53 +0200
Message-Id: <1474437173-26079-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474437173-26079-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474437173-26079-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] fftw: fix native build
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
X-List-Received-Date: Wed, 21 Sep 2016 05:53:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/fftw/fftw_3.3.4.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
index a453214..0faaea1 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
@@ -14,6 +14,9 @@ PROVIDES = "fftwl fftwf"
 
 EXTRA_OECONF = "--disable-fortran --enable-shared --enable-threads"
 
+FFTW_NEON = "${@bb.utils.contains('TUNE_FEATURES', 'neon', '--enable-neon', '', d)}"
+FFTW_NEON_class-native = ""
+
 do_configure() {
     # configure fftw
     rm -rf ${WORKDIR}/build-fftw
@@ -36,7 +39,7 @@ do_configure() {
 	mkdir -p ${B}
     cd ${B}
     # configure only
-    oe_runconf --enable-single ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--enable-neon', '', d)}
+    oe_runconf --enable-single ${FFTW_NEON}
     mv ${B} ${WORKDIR}/build-fftwf
 }
 
-- 
2.5.5


