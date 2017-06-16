Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53F587842E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 02:41:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5G2fDOw007562
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 19:41:14 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 15 Jun 2017 19:41:13 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Jun 2017 10:41:12 +0800
Message-ID: <20170616024112.13189-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] passwdqc: add new recipe and replace pam-passwdqc
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
X-List-Received-Date: Fri, 16 Jun 2017 02:41:14 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

passwdqc is a password/passphrase strength checking and policy
enforcement toolset, including an optional PAM module (pam_passwdqc),
command-line programs(pwqcheck and pwqgen), and a library(libpasswdqc).

pam_passwdqc 1.0.5 is the final version of pam_passwdqc only before
it's turned into passwdqc in 2009, so remove the pam-passwdqc recipe.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../pam-passwdqc/files/1000patch-219201.patch      | 156 ---------------------
 .../pam-passwdqc/files/7000Makefile-fix-CC.patch   |  11 --
 .../passwdqc/passwdqc/makefile-add-ldflags.patch   |  31 ++++
 .../passwdqc_1.3.1.bb}                             |  73 ++++++----
 4 files changed, 80 insertions(+), 191 deletions(-)
 delete mode 100644 meta-oe/recipes-support/pam-passwdqc/files/1000patch-219201.patch
 delete mode 100644 meta-oe/recipes-support/pam-passwdqc/files/7000Makefile-fix-CC.patch
 create mode 100644 meta-oe/recipes-support/passwdqc/passwdqc/makefile-add-ldflags.patch
 rename meta-oe/recipes-support/{pam-passwdqc/pam-passwdqc_1.0.5.bb => passwdqc/passwdqc_1.3.1.bb} (5%)

diff --git a/meta-oe/recipes-support/pam-passwdqc/files/1000patch-219201.patch b/meta-oe/recipes-support/pam-passwdqc/files/1000patch-219201.patch
deleted file mode 100644
index 366d461eb..000000000
--- a/meta-oe/recipes-support/pam-passwdqc/files/1000patch-219201.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-diff -urNp pam_passwdqc-1.0.5-orig/pam_passwdqc.c pam_passwdqc-1.0.5/pam_passwdqc.c
---- pam_passwdqc-1.0.5-orig/pam_passwdqc.c	2008-02-12 15:11:13.000000000 -0500
-+++ pam_passwdqc-1.0.5/pam_passwdqc.c	2009-09-28 12:10:32.171696694 -0400
-@@ -70,6 +70,8 @@ typedef struct {
- 	passwdqc_params_t qc;
- 	int flags;
- 	int retry;
-+	char oldpass_prompt_file[FILE_LEN+1];
-+	char newpass_prompt_file[FILE_LEN+1];
- } params_t;
- 
- static params_t defaults = {
-@@ -79,10 +81,13 @@ static params_t defaults = {
- 		3,				/* passphrase_words */
- 		4,				/* match_length */
- 		1,				/* similar_deny */
--		42				/* random_bits */
-+		42,				/* random_bits */
-+		1				/* firstupper_lastdigit_check */
- 	},
- 	F_ENFORCE_EVERYONE,			/* flags */
--	3					/* retry */
-+	3,					/* retry */
-+	"",					/* oldpass_prompt_file */
-+	""					/* newpass_prompt_file */
- };
- 
- #define PROMPT_OLDPASS \
-@@ -361,6 +366,37 @@ static int parse(params_t *params, pam_h
- 		if (!strcmp(*argv, "use_authtok")) {
- 			params->flags |= F_USE_AUTHTOK;
- 		} else
-+		if (!strcmp(*argv, "disable_firstupper_lastdigit_check")) {
-+			params->qc.firstupper_lastdigit_check = 0;
-+		} else
-+		if (!strncmp(*argv, "oldpass_prompt_file=", 20)) {
-+			int n;
-+			FILE *fp = fopen(*argv + 20, "r");
-+			if (fp) {
-+				n=fread(params->oldpass_prompt_file, sizeof(char), FILE_LEN, fp);
-+				if (0==n || ferror(fp)!=0 ) {
-+					memset(params->oldpass_prompt_file, '\0', FILE_LEN+1);
-+				}
-+				else {
-+					feof(fp)? (params->oldpass_prompt_file[n-1]='\0'): (params->oldpass_prompt_file[n]='\0');
-+				}
-+				fclose(fp);
-+			}
-+		} else
-+		if (!strncmp(*argv, "newpass_prompt_file=", 20)) {
-+			int n;
-+			FILE *fp = fopen(*argv + 20, "r");
-+			if (fp) {
-+				n=fread(params->newpass_prompt_file, sizeof(char), FILE_LEN, fp);
-+				if (0==n || ferror(fp)!=0 ) {
-+					memset(params->newpass_prompt_file, '\0', FILE_LEN+1);
-+				}
-+				else {
-+                                        feof(fp)? (params->newpass_prompt_file[n-1]='\0'): (params->newpass_prompt_file[n]='\0');
-+				}
-+				fclose(fp);
-+			}
-+		} else
- 			break;
- 		argc--; argv++;
- 	}
-@@ -406,7 +442,7 @@ PAM_EXTERN int pam_sm_chauthtok(pam_hand
- 
- 	if (ask_oldauthtok && !am_root(pamh)) {
- 		status = converse(pamh, PAM_PROMPT_ECHO_OFF,
--		    PROMPT_OLDPASS, &resp);
-+		    strlen(params.oldpass_prompt_file) ? params.oldpass_prompt_file : PROMPT_OLDPASS, &resp);
- 
- 		if (status == PAM_SUCCESS) {
- 			if (resp && resp->resp) {
-@@ -540,8 +576,7 @@ retry:
- 		    MESSAGE_RANDOMFAILED : MESSAGE_MISCONFIGURED);
- 		return PAM_AUTHTOK_ERR;
- 	}
--
--	status = converse(pamh, PAM_PROMPT_ECHO_OFF, PROMPT_NEWPASS1, &resp);
-+	status = converse(pamh, PAM_PROMPT_ECHO_OFF, strlen(params.newpass_prompt_file) ? params.newpass_prompt_file : PROMPT_NEWPASS1, &resp);
- 	if (status == PAM_SUCCESS && (!resp || !resp->resp))
- 		status = PAM_AUTHTOK_ERR;
- 
-diff -urNp pam_passwdqc-1.0.5-orig/passwdqc_check.c pam_passwdqc-1.0.5/passwdqc_check.c
---- pam_passwdqc-1.0.5-orig/passwdqc_check.c	2008-02-12 14:31:52.000000000 -0500
-+++ pam_passwdqc-1.0.5/passwdqc_check.c	2009-09-25 22:45:16.080842425 -0400
-@@ -90,10 +90,12 @@ static int is_simple(passwdqc_params_t *
- 
- /* Upper case characters and digits used in common ways don't increase the
-  * strength of a password */
--	c = (unsigned char)newpass[0];
--	if (uppers && isascii(c) && isupper(c)) uppers--;
--	c = (unsigned char)newpass[length - 1];
--	if (digits && isascii(c) && isdigit(c)) digits--;
-+	if (params->firstupper_lastdigit_check) {
-+		c = (unsigned char)newpass[0];
-+		if (uppers && isascii(c) && isupper(c)) uppers--;
-+		c = (unsigned char)newpass[length - 1];
-+		if (digits && isascii(c) && isdigit(c)) digits--;
-+	}
- 
- /* Count the number of different character classes we've seen.  We assume
-  * that there are no non-ASCII characters for digits. */
-diff -urNp pam_passwdqc-1.0.5-orig/passwdqc.h pam_passwdqc-1.0.5/passwdqc.h
---- pam_passwdqc-1.0.5-orig/passwdqc.h	2008-02-12 14:30:00.000000000 -0500
-+++ pam_passwdqc-1.0.5/passwdqc.h	2009-09-25 14:08:56.214695858 -0400
-@@ -7,12 +7,15 @@
- 
- #include <pwd.h>
- 
-+#define FILE_LEN		4096	/* Max file len = 4096 */
-+
- typedef struct {
- 	int min[5], max;
- 	int passphrase_words;
- 	int match_length;
- 	int similar_deny;
- 	int random_bits;
-+	int firstupper_lastdigit_check;
- } passwdqc_params_t;
- 
- extern char _passwdqc_wordset_4k[0x1000][6];
-diff -urNp pam_passwdqc-1.0.5-orig/README pam_passwdqc-1.0.5/README
---- pam_passwdqc-1.0.5-orig/README	2008-02-12 14:43:33.000000000 -0500
-+++ pam_passwdqc-1.0.5/README	2009-09-28 12:12:40.251016423 -0400
-@@ -41,9 +41,12 @@ words (see the "passphrase" option below
- N3 and N4 are used for passwords consisting of characters from three
- and four character classes, respectively.
- 
-+	disable_firstupper_lastdigit_check	[]
-+
- When calculating the number of character classes, upper-case letters
- used as the first character and digits used as the last character of a
--password are not counted.
-+password are not counted. To disable this, you can specify 
-+"disable_firstupper_lastdigit_check".
- 
- In addition to being sufficiently long, passwords are required to
- contain enough different characters for the character classes and
-@@ -142,6 +145,14 @@ This disables user interaction within pa
- the only difference between "use_first_pass" and "use_authtok" is that
- the former is incompatible with "ask_oldauthtok".
- 
-+	oldpass_prompt_file=absolute-file-path	[]
-+	newpass_prompt_file=abosulte-file-path	[]
-+
-+The options "oldpass_prompt_file" and "newpass_prompt_file" can be used
-+to override prompts while requesting old password and new password, 
-+respectively. The maximum size of the prompt files can be 4096 
-+characters at present. If the file size is more than 4096 characters, the
-+output will be truncated to 4096 characters.
- -- 
- Solar Designer <solar at openwall.com>
- 
diff --git a/meta-oe/recipes-support/pam-passwdqc/files/7000Makefile-fix-CC.patch b/meta-oe/recipes-support/pam-passwdqc/files/7000Makefile-fix-CC.patch
deleted file mode 100644
index 536fba132..000000000
--- a/meta-oe/recipes-support/pam-passwdqc/files/7000Makefile-fix-CC.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- pam_passwdqc-1.0.5/Makefile.orig	2012-10-02 20:53:55.443592886 +0900
-+++ pam_passwdqc-1.0.5/Makefile	2012-10-02 20:54:19.076108001 +0900
-@@ -2,7 +2,7 @@
- # Copyright (c) 2000-2003,2005 by Solar Designer.  See LICENSE.
- #
- 
--CC = gcc
-+#CC = gcc
- LD = $(CC)
- RM = rm -f
- MKDIR = mkdir -p
diff --git a/meta-oe/recipes-support/passwdqc/passwdqc/makefile-add-ldflags.patch b/meta-oe/recipes-support/passwdqc/passwdqc/makefile-add-ldflags.patch
new file mode 100644
index 000000000..e9023492e
--- /dev/null
+++ b/meta-oe/recipes-support/passwdqc/passwdqc/makefile-add-ldflags.patch
@@ -0,0 +1,31 @@
+Add LDFLAGS variable to Makefile so that extra linker flags can be sent via this variable.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff --git a/Makefile b/Makefile
+index 49d622d..cd17334 100644
+--- a/Makefile
++++ b/Makefile
+@@ -48,18 +48,17 @@ CFLAGS = -Wall -W -O2
+ CFLAGS_lib = $(CFLAGS) -fPIC
+ CFLAGS_bin = $(CFLAGS) -fomit-frame-pointer
+ 
+-LDFLAGS =
+ LDFLAGS_shared = --shared
+ LDFLAGS_shared_LINUX = --shared
+ LDFLAGS_shared_SUN = -G
+ LDFLAGS_shared_HP = -b
+ LDFLAGS_lib = $(LDFLAGS_shared)
+-LDFLAGS_lib_LINUX = $(LDFLAGS_shared_LINUX) \
++LDFLAGS_lib_LINUX = $(LDFLAGS) $(LDFLAGS_shared_LINUX) \
+ 	-Wl,--soname,$(SHARED_LIB),--version-script,$(MAP_LIB)
+ LDFLAGS_lib_SUN = $(LDFLAGS_shared_SUN)
+ LDFLAGS_lib_HP = $(LDFLAGS_shared_HP)
+ LDFLAGS_pam = $(LDFLAGS_shared)
+-LDFLAGS_pam_LINUX = $(LDFLAGS_shared_LINUX) \
++LDFLAGS_pam_LINUX = $(LDFLAGS) $(LDFLAGS_shared_LINUX) \
+ 	-Wl,--version-script,$(MAP_PAM)
+ LDFLAGS_pam_SUN = $(LDFLAGS_shared_SUN)
+ LDFLAGS_pam_HP = $(LDFLAGS_shared_HP)
diff --git a/meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb b/meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb
similarity index 5%
rename from meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb
rename to meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb
index cb9aa22cf..b8f923c29 100644
--- a/meta-oe/recipes-support/pam-passwdqc/pam-passwdqc_1.0.5.bb
+++ b/meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb
@@ -1,38 +1,63 @@
-SUMMARY = "Pluggable password quality-control module."
-DESCRIPTION = "pam_passwdqc is a simple password strength checking module for \
-PAM-aware password changing programs, such as passwd(1). In addition \
-to checking regular passwords, it offers support for passphrases and \
-can provide randomly generated passwords. All features are optional \
-and can be (re-)configured without rebuilding."
-
-HOMEPAGE = "http://www.openwall.com/passwdqc/"
+SUMMARY = "A password/passphrase strength checking and enforcement toolset"
+DESCRIPTION = "\
+passwdqc is a password/passphrase strength checking and policy enforcement \
+toolset, including an optional PAM module (pam_passwdqc), command-line \
+programs (pwqcheck and pwqgen), and a library (libpasswdqc). \
+pam_passwdqc is normally invoked on password changes by programs such as \
+passwd(1).  It is capable of checking password or passphrase strength, \
+enforcing a policy, and offering randomly-generated passphrases, with \
+all of these features being optional and easily (re-)configurable. \
+\
+pwqcheck and pwqgen are standalone password/passphrase strength checking \
+and random passphrase generator programs, respectively, which are usable \
+from scripts. \
+\
+libpasswdqc is the underlying library, which may also be used from \
+third-party programs. \
+"
+
+HOMEPAGE = "http://www.openwall.com/passwdqc"
 SECTION = "System Environment/Base"
 
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e284d013ef08e66d4737f446c5890550"
+DEPENDS += "libpam"
 
-SRC_URI = "http://www.openwall.com/pam/modules/pam_passwdqc/pam_passwdqc-1.0.5.tar.gz \
-    file://1000patch-219201.patch \
-    file://7000Makefile-fix-CC.patch \
-"
-SRC_URI[md5sum] = "cd9c014f736158b1a60384a8e2bdc28a"
-SRC_URI[sha256sum] = "32528ddf7d8219c788b6e7702361611ff16c6340b6dc0f418ff164aadc4a4a88"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1b4af6f3d4ee079a38107366e93b334d"
 
+SRC_URI = "http://www.openwall.com/${BPN}/${BP}.tar.gz \
+           file://makefile-add-ldflags.patch \
+          "
+SRC_URI[md5sum] = "3878b57bcd3fdbcf3d4b362dbc6228b9"
+SRC_URI[sha256sum] = "d1fedeaf759e8a0f32d28b5811ef11b5a5365154849190f4b7fab670a70ffb14"
 
-S = "${WORKDIR}/pam_passwdqc-${PV}"
+# explicitly define LINUX_PAM in case DISTRO_FEATURES no pam
+# this package's pam_passwdqc.so needs pam
+CFLAGS_append += "-Wall -fPIC -DHAVE_SHADOW -DLINUX_PAM"
 
-DEPENDS = "libpam"
+# -e is no longer default setting in bitbake.conf
+EXTRA_OEMAKE = "-e"
 
-EXTRA_OEMAKE = "CFLAGS="${CFLAGS} -Wall -fPIC -DHAVE_SHADOW" \
-    SECUREDIR=${base_libdir}/security \
-"
+do_compile() {
+    # make sure sub make use environment to override variables in Makefile
+    # Linux)    $(MAKE), there is a tab between
+    sed -i -e 's/Linux)	$(MAKE) CFLAGS_lib/Linux)	$(MAKE) -e CFLAGS_lib/' ${S}/Makefile
 
-TARGET_CC_ARCH += "${LDFLAGS}"
+    # LD_lib and LD must be CC because of Makefile
+    oe_runmake LD="${CC}"
+}
 
 do_install() {
-    oe_runmake install DESTDIR=${D}
+    oe_runmake install DESTDIR=${D} SHARED_LIBDIR=${base_libdir} \
+           DEVEL_LIBDIR=${libdir} SECUREDIR=${base_libdir}/security \
+           INSTALL="install -p"
 }
 
-FILES_${PN} += "${base_libdir}/security/pam_passwdqc.so"
+PROVIDES += "pam-${BPN}"
+PACKAGES =+ "lib${BPN} pam-${BPN}"
+
+FILES_lib${BPN} = "${base_libdir}/libpasswdqc.so.0"
+FILES_pam-${BPN} = "${base_libdir}/security/pam_passwdqc.so"
 FILES_${PN}-dbg += "${base_libdir}/security/.debug"
 
+RDEPENDS_${PN} = "lib${BPN}"
+RDEPENDS_pam-${BPN} = "lib${BPN}"
-- 
2.11.0


