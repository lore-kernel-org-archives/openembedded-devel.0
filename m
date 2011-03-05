Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pw0cP-0002eA-B4
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Mar 2011 00:10:37 +0100
Received: by fxm8 with SMTP id 8so3164149fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Mar 2011 15:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=C+AyUgE0vSlR0Gvn7TOZy8OEK1zpyH1/t23TpsXcAn0=;
	b=YfqTqzFMeny8lGmAx/jaHYMI1SvsFOTbD+lEZBQ9E0t4M8U5fr5AdLsJM8/xN30raN
	o9RE2xzxhguvDwf2MfznpoQmxcyGiwHDDuikO1GbaYYcL9FF15RK6GE7X5MywllPL8Vv
	EF3fcsiyhf3AXTqXRy0KpFZSVsAH1kiAf+ilA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=GiHXusuwdJOdt1yJ5laNB7XquPHcF+6mWcpiXQfVym1PxdQBr2dBd10GdZR+N+SCI+
	6yA40lhn9e69g86NJdB9yxDmpds+tBqp5L3cCtKzJMAbtCKfIywcKXMu5gxOMgUfrznu
	Kj6+E5C31GFLLONknlJYMWF6nEdSLCtD/jxYU=
Received: by 10.223.77.19 with SMTP id e19mr2758457fak.36.1299366546083; Sat,
	05 Mar 2011 15:09:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Sat, 5 Mar 2011 15:08:36 -0800 (PST)
In-Reply-To: <1299360603-24687-1-git-send-email-eric@eukrea.com>
References: <1299360603-24687-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 5 Mar 2011 15:08:36 -0800
Message-ID: <AANLkTikWU836s9FM0e0XKdZPuYb=cZs9c0Z3t9nvbZZh@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Subject: Re: [PATCH 1/2] dropbear: add 0.53.1
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
X-List-Received-Date: Sat, 05 Mar 2011 23:10:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 5, 2011 at 1:30 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> * 0.53.1 brings some improvements over 0.52 which was released
> more than 2 years ago. For more details, check the changelog here :
> http://matt.ucc.asn.au/dropbear/CHANGES
> * Please note that DROPBEAR_SMALL_CODEis now disabled which may
> increase the size of the binaries.

can you compare the sizes of .52 and .53.1 so we know how much it will be
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Patch itself looks ok

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/dropbear/dropbear-0.53.1/allow-nopw.patch =C2=A0| =C2=A0 40=
 ++++++++++++++++++++
> =C2=A0recipes/dropbear/dropbear-0.53.1/configure.patch =C2=A0 | =C2=A0 27=
 +++++++++++++
> =C2=A0.../dropbear/dropbear-0.53.1/fix-2kb-keys.patch =C2=A0 =C2=A0| =C2=
=A0 12 ++++++
> =C2=A0.../dropbear/dropbear-0.53.1/no-host-lookup.patch =C2=A0| =C2=A0 12=
 ++++++
> =C2=A0.../urandom-xauth-changes-to-options.h.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 13 ++++++
> =C2=A0recipes/dropbear/dropbear_0.53.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A09 ++++
> =C2=A06 files changed, 113 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/dropbear/dropbear-0.53.1/allow-nopw.patc=
h
> =C2=A0create mode 100644 recipes/dropbear/dropbear-0.53.1/configure.patch
> =C2=A0create mode 100644 recipes/dropbear/dropbear-0.53.1/fix-2kb-keys.pa=
tch
> =C2=A0create mode 100644 recipes/dropbear/dropbear-0.53.1/no-host-lookup.=
patch
> =C2=A0create mode 100644 recipes/dropbear/dropbear-0.53.1/urandom-xauth-c=
hanges-to-options.h.patch
> =C2=A0create mode 100644 recipes/dropbear/dropbear_0.53.1.bb
>
> diff --git a/recipes/dropbear/dropbear-0.53.1/allow-nopw.patch b/recipes/=
dropbear/dropbear-0.53.1/allow-nopw.patch
> new file mode 100644
> index 0000000..3f3e8b1
> --- /dev/null
> +++ b/recipes/dropbear/dropbear-0.53.1/allow-nopw.patch
> @@ -0,0 +1,40 @@
> +Index: dropbear-0.51/svr-auth.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- dropbear-0.51.orig/svr-auth.c
> ++++ dropbear-0.51/svr-auth.c
> +@@ -270,7 +270,7 @@ static int checkusername(unsigned char *
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 send_msg_userauth_fail=
ure(0, 1);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return DROPBEAR_FAILUR=
E;
> + =C2=A0 =C2=A0 =C2=A0 }
> +-
> ++#ifdef DISALLOW_EMPTY_PW
> + =C2=A0 =C2=A0 =C2=A0 /* check for an empty password */
> + =C2=A0 =C2=A0 =C2=A0 if (ses.authstate.pw_passwd[0] =3D=3D '\0') {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TRACE(("leave checkuse=
rname: empty pword"))
> +@@ -279,7 +279,7 @@ static int checkusername(unsigned char *
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 send_msg_userauth_fail=
ure(0, 1);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return DROPBEAR_FAILUR=
E;
> + =C2=A0 =C2=A0 =C2=A0 }
> +-
> ++#endif
> + =C2=A0 =C2=A0 =C2=A0 TRACE(("shell is %s", ses.authstate.pw_shell))
> +
> + =C2=A0 =C2=A0 =C2=A0 /* check that the shell is set */
> +Index: dropbear-0.51/svr-authpasswd.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- dropbear-0.51.orig/svr-authpasswd.c
> ++++ dropbear-0.51/svr-authpasswd.c
> +@@ -64,9 +64,13 @@ void svr_auth_password() {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* since the shadow password may differ to th=
at tested
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* in auth.c */
> + =C2=A0 =C2=A0 =C2=A0 if (passwdcrypt[0] =3D=3D '\0') {
> ++#ifdef DISALLOW_EMPTY_PW
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dropbear_log(LOG_WARNI=
NG, "user '%s' has blank password, rejected",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ses.authstate.pw_name);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 send_msg_userauth_fail=
ure(0, 1);
> ++#else
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0send_msg_userauth_succ=
ess();
> ++#endif
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> diff --git a/recipes/dropbear/dropbear-0.53.1/configure.patch b/recipes/d=
ropbear/dropbear-0.53.1/configure.patch
> new file mode 100644
> index 0000000..fa24efc
> --- /dev/null
> +++ b/recipes/dropbear/dropbear-0.53.1/configure.patch
> @@ -0,0 +1,27 @@
> +Index: dropbear-0.50/configure.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- dropbear-0.50.orig/configure.in
> ++++ dropbear-0.50/configure.in
> +@@ -164,14 +164,20 @@ AC_ARG_ENABLE(openpty,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 AC_MSG_NOTICE(Not using openpty)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 AC_MSG_NOTICE(Using openpty if available)
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AC_SEARCH_LIBS(openpty, util, [AC_DEFINE(HAVE_OPENPTY,,Have openpty()=
 function)])
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AC_SEARCH_LIBS(openpty, util, [dropbear_cv_func_have_openpty=3Dyes])
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 ],
> + =C2=A0 =C2=A0 =C2=A0 [
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_NOTICE(Using op=
enpty if available)
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_SEARCH_LIBS(openpty=
, util, [AC_DEFINE(HAVE_OPENPTY)])
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_SEARCH_LIBS(openpty=
, util, [dropbear_cv_func_have_openpty=3Dyes])
> + =C2=A0 =C2=A0 =C2=A0 ]
> + )
> ++
> ++if test "x$dropbear_cv_func_have_openpty" =3D "xyes"; then
> ++ =C2=A0 =C2=A0 =C2=A0AC_DEFINE(HAVE_OPENPTY,,Have openpty() function)
> ++ =C2=A0 =C2=A0 =C2=A0no_ptc_check=3Dyes
> ++ =C2=A0 =C2=A0 =C2=A0no_ptmx_check=3Dyes
> ++fi
> +
> +
> + AC_ARG_ENABLE(syslog,
> diff --git a/recipes/dropbear/dropbear-0.53.1/fix-2kb-keys.patch b/recipe=
s/dropbear/dropbear-0.53.1/fix-2kb-keys.patch
> new file mode 100644
> index 0000000..bb7a4d3
> --- /dev/null
> +++ b/recipes/dropbear/dropbear-0.53.1/fix-2kb-keys.patch
> @@ -0,0 +1,12 @@
> +Index: dropbear-0.50/kex.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- dropbear-0.50.orig/kex.h
> ++++ dropbear-0.50/kex.h
> +@@ -59,6 +59,6 @@ struct KEXState {
> +
> + };
> +
> +-#define MAX_KEXHASHBUF 2000
> ++#define MAX_KEXHASHBUF 3000
> +
> + #endif /* _KEX_H_ */
> diff --git a/recipes/dropbear/dropbear-0.53.1/no-host-lookup.patch b/reci=
pes/dropbear/dropbear-0.53.1/no-host-lookup.patch
> new file mode 100644
> index 0000000..d7c2ccd
> --- /dev/null
> +++ b/recipes/dropbear/dropbear-0.53.1/no-host-lookup.patch
> @@ -0,0 +1,12 @@
> +diff -urN dropbear-0.51/options.h dropbear-0.51.new/options.h
> +--- dropbear-0.51/options.h =C2=A0 =C2=A02008-03-27 14:34:39.000000000 +=
0100
> ++++ dropbear-0.51.new/options.h =C2=A0 =C2=A0 =C2=A0 =C2=A02008-06-22 00=
:22:09.000000000 +0200
> +@@ -112,7 +112,7 @@
> + /* #define DSS_PROTOK */
> +
> + /* Whether to do reverse DNS lookups. */
> +-#define DO_HOST_LOOKUP
> ++/* #define DO_HOST_LOOKUP */
> +
> + /* Whether to print the message of the day (MOTD). This doesn't add muc=
h code
> + =C2=A0* size */
> diff --git a/recipes/dropbear/dropbear-0.53.1/urandom-xauth-changes-to-op=
tions.h.patch b/recipes/dropbear/dropbear-0.53.1/urandom-xauth-changes-to-o=
ptions.h.patch
> new file mode 100644
> index 0000000..bd1657d
> --- /dev/null
> +++ b/recipes/dropbear/dropbear-0.53.1/urandom-xauth-changes-to-options.h=
.patch
> @@ -0,0 +1,13 @@
> +diff --git a/options.h b/options.h
> +index d309ab4..7fbe97b 100644
> +--- a/options.h
> ++++ b/options.h
> +@@ -236,7 +236,7 @@ much traffic. */
> + /* The command to invoke for xauth when using X11 forwarding.
> + =C2=A0* "-q" for quiet */
> + #ifndef XAUTH_COMMAND
> +-#define XAUTH_COMMAND "/usr/bin/X11/xauth -q"
> ++#define XAUTH_COMMAND "xauth -q"
> + #endif
> +
> + /* if you want to enable running an sftp server (such as the one includ=
ed with
> diff --git a/recipes/dropbear/dropbear_0.53.1.bb b/recipes/dropbear/dropb=
ear_0.53.1.bb
> new file mode 100644
> index 0000000..fd6b970
> --- /dev/null
> +++ b/recipes/dropbear/dropbear_0.53.1.bb
> @@ -0,0 +1,9 @@
> +require dropbear.inc
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI +=3D "file://no-host-lookup.patch"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +SRC_URI[md5sum] =3D "0284ea239083f04c8b874e08e1aca243"
> +SRC_URI[sha256sum] =3D "e24d3cbecd3bc850b2b336b8eb50c845a285ceef8e225449=
38a582e163d36393"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


