Received: from [209.85.221.105] (helo=mail-qy0-f105.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mario.goulart@gmail.com>) id 1MAA89-0001nT-Sk
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 May 2009 00:00:52 +0200
Received: by qyk3 with SMTP id 3so8843724qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 May 2009 14:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:subject
	:references:date:in-reply-to:message-id:user-agent:mime-version
	:content-type; bh=VLF7NT+0T78jPpvaukf8kLABbeF4jc2n1YrM6SFEfc0=;
	b=v81rJIDjU4wAZi8uaWX2AhEVTy/7jCemZieohbBUDwPxjS3XzuYLozIK31hGjjzjkt
	Da2xeWedoTkuch8fo3FE82b01MvGSE01/iiIGyEj61Gf9nijXXGhBYD7Yhc/dyO3ZS0G
	CnF+gg5Tv3Yl+W9nCXcWMSmXnQutzD/G2Mw9o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	b=s0WvBxKvCSceEhRlRxj8YL+WA7ktg8v2mM6tyTi6ClGlI4BlkyRDlHXnldUMb8P+Wd
	pb4Lu6FqQM36rzwEoWhVCiAr9HNoSVpc9FKINtGQmNKG23M/jPXqbJkS2Vhp5bZT1ZgM
	6mM/AW+vMDrzKGovKrGEw2UZQ0oTPMqNIXFTw=
Received: by 10.224.11.71 with SMTP id s7mr3372227qas.51.1243633939936;
	Fri, 29 May 2009 14:52:19 -0700 (PDT)
Received: from nachos.gmail.com
	(201-11-214-2.pltce701.dsl.brasiltelecom.net.br [201.11.214.2])
	by mx.google.com with ESMTPS id 5sm735603qwg.9.2009.05.29.14.52.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 29 May 2009 14:52:17 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
References: <4A1F82D2.6020707@bolloretelecom.eu>
Date: Fri, 29 May 2009 18:52:07 -0300
In-Reply-To: <4A1F82D2.6020707@bolloretelecom.eu> ("Jeremy =?utf-8?Q?Lain?=
	=?utf-8?Q?=C3=A9=22's?= message of
	"Fri, 29 May 2009 08:38:10 +0200")
Message-ID: <87octbk260.fsf@ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
MIME-Version: 1.0
Subject: Re: libx11 1.2 problems (dolt vs. libtool)
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
X-List-Received-Date: Fri, 29 May 2009 22:00:57 -0000
X-Groupsio-MsgNum: 10820
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi folks

On Fri, 29 May 2009 08:38:10 +0200 Jeremy Lain=C3=A9 <jeremy.laine@bolloret=
elecom.eu> wrote:

> Since libx11 was upgraded to 1.2, my libx11 builds are failing with:
>
> | ../../../doltlibtool: line 17:
> /home/oebuilder/oe/build/tmp/work/ppce300c3-angstrom-linux/libx11-1_1.2-r=
0/libX11-1.2/modules/im/ximcp/../../../libtool:
> No such file or directory
> | ../../../doltlibtool: line 17: exec:
> /home/oebuilder/oe/build/tmp/work/ppce300c3-angstrom-linux/libx11-1_1.2-r=
0/libX11-1.2/modules/im/ximcp/../../../libtool:
> cannot execute: No suchfile or directory
>
> It would seem I am not the only one with this problem:
>
> http://tinderbox.openembedded.net/packages/libx11/
>
> The problem is that the "dolibtool" script (see
> http://dolt.freedesktop.org) is trying to invoke the "libtool" script
> which it assumes lives in the base directory. However in OE the
> libtool script is called ${HOST_SYS}-libtool, so it is not being
> found.

That's the behavior we observed here too.


> For now I am working around the problem with the following patch, but
> I suspect this is going to crop up in other packages sooner or later:
>
> diff --git a/recipes/xorg-lib/libx11_1.2.bb b/recipes/xorg-lib/libx11_1.2=
.bb
> index a3d000f..8415315 100644
> --- a/recipes/xorg-lib/libx11_1.2.bb
> +++ b/recipes/xorg-lib/libx11_1.2.bb
> @@ -13,6 +13,10 @@ SRC_URI +=3D "file://x11_disable_makekeys.patch;patch=
=3D1 \
>
>  EXTRA_OECONF +=3D "--without-xcb --with-keysymdef=3D${STAGING_INCDIR}/X1=
1/keysymdef.h"
>
> +do_configure_append() {
> +       ln -s ${HOST_SYS}-libtool libtool
> +}
> +
>  do_compile() {
>         (
>                 unset CC LD CXX CCLD CFLAGS CPPFLAGS LDFLAGS CXXFLAGS

As Otavio mentioned, we faced this problem here, but our approach to
solve it was a little different (in terms of implementation).  We
actually fixed the acinclude.m4 file (the patch is attached).

I guess the right thing to do is to patch dolt.m4
(http://cgit.freedesktop.org/dolt/ -- from where libx11's and xserver's
acinclude.m4 are generated, I suppose).  We are working on a patch for
it (the fix is basically the same as for acinclude.m4).

Best wishes.
Mario

--=-=-=
Content-Type: text/x-diff
Content-Disposition: attachment; filename=acinclude.m4.patch

--- libX11-1.2/acinclude.m4.orig	2009-05-29 16:45:39.000000000 -0300
+++ libX11-1.2/acinclude.m4	2009-05-29 18:29:56.000000000 -0300
@@ -213,10 +213,16 @@
 if $modeok && $tagok ; then
     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
 else
-    exec ${top_builddir_slash}libtool "$[]@"
-fi
 __DOLTLIBTOOL__EOF__
 
+maybe_hyphen=
+if ! test x$host_alias = x; then
+    maybe_hyphen="-"
+fi
+
+echo '    exec ${top_builddir_slash}'${host_alias}${maybe_hyphen}'libtool "$[]@"' >>doltlibtool
+echo 'fi' >>doltlibtool
+
 dnl Done writing out doltlibtool; substitute it for libtool.
     chmod +x doltlibtool
     LIBTOOL='$(top_builddir)/doltlibtool'

--=-=-=--
