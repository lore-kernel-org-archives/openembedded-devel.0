Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 6B431726BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jan 2015 13:55:03 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Y7PAV-0003fv-4z for openembedded-devel@lists.openembedded.org;
	Sat, 03 Jan 2015 14:55:03 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Jan 2015 14:55:03 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Jan 2015 14:55:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 03 Jan 2015 14:52:29 +0100
Message-ID: <m88s6t$9dv$2@ger.gmane.org>
References: <1419965292-10709-1-git-send-email-ben.shelton@ni.com>
	<1419965292-10709-3-git-send-email-ben.shelton@ni.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
In-Reply-To: <1419965292-10709-3-git-send-email-ben.shelton@ni.com>
Subject: Re: [meta-oe][PATCH 2/2] iperf3: fix recipe and upgrade to 3.0.10
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
X-List-Received-Date: Sat, 03 Jan 2015 13:55:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ben Shelton schreef op 30-12-14 om 19:48:
> Fix several build issues:
> 
> - We need to pass the 'foreign' option to automake.
> 
> - The Makefiles for the examples only work properly when the build is 
> done in the same directory as the source.  Fix this in Makefile.am and 
> run bootstrap.sh to regenerate Makefile.in.
> 
> - Since this Makefile patch only applies to iperf 3.0.10 and not to newer
> iperf3 versions from git, use DEFAULT_PREFERENCE to mark the 3.0.10
> recipe as the default.
> 
> Additionally, bump the version to the latest release.
> 
> Upstream-Status: Pending [iperf-dev@googlegroups.com]
> 
> Signed-off-by: Ben Shelton <ben.shelton@ni.com> Acked-by: Ken Sharp
> <ken.sharp@ni.com> --- .../iperf3/files/automake-foreign.patch
> | 12 +++ .../iperf3/files/fix-examples.patch                | 98
> ++++++++++++++++++++++ meta-oe/recipes-benchmark/iperf3/iperf3.inc
> |  6 +- .../iperf3/{iperf3_3.0.8.bb => iperf3_3.0.10.bb}   |  2 +- 
> meta-oe/recipes-benchmark/iperf3/iperf3_git.bb     |  3 +- 5 files
> changed, 117 insertions(+), 4 deletions(-) create mode 100644
> meta-oe/recipes-benchmark/iperf3/files/automake-foreign.patch create mode
> 100644 meta-oe/recipes-benchmark/iperf3/files/fix-examples.patch rename
> meta-oe/recipes-benchmark/iperf3/{iperf3_3.0.8.bb => iperf3_3.0.10.bb}
> (69%)
> 
> diff --git
> a/meta-oe/recipes-benchmark/iperf3/files/automake-foreign.patch
> b/meta-oe/recipes-benchmark/iperf3/files/automake-foreign.patch new file
> mode 100644 index 0000000..07d8b49 --- /dev/null +++
> b/meta-oe/recipes-benchmark/iperf3/files/automake-foreign.patch @@ -0,0
> +1,12 @@ +diff -rupN iperf-3.0.10.old/configure.ac
> iperf-3.0.10/configure.ac +--- iperf-3.0.10.old/configure.ac	2014-12-16
> 13:39:58.000000000 -0600 ++++ iperf-3.0.10/configure.ac	2014-12-29
> 15:09:27.534992643 -0600 +@@ -32,7 +32,7 @@ AC_CONFIG_AUX_DIR(config) + +
>  + # Initialize the automake system +-AM_INIT_AUTOMAKE 
> ++AM_INIT_AUTOMAKE([foreign]) + + AM_MAINTAINER_MODE +
> AM_CONFIG_HEADER(src/config.h) diff --git
> a/meta-oe/recipes-benchmark/iperf3/files/fix-examples.patch
> b/meta-oe/recipes-benchmark/iperf3/files/fix-examples.patch new file mode
> 100644 index 0000000..db5a37e --- /dev/null +++
> b/meta-oe/recipes-benchmark/iperf3/files/fix-examples.patch @@ -0,0 +1,98
> @@ +diff -rupN iperf-3.0.10.old/examples/Makefile.am
> iperf-3.0.10/examples/Makefile.am +---
> iperf-3.0.10.old/examples/Makefile.am	2014-12-16 13:39:58.000000000
> -0600 ++++ iperf-3.0.10/examples/Makefile.am	2014-12-29
> 17:12:02.238979626 -0600 +@@ -2,11 +2,13 @@ noinst_PROGRAMS		= mic mis		#
> Build, but + + mic_SOURCES		= mic.c + mic_CFLAGS		= -g +-mic_LDADD		=
> ../src/libiperf.la ++mic_LDADD		= $(top_builddir)/src/libiperf.la +
> mic_LDFLAGS		= -g ++mic_CPPFLAGS		= -I$(top_srcdir)/src + + mis_SOURCES
> = mis.c + mis_CFLAGS		= -g +-mis_LDADD		= ../src/libiperf.la ++mis_LDADD
> = $(top_builddir)/src/libiperf.la + mis_LDFLAGS		= -g ++mis_CPPFLAGS		=
> -I$(top_srcdir)/src + +diff -rupN iperf-3.0.10.old/examples/Makefile.in
> iperf-3.0.10/examples/Makefile.in +---
> iperf-3.0.10.old/examples/Makefile.in	2014-12-16 13:39:58.000000000
> -0600 ++++ iperf-3.0.10/examples/Makefile.in	2014-12-29
> 17:12:07.518979616 -0600 +@@ -94,7 +94,7 @@ CONFIG_CLEAN_VPATH_FILES = +
> PROGRAMS = $(noinst_PROGRAMS) + am_mic_OBJECTS = mic-mic.$(OBJEXT) +
> mic_OBJECTS = $(am_mic_OBJECTS) +-mic_DEPENDENCIES = ../src/libiperf.la 
> ++mic_DEPENDENCIES = $(top_builddir)/src/libiperf.la + AM_V_lt =
> $(am__v_lt_@AM_V@) + am__v_lt_ = $(am__v_lt_@AM_DEFAULT_V@) + am__v_lt_0
> = --silent +@@ -104,7 +104,7 @@ mic_LINK = $(LIBTOOL) $(AM_V_lt) --tag=C 
> + 	$(mic_LDFLAGS) $(LDFLAGS) -o $@ + am_mis_OBJECTS = mis-mis.$(OBJEXT) +
> mis_OBJECTS = $(am_mis_OBJECTS) +-mis_DEPENDENCIES = ../src/libiperf.la 
> ++mis_DEPENDENCIES = $(top_builddir)/src/libiperf.la + mis_LINK =
> $(LIBTOOL) $(AM_V_lt) --tag=CC $(AM_LIBTOOLFLAGS) \ + 	$(LIBTOOLFLAGS)
> --mode=link $(CCLD) $(mis_CFLAGS) $(CFLAGS) \ + 	$(mis_LDFLAGS)
> $(LDFLAGS) -o $@ +@@ -286,12 +286,14 @@ top_builddir = @top_builddir@ +
> top_srcdir = @top_srcdir@ + mic_SOURCES = mic.c + mic_CFLAGS = -g 
> +-mic_LDADD = ../src/libiperf.la ++mic_LDADD =
> $(top_builddir)/src/libiperf.la + mic_LDFLAGS = -g ++mic_CPPFLAGS =
> -I$(top_srcdir)/src + mis_SOURCES = mis.c + mis_CFLAGS = -g +-mis_LDADD =
> ../src/libiperf.la ++mis_LDADD = $(top_builddir)/src/libiperf.la +
> mis_LDFLAGS = -g ++mis_CPPFLAGS = -I$(top_srcdir)/src + all: all-am + +
> .SUFFIXES: +@@ -375,32 +377,32 @@ distclean-compile: +
> @am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(LTCOMPILE) -c -o $@ $< + +
> mic-mic.o: mic.c +-@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS)
> $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS)
> $(CFLAGS) -MT mic-mic.o -MD -MP -MF $(DEPDIR)/mic-mic.Tpo -c -o mic-mic.o
> `test -f 'mic.c' || echo '$(srcdir)/'`mic.c ++@am__fastdepCC_TRUE@
> $(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mic_CPPFLAGS)
> $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -MT mic-mic.o -MD -MP -MF
> $(DEPDIR)/mic-mic.Tpo -c -o mic-mic.o `test -f 'mic.c' || echo
> '$(srcdir)/'`mic.c + @am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv)
> $(DEPDIR)/mic-mic.Tpo $(DEPDIR)/mic-mic.Po +
> @AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='mic.c'
> object='mic-mic.o' libtool=no @AMDEPBACKSLASH@ +
> @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE)
> $(depcomp) @AMDEPBACKSLASH@ +-@am__fastdepCC_FALSE@
> $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES)
> $(AM_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -c -o mic-mic.o `test
> -f 'mic.c' || echo '$(srcdir)/'`mic.c ++@am__fastdepCC_FALSE@
> $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES)
> $(mic_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -c -o mic-mic.o `test
> -f 'mic.c' || echo '$(srcdir)/'`mic.c + + mic-mic.obj: mic.c 
> +-@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES)
> $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -MT
> mic-mic.obj -MD -MP -MF $(DEPDIR)/mic-mic.Tpo -c -o mic-mic.obj `if test
> -f 'mic.c'; then $(CYGPATH_W) 'mic.c'; else $(CYGPATH_W)
> '$(srcdir)/mic.c'; fi` ++@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS)
> $(DEFAULT_INCLUDES) $(INCLUDES) $(mic_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS)
> $(CFLAGS) -MT mic-mic.obj -MD -MP -MF $(DEPDIR)/mic-mic.Tpo -c -o
> mic-mic.obj `if test -f 'mic.c'; then $(CYGPATH_W) 'mic.c'; else
> $(CYGPATH_W) '$(srcdir)/mic.c'; fi` + @am__fastdepCC_TRUE@
> $(AM_V_at)$(am__mv) $(DEPDIR)/mic-mic.Tpo $(DEPDIR)/mic-mic.Po +
> @AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='mic.c'
> object='mic-mic.obj' libtool=no @AMDEPBACKSLASH@ +
> @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE)
> $(depcomp) @AMDEPBACKSLASH@ +-@am__fastdepCC_FALSE@
> $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES)
> $(AM_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -c -o mic-mic.obj `if
> test -f 'mic.c'; then $(CYGPATH_W) 'mic.c'; else $(CYGPATH_W)
> '$(srcdir)/mic.c'; fi` ++@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC)
> $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mic_CPPFLAGS) $(CPPFLAGS)
> $(mic_CFLAGS) $(CFLAGS) -c -o mic-mic.obj `if test -f 'mic.c'; then
> $(CYGPATH_W) 'mic.c'; else $(CYGPATH_W) '$(srcdir)/mic.c'; fi` + +
> mis-mis.o: mis.c +-@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS)
> $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS)
> $(CFLAGS) -MT mis-mis.o -MD -MP -MF $(DEPDIR)/mis-mis.Tpo -c -o mis-mis.o
> `test -f 'mis.c' || echo '$(srcdir)/'`mis.c ++@am__fastdepCC_TRUE@
> $(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mis_CPPFLAGS)
> $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -MT mis-mis.o -MD -MP -MF
> $(DEPDIR)/mis-mis.Tpo -c -o mis-mis.o `test -f 'mis.c' || echo
> '$(srcdir)/'`mis.c + @am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv)
> $(DEPDIR)/mis-mis.Tpo $(DEPDIR)/mis-mis.Po +
> @AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='mis.c'
> object='mis-mis.o' libtool=no @AMDEPBACKSLASH@ +
> @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE)
> $(depcomp) @AMDEPBACKSLASH@ +-@am__fastdepCC_FALSE@
> $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES)
> $(AM_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -c -o mis-mis.o `test
> -f 'mis.c' || echo '$(srcdir)/'`mis.c ++@am__fastdepCC_FALSE@
> $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES)
> $(mis_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -c -o mis-mis.o `test
> -f 'mis.c' || echo '$(srcdir)/'`mis.c + + mis-mis.obj: mis.c 
> +-@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES)
> $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -MT
> mis-mis.obj -MD -MP -MF $(DEPDIR)/mis-mis.Tpo -c -o mis-mis.obj `if test
> -f 'mis.c'; then $(CYGPATH_W) 'mis.c'; else $(CYGPATH_W)
> '$(srcdir)/mis.c'; fi` ++@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS)
> $(DEFAULT_INCLUDES) $(INCLUDES) $(mis_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS)
> $(CFLAGS) -MT mis-mis.obj -MD -MP -MF $(DEPDIR)/mis-mis.Tpo -c -o
> mis-mis.obj `if test -f 'mis.c'; then $(CYGPATH_W) 'mis.c'; else
> $(CYGPATH_W) '$(srcdir)/mis.c'; fi` + @am__fastdepCC_TRUE@
> $(AM_V_at)$(am__mv) $(DEPDIR)/mis-mis.Tpo $(DEPDIR)/mis-mis.Po +
> @AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='mis.c'
> object='mis-mis.obj' libtool=no @AMDEPBACKSLASH@ +
> @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE)
> $(depcomp) @AMDEPBACKSLASH@ +-@am__fastdepCC_FALSE@
> $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES)
> $(AM_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -c -o mis-mis.obj `if
> test -f 'mis.c'; then $(CYGPATH_W) 'mis.c'; else $(CYGPATH_W)
> '$(srcdir)/mis.c'; fi` ++@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC)
> $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mis_CPPFLAGS) $(CPPFLAGS)
> $(mis_CFLAGS) $(CFLAGS) -c -o mis-mis.obj `if test -f 'mis.c'; then
> $(CYGPATH_W) 'mis.c'; else $(CYGPATH_W) '$(srcdir)/mis.c'; fi` + +
> mostlyclean-libtool: + 	-rm -f *.lo diff --git
> a/meta-oe/recipes-benchmark/iperf3/iperf3.inc
> b/meta-oe/recipes-benchmark/iperf3/iperf3.inc index 029a144..3109678
> 100644 --- a/meta-oe/recipes-benchmark/iperf3/iperf3.inc +++
> b/meta-oe/recipes-benchmark/iperf3/iperf3.inc @@ -1,6 +1,6 @@ SUMMARY =
> "Network benchmark tool" -DESCRIPTION = \ -"iperf is a tool for active
> measurements of the maximum achievable bandwidth \ +DESCRIPTION = "\ 
> +iperf is a tool for active measurements of the maximum achievable
> bandwidth \ on IP networks. It supports tuning of various parameters
> related to timing, \ protocols, and buffers. For each test it reports the
> bandwidth, loss, and \ other parameters." @@ -13,6 +13,8 @@ LICENSE =
> "BSD" BRANCH = "master" SRC_URI = "\ 
> git://github.com/esnet/iperf.git;branch=${BRANCH} \ +
> file://automake-foreign.patch \ +           file://fix-examples.patch \ 
> "
> 
> S = "${WORKDIR}/git" diff --git
> a/meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb
> b/meta-oe/recipes-benchmark/iperf3/iperf3_3.0.10.bb similarity index 69% 
> rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb rename to
> meta-oe/recipes-benchmark/iperf3/iperf3_3.0.10.bb index a39deff..5a386e8
> 100644 --- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb +++
> b/meta-oe/recipes-benchmark/iperf3/iperf3_3.0.10.bb @@ -3,4 +3,4 @@
> require iperf3.inc LIC_FILES_CHKSUM =
> "file://LICENSE;md5=ab59a0c3a4bc3954d1ece68ea19d77a4"
> 
> BRANCH = "3.0-STABLE" -SRCREV =
> "24d5cdec3731bc589f6cb7c359d8311dcaa41854" +SRCREV =
> "de420cc741dd8967ebc57f80b7712556442de81b" diff --git
> a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
> b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb index 77ebe15..c76f311
> 100644 --- a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb +++
> b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb @@ -2,6 +2,7 @@ require
> iperf3.inc
> 
> LIC_FILES_CHKSUM = "file://LICENSE;md5=062ab1bc33fae1926387ac1274cb0873"
> 
> -PV = "3.0.8+git${SRCPV}" +PV = "3.0.10+git${SRCPV}" SRCREV =
> "${AUTOREV}"
> 
> +DEFAULT_PREFERENCE = "-1"

Autorev is not allowed in public recipes, so just drop the _git version and
fold the .inc into the .bb.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUp/QdMkyGM64RGpERAtdqAJ0dpi1dGm4kFtgVPnBIwFFM7bjekACeJizy
T1O4GhLM8DgIRlhWr0IxAqc=
=qgDe
-----END PGP SIGNATURE-----


