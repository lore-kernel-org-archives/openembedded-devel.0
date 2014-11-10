Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1451465CED
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 01:41:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43106140"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Nov 2014 09:27:42 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAA1UgjS020119
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 09:30:42 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 10 Nov 2014 09:30:58 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 10 Nov 2014 09:29:46 +0800
Message-ID: <1415582986-1997-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [PATCH] pam_passwdqc: new recipe
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
X-List-Received-Date: Mon, 10 Nov 2014 01:41:55 -0000
Content-Type: text/plain

pam_passwdqc is a simple password strength checking module for
PAM-aware password changing programs, such as passwd(1).

It is capable of checking password or passphrase strength,enforcing
a policy, and offering randomly-generated passphrases,with all of
these features being optional and easily (re-)configurable.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../pam-passwdqc/files/1000patch-219201.patch      | 156 +++++++++++++++++++++
 .../pam-passwdqc/files/7000Makefile-fix-CC.patch   |  11 ++
 .../pam-passwdqc/pam-passwdqc_1.0.5.bb             |  34 +++++
 3 files changed, 201 insertions(+)
 create mode 100644 meta-oe/recipes-support/pam-passwdqc/files/1000patch-219201.patch
 create mode 100644 meta-oe/recipes-support/pam-passwdqc/files/7000Makefile-fix-CC.patch
 create mode 100644 meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb

diff --git a/meta-oe/recipes-support/pam-passwdqc/files/1000patch-219201.patch b/meta-oe/recipes-support/pam-passwdqc/files/1000patch-219201.patch
new file mode 100644
index 0000000..366d461
--- /dev/null
+++ b/meta-oe/recipes-support/pam-passwdqc/files/1000patch-219201.patch
@@ -0,0 +1,156 @@
+diff -urNp pam_passwdqc-1.0.5-orig/pam_passwdqc.c pam_passwdqc-1.0.5/pam_passwdqc.c
+--- pam_passwdqc-1.0.5-orig/pam_passwdqc.c	2008-02-12 15:11:13.000000000 -0500
++++ pam_passwdqc-1.0.5/pam_passwdqc.c	2009-09-28 12:10:32.171696694 -0400
+@@ -70,6 +70,8 @@ typedef struct {
+ 	passwdqc_params_t qc;
+ 	int flags;
+ 	int retry;
++	char oldpass_prompt_file[FILE_LEN+1];
++	char newpass_prompt_file[FILE_LEN+1];
+ } params_t;
+ 
+ static params_t defaults = {
+@@ -79,10 +81,13 @@ static params_t defaults = {
+ 		3,				/* passphrase_words */
+ 		4,				/* match_length */
+ 		1,				/* similar_deny */
+-		42				/* random_bits */
++		42,				/* random_bits */
++		1				/* firstupper_lastdigit_check */
+ 	},
+ 	F_ENFORCE_EVERYONE,			/* flags */
+-	3					/* retry */
++	3,					/* retry */
++	"",					/* oldpass_prompt_file */
++	""					/* newpass_prompt_file */
+ };
+ 
+ #define PROMPT_OLDPASS \
+@@ -361,6 +366,37 @@ static int parse(params_t *params, pam_h
+ 		if (!strcmp(*argv, "use_authtok")) {
+ 			params->flags |= F_USE_AUTHTOK;
+ 		} else
++		if (!strcmp(*argv, "disable_firstupper_lastdigit_check")) {
++			params->qc.firstupper_lastdigit_check = 0;
++		} else
++		if (!strncmp(*argv, "oldpass_prompt_file=", 20)) {
++			int n;
++			FILE *fp = fopen(*argv + 20, "r");
++			if (fp) {
++				n=fread(params->oldpass_prompt_file, sizeof(char), FILE_LEN, fp);
++				if (0==n || ferror(fp)!=0 ) {
++					memset(params->oldpass_prompt_file, '\0', FILE_LEN+1);
++				}
++				else {
++					feof(fp)? (params->oldpass_prompt_file[n-1]='\0'): (params->oldpass_prompt_file[n]='\0');
++				}
++				fclose(fp);
++			}
++		} else
++		if (!strncmp(*argv, "newpass_prompt_file=", 20)) {
++			int n;
++			FILE *fp = fopen(*argv + 20, "r");
++			if (fp) {
++				n=fread(params->newpass_prompt_file, sizeof(char), FILE_LEN, fp);
++				if (0==n || ferror(fp)!=0 ) {
++					memset(params->newpass_prompt_file, '\0', FILE_LEN+1);
++				}
++				else {
++                                        feof(fp)? (params->newpass_prompt_file[n-1]='\0'): (params->newpass_prompt_file[n]='\0');
++				}
++				fclose(fp);
++			}
++		} else
+ 			break;
+ 		argc--; argv++;
+ 	}
+@@ -406,7 +442,7 @@ PAM_EXTERN int pam_sm_chauthtok(pam_hand
+ 
+ 	if (ask_oldauthtok && !am_root(pamh)) {
+ 		status = converse(pamh, PAM_PROMPT_ECHO_OFF,
+-		    PROMPT_OLDPASS, &resp);
++		    strlen(params.oldpass_prompt_file) ? params.oldpass_prompt_file : PROMPT_OLDPASS, &resp);
+ 
+ 		if (status == PAM_SUCCESS) {
+ 			if (resp && resp->resp) {
+@@ -540,8 +576,7 @@ retry:
+ 		    MESSAGE_RANDOMFAILED : MESSAGE_MISCONFIGURED);
+ 		return PAM_AUTHTOK_ERR;
+ 	}
+-
+-	status = converse(pamh, PAM_PROMPT_ECHO_OFF, PROMPT_NEWPASS1, &resp);
++	status = converse(pamh, PAM_PROMPT_ECHO_OFF, strlen(params.newpass_prompt_file) ? params.newpass_prompt_file : PROMPT_NEWPASS1, &resp);
+ 	if (status == PAM_SUCCESS && (!resp || !resp->resp))
+ 		status = PAM_AUTHTOK_ERR;
+ 
+diff -urNp pam_passwdqc-1.0.5-orig/passwdqc_check.c pam_passwdqc-1.0.5/passwdqc_check.c
+--- pam_passwdqc-1.0.5-orig/passwdqc_check.c	2008-02-12 14:31:52.000000000 -0500
++++ pam_passwdqc-1.0.5/passwdqc_check.c	2009-09-25 22:45:16.080842425 -0400
+@@ -90,10 +90,12 @@ static int is_simple(passwdqc_params_t *
+ 
+ /* Upper case characters and digits used in common ways don't increase the
+  * strength of a password */
+-	c = (unsigned char)newpass[0];
+-	if (uppers && isascii(c) && isupper(c)) uppers--;
+-	c = (unsigned char)newpass[length - 1];
+-	if (digits && isascii(c) && isdigit(c)) digits--;
++	if (params->firstupper_lastdigit_check) {
++		c = (unsigned char)newpass[0];
++		if (uppers && isascii(c) && isupper(c)) uppers--;
++		c = (unsigned char)newpass[length - 1];
++		if (digits && isascii(c) && isdigit(c)) digits--;
++	}
+ 
+ /* Count the number of different character classes we've seen.  We assume
+  * that there are no non-ASCII characters for digits. */
+diff -urNp pam_passwdqc-1.0.5-orig/passwdqc.h pam_passwdqc-1.0.5/passwdqc.h
+--- pam_passwdqc-1.0.5-orig/passwdqc.h	2008-02-12 14:30:00.000000000 -0500
++++ pam_passwdqc-1.0.5/passwdqc.h	2009-09-25 14:08:56.214695858 -0400
+@@ -7,12 +7,15 @@
+ 
+ #include <pwd.h>
+ 
++#define FILE_LEN		4096	/* Max file len = 4096 */
++
+ typedef struct {
+ 	int min[5], max;
+ 	int passphrase_words;
+ 	int match_length;
+ 	int similar_deny;
+ 	int random_bits;
++	int firstupper_lastdigit_check;
+ } passwdqc_params_t;
+ 
+ extern char _passwdqc_wordset_4k[0x1000][6];
+diff -urNp pam_passwdqc-1.0.5-orig/README pam_passwdqc-1.0.5/README
+--- pam_passwdqc-1.0.5-orig/README	2008-02-12 14:43:33.000000000 -0500
++++ pam_passwdqc-1.0.5/README	2009-09-28 12:12:40.251016423 -0400
+@@ -41,9 +41,12 @@ words (see the "passphrase" option below
+ N3 and N4 are used for passwords consisting of characters from three
+ and four character classes, respectively.
+ 
++	disable_firstupper_lastdigit_check	[]
++
+ When calculating the number of character classes, upper-case letters
+ used as the first character and digits used as the last character of a
+-password are not counted.
++password are not counted. To disable this, you can specify 
++"disable_firstupper_lastdigit_check".
+ 
+ In addition to being sufficiently long, passwords are required to
+ contain enough different characters for the character classes and
+@@ -142,6 +145,14 @@ This disables user interaction within pa
+ the only difference between "use_first_pass" and "use_authtok" is that
+ the former is incompatible with "ask_oldauthtok".
+ 
++	oldpass_prompt_file=absolute-file-path	[]
++	newpass_prompt_file=abosulte-file-path	[]
++
++The options "oldpass_prompt_file" and "newpass_prompt_file" can be used
++to override prompts while requesting old password and new password, 
++respectively. The maximum size of the prompt files can be 4096 
++characters at present. If the file size is more than 4096 characters, the
++output will be truncated to 4096 characters.
+ -- 
+ Solar Designer <solar at openwall.com>
+ 
diff --git a/meta-oe/recipes-support/pam-passwdqc/files/7000Makefile-fix-CC.patch b/meta-oe/recipes-support/pam-passwdqc/files/7000Makefile-fix-CC.patch
new file mode 100644
index 0000000..536fba1
--- /dev/null
+++ b/meta-oe/recipes-support/pam-passwdqc/files/7000Makefile-fix-CC.patch
@@ -0,0 +1,11 @@
+--- pam_passwdqc-1.0.5/Makefile.orig	2012-10-02 20:53:55.443592886 +0900
++++ pam_passwdqc-1.0.5/Makefile	2012-10-02 20:54:19.076108001 +0900
+@@ -2,7 +2,7 @@
+ # Copyright (c) 2000-2003,2005 by Solar Designer.  See LICENSE.
+ #
+ 
+-CC = gcc
++#CC = gcc
+ LD = $(CC)
+ RM = rm -f
+ MKDIR = mkdir -p
diff --git a/meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb b/meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb
new file mode 100644
index 0000000..4add367
--- /dev/null
+++ b/meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Pluggable password quality-control module."
+DESCRIPTION = "pam_passwdqc is a simple password strength checking module for \
+PAM-aware password changing programs, such as passwd(1). In addition \
+to checking regular passwords, it offers support for passphrases and \
+can provide randomly generated passwords. All features are optional \
+and can be (re-)configured without rebuilding."
+
+HOMEPAGE = "http://www.openwall.com/passwdqc/"
+SECTION = "System Environment/Base"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e284d013ef08e66d4737f446c5890550"
+
+SRC_URI = "http://www.openwall.com/pam/modules/pam_passwdqc/pam_passwdqc-1.0.5.tar.gz \
+           file://1000patch-219201.patch \
+           file://7000Makefile-fix-CC.patch \
+          "
+SRC_URI[md5sum] = "cd9c014f736158b1a60384a8e2bdc28a"
+SRC_URI[sha256sum] = "32528ddf7d8219c788b6e7702361611ff16c6340b6dc0f418ff164aadc4a4a88"
+
+
+S = "${WORKDIR}/pam_passwdqc-${PV}"
+
+DEPENDS = "libpam"
+
+EXTRA_OEMAKE = "CFLAGS="${CFLAGS} -Wall -fPIC -DHAVE_SHADOW""
+
+do_install() {
+	oe_runmake install DESTDIR=${D}
+}
+
+FILES_${PN} += "/lib/security/pam_passwdqc.so"
+FILES_${PN}-dbg += "/lib/security/.debug"
+
-- 
1.8.4.2


