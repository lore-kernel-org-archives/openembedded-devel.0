Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF58CC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 16:35:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.51301.1643733316200928717
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 08:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2347113E
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4832E3F40C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:15 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/14] mailx: remove
Date: Tue,  1 Feb 2022 16:35:05 +0000
Message-Id: <20220201163507.1320861-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201163507.1320861-1-ross.burton@arm.com>
References: <20220201163507.1320861-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 16:35:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95197

Heirloom Mailx hasn't been maintained for some time: the last release
on their web site was 11.25 in 2005 and Debian shipped 12.5 in 2016, but
this appears to be a Debian-specific fork which is also now dead.

Now that we have s-nail, we can drop mailx.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |   1 -
 ...k-symbol-optopt-to-fix-FTBFS-on-mips.patch |  59 ---------
 .../files/0001-support-openssl-1.1.x.patch    |  72 -----------
 ...-support-since-it-is-no-longer-suppo.patch |  41 -------
 ...-warning-warning-macro-N-not-defined.patch |  25 ----
 ...0011-outof-Introduce-expandaddr-flag.patch |  71 -----------
 ...ption-processing-for-email-addresses.patch |  79 ------------
 ...onditionally-require-wordexp-support.patch | 113 ------------------
 ...bname-Invoke-wordexp-with-WRDE_NOCMD.patch |  31 -----
 .../mailx/files/0015-usr-sbin-sendmail.patch  |  38 ------
 .../explicitly.disable.krb5.support.patch     |  46 -------
 .../recipes-extended/mailx/mailx_12.5-5.bb    |  54 ---------
 12 files changed, 630 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mailx/files/0001-Don-t-reuse=
-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
 delete mode 100644 meta-oe/recipes-extended/mailx/files/0001-support-ope=
nssl-1.1.x.patch
 delete mode 100644 meta-oe/recipes-extended/mailx/files/0002-Patched-out=
-SSL2-support-since-it-is-no-longer-suppo.patch
 delete mode 100644 meta-oe/recipes-extended/mailx/files/0003-Fixed-Linti=
an-warning-warning-macro-N-not-defined.patch
 delete mode 100644 meta-oe/recipes-extended/mailx/files/0011-outof-Intro=
duce-expandaddr-flag.patch
 delete mode 100644 meta-oe/recipes-extended/mailx/files/0012-unpack-Disa=
ble-option-processing-for-email-addresses.patch
 delete mode 100644 meta-oe/recipes-extended/mailx/files/0013-fio.c-Uncon=
ditionally-require-wordexp-support.patch
 delete mode 100644 meta-oe/recipes-extended/mailx/files/0014-globname-In=
voke-wordexp-with-WRDE_NOCMD.patch
 delete mode 100644 meta-oe/recipes-extended/mailx/files/0015-usr-sbin-se=
ndmail.patch
 delete mode 100644 meta-oe/recipes-extended/mailx/files/explicitly.disab=
le.krb5.support.patch
 delete mode 100644 meta-oe/recipes-extended/mailx/mailx_12.5-5.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index de7239287c..e14ca405ca 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -409,7 +409,6 @@ RDEPENDS:packagegroup-meta-oe-extended =3D"\
     libstatgrab \
     lockfile-progs \
     logwatch \
-    mailx \
     mraa \
     ostree \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-plugin-ccreds pa=
m-plugin-ldapdb pam-ssh-agent-auth", "", d)} \
diff --git a/meta-oe/recipes-extended/mailx/files/0001-Don-t-reuse-weak-s=
ymbol-optopt-to-fix-FTBFS-on-mips.patch b/meta-oe/recipes-extended/mailx/=
files/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
deleted file mode 100644
index 77da33321d..0000000000
--- a/meta-oe/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symbol-o=
ptopt-to-fix-FTBFS-on-mips.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From: Luk Claes <luk@debian.org>
-Date: Sat, 4 Jul 2009 10:54:53 +0200
-Subject: Don't reuse weak symbol optopt to fix FTBFS on mips*
-
-This patch is taken from=20
-ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12=
.5-5.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
----
- getopt.c |   10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/getopt.c b/getopt.c
-index 83ce628..82e983c 100644
---- a/getopt.c
-+++ b/getopt.c
-@@ -43,7 +43,7 @@ typedef	int	ssize_t;
- char	*optarg;
- int	optind =3D 1;
- int	opterr =3D 1;
--int	optopt;
-+int	optoptc;
-=20
- static void
- error(const char *s, int c)
-@@ -69,7 +69,7 @@ error(const char *s, int c)
- 		*bp++ =3D *s++;
- 	while (*msg)
- 		*bp++ =3D *msg++;
--	*bp++ =3D optopt;
-+	*bp++ =3D optoptc;
- 	*bp++ =3D '\n';
- 	write(2, buf, bp - buf);
- 	ac_free(buf);
-@@ -101,13 +101,13 @@ getopt(int argc, char *const argv[], const char *o=
ptstring)
- 		}
- 		curp =3D &argv[optind][1];
- 	}
--	optopt =3D curp[0] & 0377;
-+	optoptc =3D curp[0] & 0377;
- 	while (optstring[0]) {
- 		if (optstring[0] =3D=3D ':') {
- 			optstring++;
- 			continue;
- 		}
--		if ((optstring[0] & 0377) =3D=3D optopt) {
-+		if ((optstring[0] & 0377) =3D=3D optoptc) {
- 			if (optstring[1] =3D=3D ':') {
- 				if (curp[1] !=3D '\0') {
- 					optarg =3D (char *)&curp[1];
-@@ -127,7 +127,7 @@ getopt(int argc, char *const argv[], const char *opt=
string)
- 					optind++;
- 				optarg =3D 0;
- 			}
--			return optopt;
-+			return optoptc;
- 		}
- 		optstring++;
- 	}
diff --git a/meta-oe/recipes-extended/mailx/files/0001-support-openssl-1.=
1.x.patch b/meta-oe/recipes-extended/mailx/files/0001-support-openssl-1.1=
.x.patch
deleted file mode 100644
index 6a8911daf7..0000000000
--- a/meta-oe/recipes-extended/mailx/files/0001-support-openssl-1.1.x.pat=
ch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 7db6d8a657d13bb562a27c6181accaf3e53c0efd Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 25 Sep 2018 14:03:10 +0800
-Subject: [PATCH] support openssl 1.1.x
-
-Long time no maintain from upstream since 2013-06-04
-(https://sourceforge.net/projects/nail/), backport a
-fix from openSUSE
-
-Upstream-Status: Backport [openSUSE]
-https://build.opensuse.org/package/view_file/openSUSE:Leap:15.0/mailx/ma=
ilx-12.5-openssl-1.1.0f.patch?expand=3D1
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- openssl.c | 25 ++++++++++++++++++++++++-
- 1 file changed, 24 insertions(+), 1 deletion(-)
-
-diff --git a/openssl.c b/openssl.c
-index 44fe4e5..0ccc517 100644
---- a/openssl.c
-+++ b/openssl.c
-@@ -137,7 +137,12 @@ ssl_rand_init(void)
-=20
- 	if ((cp =3D value("ssl-rand-egd")) !=3D NULL) {
- 		cp =3D expand(cp);
--		if (RAND_egd(cp) =3D=3D -1) {
-+#ifndef OPENSSL_NO_EGD
-+		if (RAND_egd(cp) =3D=3D -1)
-+#else
-+		if (1)
-+#endif
-+		{
- 			fprintf(stderr, catgets(catd, CATSET, 245,
- 				"entropy daemon at \"%s\" not available\n"),
- 					cp);
-@@ -216,6 +221,7 @@ ssl_select_method(const char *uhp)
-=20
- 	cp =3D ssl_method_string(uhp);
- 	if (cp !=3D NULL) {
-+#if defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x10100=
06fL
- 		if (equal(cp, "ssl3"))
- 			method =3D SSLv3_client_method();
- 		else if (equal(cp, "tls1"))
-@@ -225,8 +231,25 @@ ssl_select_method(const char *uhp)
- 					"Invalid SSL method \"%s\"\n"), cp);
- 			method =3D SSLv23_client_method();
- 		}
-+#else
-+		method =3D NULL;
-+		if (equal(cp, "tls"))
-+			method =3D TLS_client_method();
-+		else if (equal(cp, "dtls"))
-+			method =3D DTLS_client_method();
-+
-+		if (!method) {
-+			fprintf(stderr, catgets(catd, CATSET, 244,
-+					"Invalid SSL method \"%s\"\n"), cp);
-+			method =3D TLS_client_method();
-+		}
-+#endif
- 	} else
-+#if defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x10100=
06fL
- 		method =3D SSLv23_client_method();
-+#else
-+		method =3D TLS_client_method();
-+#endif
- 	return method;
- }
-=20
---=20
-2.7.4
-
diff --git a/meta-oe/recipes-extended/mailx/files/0002-Patched-out-SSL2-s=
upport-since-it-is-no-longer-suppo.patch b/meta-oe/recipes-extended/mailx=
/files/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
deleted file mode 100644
index 6bad433ea6..0000000000
--- a/meta-oe/recipes-extended/mailx/files/0002-Patched-out-SSL2-support-=
since-it-is-no-longer-suppo.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From: Hilko Bengen <bengen@debian.org>
-Date: Wed, 27 Apr 2011 00:18:42 +0200
-Subject: Patched out SSL2 support since it is no longer supported by Ope=
nSSL.
-
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12=
.5-5.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
----
- mailx.1   |    2 +-
- openssl.c |    4 +---
- 2 files changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/mailx.1 b/mailx.1
-index 417ea04..a02e430 100644
---- a/mailx.1
-+++ b/mailx.1
-@@ -3575,7 +3575,7 @@ Only applicable if SSL/TLS support is built using =
OpenSSL.
- .TP
- .B ssl-method
- Selects a SSL/TLS protocol version;
--valid values are `ssl2', `ssl3', and `tls1'.
-+valid values are `ssl3', and `tls1'.
- If unset, the method is selected automatically,
- if possible.
- .TP
-diff --git a/openssl.c b/openssl.c
-index b4e33fc..44fe4e5 100644
---- a/openssl.c
-+++ b/openssl.c
-@@ -216,9 +216,7 @@ ssl_select_method(const char *uhp)
-=20
- 	cp =3D ssl_method_string(uhp);
- 	if (cp !=3D NULL) {
--		if (equal(cp, "ssl2"))
--			method =3D SSLv2_client_method();
--		else if (equal(cp, "ssl3"))
-+		if (equal(cp, "ssl3"))
- 			method =3D SSLv3_client_method();
- 		else if (equal(cp, "tls1"))
- 			method =3D TLSv1_client_method();
diff --git a/meta-oe/recipes-extended/mailx/files/0003-Fixed-Lintian-warn=
ing-warning-macro-N-not-defined.patch b/meta-oe/recipes-extended/mailx/fi=
les/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
deleted file mode 100644
index 13b73ae593..0000000000
--- a/meta-oe/recipes-extended/mailx/files/0003-Fixed-Lintian-warning-war=
ning-macro-N-not-defined.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From: Hilko Bengen <bengen@debian.org>
-Date: Sat, 14 Apr 2012 20:22:43 +0200
-Subject: Fixed Lintian warning (warning: macro `N' not defined)
-
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12=
.5-5.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
----
- mailx.1 |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mailx.1 b/mailx.1
-index a02e430..b0723bd 100644
---- a/mailx.1
-+++ b/mailx.1
-@@ -3781,7 +3781,7 @@ you could examine the first message by giving the =
command:
- .sp
- .fi
- which might cause
--.N mailx
-+.I mailx
- to respond with, for example:
- .nf
- .sp
diff --git a/meta-oe/recipes-extended/mailx/files/0011-outof-Introduce-ex=
pandaddr-flag.patch b/meta-oe/recipes-extended/mailx/files/0011-outof-Int=
roduce-expandaddr-flag.patch
deleted file mode 100644
index 13b955c4b5..0000000000
--- a/meta-oe/recipes-extended/mailx/files/0011-outof-Introduce-expandadd=
r-flag.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 9984ae5cb0ea0d61df1612b06952a61323c083d9 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 17 Nov 2014 11:13:38 +0100
-Subject: [PATCH 1/4] outof: Introduce expandaddr flag
-
-Document that address expansion is disabled unless the expandaddr
-binary option is set.
-
-This has been assigned CVE-2014-7844 for BSD mailx, but it is not
-a vulnerability in Heirloom mailx because this feature was documented.
-
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12=
.5-5.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
-CVE: CVE-2014-7844
----
- mailx.1 | 14 ++++++++++++++
- names.c |  3 +++
- 2 files changed, 17 insertions(+)
-
-diff --git a/mailx.1 b/mailx.1
-index 70a7859..22a171b 100644
---- a/mailx.1
-+++ b/mailx.1
-@@ -656,6 +656,14 @@ but any reply returned to the machine
- will have the system wide alias expanded
- as all mail goes through sendmail.
- .SS "Recipient address specifications"
-+If the
-+.I expandaddr
-+option is not set (the default), recipient addresses must be names of
-+local mailboxes or Internet mail addresses.
-+.PP
-+If the
-+.I expandaddr
-+option is set, the following rules apply:
- When an address is used to name a recipient
- (in any of To, Cc, or Bcc),
- names of local mail folders
-@@ -2391,6 +2399,12 @@ and exits immediately.
- If this option is set,
- \fImailx\fR starts even with an empty mailbox.
- .TP
-+.B expandaddr
-+Causes
-+.I mailx
-+to expand message recipient addresses, as explained in the section,
-+Recipient address specifications.
-+.TP
- .B flipr
- Exchanges the
- .I Respond
-diff --git a/names.c b/names.c
-index 66e976b..c69560f 100644
---- a/names.c
-+++ b/names.c
-@@ -268,6 +268,9 @@ outof(struct name *names, FILE *fo, struct header *h=
p)
- 	FILE *fout, *fin;
- 	int ispipe;
-=20
-+	if (value("expandaddr") =3D=3D NULL)
-+		return names;
-+
- 	top =3D names;
- 	np =3D names;
- 	time(&now);
---=20
-1.9.3
-
-
diff --git a/meta-oe/recipes-extended/mailx/files/0012-unpack-Disable-opt=
ion-processing-for-email-addresses.patch b/meta-oe/recipes-extended/mailx=
/files/0012-unpack-Disable-option-processing-for-email-addresses.patch
deleted file mode 100644
index 8cdbfd8b03..0000000000
--- a/meta-oe/recipes-extended/mailx/files/0012-unpack-Disable-option-pro=
cessing-for-email-addresses.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From e34e2ac67b80497080ebecccec40c3b61456167d Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 17 Nov 2014 11:14:06 +0100
-Subject: [PATCH 2/4] unpack: Disable option processing for email address=
es
- when calling sendmail
-
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12=
.5-5.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
----
- extern.h  | 2 +-
- names.c   | 8 ++++++--
- sendout.c | 2 +-
- 3 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/extern.h b/extern.h
-index 6b85ba0..8873fe8 100644
---- a/extern.h
-+++ b/extern.h
-@@ -396,7 +396,7 @@ struct name *outof(struct name *names, FILE *fo, str=
uct header *hp);
- int is_fileaddr(char *name);
- struct name *usermap(struct name *names);
- struct name *cat(struct name *n1, struct name *n2);
--char **unpack(struct name *np);
-+char **unpack(struct name *smopts, struct name *np);
- struct name *elide(struct name *names);
- int count(struct name *np);
- struct name *delete_alternates(struct name *np);
-diff --git a/names.c b/names.c
-index c69560f..45bbaed 100644
---- a/names.c
-+++ b/names.c
-@@ -549,7 +549,7 @@ cat(struct name *n1, struct name *n2)
-  * Return an error if the name list won't fit.
-  */
- char **
--unpack(struct name *np)
-+unpack(struct name *smopts, struct name *np)
- {
- 	char **ap, **top;
- 	struct name *n;
-@@ -564,7 +564,7 @@ unpack(struct name *np)
- 	 * the terminating 0 pointer.  Additional spots may be needed
- 	 * to pass along -f to the host mailer.
- 	 */
--	extra =3D 2;
-+	extra =3D 3 + count(smopts);
- 	extra++;
- 	metoo =3D value("metoo") !=3D NULL;
- 	if (metoo)
-@@ -581,6 +581,10 @@ unpack(struct name *np)
- 		*ap++ =3D "-m";
- 	if (verbose)
- 		*ap++ =3D "-v";
-+	for (; smopts !=3D NULL; smopts =3D smopts->n_flink)
-+		if ((smopts->n_type & GDEL) =3D=3D 0)
-+			*ap++ =3D smopts->n_name;
-+	*ap++ =3D "--";
- 	for (; n !=3D NULL; n =3D n->n_flink)
- 		if ((n->n_type & GDEL) =3D=3D 0)
- 			*ap++ =3D n->n_name;
-diff --git a/sendout.c b/sendout.c
-index 7b7f2eb..c52f15d 100644
---- a/sendout.c
-+++ b/sendout.c
-@@ -835,7 +835,7 @@ start_mta(struct name *to, struct name *mailargs, FI=
LE *input,
- #endif	/* HAVE_SOCKETS */
-=20
- 	if ((smtp =3D value("smtp")) =3D=3D NULL) {
--		args =3D unpack(cat(mailargs, to));
-+		args =3D unpack(mailargs, to);
- 		if (debug || value("debug")) {
- 			printf(catgets(catd, CATSET, 181,
- 					"Sendmail arguments:"));
---=20
-1.9.3
-
-
diff --git a/meta-oe/recipes-extended/mailx/files/0013-fio.c-Unconditiona=
lly-require-wordexp-support.patch b/meta-oe/recipes-extended/mailx/files/=
0013-fio.c-Unconditionally-require-wordexp-support.patch
deleted file mode 100644
index 5558d8639f..0000000000
--- a/meta-oe/recipes-extended/mailx/files/0013-fio.c-Unconditionally-req=
uire-wordexp-support.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 2bae8ecf04ec2ba6bb9f0af5b80485dd0edb427d Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 17 Nov 2014 12:48:25 +0100
-Subject: [PATCH 3/4] fio.c: Unconditionally require wordexp support
-
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12=
.5-5.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
----
- fio.c | 67 +++++-------------------------------------------------------=
-------
- 1 file changed, 5 insertions(+), 62 deletions(-)
-
-diff --git a/fio.c b/fio.c
-index 65e8f10..1529236 100644
---- a/fio.c
-+++ b/fio.c
-@@ -43,12 +43,15 @@ static char sccsid[] =3D "@(#)fio.c	2.76 (gritter) 9=
/16/09";
- #endif /* not lint */
-=20
- #include "rcv.h"
-+
-+#ifndef HAVE_WORDEXP
-+#error wordexp support is required
-+#endif
-+
- #include <sys/stat.h>
- #include <sys/file.h>
- #include <sys/wait.h>
--#ifdef	HAVE_WORDEXP
- #include <wordexp.h>
--#endif	/* HAVE_WORDEXP */
- #include <unistd.h>
-=20
- #if defined (USE_NSS)
-@@ -481,7 +484,6 @@ next:
- static char *
- globname(char *name)
- {
--#ifdef	HAVE_WORDEXP
- 	wordexp_t we;
- 	char *cp;
- 	sigset_t nset;
-@@ -527,65 +529,6 @@ globname(char *name)
- 	}
- 	wordfree(&we);
- 	return cp;
--#else	/* !HAVE_WORDEXP */
--	char xname[PATHSIZE];
--	char cmdbuf[PATHSIZE];		/* also used for file names */
--	int pid, l;
--	char *cp, *shell;
--	int pivec[2];
--	extern int wait_status;
--	struct stat sbuf;
--
--	if (pipe(pivec) < 0) {
--		perror("pipe");
--		return name;
--	}
--	snprintf(cmdbuf, sizeof cmdbuf, "echo %s", name);
--	if ((shell =3D value("SHELL")) =3D=3D NULL)
--		shell =3D SHELL;
--	pid =3D start_command(shell, 0, -1, pivec[1], "-c", cmdbuf, NULL);
--	if (pid < 0) {
--		close(pivec[0]);
--		close(pivec[1]);
--		return NULL;
--	}
--	close(pivec[1]);
--again:
--	l =3D read(pivec[0], xname, sizeof xname);
--	if (l < 0) {
--		if (errno =3D=3D EINTR)
--			goto again;
--		perror("read");
--		close(pivec[0]);
--		return NULL;
--	}
--	close(pivec[0]);
--	if (wait_child(pid) < 0 && WTERMSIG(wait_status) !=3D SIGPIPE) {
--		fprintf(stderr, catgets(catd, CATSET, 81,
--				"\"%s\": Expansion failed.\n"), name);
--		return NULL;
--	}
--	if (l =3D=3D 0) {
--		fprintf(stderr, catgets(catd, CATSET, 82,
--					"\"%s\": No match.\n"), name);
--		return NULL;
--	}
--	if (l =3D=3D sizeof xname) {
--		fprintf(stderr, catgets(catd, CATSET, 83,
--				"\"%s\": Expansion buffer overflow.\n"), name);
--		return NULL;
--	}
--	xname[l] =3D 0;
--	for (cp =3D &xname[l-1]; *cp =3D=3D '\n' && cp > xname; cp--)
--		;
--	cp[1] =3D '\0';
--	if (strchr(xname, ' ') && stat(xname, &sbuf) < 0) {
--		fprintf(stderr, catgets(catd, CATSET, 84,
--				"\"%s\": Ambiguous.\n"), name);
--		return NULL;
--	}
--	return savestr(xname);
--#endif	/* !HAVE_WORDEXP */
- }
-=20
- /*
---=20
-1.9.3
-
-
diff --git a/meta-oe/recipes-extended/mailx/files/0014-globname-Invoke-wo=
rdexp-with-WRDE_NOCMD.patch b/meta-oe/recipes-extended/mailx/files/0014-g=
lobname-Invoke-wordexp-with-WRDE_NOCMD.patch
deleted file mode 100644
index ae14b8acfe..0000000000
--- a/meta-oe/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-w=
ith-WRDE_NOCMD.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 73fefa0c1ac70043ec84f2d8b8f9f683213f168d Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 17 Nov 2014 13:11:32 +0100
-Subject: [PATCH 4/4] globname: Invoke wordexp with WRDE_NOCMD (CVE-2004-=
2771)
-
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12=
.5-5.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
-CVE: CVE-2004-2771
----
- fio.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/fio.c b/fio.c
-index 1529236..774a204 100644
---- a/fio.c
-+++ b/fio.c
-@@ -497,7 +497,7 @@ globname(char *name)
- 	sigemptyset(&nset);
- 	sigaddset(&nset, SIGCHLD);
- 	sigprocmask(SIG_BLOCK, &nset, NULL);
--	i =3D wordexp(name, &we, 0);
-+	i =3D wordexp(name, &we, WRDE_NOCMD);
- 	sigprocmask(SIG_UNBLOCK, &nset, NULL);
- 	switch (i) {
- 	case 0:
---=20
-1.9.3
-
-
diff --git a/meta-oe/recipes-extended/mailx/files/0015-usr-sbin-sendmail.=
patch b/meta-oe/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch
deleted file mode 100644
index 2b5991425b..0000000000
--- a/meta-oe/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Description: Sendmail is at /usr/sbin/sendmail
- As per Debian Policy =C2=A711.6
-Author: Ryan Kavanagh <rak@debian.org>
-Origin: Debian
-Forwarded: no
----
-This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
-Index: heirloom-mailx-12.5/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12=
.5-5.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
-
---- heirloom-mailx-12.5.orig/Makefile	2011-04-26 17:23:22.000000000 -040=
0
-+++ heirloom-mailx-12.5/Makefile	2015-01-27 13:20:04.733542801 -0500
-@@ -13,7 +13,7 @@
-=20
- MAILRC		=3D $(SYSCONFDIR)/nail.rc
- MAILSPOOL	=3D /var/mail
--SENDMAIL	=3D /usr/lib/sendmail
-+SENDMAIL	=3D /usr/sbin/sendmail
-=20
- DESTDIR		=3D
-=20
-Index: heirloom-mailx-12.5/mailx.1
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- heirloom-mailx-12.5.orig/mailx.1	2015-01-27 13:18:49.000000000 -0500
-+++ heirloom-mailx-12.5/mailx.1	2015-01-27 13:20:32.382336867 -0500
-@@ -4922,7 +4922,7 @@
- which just acts as a proxy.
- .PP
- \fIMailx\fR immediately contacts the SMTP server (or
--.IR \%/usr/lib/sendmail )
-+.IR \%/usr/sbin/sendmail )
- even when operating in
- .I disconnected
- mode.
diff --git a/meta-oe/recipes-extended/mailx/files/explicitly.disable.krb5=
.support.patch b/meta-oe/recipes-extended/mailx/files/explicitly.disable.=
krb5.support.patch
deleted file mode 100644
index b74fd0472e..0000000000
--- a/meta-oe/recipes-extended/mailx/files/explicitly.disable.krb5.suppor=
t.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-krb5 support is autodetected from sysroot making builds undeterministic
-feel free to improve this to support explicitly enabling/disabling it
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
---- a/makeconfig	2013-07-21 15:06:11.177792334 +0200
-+++ b/makeconfig	2013-07-21 15:07:20.028793994 +0200
-@@ -424,36 +424,6 @@
- }
- !
-=20
--<$tmp2.c link_check gssapi 'for GSSAPI in libgss' \
--		'#define USE_GSSAPI' '-lgss' ||
--	<$tmp2.c link_check gssapi 'for GSSAPI in libgssapi_krb5' \
--			'#define USE_GSSAPI' '-lgssapi_krb5' ||
--		link_check gssapi 'for GSSAPI in libgssapi_krb5, old-style' \
--				'#define USE_GSSAPI
--#define GSSAPI_OLD_STYLE' '-lgssapi_krb5' <<\! || \
--			link_check gssapi 'for GSSAPI in libgssapi' \
--				'#define USE_GSSAPI
--#define	GSSAPI_REG_INCLUDE' '-lgssapi' <<\%
--#include <gssapi/gssapi.h>
--#include <gssapi/gssapi_generic.h>
--
--int main(void)
--{
--	gss_import_name(0, 0, gss_nt_service_name, 0);
--	gss_init_sec_context(0,0,0,0,0,0,0,0,0,0,0,0,0);
--	return 0;
--}
--!
--#include <gssapi.h>
--
--int main(void)
--{
--	gss_import_name(0, 0, GSS_C_NT_HOSTBASED_SERVICE, 0);
--	gss_init_sec_context(0,0,0,0,0,0,0,0,0,0,0,0,0);
--	return 0;
--}
--%
--
- cat >$tmp2.c <<\!
- #include "config.h"
- #ifdef HAVE_NL_LANGINFO
diff --git a/meta-oe/recipes-extended/mailx/mailx_12.5-5.bb b/meta-oe/rec=
ipes-extended/mailx/mailx_12.5-5.bb
deleted file mode 100644
index dbf5d59d18..0000000000
--- a/meta-oe/recipes-extended/mailx/mailx_12.5-5.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-SUMMARY =3D "mailx is the traditional command-line-mode mail user agent"
-
-DESCRIPTION =3D "Mailx is derived from Berkeley Mail and is intended pro=
vide the \
-functionality of the POSIX mailx command with additional support \
-for MIME, IMAP, POP3, SMTP, and S/MIME."
-
-HOMEPAGE =3D "http://heirloom.sourceforge.net/mailx.html"
-SECTION =3D "console/network"
-LICENSE =3D "BSD & MPL-1"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4202a0a62910cf94f7af8a3436a2a=
2dd"
-
-DEPENDS =3D "openssl"
-
-SRC_URI =3D "http://snapshot.debian.org/archive/debian/20160728T043443Z/=
pool/main/h/heirloom-mailx/heirloom-mailx_12.5.orig.tar.gz;name=3Darchive=
 \
-           file://0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mi=
ps.patch \
-           file://0002-Patched-out-SSL2-support-since-it-is-no-longer-su=
ppo.patch \
-           file://0003-Fixed-Lintian-warning-warning-macro-N-not-defined=
.patch \
-           file://0011-outof-Introduce-expandaddr-flag.patch \
-           file://0012-unpack-Disable-option-processing-for-email-addres=
ses.patch \
-           file://0013-fio.c-Unconditionally-require-wordexp-support.pat=
ch \
-           file://0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch \
-           file://0015-usr-sbin-sendmail.patch \
-           file://explicitly.disable.krb5.support.patch \
-           file://0001-support-openssl-1.1.x.patch \
-          "
-
-SRC_URI[archive.md5sum] =3D "29a6033ef1412824d02eb9d9213cb1f2"
-SRC_URI[archive.sha256sum] =3D "015ba4209135867f37a0245d22235a392b8bbed9=
56913286b887c2e2a9a421ad"
-
-# for this package we're mostly interested in tracking debian patches,
-# and not in the upstream version where all development has effectively =
stopped
-UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/h/heirloom-mailx/"
-UPSTREAM_CHECK_REGEX =3D "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debia=
n\.tar)\.(gz|xz)"
-
-S =3D "${WORKDIR}/heirloom-mailx-12.5"
-
-inherit autotools-brokensep
-
-CFLAGS:append =3D " -D_BSD_SOURCE -DDEBIAN -I${S}/EXT"
-
-# "STRIP=3Dtrue" means that 'true' command will be used to 'strip' files=
 which will achieve the effect of not stripping them
-# mailx's Makefile doesn't allow a more straightforward way to avoid str=
ipping
-EXTRA_OEMAKE =3D "SENDMAIL=3D${sbindir}/sendmail IPv6=3D-DHAVE_IPv6_FUNC=
S PREFIX=3D/usr UCBINSTALL=3D/usr/bin/install STRIP=3Dtrue"
-
-# The makeconfig can't run parallelly, otherwise the checking results
-# might be incorrect and lead to errors:
-# fio.c:56:17: fatal error: ssl.h: No such file or directory
-# #include <ssl.h>
-PARALLEL_MAKE =3D ""
-
-# Causes gcc to get stuck and eat all available memory in qemuarm builds
-# http://errors.yoctoproject.org/Errors/Details/20488/
-ARM_INSTRUCTION_SET:armv4 =3D "arm"
-ARM_INSTRUCTION_SET:armv5 =3D "arm"
--=20
2.25.1


