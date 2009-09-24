Received: from [91.121.30.210] (helo=27.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Mqtai-0004Ud-NO
	for openembedded-devel@openembedded.org; Thu, 24 Sep 2009 21:03:01 +0200
Received: (qmail 21687 invoked by uid 503); 24 Sep 2009 21:17:43 -0000
Received: from b9.ovh.net (HELO mail620.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 24 Sep 2009 21:17:43 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 24 Sep 2009 19:02:14 -0000
Received: from tal33-2-82-228-175-43.fbx.proxad.net (HELO ?192.168.1.13?)
	(ebenard%eukrea.com@82.228.175.43)
	by ns0.ovh.net with SMTP; 24 Sep 2009 19:02:12 -0000
Message-ID: <4ABBC232.7010901@eukrea.com>
Date: Thu, 24 Sep 2009 21:02:10 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AA3ABA8.304@eukrea.com>	<200909061703.48206.holger+oe@freyther.de>
	<4AA3EE5E.70409@eukrea.com> <4AA43612.8070808@4d-electronics.co.nz>
In-Reply-To: <4AA43612.8070808@4d-electronics.co.nz>
X-Ovh-Tracer-Id: 13993809943490243913
X-Ovh-Remote: 82.228.175.43 (tal33-2-82-228-175-43.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.30.210
X-SA-Exim-Mail-From: eric@eukrea.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] qt4-embedded & tslib
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
X-List-Received-Date: Thu, 24 Sep 2009 19:03:01 -0000
Content-Type: multipart/mixed; boundary="------------040704070404080105040102"

--------------040704070404080105040102
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Matthew Dombroski wrote :
> Actually, the problem is that tslib is linked incorrectly.
> The pthres, linear, etc. modules are not linked to libts so theyre 
> missing symbols when an attempt is made to load them.
> To confirm, do
> 
> LD_PRELOAD=/usr/lib/libts-1.0.so.0 <args>
> 
> tslib modules will resolve symbols properly so tslib will work.
> 
> A quick patch to tslib to link those modules against libts is below.
> A little dirty linking against the static libs, but it works!
> 
in fact, the patch you sent on the list was integrated into tslib in 
november 2008 :
http://svn.berlios.de/viewcvs/tslib/trunk/tslib/plugins/Makefile.am?r1=51&r2=56

Please find attached a patch to add this patch to the tslib's recipe.

Best regards
Eric

--------------040704070404080105040102
Content-Type: text/x-patch;
 name="tslib.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="tslib.patch"

diff --git a/recipes/tslib/tslib/tslib-pluginsld.patch b/recipes/tslib/tslib/tslib-pluginsld.patch
new file mode 100644
index 0000000..37ef808
--- /dev/null
+++ b/recipes/tslib/tslib/tslib-pluginsld.patch
@@ -0,0 +1,36 @@
+ plugins/Makefile.am |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/plugins/Makefile.am b/plugins/Makefile.am
+index 3b902c2..4c4ef8b 100644
+--- a/plugins/Makefile.am
++++ b/plugins/Makefile.am
+@@ -114,15 +114,19 @@ pluginexec_LTLIBRARIES = \
+   
+ variance_la_SOURCES	= variance.c
+ variance_la_LDFLAGS	= -module $(LTVSN)
++variance_la_LIBADD	= $(top_builddir)/src/libts.la
+   
+ dejitter_la_SOURCES	= dejitter.c
+ dejitter_la_LDFLAGS	= -module $(LTVSN)
++dejitter_la_LIBADD	= $(top_builddir)/src/libts.la
+   
+ linear_la_SOURCES	= linear.c
+ linear_la_LDFLAGS	= -module $(LTVSN)
++linear_la_LIBADD	= $(top_builddir)/src/libts.la
+ 
+ pthres_la_SOURCES	= pthres.c
+ pthres_la_LDFLAGS	= -module $(LTVSN)
++pthres_la_LIBADD	= $(top_builddir)/src/libts.la
+ 
+ # hw access
+ corgi_la_SOURCES	= corgi-raw.c
+@@ -148,6 +152,7 @@ tatung_la_LDFLAGS	= -module $(LTVSN)
+ 
+ input_la_SOURCES	= input-raw.c
+ input_la_LDFLAGS	= -module $(LTVSN)
++input_la_LIBADD	  = $(top_builddir)/src/libts.la
+ 
+ linear_h2200_la_SOURCES	= linear-h2200.c
+ linear_h2200_la_LDFLAGS	= -module $(LTVSN)
+
diff --git a/recipes/tslib/tslib_1.0.bb b/recipes/tslib/tslib_1.0.bb
index 1929ee0..bbd4793 100644
--- a/recipes/tslib/tslib_1.0.bb
+++ b/recipes/tslib/tslib_1.0.bb
@@ -1,6 +1,7 @@
 SRC_URI = "http://download.berlios.de/tslib/${BP}.tar.bz2 \
            file://fix_version.patch;patch=1 \
-           file://tslib-nopressure.patch;patch=1"
-PR = "${INC_PR}.2"
+           file://tslib-nopressure.patch;patch=1 \
+	   file://tslib-pluginsld.patch;patch=1"
+PR = "${INC_PR}.3"
 
 include tslib.inc

--------------040704070404080105040102--
