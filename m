Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GWndp-0004fs-0x for openembedded-devel@lists.openembedded.org;
	Mon, 09 Oct 2006 07:25:29 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id A94B840654F; Sun,  8 Oct 2006 21:53:12 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061009045312.A94B840654F@tinman.treke.net>
Date: Sun,  8 Oct 2006 21:53:12 -0700 (PDT)
Subject: [Bug 1462] New: sudo 1.6.8p12 failed to configure on Powerpc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2006 05:25:29 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1462

           Summary: sudo 1.6.8p12 failed to configure on Powerpc
           Product: Openembedded
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: m3l3m01t@gmail.com
         QAContact: tinderbox-oe@gmx.net


the "configure" script generated is invalid. it's caused by "SUDO_LONG_LONG"
defined in aclocal.m4

see following patch file:

Index: sudo-1.6.8p12/aclocal.m4
===================================================================
--- sudo-1.6.8p12.orig/aclocal.m4
+++ sudo-1.6.8p12/aclocal.m4
@@ -304,15 +304,23 @@ dnl check for "long long"
 dnl XXX hard to cache since it includes 2 tests
 dnl

-AC_DEFUN([SUDO_LONG_LONG], [AC_MSG_CHECKING(for long long support)
-AC_LINK_IFELSE([long long foo = 1000; foo /= 10;],
-       AC_DEFINE(HAVE_LONG_LONG, 1, [Define if your compiler supports the
"long long" type.])
-       AC_CHECK_SIZEOF([long])
-       AC_CHECK_SIZEOF([long long])
-       if x"$ac_cv_sizeof_long" = x"$ac_cv_sizeof_long_long"; then
-           AC_DEFINE(LONG_IS_QUAD, 1, [Define if sizeof(long) == sizeof(long
long).])
-       fi
-, AC_MSG_RESULT(yes), AC_MSG_RESULT(no))])
+AC_DEFUN([SUDO_LONG_LONG],
+[
+       AC_CACHE_CHECK([for long long], ac_cv_type_long_long,
+               [AC_TRY_LINK([long long ll = 1LL; int i = 63;],
+                       [long long llmax = (long long) -1;
+                       return ll << i | ll >> i | llmax / ll | llmax % ll;],
+                       ac_cv_type_long_long=yes,
+                       ac_cv_type_long_long=no)])
+       if test $ac_cv_type_long_long = yes; then
+               AC_DEFINE(HAVE_LONG_LONG, 1, [Define if you have the 'long
long' type.])
+               AC_CHECK_SIZEOF([long])
+               AC_CHECK_SIZEOF([long long])
+               if x"$ac_cv_sizeof_long" = x"$ac_cv_sizeof_long_long"; then
+                       AC_DEFINE(LONG_IS_QUAD, 1, [Define if sizeof(long) ==
sizeof(long long).])
+               fi
+        fi
+])

 dnl
 dnl append a libpath to an LDFLAGS style variable


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


