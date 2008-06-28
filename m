Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1KCcOa-0000Qd-Ly
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Jun 2008 17:31:28 +0200
Received: from gw.mwester.net ([209.242.5.110] helo=[192.168.1.111])
	by mx01.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1KCcM3-0005y3-SV
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Jun 2008 10:28:47 -0500
Message-ID: <486658B8.2070403@dls.net>
Date: Sat, 28 Jun 2008 10:28:56 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.14) Gecko/20080421 Thunderbird/2.0.0.14 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: python-pygobject fails to build from scratch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 28 Jun 2008 15:31:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The patch below causes build failures for me :(

Specifically, with an empty tmp directory (and parallel make specified,
but I don't think that makes a difference in this case),
gobject-generate-constants is not yet built and staged.  In fact, it is
both created and used by this makefile, so there's no way that this
recipe should use the one in staging (in fact, if it's working for folks
today, it's because their builds are finding (an older) one left around
in staging).

Since I don't know what problem this patch and the others in the
associated commit were solving, I can't provide a fix, other than to
note that backing out just this patch makes it Work For Me(tm).

Thanks,
Mike (mwester)




--- packages/python/python-pygobject/generate-constants.patch
1726f18a8e65fb7fe7a860bd1bd79e09c0dd2de1
+++ packages/python/python-pygobject/generate-constants.patch
1726f18a8e65fb7fe7a860bd1bd79e09c0dd2de1
@@ -0,0 +1,18 @@
+Index: pygobject-2.14.2/gobject/Makefile.am
+===================================================================
+--- pygobject-2.14.2.orig/gobject/Makefile.am
++++ pygobject-2.14.2/gobject/Makefile.am
+@@ -21,11 +21,11 @@ if PLATFORM_WIN32
+ common_ldflags += -no-undefined
+ endif
+
+-constants.py: generate-constants$(EXEEXT) constants.py.in
++constants.py: constants.py.in
+ 	rm -f constants.py
+ 	cp $(srcdir)/constants.py.in constants.py
+ 	chmod 644 constants.py
+-	$(top_builddir)/gobject/generate-constants$(EXEEXT) >> constants.py
++	gobject-generate-constants$(EXEEXT) >> constants.py
+ 	chmod 444 constants.py
+
+ generate_constants_CFLAGS = $(GLIB_CFLAGS)


