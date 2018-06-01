Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id D2DF8601F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 18:01:11 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id k14-v6so1247734uao.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2018 11:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2Z5QdwAvmEOzXHqdIiMJa52o4DUna0jHHQde8LKxNeU=;
	b=nVqLiIK6EENbiwLbWcycGHgfeSgyLJI1XrnutNIbcHrhkbDiIHwRUpkNJ76FnLvN+b
	uBUy3KbTSMhCzxlyIPKGFt71UQy5tzSRYJqdlawQchkH/qZgb22lxJWgTzlfIr+U8EVG
	H0RpD3AGV9V6QyKpdh3ksUaYwjXNaYtkPkP9+W90m9w33MFjfcjMnqRiHP+uV6EeAU6i
	yjSHZoLcVGwkgg/85AntiKRFGe0MYsPPkq4umWHVpVGhvlUgX6M1vdtC6FxiX6V+Tx4p
	BFc8TadRwChgqKPgwqhf+pQT6DIf2SkDO7Y26kQMAnnZc/PpBapehp3NrevNkCeMiglW
	we1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2Z5QdwAvmEOzXHqdIiMJa52o4DUna0jHHQde8LKxNeU=;
	b=GVMxuOhvIdD0EUdtq6LsxEpJMtWQAL971lWidCBVI51Zy+GYAuJ5vCIuw0Z7fMcrG/
	J++qEWCEvrhHp+lGT61ZDHihIbbXbpkllP+/jYmFhCA8kVqygimbWHWWfBUzApkN3sla
	JOLbXfwCt1Xg9NdDdyO6GZ0R1oN13HhraX2h2uwQ7YuBOAVcBuTmI/BUgwiod8JkNqJL
	hwpnpB9jW3AagPmKIfLGLUCFUHVvEKUIN+VoEdcEA3bzJrPBzw+uVwCsbjksODOuGkRW
	BhAn9Sxc5rC+9MFIQojdVH6de6jJWvJyJqUdmShFyYDysQzR4QMG8VFBKq7sHe2hPdGn
	95aw==
X-Gm-Message-State: ALKqPweeKrhEcyi6DpRtAPs3aFemL/y08ozCFNMFFqg8OPe9845Bd+5q
	8cFnzh9BjVIc1eMglhc+MPovWprutRDeygYeBQ5lmw==
X-Google-Smtp-Source: ADUXVKLkYSfue9cq5oQVYupPkVvm6+s9JDOfNDI/C3edvn/PRWgsINylUgEe2qvm6/7DIndgFDjpeuIVJiinP5jaPBs=
X-Received: by 2002:ab0:1048:: with SMTP id g8-v6mr7472861uab.52.1527876072119;
	Fri, 01 Jun 2018 11:01:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Fri, 1 Jun 2018 11:01:11 -0700 (PDT)
In-Reply-To: <ab305d19-628d-097f-9905-e1f724abe6ba@gmail.com>
References: <20180601114158.24298-1-richard.leitner@skidata.com>
	<ab305d19-628d-097f-9905-e1f724abe6ba@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 1 Jun 2018 11:01:11 -0700
Message-ID: <CAJ86T=Ux5-SHTB49_-mUSWFdkEaugnfO=jMSib1o7L17bmV6KA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: dev@g0hl1n.net
Subject: Re: [meta-oe][PATCH] pam-plugin-ccreds: add recipe
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
X-List-Received-Date: Fri, 01 Jun 2018 18:01:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 1, 2018 at 10:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On 6/1/18 4:41 AM, Richard Leitner wrote:
>> Add version 11 of the pam-plugin-ccreds with the debian patches applied.
>
> I see QA errors like below
>
> ERROR: pam-plugin-ccreds-11-r0 do_package_qa: QA Issue: non
> -dev/-dbg/nativesdk- package contains symlink .so: pam-plugin-ccreds
> path
> '/work/core2-64-bec-linux-musl/pam-plugin-ccreds/11-r0/packages-split/pam-plugin-ccreds/lib/security/pam_ccreds.so'
> [dev-so]

According to OE's sanity checks, a .so plug-in should not be a symlink.

See the do_install_append() in the libcgroup recipe in oe-core for an
example of how to fix the issue.

>> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>> ---
>>  ...ke-sure-we-don-t-overflow-the-data-buffer.patch | 29 +++++++
>>  .../0002-add-minimum_uid-option.patch              | 97 ++++++++++++++++++++++
>>  ...TENSION_SO-also-for-linux-gnueabi-targets.patch | 29 +++++++
>>  .../recipes-extended/pam/pam-plugin-ccreds_11.bb   | 27 ++++++
>>  4 files changed, 182 insertions(+)
>>  create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-make-sure-we-don-t-overflow-the-data-buffer.patch
>>  create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ccreds/0002-add-minimum_uid-option.patch
>>  create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003-Set-EXTENSION_SO-also-for-linux-gnueabi-targets.patch
>>  create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
>>
>> diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-make-sure-we-don-t-overflow-the-data-buffer.patch b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-make-sure-we-don-t-overflow-the-data-buffer.patch
>> new file mode 100644
>> index 000000000..d7f8f5a96
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-make-sure-we-don-t-overflow-the-data-buffer.patch
>> @@ -0,0 +1,29 @@
>> +From 59a95494002ce57ace17d676544101e88a55265d Mon Sep 17 00:00:00 2001
>> +From: Nicolas Boullis <nicolas.boullis@ecp.fr>
>> +Date: Mon, 23 Mar 2009 10:46:44 +0100
>> +Subject: [PATCH 1/3] make sure we don't overflow the data buffer
>> +
>> +This patch was taken from Debian's libpam-ccreds v10-6 source:
>> +     0001-make-sure-we-don-t-overflow-the-data-buffer.patch
>> +
>> +Reviewed-by: Richard Leitner <richard.leitner@skidata.com>
>> +---
>> + cc_db.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/cc_db.c b/cc_db.c
>> +index c0e0488..9371c4d 100644
>> +--- a/cc_db.c
>> ++++ b/cc_db.c
>> +@@ -199,7 +199,7 @@ int pam_cc_db_get(void *_db, const char *keyname, size_t keylength,
>> +             return (rc == DB_NOTFOUND) ? PAM_AUTHINFO_UNAVAIL : PAM_SERVICE_ERR;
>> +     }
>> +
>> +-    if (val.size < *size) {
>> ++    if (val.size > *size) {
>> +             return PAM_BUF_ERR;
>> +     }
>> +
>> +--
>> +2.11.0
>> +
>> diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0002-add-minimum_uid-option.patch b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0002-add-minimum_uid-option.patch
>> new file mode 100644
>> index 000000000..adc464924
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0002-add-minimum_uid-option.patch
>> @@ -0,0 +1,97 @@
>> +From 21e3ab24836c5087f3531d2d3270242cea857a79 Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
>> +Date: Thu, 13 May 2010 12:36:26 +0200
>> +Subject: [PATCH 2/3] add minimum_uid option
>> +
>> +Closes: #580037
>> +
>> +This patch was taken from Debian's libpam-ccreds v10-6 source:
>> +     0002-add-minimum_uid-option.patch
>> +
>> +Reviewed-by: Richard Leitner <richard.leitner@skidata.com>
>> +---
>> + cc_pam.c | 39 +++++++++++++++++++++++++++++++++++++++
>> + 1 file changed, 39 insertions(+)
>> +
>> +diff --git a/cc_pam.c b/cc_pam.c
>> +index d096117..56776aa 100644
>> +--- a/cc_pam.c
>> ++++ b/cc_pam.c
>> +@@ -20,6 +20,7 @@
>> + #include <errno.h>
>> + #include <limits.h>
>> + #include <syslog.h>
>> ++#include <pwd.h>
>> +
>> + #include "cc_private.h"
>> +
>> +@@ -45,6 +46,30 @@ PAM_EXTERN int pam_sm_acct_mgmt(pam_handle_t *pamh,
>> +                             int flags, int argc, const char **argv);
>> + #endif
>> +
>> ++
>> ++/*
>> ++ * Given the PAM arguments and the user we're authenticating, see if we should
>> ++ * ignore that user because they're root or have a low-numbered UID and we
>> ++ * were configured to ignore such users.  Returns true if we should ignore
>> ++ * them, false otherwise.
>> ++ */
>> ++static int
>> ++_pamcc_should_ignore(const char *username, int minimum_uid)
>> ++{
>> ++    struct passwd *pwd;
>> ++
>> ++    if (minimum_uid > 0) {
>> ++            pwd = getpwnam(username);
>> ++            if (pwd != NULL && pwd->pw_uid < (unsigned long) minimum_uid) {
>> ++                    syslog(LOG_DEBUG, "ignoring low-UID user (%lu < %d)",
>> ++                            (unsigned long) pwd->pw_uid, minimum_uid);
>> ++                    return 1;
>> ++            }
>> ++    }
>> ++    return 0;
>> ++}
>> ++
>> ++
>> + static int _pam_sm_interact(pam_handle_t *pamh,
>> +                         int flags,
>> +                         const char **authtok)
>> +@@ -291,7 +316,9 @@ PAM_EXTERN int pam_sm_authenticate(pam_handle_t *pamh,
>> +     unsigned int sm_flags = 0, sm_action = 0;
>> +     const char *ccredsfile = NULL;
>> +     const char *action = NULL;
>> ++    const char *name = NULL;
>> +     int (*selector)(pam_handle_t *, int, unsigned int, const char *);
>> ++    int minimum_uid = 0;
>> +
>> +     for (i = 0; i < argc; i++) {
>> +             if (strcmp(argv[i], "use_first_pass") == 0)
>> +@@ -300,6 +327,8 @@ PAM_EXTERN int pam_sm_authenticate(pam_handle_t *pamh,
>> +                     sm_flags |= SM_FLAGS_TRY_FIRST_PASS;
>> +             else if (strcmp(argv[i], "service_specific") == 0)
>> +                     sm_flags |= SM_FLAGS_SERVICE_SPECIFIC;
>> ++            else if (strncmp(argv[i], "minimum_uid=", sizeof("minimum_uid=") - 1) == 0)
>> ++                    minimum_uid = atoi(argv[i] + sizeof("minimum_uid=") - 1);
>> +             else if (strncmp(argv[i], "ccredsfile=", sizeof("ccredsfile=") - 1) == 0)
>> +                     ccredsfile = argv[i] + sizeof("ccredsfile=") - 1;
>> +             else if (strncmp(argv[i], "action=", sizeof("action=") - 1) == 0)
>> +@@ -321,6 +350,16 @@ PAM_EXTERN int pam_sm_authenticate(pam_handle_t *pamh,
>> +             syslog(LOG_ERR, "pam_ccreds: invalid action \"%s\"", action);
>> +     }
>> +
>> ++    rc = pam_get_user(pamh, &name, NULL);
>> ++    if (rc != PAM_SUCCESS || name == NULL) {
>> ++            if (rc == PAM_CONV_AGAIN)
>> ++                    return PAM_INCOMPLETE;
>> ++            else
>> ++                    return PAM_SERVICE_ERR;
>> ++    }
>> ++    if (_pamcc_should_ignore(name, minimum_uid))
>> ++            return PAM_USER_UNKNOWN;
>> ++
>> +     switch (sm_action) {
>> +     case SM_ACTION_VALIDATE_CCREDS:
>> +             selector = _pam_sm_validate_cached_credentials;
>> +--
>> +2.11.0
>> +
>> diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003-Set-EXTENSION_SO-also-for-linux-gnueabi-targets.patch b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003-Set-EXTENSION_SO-also-for-linux-gnueabi-targets.patch
>> new file mode 100644
>> index 000000000..4f203f1a3
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003-Set-EXTENSION_SO-also-for-linux-gnueabi-targets.patch
>> @@ -0,0 +1,29 @@
>> +From 12d9bb59284bd01a9fcc3b9280698ffc23ef2ddc Mon Sep 17 00:00:00 2001
>> +From: Richard Leitner <richard.leitner@skidata.com>
>> +Date: Fri, 1 Jun 2018 13:24:15 +0200
>> +Subject: [PATCH 3/3] Set EXTENSION_SO also for linux-gnueabi targets
>> +
>> +As EXTENSION_SO gets already set for linux and linux-gnu targets we
>> +should set it also for linux-gnueabi targets.
>> +
>> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>> +---
>> + configure.in | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/configure.in b/configure.in
>> +index 0dbdf79..a434208 100644
>> +--- a/configure.in
>> ++++ b/configure.in
>> +@@ -43,7 +43,7 @@ AC_SUBST(pam_ccreds_so_LD)
>> + AC_SUBST(pam_ccreds_so_LDFLAGS)
>> +
>> + AM_CONDITIONAL(USE_NATIVE_LINKER, test -n "$pam_ccreds_so_LD")
>> +-AM_CONDITIONAL(EXTENSION_SO, test "$target_os" = "linux" -o "$target_os" = "linux-gnu")
>> ++AM_CONDITIONAL(EXTENSION_SO, test "$target_os" = "linux" -o "$target_os" = "linux-gnu" -o "$target_os" = "linux-gnueabi")
>> + AM_CONDITIONAL(EXTENSION_1, test "$TARGET_OS" = "HPUX")
>> +
>> + if test -z "$use_gcrypt"; then
>> +--
>> +2.11.0
>> +
>> diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb b/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
>> new file mode 100644
>> index 000000000..ded51e3a0
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
>> @@ -0,0 +1,27 @@
>> +SUMMARY = "PAM cached credentials module"
>> +HOMEPAGE = "https://www.padl.com/OSS/pam_ccreds.html"
>> +SECTION = "libs"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>> +
>> +DEPENDS = "libpam openssl db"
>> +
>> +inherit distro_features_check
>> +REQUIRED_DISTRO_FEATURES = "pam"
>> +
>> +SRCREV = "376bb189ceb3a113954f1012c45be7ff09e148ba"
>> +
>> +SRC_URI = " \
>> +    git://github.com/PADL/pam_ccreds \
>> +    file://0001-make-sure-we-don-t-overflow-the-data-buffer.patch \
>> +    file://0002-add-minimum_uid-option.patch \
>> +    file://0003-Set-EXTENSION_SO-also-for-linux-gnueabi-targets.patch \
>> +"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit autotools
>> +
>> +EXTRA_OECONF += "--libdir=${base_libdir} "
>> +
>> +FILES_${PN} += "${base_libdir}/security/pam*"
>>
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

