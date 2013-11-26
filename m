Return-Path: <nickdademo@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 63F426CFDE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 06:57:08 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id ma3so7394199pbc.40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2013 22:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sUIhEi2Pqlcr9Dw8p6fLgFjw2F3SaB8O85lUIg0Q/sI=;
	b=ASqvxAn4ROPMLaxqOzVDDSdyPzE15IbkYLS2nttWkThZEx4XcIWDA8efXpCU7yS6Yl
	MxQsuO3oKXJ4jf1tU80UC5UIqLsiIrmYTnpwyieECpj8fwvAe1zlsXZgiqxEA0mMsQs8
	jhbFhWG0e8Bq1AIuGOmALXo6GLAEgJ6GULyem0V8EXtCOkb40jIVcmX8CIblRDy/I4zn
	l3BmKatOjjEqOxXRxnPVxIoq0It4nPYyBFVG/NFBwQYJVaxSvsN4QGQFG2mn2bbMutnl
	djrtRA1/QhhuynsX9V+wz44tE+Y2kx44JiFvr99hoNWLZ9UrWRiOHQk+JCP7dV+8w0EB
	XH1w==
X-Received: by 10.66.164.136 with SMTP id yq8mr31512058pab.67.1385449027535;
	Mon, 25 Nov 2013 22:57:07 -0800 (PST)
Received: from localhost.localdomain
	(d110-32-96-161.meb801.vic.optusnet.com.au. [110.32.96.161])
	by mx.google.com with ESMTPSA id
	jn12sm36800545pbd.37.2013.11.25.22.57.04 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 25 Nov 2013 22:57:06 -0800 (PST)
From: Nick D'Ademo <nickdademo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Nov 2013 17:55:59 +1100
Message-Id: <1385448959-31351-1-git-send-email-nickdademo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] v4l-utils: use correct udev dir location when multilib is enabled
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
X-List-Received-Date: Tue, 26 Nov 2013 06:57:09 -0000

Explicitly set the path to the udev dir to ${base_libdir} in EXTRA_OECONF. Otherwise, the multilib build will fail as it will look for udev in the default location of /lib/udev/.

Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
---
 .../recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
index 9301676..6737870 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
@@ -20,7 +20,7 @@ SRCREV = "0298efdcd1153b8f719b9164548a3f0546f0cb7c"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF = "--disable-qv4l2 --enable-shared" 
+EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev" 
 
 do_configure() {
     # autotools_do_configure fails with:
-- 
1.7.9.5


