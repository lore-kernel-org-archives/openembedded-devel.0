Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetTh-0005OO-Nd
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:57:54 +0100
Received: (qmail 26340 invoked by uid 813007); 4 Mar 2009 15:53:37 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:37 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPV-0001Cq-KA; Wed, 04 Mar 2009 16:53:29 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:21 +0100
Message-Id: <1236182004-4523-7-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 06/70] rpm: Add recommends support from suse rpm patches (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 15:59:35 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5113 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/rpm/files/tagsbackport.patch |   37 ++++
 packages/rpm/files/weakdeps.patch     |  312 +++++++++++++++++++++++++++++++++
 packages/rpm/rpm_4.4.2.3.bb           |    6 +-
 3 files changed, 353 insertions(+), 2 deletions(-)
 create mode 100644 packages/rpm/files/tagsbackport.patch
 create mode 100644 packages/rpm/files/weakdeps.patch

diff --git a/packages/rpm/files/tagsbackport.patch b/packages/rpm/files/tagsbackport.patch
new file mode 100644
index 0000000..a2a3609
--- /dev/null
+++ b/packages/rpm/files/tagsbackport.patch
@@ -0,0 +1,37 @@
+Backported some new tags and sense values.
+
+Index: lib/rpmlib.h
+===================================================================
+--- lib/rpmlib.h.orig	2008-08-26 17:07:12.000000000 +0100
++++ lib/rpmlib.h	2008-08-26 17:22:21.000000000 +0100
+@@ -447,7 +447,19 @@
+     RPMTAG_PRIORITY		= 1162, /* i   extension placeholder */
+     RPMTAG_CVSID		= 1163, /* s */
+ #define	RPMTAG_SVNID	RPMTAG_CVSID	/* s */
++    RPMTAG_BLINKPKGID		= 1164, /* s[] */
++    RPMTAG_BLINKHDRID		= 1165, /* s[] */
++    RPMTAG_BLINKNEVRA		= 1166, /* s[] */
++    RPMTAG_FLINKPKGID		= 1167, /* s[] */
++    RPMTAG_FLINKHDRID		= 1168, /* s[] */
++    RPMTAG_FLINKNEVRA		= 1169, /* s[] */
++    RPMTAG_PACKAGEORIGIN	= 1170, /* s */
+     RPMTAG_TRIGGERPREIN		= 1171, /*!< internal */
++    RPMTAG_BUILDSUGGESTS	= 1172, /*!< internal */
++    RPMTAG_BUILDENHANCES	= 1173, /*!< internal */
++    RPMTAG_SCRIPTSTATES		= 1174, /*!< i scriptlet exit codes */
++    RPMTAG_SCRIPTMETRICS	= 1175, /*!< i scriptlet execution times */
++    RPMTAG_BUILDCPUCLOCK	= 1176, /*!< i */
+ 
+ /*@-enummemuse@*/
+     RPMTAG_FIRSTFREE_TAG	/*!< internal */
+@@ -531,7 +543,9 @@
+ /*@=enummemuse@*/
+     RPMSENSE_KEYRING	= (1 << 26),
+     RPMSENSE_STRONG	= (1 << 27),
+-    RPMSENSE_CONFIG	= (1 << 28)
++    RPMSENSE_CONFIG	= (1 << 28),
++    RPMSENSE_PROBE	= (1 << 29),
++    RPMSENSE_PACKAGE	= (1 << 30)
+ } rpmsenseFlags;
+ 
+ #define	RPMSENSE_SENSEMASK	15	 /* Mask to get senses, ie serial, */
diff --git a/packages/rpm/files/weakdeps.patch b/packages/rpm/files/weakdeps.patch
new file mode 100644
index 0000000..a013b75
--- /dev/null
+++ b/packages/rpm/files/weakdeps.patch
@@ -0,0 +1,312 @@
+Taken from OpenSUSE 11 rpm source file - RP 26/8/08
+
+Add support for weak dependencies:
+
+A) use RPMTAG_SUGGESTS and RPMTAG_ENHANCES to store them.
+
+   This is different to upstream, which uses RPMSENSE_MISSINGOK
+   and RPMTAG_REQUIRES/RPMTAG_PROVIDES instead. I chose different
+   tags because I wanted to be compatible. The point is that
+   applications that don't know about the new MISSINGOK semantics
+   will mis-interpret the provides/requires otherwise, which
+   I deemed to risky.
+
+B) use RPMSENSE_STRONG to support a "strong" version, "Recommends"
+   instead of "Suggests" and "Supplements" instead of "Enhances".
+
+Needs extcond.diff for query operations.
+
+Index: build/parsePreamble.c
+===================================================================
+--- build/parsePreamble.c.orig	2008-04-01 08:28:21.000000000 +0100
++++ build/parsePreamble.c	2008-08-26 16:58:09.000000000 +0100
+@@ -129,6 +129,8 @@
+     { "post",		RPMSENSE_SCRIPT_POST },
+     { "rpmlib",		RPMSENSE_RPMLIB },
+     { "verify",		RPMSENSE_SCRIPT_VERIFY },
++    { "hint",		RPMSENSE_MISSINGOK },
++    { "strong",		RPMSENSE_STRONG },
+     { NULL, 0 }
+ };
+ 
+@@ -140,6 +142,8 @@
+     { "build",		RPMSENSE_SCRIPT_BUILD },
+     { "install",	RPMSENSE_SCRIPT_INSTALL },
+     { "clean",		RPMSENSE_SCRIPT_CLEAN },
++    { "hint",		RPMSENSE_MISSINGOK },
++    { "strong",		RPMSENSE_STRONG },
+     { NULL, 0 }
+ };
+ 
+@@ -692,6 +696,18 @@
+ 	if ((rc = parseRCPOT(spec, pkg, field, tag, 0, tagflags)))
+ 	    return rc;
+ 	break;
++    case RPMTAG_SUGGESTSFLAGS:
++    case RPMTAG_ENHANCESFLAGS:
++    case RPMTAG_BUILDSUGGESTS:
++    case RPMTAG_BUILDENHANCES:
++	tagflags = RPMSENSE_MISSINGOK;
++	if (macro && (!strcmp(macro, "recommends") || !strcmp(macro, "buildrecommends")))
++	    tagflags |= RPMSENSE_STRONG;
++	if (macro && (!strcmp(macro, "supplements") || !strcmp(macro, "buildsupplements")))
++	    tagflags |= RPMSENSE_STRONG;
++	if ((rc = parseRCPOT(spec, pkg, field, tag, 0, tagflags)))
++	    return rc;
++	break;
+     case RPMTAG_EXCLUDEARCH:
+     case RPMTAG_EXCLUSIVEARCH:
+     case RPMTAG_EXCLUDEOS:
+@@ -783,6 +799,14 @@
+     {RPMTAG_DISTTAG,		0, 0, 0, "disttag"},
+     {RPMTAG_CVSID,		0, 0, 0, "cvsid"},
+     {RPMTAG_SVNID,		0, 0, 0, "svnid"},
++    {RPMTAG_SUGGESTSFLAGS,	0, 0, 0, "recommends"},
++    {RPMTAG_SUGGESTSFLAGS,	0, 0, 0, "suggests"},
++    {RPMTAG_ENHANCESFLAGS,	0, 0, 0, "supplements"},
++    {RPMTAG_ENHANCESFLAGS,	0, 0, 0, "enhances"},
++    {RPMTAG_BUILDSUGGESTS,	0, 0, 0, "buildrecommends"},
++    {RPMTAG_BUILDSUGGESTS,	0, 0, 0, "buildsuggests"},
++    {RPMTAG_BUILDENHANCES,	0, 0, 0, "buildsupplements"},
++    {RPMTAG_BUILDENHANCES,	0, 0, 0, "buildenhances"},
+     /*@-nullassign@*/	/* LCL: can't add null annotation */
+     {0, 0, 0, 0, 0}
+     /*@=nullassign@*/
+Index: build/parseReqs.c
+===================================================================
+--- build/parseReqs.c.orig	2008-04-01 08:28:21.000000000 +0100
++++ build/parseReqs.c	2008-08-26 16:58:09.000000000 +0100
+@@ -85,6 +85,14 @@
+ 	tagflags |= RPMSENSE_ANY;
+ 	h = spec->buildRestrictions;
+ 	break;
++    case RPMTAG_SUGGESTSFLAGS:
++    case RPMTAG_ENHANCESFLAGS:
++	h = pkg->header;
++	break;
++    case RPMTAG_BUILDSUGGESTS:
++    case RPMTAG_BUILDENHANCES:
++        h = spec->buildRestrictions;
++        break;
+     default:
+     case RPMTAG_REQUIREFLAGS:
+ 	tagflags |= RPMSENSE_ANY;
+Index: build/reqprov.c
+===================================================================
+--- build/reqprov.c.orig	2008-04-01 08:28:21.000000000 +0100
++++ build/reqprov.c	2008-08-26 16:58:09.000000000 +0100
+@@ -48,6 +48,16 @@
+ 	flagtag = RPMTAG_TRIGGERFLAGS;
+ 	indextag = RPMTAG_TRIGGERINDEX;
+ 	extra = Flags & RPMSENSE_TRIGGER;
++    } else if (tagN == RPMTAG_SUGGESTSFLAGS || tagN == RPMTAG_BUILDSUGGESTS) {
++	nametag = RPMTAG_SUGGESTSNAME;
++	versiontag = RPMTAG_SUGGESTSVERSION;
++	flagtag = RPMTAG_SUGGESTSFLAGS;
++	extra = Flags & _ALL_REQUIRES_MASK;
++    } else if (tagN == RPMTAG_ENHANCESFLAGS || tagN == RPMTAG_BUILDENHANCES) {
++	nametag = RPMTAG_ENHANCESNAME;
++	versiontag = RPMTAG_ENHANCESVERSION;
++	flagtag = RPMTAG_ENHANCESFLAGS;
++	extra = Flags & _ALL_REQUIRES_MASK;
+     } else {
+ 	nametag = RPMTAG_REQUIRENAME;
+ 	versiontag = RPMTAG_REQUIREVERSION;
+Index: build/rpmfc.c
+===================================================================
+--- build/rpmfc.c.orig	2008-04-01 08:28:21.000000000 +0100
++++ build/rpmfc.c	2008-08-26 16:58:09.000000000 +0100
+@@ -1385,6 +1385,12 @@
+   { "Obsoletes",	{ "%{?__find_obsoletes}", NULL, NULL, NULL },
+ 	RPMTAG_OBSOLETENAME, RPMTAG_OBSOLETEVERSION, RPMTAG_OBSOLETEFLAGS,
+ 	0, -1 },
++  { "Enhances",		{ "%{?__find_enhances}", NULL, NULL, NULL },
++	RPMTAG_ENHANCESNAME, RPMTAG_ENHANCESVERSION, RPMTAG_ENHANCESFLAGS,
++	RPMSENSE_STRONG, RPMSENSE_STRONG },
++  { "Supplements",	{ "%{?__find_supplements}", NULL, NULL, NULL },
++	RPMTAG_ENHANCESNAME, RPMTAG_ENHANCESVERSION, RPMTAG_ENHANCESFLAGS,
++	RPMSENSE_STRONG, 0 },
+   { NULL,		{ NULL, NULL, NULL, NULL },	0, 0, 0, 0, 0 }
+ };
+ 
+@@ -1480,6 +1486,14 @@
+ 	    failnonzero = 0;
+ 	    tagflags = RPMSENSE_FIND_REQUIRES;
+ 	    /*@switchbreak@*/ break;
++	case RPMTAG_ENHANCESFLAGS:
++	    if (!pkg->autoProv)
++		continue;
++	    failnonzero = 0;
++	    tagflags = RPMSENSE_FIND_REQUIRES | RPMSENSE_MISSINGOK;
++	    if (strcmp(dm->msg, "Supplements") == 0)
++		tagflags |= RPMSENSE_STRONG;
++	    /*@switchbreak@*/ break;
+ 	default:
+ 	    continue;
+ 	    /*@notreached@*/ /*@switchbreak@*/ break;
+Index: lib/rpmlib.h
+===================================================================
+--- lib/rpmlib.h.orig	2008-04-01 08:28:22.000000000 +0100
++++ lib/rpmlib.h	2008-08-26 17:00:37.000000000 +0100
+@@ -530,7 +530,7 @@
+     RPMSENSE_TRIGGERPREIN = (1 << 25),	/*!< @todo Implement %triggerprein. */
+ /*@=enummemuse@*/
+     RPMSENSE_KEYRING	= (1 << 26),
+-    RPMSENSE_PATCHES	= (1 << 27),
++    RPMSENSE_STRONG	= (1 << 27),
+     RPMSENSE_CONFIG	= (1 << 28)
+ } rpmsenseFlags;
+ 
+Index: python/rpmmodule.c
+===================================================================
+--- python/rpmmodule.c.orig	2008-04-01 08:28:22.000000000 +0100
++++ python/rpmmodule.c	2008-08-26 16:58:09.000000000 +0100
+@@ -433,7 +433,7 @@
+     REGISTER_ENUM(RPMSENSE_RPMLIB);
+     REGISTER_ENUM(RPMSENSE_TRIGGERPREIN);
+     REGISTER_ENUM(RPMSENSE_KEYRING);
+-    REGISTER_ENUM(RPMSENSE_PATCHES);
++    REGISTER_ENUM(RPMSENSE_STRONG);
+     REGISTER_ENUM(RPMSENSE_CONFIG);
+ 
+     REGISTER_ENUM(RPMTRANS_FLAG_TEST);
+Index: lib/rpmds.c
+===================================================================
+--- lib/rpmds.c.orig	2008-04-01 08:28:22.000000000 +0100
++++ lib/rpmds.c	2008-08-26 16:58:09.000000000 +0100
+@@ -320,6 +320,11 @@
+ 	tagEVR = RPMTAG_TRIGGERVERSION;
+ 	tagF = RPMTAG_TRIGGERFLAGS;
+     } else
++    if (tagN == RPMTAG_ENHANCESNAME) {
++	Type = "Enhances";
++	tagEVR = RPMTAG_ENHANCESVERSION;
++	tagF = RPMTAG_ENHANCESFLAGS;
++    } else
+ 	goto exit;
+ 
+     /*@-branchstate@*/
+Index: rpmpopt.in
+===================================================================
+--- rpmpopt.in.orig	2008-04-01 08:28:22.000000000 +0100
++++ rpmpopt.in	2008-08-26 16:58:09.000000000 +0100
+@@ -68,6 +68,22 @@
+ 	--POPTdesc=$"list capabilities required by package(s)"
+ rpm	alias -R --requires
+ 
++rpm	alias --suggests	--qf \
++  "[%|SUGGESTSFLAGS:depflag_strong?{}:{%{SUGGESTSNAME} %{SUGGESTSFLAGS:depflags} %{SUGGESTSVERSION}\n}|]" \
++	--POPTdesc=$"list capabilities this package suggests"
++
++rpm	alias --recommends	--qf \
++  "[%|SUGGESTSFLAGS:depflag_strong?{%{SUGGESTSNAME} %{SUGGESTSFLAGS:depflags} %{SUGGESTSVERSION}\n}|]" \
++	--POPTdesc=$"list capabilities this package recommends"
++
++rpm	alias --enhances	--qf \
++  "[%|ENHANCESFLAGS:depflag_strong?{}:{%{ENHANCESNAME} %{ENHANCESFLAGS:depflags} %{ENHANCESVERSION}\n}|]" \
++	--POPTdesc=$"list capabilities this package enhances"
++
++rpm	alias --supplements	--qf \
++  "[%|ENHANCESFLAGS:depflag_strong?{%{ENHANCESNAME} %{ENHANCESFLAGS:depflags} %{ENHANCESVERSION}\n}|]" \
++	--POPTdesc=$"list capabilities this package supplements"
++
+ rpm	alias --info --qf 'Name        : %-27{NAME}  Relocations: %|PREFIXES?{[%{PREFIXES} ]}:{(not relocatable)}|\n\
+ Version     : %-27{VERSION}       Vendor: %{VENDOR}\n\
+ Release     : %-27{RELEASE}   Build Date: %{BUILDTIME:date}\n\
+@@ -351,6 +367,22 @@
+ 	--POPTdesc=$"list capabilities required by package(s)"
+ rpmq	alias -R --requires
+ 
++rpmq	alias --suggests	--qf \
++  "[%|SUGGESTSFLAGS:depflag_strong?{}:{%{SUGGESTSNAME} %{SUGGESTSFLAGS:depflags} %{SUGGESTSVERSION}\n}|]" \
++	--POPTdesc=$"list capabilities this package suggests"
++
++rpmq	alias --recommends	--qf \
++  "[%|SUGGESTSFLAGS:depflag_strong?{%{SUGGESTSNAME} %{SUGGESTSFLAGS:depflags} %{SUGGESTSVERSION}\n}|]" \
++	--POPTdesc=$"list capabilities this package recommends"
++
++rpmq	alias --enhances	--qf \
++  "[%|ENHANCESFLAGS:depflag_strong?{}:{%{ENHANCESNAME} %{ENHANCESFLAGS:depflags} %{ENHANCESVERSION}\n}|]" \
++	--POPTdesc=$"list capabilities this package enhances"
++
++rpmq	alias --supplements	--qf \
++  "[%|ENHANCESFLAGS:depflag_strong?{%{ENHANCESNAME} %{ENHANCESFLAGS:depflags} %{ENHANCESVERSION}\n}|]" \
++	--POPTdesc=$"list capabilities this package supplements"
++
+ rpmq	alias --info --qf 'Name        : %-27{NAME}  Relocations: %|PREFIXES?{[%{PREFIXES} ]}:{(not relocatable)}|\n\
+ Version     : %-27{VERSION}       Vendor: %{VENDOR}\n\
+ Release     : %-27{RELEASE}   Build Date: %{BUILDTIME:date}\n\
+@@ -452,6 +484,22 @@
+ 	--POPTdesc=$"list capabilities required by package(s)"
+ rpmquery	alias -R --requires
+ 
++rpmquery	alias --suggests	--qf \
++  "[%|SUGGESTSFLAGS:depflag_strong?{}:{%{SUGGESTSNAME} %{SUGGESTSFLAGS:depflags} %{SUGGESTSVERSION}\n}|]" \
++	--POPTdesc=$"list capabilities this package suggests"
++
++rpmquery	alias --recommends	--qf \
++  "[%|SUGGESTSFLAGS:depflag_strong?{%{SUGGESTSNAME} %{SUGGESTSFLAGS:depflags} %{SUGGESTSVERSION}\n}|]" \
++	--POPTdesc=$"list capabilities this package recommends"
++
++rpmquery	alias --enhances	--qf \
++  "[%|ENHANCESFLAGS:depflag_strong?{}:{%{ENHANCESNAME} %{ENHANCESFLAGS:depflags} %{ENHANCESVERSION}\n}|]" \
++	--POPTdesc=$"list capabilities this package enhances"
++
++rpmquery	alias --supplements	--qf \
++  "[%|ENHANCESFLAGS:depflag_strong?{%{ENHANCESNAME} %{ENHANCESFLAGS:depflags} %{ENHANCESVERSION}\n}|]" \
++	--POPTdesc=$"list capabilities this package supplements"
++
+ rpmquery	alias --info --qf 'Name        : %-27{NAME}  Relocations: %|PREFIXES?{[%{PREFIXES} ]}:{(not relocatable)}|\n\
+ Version     : %-27{VERSION}       Vendor: %{VENDOR}\n\
+ Release     : %-27{RELEASE}   Build Date: %{BUILDTIME:date}\n\
+Index: lib/formats.c
+===================================================================
+--- lib/formats.c.orig	2008-04-01 08:28:22.000000000 +0100
++++ lib/formats.c	2008-08-26 16:58:09.000000000 +0100
+@@ -543,6 +543,38 @@
+     return val;
+ }
+ 
++static /*@only@*/ char * depflag_strongFormat(int_32 type, const void * data,
++		char * formatPrefix, int padding, /*@unused@*/ int element)
++	/*@modifies formatPrefix @*/
++	/*@requires maxRead(data) >= 0 @*/
++{
++    char * val;
++    char buf[10];
++    int anint;
++
++    if (type != RPM_INT32_TYPE) {
++	val = xstrdup(_("(not a number)"));
++    } else {
++	anint = *((int_32 *) data);
++	buf[0] = '\0';
++
++/*@-boundswrite@*/
++	if (anint & RPMSENSE_STRONG)
++	    strcat(buf, "strong");
++/*@=boundswrite@*/
++
++	val = xmalloc(7 + padding);
++/*@-boundswrite@*/
++	strcat(formatPrefix, "s");
++/*@=boundswrite@*/
++	/*@-formatconst@*/
++	sprintf(val, formatPrefix, buf);
++	/*@=formatconst@*/
++    }
++
++    return val;
++}
++
+ /**
+  * Retrieve mounted file system paths.
+  * @param h		header
+@@ -1171,6 +1203,7 @@
+     { HEADER_EXT_FORMAT, "base64",		{ base64Format } },
+     { HEADER_EXT_FORMAT, "pgpsig",		{ pgpsigFormat } },
+     { HEADER_EXT_FORMAT, "depflags",		{ depflagsFormat } },
++    { HEADER_EXT_FORMAT, "depflag_strong",	{ depflag_strongFormat } },
+     { HEADER_EXT_FORMAT, "fflags",		{ fflagsFormat } },
+     { HEADER_EXT_FORMAT, "perms",		{ permsFormat } },
+     { HEADER_EXT_FORMAT, "permissions",		{ permsFormat } },
diff --git a/packages/rpm/rpm_4.4.2.3.bb b/packages/rpm/rpm_4.4.2.3.bb
index 4e868e3..1a6e01a 100644
--- a/packages/rpm/rpm_4.4.2.3.bb
+++ b/packages/rpm/rpm_4.4.2.3.bb
@@ -2,11 +2,13 @@ DESCRIPTION = "The RPM Package Manager."
 HOMEPAGE = "http://rpm.org/"
 LICENSE = "LGPL GPL"
 DEPENDS = "zlib beecrypt file popt python"
-PR = "r4"
+PR = "r6"
 
 SRC_URI = "http://www.rpm.org/releases/rpm-4.4.x/rpm-4.4.2.3.tar.gz \
            file://external-tools.patch;patch=1 \
-	   file://cross_libpaths.patch;patch=1"
+	   file://cross_libpaths.patch;patch=1 \
+	   file://weakdeps.patch;patch=1;pnum=0 \
+	   file://tagsbackport.patch;patch=1;pnum=0"
 
 inherit autotools gettext
 
-- 
1.6.1.3





