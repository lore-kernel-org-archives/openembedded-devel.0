Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 997B3729BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 11:53:20 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id ex7so1444078wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2015 03:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+tVPTqmM/cCRw9LOc0YeC+Mfoe4RMqz102wVIDrxjik=;
	b=iDyjkjtHaviYWLxXhOiR/bAw7HHDv+iMZY+mzXk3jARZ697Q/gBsVONgJXg9U6e34n
	Dm5F4BPnfqoRxN3OX8lPbLeR8QGqCqS2BqUbJzjknFuuokT+R6mM/eyiyrM7m1m/1Tbd
	c6xzf4WQoP7iiFvXc8jdeq5pVRrr9aOGYs5cCSx5x+ICXv6X2Y0BzoKhI6v+duCbTuDv
	KWE6I8D2TdK+Ff87ntS3eK+zNyEsH0FWxFDw/DiycY9FyYELWxOG9I3eaHI9CGGLIjtw
	wida9iNd1iemtC7QCOPx5cFGqvmqizp8e05/uWj0cSMqsLNCzuAJZsFrDcSSGLYLbqIA
	Zx2Q==
X-Received: by 10.194.93.5 with SMTP id cq5mr5374616wjb.84.1420631601157;
	Wed, 07 Jan 2015 03:53:21 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	b10sm2291300wiw.9.2015.01.07.03.53.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 03:53:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 Jan 2015 12:53:22 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150107115322.GL29986@jama>
References: <1417659220-8645-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1417659220-8645-1-git-send-email-qianl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libutempter: Add new recipe
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
X-List-Received-Date: Wed, 07 Jan 2015 11:53:22 -0000
X-Groupsio-MsgNum: 53727
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7l042bGvurpep9Wg"
Content-Disposition: inline

--7l042bGvurpep9Wg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2014 at 10:13:40AM +0800, Qian Lei wrote:
> Libutempter provides interface for terminal emulators such as
> screen and xterm to record user sessions to utmp and wtmp files.

It's failing for all MACHINEs in world builds now.

Please fix it soon, otherwise it will be blacklisted/removed from meta-oe

ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5te-oe-linux-gnueabi/libutempter/1.1.6-r0/temp/log.do_compile.=
9839
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 8 -e MAKEFLAGS=3D libdir=3D/usr/lib libexecdir=3D/usr/lib/l=
ibutempter
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm  -mthumb-interwork --sys=
root=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm  -O2 -pip=
e -g -feliminate-unused-debug-types -DLIBEXECDIR=3D/usr/lib/libutempter  -W=
l,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed  -Wl,-z,now,-stats  utempter.c=
 -o utempter
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm  -mthumb-interwork --sys=
root=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm  -O2 -pip=
e -g -feliminate-unused-debug-types -DLIBEXECDIR=3D/usr/lib/libutempter   -=
c -fPIC iface.c -o iface.os
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm  -mthumb-interwork --sys=
root=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm  -O2 -pip=
e -g -feliminate-unused-debug-types -DLIBEXECDIR=3D/usr/lib/libutempter   -=
c -o iface.o iface.c
| iface.c: In function 'utempter_add_record':
| <command-line>:0:12: error: expected expression before '/' token
| iface.c:46:35: note: in expansion of macro 'LIBEXECDIR'
|  #define UTEMPTER_DEFAULT_PATHNAME LIBEXECDIR "/utempter/utempter"
|                                    ^
| iface.c:144:27: note: in expansion of macro 'UTEMPTER_DEFAULT_PATHNAME'
|    { utempter_pathname ? : UTEMPTER_DEFAULT_PATHNAME, "add",
|                            ^
| iface.c: In function 'utempter_remove_record':
| <command-line>:0:12: error: expected expression before '/' token
| iface.c:46:35: note: in expansion of macro 'LIBEXECDIR'
|  #define UTEMPTER_DEFAULT_PATHNAME LIBEXECDIR "/utempter/utempter"
|                                    ^
| iface.c:158:27: note: in expansion of macro 'UTEMPTER_DEFAULT_PATHNAME'
|    { utempter_pathname ? : UTEMPTER_DEFAULT_PATHNAME, "del", 0 };
|                            ^
| iface.c:158:25: warning: pointer type mismatch in conditional expression
|    { utempter_pathname ? : UTEMPTER_DEFAULT_PATHNAME, "del", 0 };
|                          ^
| make: *** [iface.os] Error 1
| make: *** Waiting for unfinished jobs....
| iface.c: In function 'utempter_add_record':
| <command-line>:0:12: error: expected expression before '/' token
| iface.c:46:35: note: in expansion of macro 'LIBEXECDIR'
|  #define UTEMPTER_DEFAULT_PATHNAME LIBEXECDIR "/utempter/utempter"
|                                    ^
| iface.c:144:27: note: in expansion of macro 'UTEMPTER_DEFAULT_PATHNAME'
|    { utempter_pathname ? : UTEMPTER_DEFAULT_PATHNAME, "add",
|                            ^
| iface.c: In function 'utempter_remove_record':
| <command-line>:0:12: error: expected expression before '/' token
| iface.c:46:35: note: in expansion of macro 'LIBEXECDIR'
|  #define UTEMPTER_DEFAULT_PATHNAME LIBEXECDIR "/utempter/utempter"
|                                    ^
| iface.c:158:27: note: in expansion of macro 'UTEMPTER_DEFAULT_PATHNAME'
|    { utempter_pathname ? : UTEMPTER_DEFAULT_PATHNAME, "del", 0 };
|                            ^
| iface.c:158:25: warning: pointer type mismatch in conditional expression
|    { utempter_pathname ? : UTEMPTER_DEFAULT_PATHNAME, "del", 0 };
|                          ^
| make: *** [iface.o] Error 1
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: initial tasks ru=
n time: (user: 0.010000 sys: 0.010000 wall: 0.020000)
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: middle tasks run=
 time: (user: 0.000000 sys: 0.000000 wall: 0.000000)
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: final tasks run =
time: (user: 0.000000 sys: 0.000000 wall: 0.000000)
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: total run time: =
(user: 0.010000 sys: 0.010000 wall: 0.020000)
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: total space allo=
cated by malloc: 3207168 bytes
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: total bytes mapp=
ed for read: 36264230
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: maximum bytes ma=
pped for read at one time: 36264230
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: archive librarie=
s: 7
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: total archive me=
mbers: 5668
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: loaded archive m=
embers: 1
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: lib groups: 0
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: total lib groups=
 members: 0
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: loaded lib group=
s members: 0
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: output file size=
: 18452 bytes
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: symbol table ent=
ries: 6765; buckets: 12011
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: symbol table str=
ingpool entries: 3410; buckets: 12011
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: symbol table str=
ingpool Stringdata structures: 47
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: section name poo=
l entries: 41; buckets: 47
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: section name poo=
l Stringdata structures: 1
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: output symbol na=
me pool entries: 62; buckets: 79
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: output symbol na=
me pool Stringdata structures: 1
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: dynamic name poo=
l entries: 25; buckets: 79
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: dynamic name poo=
l Stringdata structures: 1
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: .rodata merged c=
onstants size: 4; input: 1; output: 1
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: .rodata merged s=
trings input bytes: 24
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: .rodata merged s=
trings input strings: 2
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: .rodata merged s=
trings entries: 3; buckets: 11
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: .rodata merged s=
trings Stringdata structures: 1
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: .comment merged =
strings input bytes: 90
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: .comment merged =
strings input strings: 5
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: .comment merged =
strings entries: 2; buckets: 11
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: .comment merged =
strings Stringdata structures: 1
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: .debug_str merge=
d strings input bytes: 2485
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: .debug_str merge=
d strings input strings: 185
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: .debug_str merge=
d strings entries: 168; buckets: 199
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: .debug_str merge=
d strings Stringdata structures: 3
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: total free lists=
: 0
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: total free list =
nodes: 0
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: calls to Free_li=
st::remove: 0
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: nodes visited: 0
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: calls to Free_li=
st::allocate: 0
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: nodes visited: 0
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libutempter/1.1.6=
-r0/temp/log.do_compile.9839)
NOTE: recipe libutempter-1.1.6-r0: task do_compile: Failed

>=20
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  .../libutempter/libutempter_1.1.6.bb               | 36 ++++++++++++++++=
++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libutempter/libutempter_1.1.6=
=2Ebb
>=20
> diff --git a/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb b/m=
eta-oe/recipes-support/libutempter/libutempter_1.1.6.bb
> new file mode 100644
> index 0000000..e1dccd6
> --- /dev/null
> +++ b/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb
> @@ -0,0 +1,36 @@
> +SUMMARY =3D "A privileged helper for utmp/wtmp updates"
> +DESCRIPTION =3D "\
> +This library provides interface for terminal emulators such as \
> +screen and xterm to record user sessions to utmp and wtmp files."
> +HOMEPAGE =3D "ftp://ftp.altlinux.org/pub/people/ldv/utempter"
> +SECTION =3D "System Environment/Libraries"
> +LICENSE =3D "GPLv2 GPLv2+ LGPLv2 MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
> +
> +SRC_URI =3D "ftp://ftp.altlinux.org/pub/people/ldv/utempter/${BP}.tar.bz=
2"
> +SRC_URI[md5sum] =3D "b43827806923903aba2bc7cd3a2d45b7"
> +SRC_URI[sha256sum] =3D "b898565f31ced7e5c1fa0a2eaa0f6ff0ed862b5fe375d263=
75b64bfbdfeac397"
> +
> +CFLAGS +=3D "-DLIBEXECDIR=3D$(libexecdir)"
> +
> +do_compile() {
> +    oe_runmake                      \
> +        libdir=3D${libdir}            \
> +        libexecdir=3D${libexecdir}    \
> +}
> +
> +do_install() {
> +    oe_runmake install              \
> +        DESTDIR=3D${D}                \
> +        libdir=3D"${libdir}"          \
> +        libexecdir=3D"${libexecdir}"  \
> +        includedir=3D${includedir}    \
> +        mandir=3D${mandir}
> +
> +        rm -f ${D}${libdir}/*.a
> +}
> +
> +FILES_${PN} =3D "${libdir}/*.so.*"
> +FILES_${PN} +=3D "${libexecdir}/utempter/utempter"
> +
> +FILES_${PN}-dbg +=3D "${libexecdir}/utempter/.debug/utempter"
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7l042bGvurpep9Wg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlStHjIACgkQN1Ujt2V2gBzpkQCcCqjoFUeNEsYOOUECJ+H7blRc
YEcAnjU/8ulVABUvkODJOA6NK6AyjLtX
=6CX3
-----END PGP SIGNATURE-----

--7l042bGvurpep9Wg--
