Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id B119271DD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 16:54:01 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id r199so27800237vke.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 09:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mIDz1582NtYllGLdRYbtZEdfb1Ik52GMigCK3Srd5ko=;
	b=hEEsEiogkYBbkKMfbwqYz5j8RBcg6O1zwOUsx/tEGDSrAC1EovoTefyL4Zws4wG8jU
	KD0birJqq2Ap5jQaHkk4zwPYtS2tWzVTumMBcPHYrkp60b+3kM304rVw0AnX8M9/yeJx
	R6WNKbkZkDRFqL0oduO7oe8/0Ih+h0ujCr7D9ww0DE8PwEDZvPpzc0Yw2DdbUug/wSVE
	PUEUFERbwR9v4Cd0IO4jTfYlVM8+GZoF4tp9xp+/3sDuwyGIKL6xDzsOJHNxbzxZ2rJy
	pqNSvySdvr6mO9xjPdgQFAMT+O96RRNDThrHmzXotXAVE8S3IKYe6f94nNQCSZPHobU8
	uNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mIDz1582NtYllGLdRYbtZEdfb1Ik52GMigCK3Srd5ko=;
	b=Z7AxzAmxQRbE+hP1J4Cj82mclShgFZ810pIe5G7b+GSY0PreerLZDS6/dc79lIW5bV
	jNgIHxRrsDvdiVJviNNkcu+WLztMsFPjefehGns2LEhxrCusA91qV5zcsuSQ8lx9FM8z
	8mKLSLAmdGrnMU+uCmx79HaQ9wJmf7hfWzsC3QSMDfnyLveXrFPoJebbIAe2SqkKnM+4
	Fx/tzGtDvkOCKhIGit/p3ruQLCQEmaU1eV7FzYzQU6upc2tHQj1qujls9rIPngokMIGV
	IdTlbXtQfAfVHNufOBhXnLgtBf5OlQl8nfISoZ0py43+v5v4vy7VMfDRLJHbVKsGXfHv
	M7tQ==
X-Gm-Message-State: AHYfb5gjJt1E3dUVhcgPHmxx/55MAnxz8ppzVo4B01DUoYEfabYpUziH
	9297NuLXuHVUZs4Jb2WtWFFbScNCoQ==
X-Received: by 10.31.181.85 with SMTP id e82mr5038721vkf.168.1502297642391;
	Wed, 09 Aug 2017 09:54:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Wed, 9 Aug 2017 09:54:01 -0700 (PDT)
In-Reply-To: <20170725005928.4127-1-jackie.huang@windriver.com>
References: <20170725005928.4127-1-jackie.huang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 9 Aug 2017 18:54:01 +0200
Message-ID: <CA+chaQdS=S=fiHjQeG49dE5C=pD6Cy3f07VcfoRuJwOpH9RXgA@mail.gmail.com>
To: JackieHuang <jackie.huang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] vlock: add new recipe
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
X-List-Received-Date: Wed, 09 Aug 2017 16:54:02 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build:
http://errors.yoctoproject.org/Errors/Details/150177/

On Tue, Jul 25, 2017 at 2:59 AM, <jackie.huang@windriver.com> wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>
> vlock is a program to lock one or more
> sessions on the Linux console.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../vlock/vlock-2.2.3/disable_vlockrc.patch        |  37 +++++++
>  .../vlock/vlock-2.2.3/vlock-no_tally.patch         | 107
> +++++++++++++++++++++
>  .../recipes-extended/vlock/vlock-2.2.3/vlock_pam   |   3 +
>  .../vlock/vlock-2.2.3/vlock_pam_tally2_reset.patch |  19 ++++
>  meta-oe/recipes-extended/vlock/vlock_2.2.3.bb      |  53 ++++++++++
>  5 files changed, 219 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_
> vlockrc.patch
>  create mode 100644 meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock-no_
> tally.patch
>  create mode 100644 meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam
>  create mode 100644 meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam_
> tally2_reset.patch
>  create mode 100644 meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
>
> diff --git a/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch
> b/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch
> new file mode 100644
> index 000000000..ee0d074de
> --- /dev/null
> +++ b/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch
> @@ -0,0 +1,37 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +written by: Jeff Polk <jeff.polk@windriver.com>
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +
> +Index: vlock-2.2.2/man/vlock.1
> +===================================================================
> +--- vlock-2.2.2.orig/man/vlock.1       2010-07-26 14:12:42.000000000 -0400
> ++++ vlock-2.2.2/man/vlock.1    2010-07-26 14:13:06.000000000 -0400
> +@@ -111,11 +111,6 @@
> + to an invalid value or 0 no timeout is used.  \fBWarning\fR: If this
> value is
> + too low, you may not be able to unlock your session.
> + .PP
> +-.SH FILES
> +-.B ~/.vlockrc
> +-.IP
> +-This file is read by \fBvlock\fR on startup if it exists.  All the
> variables
> +-mentioned above can be set here.
> + .SH SECURITY
> + See the SECURITY file in the \fBvlock\fR distribution for more
> information.
> + .PP
> +Index: vlock-2.2.2/src/vlock.sh
> +===================================================================
> +--- vlock-2.2.2.orig/src/vlock.sh      2010-07-26 14:12:32.000000000 -0400
> ++++ vlock-2.2.2/src/vlock.sh   2010-07-26 14:13:33.000000000 -0400
> +@@ -35,11 +35,6 @@
> +
> + ${VLOCK_ENTER_PROMPT}"
> +
> +-# Read user settings.
> +-if [ -r "${HOME}/.vlockrc" ] ; then
> +-  . "${HOME}/.vlockrc"
> +-fi
> +-
> + # "Compile" time variables.
> + VLOCK_MAIN="%PREFIX%/sbin/vlock-main"
> + VLOCK_VERSION="%VLOCK_VERSION%"
> diff --git a/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock-no_tally.patch
> b/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock-no_tally.patch
> new file mode 100644
> index 000000000..6e8a6a9fd
> --- /dev/null
> +++ b/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock-no_tally.patch
> @@ -0,0 +1,107 @@
> +Upstream-Status: Pending
> +
> +written by: Jeff Polk <jeff.polk@windriver.com>
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -126,6 +126,10 @@ ifeq ($(AUTH_METHOD),shadow)
> + vlock-main : override LDLIBS += $(CRYPT_LIB)
> + endif
> +
> ++ifneq ($(ENABLE_FAIL_COUNT),yes)
> ++vlock-main.o : override CFLAGS += -DNO_FAIL_COUNT
> ++endif
> ++
> + ifeq ($(ENABLE_PLUGINS),yes)
> + vlock-main: plugins.o plugin.o module.o process.o script.o tsort.o list.o
> + # -rdynamic is needed so that the all plugin can access the symbols from
> console_switch.o
> +--- a/configure
> ++++ b/configure
> +@@ -44,6 +44,7 @@ Optional Features:
> +   --enable-shadow         enable shadow authentication [disabled]
> +   --enable-root-password  enable unlogging with root password [enabled]
> +   --enable-debug          enable debugging
> ++  --enable-fail-count     enable failed login attempt summary [enabled]
> +
> + Additional configuration:
> +   --with-scripts=SCRIPTS  enable the named scripts []
> +@@ -78,6 +79,9 @@ enable_feature() {
> +     root-password)
> +       ENABLE_ROOT_PASSWORD="$2"
> +     ;;
> ++    fail-count)
> ++      ENABLE_FAIL_COUNT="$2"
> ++    ;;
> +     pam|shadow)
> +       if [ "$2" = "yes" ] ; then
> +         if [ -n "$auth_method" ] && [ "$auth_method" != "$1" ] ; then
> +@@ -232,6 +232,7 @@ set_defaults() {
> +   AUTH_METHOD="pam"
> +   ENABLE_ROOT_PASSWORD="yes"
> +   ENABLE_PLUGINS="yes"
> ++  ENABLE_FAIL_COUNT="yes"
> +   SCRIPTS=""
> +
> +   VLOCK_GROUP="vlock"
> +@@ -356,10 +356,14 @@ ENABLE_PLUGINS = ${ENABLE_PLUGINS}
> + # which plugins should be build
> + MODULES = ${MODULES}
> + # which scripts should be installed
> + SCRIPTS = ${SCRIPTS}
> +
> ++# display a summary of failed authentication attempts after successfully
> ++# unlocking?
> ++ENABLE_FAIL_COUNT = ${ENABLE_FAIL_COUNT}
> ++
> + # root's group
> + ROOT_GROUP = ${ROOT_GROUP}
> +
> + # group for privileged plugins
> + VLOCK_GROUP = ${VLOCK_GROUP}
> +--- a/src/vlock-main.c
> ++++ b/src/vlock-main.c
> +@@ -111,7 +111,9 @@ static void restore_terminal(void)
> +   (void) tcsetattr(STDIN_FILENO, TCSANOW, &term);
> + }
> +
> ++#ifdef ENABLE_FAIL_COUNT
> + static int auth_tries;
> ++#endif /* ENABLE_FAIL_COUNT */
> +
> + static void auth_loop(const char *username)
> + {
> +@@ -181,7 +183,9 @@ static void auth_loop(const char *userna
> +     }
> + #endif
> +
> ++#ifdef ENABLE_FAIL_COUNT
> +     auth_tries++;
> ++#endif /* ENABLE_FAIL_COUNT */
> +   }
> +
> +   /* Free timeouts memory. */
> +@@ -189,11 +193,13 @@ static void auth_loop(const char *userna
> +   free(prompt_timeout);
> + }
> +
> ++#ifdef ENABLE_FAIL_COUNT
> + void display_auth_tries(void)
> + {
> +   if (auth_tries > 0)
> +     fprintf(stderr, "%d failed authentication %s.\n", auth_tries,
> auth_tries > 1 ? "tries" : "try");
> + }
> ++#endif /* ENABLE_FAIL_COUNT */
> +
> + #ifdef USE_PLUGINS
> + static void call_end_hook(void)
> +@@ -216,7 +222,9 @@ int main(int argc, char *const argv[])
> +   if (username == NULL)
> +     fatal_perror("vlock: could not get username");
> +
> ++#ifdef ENABLE_FAIL_COUNT
> +   ensure_atexit(display_auth_tries);
> ++#endif /* ENABLE_FAIL_COUNT */
> +
> + #ifdef USE_PLUGINS
> +   for (int i = 1; i < argc; i++)
> diff --git a/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam
> b/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam
> new file mode 100644
> index 000000000..a919682b0
> --- /dev/null
> +++ b/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam
> @@ -0,0 +1,3 @@
> +# Use the default auth and account policies for vlock
> +auth       include      common-auth
> +account    include      common-account
> diff --git a/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam_tally2_reset.patch
> b/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam_tally2_reset.patch
> new file mode 100644
> index 000000000..4ce0abc71
> --- /dev/null
> +++ b/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam_
> tally2_reset.patch
> @@ -0,0 +1,19 @@
> +Upstream-Status: Pending
> +
> +written by: Jeff Polk <jeff.polk@windriver.com>
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +
> +Index: vlock-2.2.2/src/auth-pam.c
> +===================================================================
> +--- vlock-2.2.2.orig/src/auth-pam.c    2010-06-14 14:38:51.000000000
> -0400
> ++++ vlock-2.2.2/src/auth-pam.c 2010-06-14 14:39:12.000000000 -0400
> +@@ -148,6 +148,9 @@
> +
> +   if (pam_status != PAM_SUCCESS) {
> +     fprintf(stderr, "vlock: %s\n", pam_strerror(pamh, pam_status));
> ++  } else {
> ++    pam_status = pam_acct_mgmt(pamh, 0);
> ++    if (pam_status == PAM_SUCCESS) pam_setcred(pamh,
> PAM_REINITIALIZE_CRED);
> +   }
> +
> + end:
> diff --git a/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
> b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
> new file mode 100644
> index 000000000..d660b0378
> --- /dev/null
> +++ b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
> @@ -0,0 +1,53 @@
> +SUMMARY = "Virtual Console lock program"
> +DESCRIPTION = "Sometimes a malicious local user could cause more problems
> \
> +  than a sophisticated remote one. vlock is a program that locks one or
> more \
> +  sessions on the Linux console to prevent attackers from gaining
> physical \
> +  access to the machine. \
> +  "
> +SECTION = "utils"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
> +
> +SRC_URI = "${GENTOO_MIRROR}/${BP}.tar.gz \
> +       file://disable_vlockrc.patch \
> +       file://vlock_pam_tally2_reset.patch \
> +       file://vlock-no_tally.patch \
> +       file://vlock_pam \
> +       "
> +
> +SRC_URI[md5sum] = "378175c7692a8f288e65fd4dbf8a38eb"
> +SRC_URI[sha256sum] = "85aa5aed1ae49351378a0bd527a013
> 078f0f969372a63164b1944174ae1a5e39"
> +
> +inherit autotools-brokensep update-alternatives
> +
> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
> +PACKAGECONFIG[pam] = "--enable-pam, --disable-pam, libpam,"
> +
> +CFLAGS += "-Wall -W -pedantic -std=gnu99"
> +
> +do_configure () {
> +    ${CONFIGURE_SCRIPT} \
> +        VLOCK_GROUP=root \
> +        ROOT_GROUP=root \
> +        CC="${CC}" \
> +        CFLAGS="${CFLAGS}" \
> +        LDFLAGS="${LDFLAGS}" \
> +        --prefix=${prefix} \
> +        --libdir=${libdir} \
> +        --mandir=${mandir} \
> +        --with-modules="all.so new.so nosysrq.so ttyblank.so
> vesablank.so" \
> +        --disable-root-password --enable-debug --disable-fail-count \
> +        ${PACKAGECONFIG_CONFARGS}
> +}
> +
> +do_install_append () {
> +    if [ ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'yes', '', d)} =
> yes ]; then
> +        install -d -m 0755 ${D}/${sysconfdir}/pam.d
> +        install -m 0644 ${WORKDIR}/vlock_pam ${D}${sysconfdir}/pam.d/vlock
> +    fi
> +}
> +
> +ALTERNATIVE_${PN} = "vlock"
> +ALTERNATIVE_PRIORITY = "60"
> +ALTERNATIVE_LINK_NAME[vlock] = "${bindir}/vlock"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

