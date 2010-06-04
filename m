Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKRXT-0003B0-II
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 09:42:02 +0200
Received: by mail-fx0-f47.google.com with SMTP id 9so590619fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 00:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mUFfbAjErUOn76mbpJoVnqYpPfzDrqOsaCleUiUr4y0=;
	b=vqB5k3JnVMZC7a7YhCAZDURfCMFiKMuVc0TbWJujNM38QufDGuR0BaUVN+qMJFDLwK
	jR+CjK4mQeTl8/V2fewU4WXlINR41N/fk8k5Pr/EMGfpbuHH/2QfguLqUJtQ+0Z3/zF3
	GkOhBfvGYXydziCtungCvxh5NdeOsbtphQ5zM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=RAio3xXQwa2BHU8mRGMpnh/Q9KyorycsTyHH9/jP96rCMxK8Rx461bXsg1T2nrZcjz
	4B0mc4/DMtXW4KOotLnVpFnblXPbd85zWSFtUYm4yDIpNa9WORp2Uy8zlyALQk6NsgS1
	Verg/EgFXdwugN2vRqZWtxjns0LMgl91vwfdQ=
MIME-Version: 1.0
Received: by 10.223.25.74 with SMTP id y10mr11349440fab.81.1275637065311; Fri, 
	04 Jun 2010 00:37:45 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Fri, 4 Jun 2010 00:37:45 -0700 (PDT)
In-Reply-To: <1275510896-30845-5-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-5-git-send-email-raj.khem@gmail.com>
Date: Fri, 4 Jun 2010 09:37:45 +0200
Message-ID: <AANLkTikwvaP5cJg4YX_0T4PZsVHmnW9IgdorMvvsHROC@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 04/16] coreutils-8.5: Add recipes for version 8.5
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
X-List-Received-Date: Fri, 04 Jun 2010 07:42:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 2, 2010 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> =A0recipes/coreutils/coreutils-8.5.inc =A0 =A0 =A0 =A0 | =A0 =A07 +++
> =A0recipes/coreutils/coreutils-8.5/onceonly.m4 | =A0 63 +++++++++++++++++=
++++++++++
> =A0recipes/coreutils/coreutils-native_8.5.bb =A0 | =A0 =A04 ++
> =A0recipes/coreutils/coreutils_8.5.bb =A0 =A0 =A0 =A0 =A0| =A0 =A04 ++
> =A04 files changed, 78 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/coreutils/coreutils-8.5.inc
> =A0create mode 100644 recipes/coreutils/coreutils-8.5/onceonly.m4
> =A0create mode 100644 recipes/coreutils/coreutils-native_8.5.bb
> =A0create mode 100644 recipes/coreutils/coreutils_8.5.bb
>
> diff --git a/recipes/coreutils/coreutils-8.5.inc b/recipes/coreutils/core=
utils-8.5.inc
> new file mode 100644
> index 0000000..da57745
> --- /dev/null
> +++ b/recipes/coreutils/coreutils-8.5.inc
> @@ -0,0 +1,7 @@
> +require coreutils.inc
> +
> +SRC_URI =3D "ftp://ftp.gnu.org/gnu/coreutils/coreutils-${PV}.tar.gz \
> + =A0 =A0 =A0 =A0 =A0"
> +SRC_URI[md5sum] =3D "c1ffe586d001e87d66cd80c4536ee823"
> +SRC_URI[sha256sum] =3D "dd243e2ac7d0ed203b170ecfb8299643779e7501fec2b45a=
e1cea8a450fa8ca0"
> +
> diff --git a/recipes/coreutils/coreutils-8.5/onceonly.m4 b/recipes/coreut=
ils/coreutils-8.5/onceonly.m4
> new file mode 100644
> index 0000000..f6fec37
> --- /dev/null
> +++ b/recipes/coreutils/coreutils-8.5/onceonly.m4
> @@ -0,0 +1,63 @@
> +# onceonly.m4 serial 3
> +dnl Copyright (C) 2002, 2003 Free Software Foundation, Inc.
> +dnl This file is free software, distributed under the terms of the GNU
> +dnl General Public License. =A0As a special exception to the GNU General
> +dnl Public License, this file may be distributed as part of a program
> +dnl that contains a configuration script generated by Autoconf, under
> +dnl the same distribution terms as the rest of that program.
> +
> +dnl This file defines some "once only" variants of standard autoconf mac=
ros.
> +dnl =A0 AC_CHECK_HEADERS_ONCE =A0 =A0 =A0 =A0 like =A0AC_CHECK_HEADERS
> +dnl =A0 AC_CHECK_FUNCS_ONCE =A0 =A0 =A0 =A0 =A0 like =A0AC_CHECK_FUNCS
> +dnl =A0 AC_CHECK_DECLS_ONCE =A0 =A0 =A0 =A0 =A0 like =A0AC_CHECK_DECLS
> +dnl =A0 AC_REQUIRE([AC_HEADER_STDC]) =A0like =A0AC_HEADER_STDC
> +dnl The advantage is that the check for each of the headers/functions/de=
cls
> +dnl will be put only once into the 'configure' file. It keeps the size o=
f
> +dnl the 'configure' file down, and avoids redundant output when 'configu=
re'
> +dnl is run.
> +dnl The drawback is that the checks cannot be conditionalized. If you wr=
ite
> +dnl =A0 if some_condition; then gl_CHECK_HEADERS(stdlib.h); fi
> +dnl inside an AC_DEFUNed function, the gl_CHECK_HEADERS macro call expan=
ds to
> +dnl empty, and the check will be inserted before the body of the AC_DEFU=
Ned
> +dnl function.
> +
> +dnl Autoconf version 2.57 or newer is recommended.
> +AC_PREREQ(2.54)
> +
> +# AC_CHECK_HEADERS_ONCE(HEADER1 HEADER2 ...) is a once-only variant of
> +# AC_CHECK_HEADERS(HEADER1 HEADER2 ...).
> +AC_DEFUN([AC_CHECK_HEADERS_ONCE], [
> + =A0:
> + =A0AC_FOREACH([gl_HEADER_NAME], [$1], [
> + =A0 =A0AC_DEFUN([gl_CHECK_HEADER_]m4_quote(translit(defn([gl_HEADER_NAM=
E]),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 [-./], [___])), [
> + =A0 =A0 =A0AC_CHECK_HEADERS(gl_HEADER_NAME)
> + =A0 =A0])
> + =A0 =A0AC_REQUIRE([gl_CHECK_HEADER_]m4_quote(translit(gl_HEADER_NAME,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [-./], [___])))
> + =A0])
> +])
> +
> +# AC_CHECK_FUNCS_ONCE(FUNC1 FUNC2 ...) is a once-only variant of
> +# AC_CHECK_FUNCS(FUNC1 FUNC2 ...).
> +AC_DEFUN([AC_CHECK_FUNCS_ONCE], [
> + =A0:
> + =A0AC_FOREACH([gl_FUNC_NAME], [$1], [
> + =A0 =A0AC_DEFUN([gl_CHECK_FUNC_]defn([gl_FUNC_NAME]), [
> + =A0 =A0 =A0AC_CHECK_FUNCS(defn([gl_FUNC_NAME]))
> + =A0 =A0])
> + =A0 =A0AC_REQUIRE([gl_CHECK_FUNC_]defn([gl_FUNC_NAME]))
> + =A0])
> +])
> +
> +# AC_CHECK_DECLS_ONCE(DECL1 DECL2 ...) is a once-only variant of
> +# AC_CHECK_DECLS(DECL1, DECL2, ...).
> +AC_DEFUN([AC_CHECK_DECLS_ONCE], [
> + =A0:
> + =A0AC_FOREACH([gl_DECL_NAME], [$1], [
> + =A0 =A0AC_DEFUN([gl_CHECK_DECL_]defn([gl_DECL_NAME]), [
> + =A0 =A0 =A0AC_CHECK_DECLS(defn([gl_DECL_NAME]))
> + =A0 =A0])
> + =A0 =A0AC_REQUIRE([gl_CHECK_DECL_]defn([gl_DECL_NAME]))
> + =A0])
> +])
> diff --git a/recipes/coreutils/coreutils-native_8.5.bb b/recipes/coreutil=
s/coreutils-native_8.5.bb
> new file mode 100644
> index 0000000..fbf416e
> --- /dev/null
> +++ b/recipes/coreutils/coreutils-native_8.5.bb
> @@ -0,0 +1,4 @@
> +require coreutils-${PV}.inc
> +require coreutils-native.inc
> +
> +PR =3D "r0"
> diff --git a/recipes/coreutils/coreutils_8.5.bb b/recipes/coreutils/coreu=
tils_8.5.bb
> new file mode 100644
> index 0000000..b4025c2
> --- /dev/null
> +++ b/recipes/coreutils/coreutils_8.5.bb
> @@ -0,0 +1,4 @@
> +require coreutils-${PV}.inc
> +require coreutils-target.inc
> +
> +PR =3D "r0"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


