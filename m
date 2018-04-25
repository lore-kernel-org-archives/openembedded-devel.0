Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8B7E571B57
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:13:37 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id q22so397564pff.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fhHG53oZhAtwrI82qQN4gdJ4ZBOBuV8lzckbE1Zptw8=;
	b=YHgts0uYO3erO6dg7wI9AMvVITYrsB6SFDTHnY36ntFkPObnldhT0Yb9ISg+wT3x1c
	PjEcER2vfIxarY0QxkfFOftEIljTKjREwtAJXW1xV61feouMlcoOdTNKnfyaRiIPqDXw
	MfyUiTc1HBd8GknLyo6dz4ICrRS1bySJjmIo2/vF/GIl1hS692NY8dmxFJeecizRgY8S
	S4/e8hGgFEP6W2xpsNjMOCezEXqIcqzNYb/Krv1rnanBSM6QzEpx3agFDUgyPeVGd75i
	ljxH2YcMbdLMc/vM05Z1ItwdH5gzoJhtzdgGPt1nT2mGto8Z6ZMbR/xFuTOAoU7o5Iy+
	NisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fhHG53oZhAtwrI82qQN4gdJ4ZBOBuV8lzckbE1Zptw8=;
	b=kWCR9DB1kFAnPgX7UZkavDlPGEsrXqrgQJHyOBi7RwzbVFati7tmp5CrRKpeAK9a7x
	vLRLBFWW5lTWIyknd7HuRuH4Iijkr4BRjqjBBMnuP0mfm/scfgXokjpCVFBt+0jzubas
	iCB5N470jAhZOQRB9pMKcU1Hr7MbHkr5U2ezLPZBpw3MfKm1mYjBdZTiOAwqMtckN0it
	GrG//RCmf7WAcR/b9X8l6ZIqI4Ru0Hem/8WPwho9Bzr7bfLwGxCqfSKkLC+8PMA69A3X
	9RDV9uxtNIOZugkT2SMqfkZPp+Xr7UODyRxDzR1zBCHfxc6H0AJVQGQ82AVT6qsaE2so
	zQ5g==
X-Gm-Message-State: ALQs6tDPqUMoJWC4ZvGAYvwdgRyOruc8c1P6RRqOyyvvR2ZGCpoiXEEw
	e56h5fSu3IEMzkt2cb2M7s4=
X-Google-Smtp-Source: AIpwx4+NFkQzx9MP/Jogtc8azzdCi6dEuWniP3NCy0QHTOgwYZ/woDKmD+Ie61A9r09tbAmafBZnUw==
X-Received: by 10.98.138.68 with SMTP id y65mr27907418pfd.110.1524665618665;
	Wed, 25 Apr 2018 07:13:38 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:952a:dcb5:7c5a:56df])
	by smtp.gmail.com with ESMTPSA id
	e4sm35563566pfa.128.2018.04.25.07.13.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Apr 2018 07:13:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 25 Apr 2018 07:13:29 -0700
Message-Id: <1524665609-7709-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524665609-7709-1-git-send-email-akuster808@gmail.com>
References: <1524665609-7709-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 6/6] gst-rtsp: refresh patch
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
X-List-Received-Date: Wed, 25 Apr 2018 14:13:37 -0000

Applying patch 0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch
patching file bindings/python/Makefile.am
Hunk #1 succeeded at 14 with fuzz 1.
patching file examples/Makefile.am
patching file tests/Makefile.am

Now at patch 0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch | 34 ++++++++++++----------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp/0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp/0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch
index 3afca4e..69b21dd 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp/0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp/0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch
@@ -1,34 +1,38 @@
 index gst-rtsp_0.10.8/bindings/python/Makefile.am
---- gst-rtsp_0.10.8.orig/bindings/python/Makefile.am
-+++ gst-rtsp_0.10.8/bindings/python/Makefile.am
+Index: gst-rtsp-0.10.8/bindings/python/Makefile.am
+===================================================================
+--- gst-rtsp-0.10.8.orig/bindings/python/Makefile.am
++++ gst-rtsp-0.10.8/bindings/python/Makefile.am
 @@ -14,7 +14,7 @@ defs_DATA = $(DEFS)
  defsdir = $(pkgdatadir)/$(GST_MAJORMINOR)/defs
  OVERRIDES = rtspserver.override
-
+ 
 -INCLUDES = -I$(top_srcdir) -I$(srcdir) $(PYTHON_INCLUDES)
 +AM_CPPFLAGS = -I$(top_srcdir) -I$(srcdir) $(PYTHON_INCLUDES)
-
+ 
  rtspserver_la_CFLAGS = -I$(top_srcdir)/src \
-         $(PYGOBJECT_CFLAGS) $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
-index gst-rtsp_0.10.8/examples/Makefile.am
---- gst-rtsp_0.10.8.orig/examples/Makefile.am
-+++ gst-rtsp_0.10.8/examples/Makefile.am
+ 		$(PYGOBJECT_CFLAGS) $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
+Index: gst-rtsp-0.10.8/examples/Makefile.am
+===================================================================
+--- gst-rtsp-0.10.8.orig/examples/Makefile.am
++++ gst-rtsp-0.10.8/examples/Makefile.am
 @@ -1,6 +1,6 @@
  noinst_PROGRAMS = test-video test-ogg test-mp4 test-readme test-launch test-sdp test-uri test-auth
-
+ 
 -INCLUDES = -I$(top_srcdir) -I$(srcdir)
 +AM_CPPFLAGS = -I$(top_srcdir) -I$(srcdir)
-
+ 
  AM_CFLAGS = $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
  AM_LDFLAGS = \
-index gst-rtsp_0.10.8/tests/Makefile.am
---- gst-rtsp_0.10.8.orig/tests/Makefile.am
-+++ gst-rtsp_0.10.8/tests/Makefile.am
+Index: gst-rtsp-0.10.8/tests/Makefile.am
+===================================================================
+--- gst-rtsp-0.10.8.orig/tests/Makefile.am
++++ gst-rtsp-0.10.8/tests/Makefile.am
 @@ -1,6 +1,6 @@
  noinst_PROGRAMS = test-cleanup
-
+ 
 -INCLUDES = -I$(top_srcdir) -I$(srcdir)
 +AM_CPPFLAGS = -I$(top_srcdir) -I$(srcdir)
-
+ 
  AM_CFLAGS = $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
  AM_LDFLAGS = \
-- 
2.7.4


