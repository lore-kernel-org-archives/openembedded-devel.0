Received: from [65.182.109.77] (helo=mta8.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1MQkQQ-0006sv-Kk
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jul 2009 18:00:14 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta8.brinkster.com (Postfix) with ESMTP id C245A7156E4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2009 11:46:48 -0400 (EDT)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: 0.402
X-Spam-Level: 
X-Spam-Status: No, score=0.402 tagged_above=-10 required=5 tests=[AWL=-0.330, 
	BAYES_00=-2.599, MSGID_MULTIPLE_AT=1.449, RCVD_IN_PBL=0.905,
	RCVD_IN_SORBS_DUL=0.877, RDNS_DYNAMIC=0.1]
Received: from mta8.brinkster.com ([127.0.0.1])
	by localhost (mta8.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E7GKTzxWqxrq
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2009 11:46:43 -0400 (EDT)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta8.brinkster.com (Postfix) with ESMTP id 89AD3715CB2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2009 11:46:42 -0400 (EDT)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 14 Jul 2009 16:46:31 +0100
Message-ID: <003d01ca049a$43702c60$ca508520$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcoEmkI+jm7OrD11Tim0D//52IEsBg==
Subject: [PATCH] Fix build issue with gamin_0.1.8.bb and recent GCC/GLibC combos.
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
X-List-Received-Date: Tue, 14 Jul 2009 16:00:15 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Update gamin_0.1.8.bb to build with recent GCC and GLibC 2.8 > via addition
of configure.in patch (use AC_USE_SYSTEM_EXTENSIONS instead of
AC_ISC_POSIX).

Signed-off-by: David-John Willis <John.Willis@Distant-earth.com>
---
 recipes/gamin/files/configure_ucred.patch |   11 +++++++++++
 recipes/gamin/gamin_0.1.8.bb              |    3 ++-
 2 files changed, 13 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gamin/files/configure_ucred.patch

diff --git a/recipes/gamin/files/configure_ucred.patch
b/recipes/gamin/files/configure_ucred.patch
new file mode 100644
index 0000000..016c4df
--- /dev/null
+++ b/recipes/gamin/files/configure_ucred.patch
@@ -0,0 +1,11 @@
+--- trunk/configure.in	2007/08/06 08:35:56	326
++++ trunk/configure.in	2008/06/03 15:34:24	330
+@@ -29,7 +29,7 @@
+ 
+ AM_PROG_LIBTOOL
+ 
+-AC_ISC_POSIX
++AC_USE_SYSTEM_EXTENSIONS
+ AC_PROG_CC
+ AM_PROG_CC_STDC
+ AC_HEADER_STDC
diff --git a/recipes/gamin/gamin_0.1.8.bb b/recipes/gamin/gamin_0.1.8.bb
index 754f47d..2f35392
--- a/recipes/gamin/gamin_0.1.8.bb
+++ b/recipes/gamin/gamin_0.1.8.bb
@@ -2,7 +2,8 @@ DESCRIPTION = "Gamin is a file and directory monitoring
system defined to be a s
 LICENSE = "LGPL"
 
 SRC_URI = "http://www.gnome.org/~veillard/gamin/sources/gamin-${PV}.tar.gz
\
-           file://no-abstract-sockets.patch;patch=1"
+           file://no-abstract-sockets.patch;patch=1 \
+           file://configure_ucred.patch;patch=1"
 
 EXTRA_OECONF = " --without-python " 
 
-- 
1.6.3.1





