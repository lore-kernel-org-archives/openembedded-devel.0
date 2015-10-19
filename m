Return-Path: <B40290@freescale.com>
X-Greylist: delayed 933 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 19 Oct 2015 08:58:54 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0148.outbound.protection.outlook.com [207.46.100.148])
	by mail.openembedded.org (Postfix) with ESMTP id 19D0F7706B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 08:58:54 +0000 (UTC)
Received: from BY2PR03CA012.namprd03.prod.outlook.com (10.255.93.29) by
	BY2PR03MB300.namprd03.prod.outlook.com (10.141.139.24) with Microsoft
	SMTP Server (TLS) id 15.1.300.14; Mon, 19 Oct 2015 08:43:19 +0000
Received: from BN1AFFO11FD045.protection.gbl (10.255.93.4) by
	BY2PR03CA012.outlook.office365.com (10.255.93.29) with Microsoft SMTP
	Server (TLS) id 15.1.300.14 via Frontend Transport;
	Mon, 19 Oct 2015 08:43:18 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD045.mail.protection.outlook.com (10.58.53.60) with Microsoft
	SMTP Server (TLS) id 15.1.300.4 via Frontend Transport;
	Mon, 19 Oct 2015 08:43:18 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t9J8hFxK001936; Mon, 19 Oct 2015 01:43:16 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 19 Oct 2015 16:43:06 +0800
Message-ID: <1445244186-23452-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD045;
	1:ejDRMA+c0ul+fe5OOsjclg7fmSICmlqdO4js9XknIjuA3sZleL1JmUWKcB1yPAQhn2xMBUjh/F9USQbudRZBXZ7Zs2LLsKOQGJZ3KMN2PzVB7m56v3Uki/K0Lg3bQYwzP/iXllgGKTi3WPUc9yPW4+jVv5MqFYON5nuI008o2a5i8F0D0MFE83SOurvjuoLrBrVBi5FoJ1/gX3gZ6CljqfkL2WW+G6ovuV57sfvcGcwAfYmBIJ2uwb2SjEgIebAgsNl6UfnUpkF4XrhOtGlxhM+lODFpNQvUCWWLKJV+J7I+1AhkonOGLGLuM3T1WsuBJzq6IndYYA+vbG36VzBFdt6Beh2zc7rsoJLhApXECoIjTNzZqEr0t5mi1zUp6swAavTIvCaIlth6JmHOca+nrw==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(1109001)(1110001)(339900001)(377424004)(189002)(199003)(107886002)(97736004)(92566002)(450100001)(15975445007)(33646002)(189998001)(47776003)(77096005)(46102003)(36756003)(106466001)(110136002)(48376002)(50466002)(2351001)(5007970100001)(50986999)(19580395003)(5001960100002)(64706001)(229853001)(50226001)(86152002)(5001920100001)(5003940100001)(5008740100001)(105606002)(575784001)(86362001)(4001150100001)(104016004)(6806005)(19580405001)(11100500001)(87936001)(81156007)(85426001)(50929005)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB300;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB300;
	2:AJHHKrIll2GCcl+3qTqQ7QBFTki5PxLXiV9DeGiiNorbk6w5zp8xl7d8R4vCDpoLI02gs0CjtjgpnfHncjvm4CAs1JLylIGZnuaV/bTIZp46AVQc2+NPSfa1Cx180VhyO6bgzEqCwXu0wGJnlzEkiEfi8Y8kVHNv5UVFqlG3Pdc=;
	3:Tjanrr2dS57+eZOv3QQYzaNt2OSZ7QTSeRImDMu8Lo+ajqNcfq4vc8+rI38pxUo6TxQgv2CMaE5/azwgNcbCURQkBARIgakEkXxWCgKTaihr1gAtZqi8xMLMTKdEmZls7X/ZTfZv2xLnKu0EbuDBVkHVMbbwArMm/FvyrT7K5zHYbe7oGaXgiJ2R/Dfi3h9bmTOIUTIVXBPj3hlaY4eZ/Ir936qhdHt17EOLY6gWZts=;
	25:FsSvcylWfoowl24SZ8NWSwVWEQjhfxu73nZxkqQcYdhE+2sKQ5hdVXS4b2L3RQ+/mnmERo3FqKNDo7LNxEfCMe+lGGS5qqVEDhytOB9P5hIlPFcsMFCJnrYFULrOQ/CvC5Ay2wHExcrrVbFhgepxkW4XL0zBqUyiAQvjW990sgfxYHFVt1r/nYO2o68nk+WaRAhnp2folUwe94ep6Vl5rYESR/7hoZnTThVZC5gTmFcyhyjTMfJOvtJ6izqQ707o+W1gg4sWwyNhhhyho5mN6w==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB300;
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB300;
	20:UYfHpVCONv3bLF6kJr0KYe7zIjpJAR2pKc1K7sSzIWkEVTSxir/KqQwvYLJ8MhqGUjwIAzSe+DzTeffmDBtSZ/4Gk9AaxnCTYSkqW0iN+n3XzWVugiy3BKy1HbZMGUV8xRotM/+0swBAwrsVHO276WvnQ/i98GlatCSfhT9PGRhisKnxLMUV5dfy61LBeCvtZgUrfq5uW6f+WhgHHc+u7XX+fdEBF9Vf7mF6f2jjJ2RwzodgcfXI/vUkfWbR+h+tuX0b+o6gM6Gt7cODkLx7wjGSpXuIU/XAXRqWjR6U0UIvyyl8sCnaHGNLlnJfK5qOsn8P/370jfCoumgOpRGm905LtzWTrNXTpG4g7eO9/t8=;
	4:eQWb6UFuQCEUsuoulUxr5TiPsS15fUWE9/W5co7NkQ55V+IxTuL7AHWgWsVbqXh+mkDcaHgwMqrm8oJKNjIg6hFpkwlHFT5bt2tfA96YCJfDnpEBV89rSLcfq0BVqujK2zu+WQNk2IHMGjU4rZzHNwQuJn2jZTcGGAF14H7wU7St7BFsUbMk3mvFezqGwlGDx4G6vOQrOSWRxC/9au4/1jyRNkfvj7BEHlJy2wi91MmKUhNf/z4uKWdW6E6cSB1c4WPjdDWfqE2Cxlo4X/IWqzNFVJ77UMFBJIVWwnGEjcFwP7q/aX7m2Q3OaugrdkKyBJBBGorsowtetO3DRIZ/rhsVy0qoMqCvPts8cGG+q/VlJGY/afCK/vE1epGhOV0z
X-Microsoft-Antispam-PRVS: <BY2PR03MB3006947BBDAEAB39D816AEC843A0@BY2PR03MB300.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(101931422205132)(44728458202952);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(5005006)(8121501046)(3002001)(2002001);
	SRVR:BY2PR03MB300; BCL:0; PCL:0; RULEID:; SRVR:BY2PR03MB300; 
X-Forefront-PRVS: 07349BFAD2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR03MB300;
	23:VgnCjfcrlgpL15K/jAOp4pBoGttu5H83F3UabWdNeG?=
	=?us-ascii?Q?PGdIgp9N5yiUVvRt9/Q8vxJRWkWAGWRSTu3hmnuuLAx3hkr3jTCCsTHflHBz?=
	=?us-ascii?Q?ysOyZbomzEEBBdaWrjXtpLxE/lwrsJhpL49/oS4HWMs7zrlixelK6f4zzmMW?=
	=?us-ascii?Q?2be7fMzybDIR4lgsZnlHRQBA0KXcGw2Ej9L8esFybMWS5OpjWiJPrbQWvG2R?=
	=?us-ascii?Q?ctnPg/z/5vjlHUzM1C5XzwiSvafF7X6C4IJGFPs3QbUgbftcSh/EuJByl/mY?=
	=?us-ascii?Q?cuxr01ezTVBCSz55qFEL2BcR1RgvTfruEeqek6d7QfrwK2vvpENYtmx+EawV?=
	=?us-ascii?Q?UqYRoCKRLC/wU4D5bMD8pCKqdbtnaUZeBPMPTL/nBldm6Pc2LCVk7c+FZLiD?=
	=?us-ascii?Q?+rplaLqksIjewxM8DtKmpDtXuqR32d4MEks6XFQpaGv+usvH1yV+zWoPY53y?=
	=?us-ascii?Q?p+5svZ2ozZgZkpYbYk8fleK8HiC37exFr7xqohQudaIGulpZVMVXj1Zz54Yo?=
	=?us-ascii?Q?yzj/c2vjtlQ1OlWwJBMH3mYJg/fojn2cwceYk8PutJe5hv6kFEkqN19NGztd?=
	=?us-ascii?Q?MvENyJjskdWlxl5OsISI5EvBYR5b6w3RpJG1cz74tTjIe+EN3BvTWt30krGf?=
	=?us-ascii?Q?1V4l2ZmsrTgvZvavuIM2egZwOGo4UfJW7QqFh6SmPNbemOagK/C3RpQHJgv0?=
	=?us-ascii?Q?2R4gILaItGJc+8AKstO1Csf2/l5u+7uEXO1vM5zbRys8va067qf/vTbXkwlY?=
	=?us-ascii?Q?NXUVBfIQqLuoQHoj8Y+OMHcIQzhiwhCQlq7yX1juezRiO/AOQ15vyR0kxgza?=
	=?us-ascii?Q?jOSBFt1oliXmy59zhBUie4ETaxzaYa5L7IUVQvRxcnpXnxALEj0uB5W2T3T+?=
	=?us-ascii?Q?wFq3s6ZU+GJ1GF+V59JTDkX/9Z9DCfB1JVKRrLwvI7if3rELn8XMkR4NFZ2F?=
	=?us-ascii?Q?JbobnkKdxGhKy+SbR3xrKRmP/p94nxsTyt0bfyyIYHfpNG8XssvactzBmGIs?=
	=?us-ascii?Q?mI2LLUMmvQy3fmiW5Ypdq8cE2gF+sGLPaWqU6NUfaDxm9ht5jXFk9UaG2G2+?=
	=?us-ascii?Q?PqTBfmwFK/AHGemv8rguERKinWjXa8H18DwctigEzYBEJz1WWj7YYhXIg8uE?=
	=?us-ascii?Q?fCl82mW+gMZuMVbtFrjUg1TmAa3uRrhOKCplK5EC8NSk82buj+/iAoujgeza?=
	=?us-ascii?Q?jUhvX4WI3CLTm12vIaz7O6OoHxyxAHABcC5UQkFC6jC7qNaLJOl/dSfp2O5n?=
	=?us-ascii?Q?SF6ZH7u8vNDsUCf8gmP8dsVZGh3bxPznKvwE7k8b7bxnzcrxeYyWf8rVwUJQ?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB300;
	5:/hbBst68Sz0x5NlVo/3hA7KnAp3l6Yz2UvQWiS6OQn+jxE0jf0l3IdJhe0OW4b0RPEiSY0OOF640EJIJsBL5yo8CkBPMenQOEClk/VmlSoglluPTAIv24ngLr3YElRoMVjcWcBnf/DyMqPNb2dOaaw==;
	24:YnLfVXOv2vr6eHFujQp0MhcX4zVwRExTnaQ2BFOkXXROyuaST0FAkQ3UTRhfypkMh61FccvLehHMeFOH0I2/1zU3W96wliBF4US2rVb9D9E=;
	20:qrfBkguz0WwTStXAppAXzdxSQbnTy1qlIs0PalnbLuuFzTqo2D435x36FoHxA11Je2YduSS2x45eZvEqcMa89g==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2015 08:43:18.6799 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB300
Subject: [meta-oe][PATCH] iperf3 :upgrade to 3.1
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
X-List-Received-Date: Mon, 19 Oct 2015 08:58:55 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

---
 .../iperf3/iperf3/automake-foreign.patch           |  14 ++-
 .../iperf3/iperf3/fix-examples.patch               | 107 ---------------------
 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb     |   9 +-
 3 files changed, 10 insertions(+), 120 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/fix-examples.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/automake-foreign.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/automake-foreign.patch
index a27b61e..06c394e 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/automake-foreign.patch
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/automake-foreign.patch
@@ -2,18 +2,16 @@ Pass the 'foreign' option to automake to enable iperf3 to build.
 
 Upstream-Status: Inappropriate [configuration]
 
-Signed-off-by: Ben Shelton <ben.shelton@ni.com>
----
+Signed-off-by: Chunrong Guo <b40290@freescale.com>
 
-diff -rupN iperf-3.0.10.old/configure.ac iperf-3.0.10/configure.ac
---- iperf-3.0.10.old/configure.ac	2014-12-16 13:39:58.000000000 -0600
-+++ iperf-3.0.10/configure.ac	2014-12-29 15:09:27.534992643 -0600
-@@ -32,7 +32,7 @@ AC_CONFIG_AUX_DIR(config)
+--- a/configure.ac	2015-10-19 02:49:30.471867352 -0500
++++ b/configure.ac	2015-10-19 02:46:36.207873572 -0500
+@@ -33,7 +33,7 @@
  
  
  # Initialize the automake system
 -AM_INIT_AUTOMAKE
 +AM_INIT_AUTOMAKE([foreign])
- 
  AM_MAINTAINER_MODE
- AM_CONFIG_HEADER(src/config.h)
+ AM_CONFIG_HEADER(src/iperf_config.h)
+ 
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/fix-examples.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/fix-examples.patch
deleted file mode 100644
index 445570d..0000000
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/fix-examples.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-The Makefiles for the examples only work properly when the build is
-done in the same directory as the source.  Fix this in Makefile.am and
-run bootstrap.sh to regenerate Makefile.in.
-
-Upstream-Status: Pending [iperf-dev@googlegroups.com]
-
-Signed-off-by: Ben Shelton <ben.shelton@ni.com>
----
-
-diff -rupN iperf-3.0.10.old/examples/Makefile.am iperf-3.0.10/examples/Makefile.am
---- iperf-3.0.10.old/examples/Makefile.am	2014-12-16 13:39:58.000000000 -0600
-+++ iperf-3.0.10/examples/Makefile.am	2014-12-29 17:12:02.238979626 -0600
-@@ -2,11 +2,13 @@ noinst_PROGRAMS		= mic mis		# Build, but
- 
- mic_SOURCES		= mic.c
- mic_CFLAGS		= -g
--mic_LDADD		= ../src/libiperf.la
-+mic_LDADD		= $(top_builddir)/src/libiperf.la
- mic_LDFLAGS		= -g
-+mic_CPPFLAGS		= -I$(top_srcdir)/src
- 
- mis_SOURCES		= mis.c
- mis_CFLAGS		= -g
--mis_LDADD		= ../src/libiperf.la
-+mis_LDADD		= $(top_builddir)/src/libiperf.la
- mis_LDFLAGS		= -g
-+mis_CPPFLAGS		= -I$(top_srcdir)/src
- 
-diff -rupN iperf-3.0.10.old/examples/Makefile.in iperf-3.0.10/examples/Makefile.in
---- iperf-3.0.10.old/examples/Makefile.in	2014-12-16 13:39:58.000000000 -0600
-+++ iperf-3.0.10/examples/Makefile.in	2014-12-29 17:12:07.518979616 -0600
-@@ -94,7 +94,7 @@ CONFIG_CLEAN_VPATH_FILES =
- PROGRAMS = $(noinst_PROGRAMS)
- am_mic_OBJECTS = mic-mic.$(OBJEXT)
- mic_OBJECTS = $(am_mic_OBJECTS)
--mic_DEPENDENCIES = ../src/libiperf.la
-+mic_DEPENDENCIES = $(top_builddir)/src/libiperf.la
- AM_V_lt = $(am__v_lt_@AM_V@)
- am__v_lt_ = $(am__v_lt_@AM_DEFAULT_V@)
- am__v_lt_0 = --silent
-@@ -104,7 +104,7 @@ mic_LINK = $(LIBTOOL) $(AM_V_lt) --tag=C
- 	$(mic_LDFLAGS) $(LDFLAGS) -o $@
- am_mis_OBJECTS = mis-mis.$(OBJEXT)
- mis_OBJECTS = $(am_mis_OBJECTS)
--mis_DEPENDENCIES = ../src/libiperf.la
-+mis_DEPENDENCIES = $(top_builddir)/src/libiperf.la
- mis_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CC $(AM_LIBTOOLFLAGS) \
- 	$(LIBTOOLFLAGS) --mode=link $(CCLD) $(mis_CFLAGS) $(CFLAGS) \
- 	$(mis_LDFLAGS) $(LDFLAGS) -o $@
-@@ -286,12 +286,14 @@ top_builddir = @top_builddir@
- top_srcdir = @top_srcdir@
- mic_SOURCES = mic.c
- mic_CFLAGS = -g
--mic_LDADD = ../src/libiperf.la
-+mic_LDADD = $(top_builddir)/src/libiperf.la
- mic_LDFLAGS = -g
-+mic_CPPFLAGS = -I$(top_srcdir)/src
- mis_SOURCES = mis.c
- mis_CFLAGS = -g
--mis_LDADD = ../src/libiperf.la
-+mis_LDADD = $(top_builddir)/src/libiperf.la
- mis_LDFLAGS = -g
-+mis_CPPFLAGS = -I$(top_srcdir)/src
- all: all-am
- 
- .SUFFIXES:
-@@ -375,32 +377,32 @@ distclean-compile:
- @am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(LTCOMPILE) -c -o $@ $<
- 
- mic-mic.o: mic.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -MT mic-mic.o -MD -MP -MF $(DEPDIR)/mic-mic.Tpo -c -o mic-mic.o `test -f 'mic.c' || echo '$(srcdir)/'`mic.c
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mic_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -MT mic-mic.o -MD -MP -MF $(DEPDIR)/mic-mic.Tpo -c -o mic-mic.o `test -f 'mic.c' || echo '$(srcdir)/'`mic.c
- @am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) $(DEPDIR)/mic-mic.Tpo $(DEPDIR)/mic-mic.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='mic.c' object='mic-mic.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -c -o mic-mic.o `test -f 'mic.c' || echo '$(srcdir)/'`mic.c
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mic_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -c -o mic-mic.o `test -f 'mic.c' || echo '$(srcdir)/'`mic.c
- 
- mic-mic.obj: mic.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -MT mic-mic.obj -MD -MP -MF $(DEPDIR)/mic-mic.Tpo -c -o mic-mic.obj `if test -f 'mic.c'; then $(CYGPATH_W) 'mic.c'; else $(CYGPATH_W) '$(srcdir)/mic.c'; fi`
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mic_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -MT mic-mic.obj -MD -MP -MF $(DEPDIR)/mic-mic.Tpo -c -o mic-mic.obj `if test -f 'mic.c'; then $(CYGPATH_W) 'mic.c'; else $(CYGPATH_W) '$(srcdir)/mic.c'; fi`
- @am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) $(DEPDIR)/mic-mic.Tpo $(DEPDIR)/mic-mic.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='mic.c' object='mic-mic.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -c -o mic-mic.obj `if test -f 'mic.c'; then $(CYGPATH_W) 'mic.c'; else $(CYGPATH_W) '$(srcdir)/mic.c'; fi`
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mic_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -c -o mic-mic.obj `if test -f 'mic.c'; then $(CYGPATH_W) 'mic.c'; else $(CYGPATH_W) '$(srcdir)/mic.c'; fi`
- 
- mis-mis.o: mis.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -MT mis-mis.o -MD -MP -MF $(DEPDIR)/mis-mis.Tpo -c -o mis-mis.o `test -f 'mis.c' || echo '$(srcdir)/'`mis.c
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mis_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -MT mis-mis.o -MD -MP -MF $(DEPDIR)/mis-mis.Tpo -c -o mis-mis.o `test -f 'mis.c' || echo '$(srcdir)/'`mis.c
- @am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) $(DEPDIR)/mis-mis.Tpo $(DEPDIR)/mis-mis.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='mis.c' object='mis-mis.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -c -o mis-mis.o `test -f 'mis.c' || echo '$(srcdir)/'`mis.c
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mis_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -c -o mis-mis.o `test -f 'mis.c' || echo '$(srcdir)/'`mis.c
- 
- mis-mis.obj: mis.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -MT mis-mis.obj -MD -MP -MF $(DEPDIR)/mis-mis.Tpo -c -o mis-mis.obj `if test -f 'mis.c'; then $(CYGPATH_W) 'mis.c'; else $(CYGPATH_W) '$(srcdir)/mis.c'; fi`
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mis_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -MT mis-mis.obj -MD -MP -MF $(DEPDIR)/mis-mis.Tpo -c -o mis-mis.obj `if test -f 'mis.c'; then $(CYGPATH_W) 'mis.c'; else $(CYGPATH_W) '$(srcdir)/mis.c'; fi`
- @am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) $(DEPDIR)/mis-mis.Tpo $(DEPDIR)/mis-mis.Po
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='mis.c' object='mis-mis.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -c -o mis-mis.obj `if test -f 'mis.c'; then $(CYGPATH_W) 'mis.c'; else $(CYGPATH_W) '$(srcdir)/mis.c'; fi`
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(mis_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -c -o mis-mis.obj `if test -f 'mis.c'; then $(CYGPATH_W) 'mis.c'; else $(CYGPATH_W) '$(srcdir)/mis.c'; fi`
- 
- mostlyclean-libtool:
- 	-rm -f *.lo
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
index b4d2b61..58818bb 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
@@ -9,16 +9,15 @@ SECTION = "console/network"
 BUGTRACKER = "https://github.com/esnet/iperf/issues"
 AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <websupport@lbl.gov>"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ab59a0c3a4bc3954d1ece68ea19d77a4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=062ab1bc33fae1926387ac1274cb0873"
 
 SRC_URI = "\
-    git://github.com/esnet/iperf.git;branch=3.0-STABLE \
+    git://github.com/esnet/iperf.git \
     file://automake-foreign.patch \
-    file://fix-examples.patch \
 "
 
-PV = "3.0.10+gitr${SRCPV}"
-SRCREV = "de420cc741dd8967ebc57f80b7712556442de81b"
+PV = "3.1+gitr${SRCPV}"
+SRCREV = "e396134952a01199326665d1df7c51ae9e62e945"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.2


