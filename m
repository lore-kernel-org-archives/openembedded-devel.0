Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LeZID-0001qh-6f
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 19:24:37 +0100
Received: by bwz9 with SMTP id 9so2515521bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2009 10:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=BXgrx6PQlAQt7EM6HKjvXpsP1r/CXEAgoyHyMTHLeiE=;
	b=a9VnByVUGDNG53nLA5PAnzXV3EKq8r/pR5ObLAvAaVtaji2Tx8ds4MFkZ1hLuRtx50
	d9Rn8Ly+Y6pae/qEztdIBHzOE3Dr/DJ+BYkIAexPSlrLs2/5GO2xbMLHyKY4ACZZGLl1
	QTtZhZebLhyvSQVd0zlTpP//ZU81bpaJNCSXM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=YSG1SreEQBos1ORu9EuF/bn0JCpKtb9LwUihAV/HobA5ogSQTgmnNZCSqXNaN9Q6rZ
	Nw2u7JLp+vwSLNERbE0ZZuFk4q9t6RUF0xZ1M1OKbm/Fc9h00OEHTQiv5mK/FYgbGAbX
	r2JT4MxeTqrfN6nY4geaCo8xPmth/bauiGQbA=
MIME-Version: 1.0
Received: by 10.181.209.1 with SMTP id l1mr2622134bkq.139.1236104430335; Tue, 
	03 Mar 2009 10:20:30 -0800 (PST)
In-Reply-To: <1236103767-18596-1-git-send-email-ihar.hrachyshka@gmail.com>
References: <1236103767-18596-1-git-send-email-ihar.hrachyshka@gmail.com>
Date: Tue, 3 Mar 2009 20:20:30 +0200
Message-ID: <fce2a370903031020o72c07dd3k1d57cf8b8339651a@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] [nfs-utils]: fixed cross-compilation for tools
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
X-List-Received-Date: Tue, 03 Mar 2009 18:24:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Seems to be another way to do it. Don't commit it as for now...

On Tue, Mar 3, 2009 at 8:09 PM, Ihar Hrachyshka
<ihar.hrachyshka@gmail.com> wrote:
> Fixed a mess with CFLAGS, CC_FOR_BUILD and other stuff: this patch
> forces compilation of tools/ stuff with compiler defined by ./configure
>
> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> ---
> =C2=A0packages/nfs-utils/files/cross-compile.patch | =C2=A0 56 ++++++++++=
++++++++++++++++
> =C2=A0packages/nfs-utils/nfs-utils_1.1.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 =C2=A03 +-
> =C2=A02 files changed, 58 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 packages/nfs-utils/files/cross-compile.patch
>
> diff --git a/packages/nfs-utils/files/cross-compile.patch b/packages/nfs-=
utils/files/cross-compile.patch
> new file mode 100644
> index 0000000..e297b29
> --- /dev/null
> +++ b/packages/nfs-utils/files/cross-compile.patch
> @@ -0,0 +1,56 @@
> +diff -urN nfs-utils-1.1.2.orig/tools/locktest/Makefile.am nfs-utils-1.1.=
2/tools/locktest/Makefile.am
> +--- nfs-utils-1.1.2.orig/tools/locktest/Makefile.am =C2=A0 =C2=A02009-03=
-03 17:33:48.000000000 +0200
> ++++ nfs-utils-1.1.2/tools/locktest/Makefile.am 2009-03-03 18:12:59.00000=
0000 +0200
> +@@ -1,12 +1,8 @@
> + ## Process this file with automake to produce Makefile.in
> +
> +-CC=3D$(CC_FOR_BUILD)
> + LIBTOOL =3D @LIBTOOL@ --tag=3DCC
> +
> + noinst_PROGRAMS =3D testlk
> + testlk_SOURCES =3D testlk.c
> +-testlk_CFLAGS=3D$(CFLAGS_FOR_BUILD)
> +-testlk_CPPFLAGS=3D$(CPPFLAGS_FOR_BUILD)
> +-testlk_LDFLAGS=3D$(LDFLAGS_FOR_BUILD)
> +
> + MAINTAINERCLEANFILES =3D Makefile.in
> +diff -urN nfs-utils-1.1.2.orig/tools/rpcdebug/Makefile.am nfs-utils-1.1.=
2/tools/rpcdebug/Makefile.am
> +--- nfs-utils-1.1.2.orig/tools/rpcdebug/Makefile.am =C2=A0 =C2=A02009-03=
-03 17:33:48.000000000 +0200
> ++++ nfs-utils-1.1.2/tools/rpcdebug/Makefile.am 2009-03-03 18:30:27.00000=
0000 +0200
> +@@ -1,6 +1,5 @@
> + ## Process this file with automake to produce Makefile.in
> +
> +-CC=3D$(CC_FOR_BUILD)
> + LIBTOOL =3D @LIBTOOL@ --tag=3DCC
> +
> + man8_MANS =3D rpcdebug.man
> +@@ -8,8 +7,5 @@
> +
> + sbin_PROGRAMS =3D rpcdebug
> + rpcdebug_SOURCES =3D rpcdebug.c
> +-rpcdebug_CFLAGS=3D$(CFLAGS_FOR_BUILD)
> +-rpcdebug_CPPFLAGS=3D$(CPPFLAGS_FOR_BUILD) -I$(top_srcdir)/support/inclu=
de
> +-rpcdebug_LDFLAGS=3D$(LDFLAGS_FOR_BUILD)
> +
> + MAINTAINERCLEANFILES =3D Makefile.in
> +diff -urN nfs-utils-1.1.2.orig/tools/rpcgen/Makefile.am nfs-utils-1.1.2/=
tools/rpcgen/Makefile.am
> +--- nfs-utils-1.1.2.orig/tools/rpcgen/Makefile.am =C2=A0 =C2=A0 =C2=A020=
09-03-03 17:33:48.000000000 +0200
> ++++ nfs-utils-1.1.2/tools/rpcgen/Makefile.am =C2=A0 2009-03-03 18:13:10.=
000000000 +0200
> +@@ -1,6 +1,5 @@
> + ## Process this file with automake to produce Makefile.in
> +
> +-CC=3D$(CC_FOR_BUILD)
> + LIBTOOL =3D @LIBTOOL@ --tag=3DCC
> +
> + noinst_PROGRAMS =3D rpcgen
> +@@ -9,10 +8,6 @@
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rpc_util.c rpc_s=
ample.c rpc_output.h rpc_parse.h \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rpc_scan.h rpc_u=
til.h
> +
> +-rpcgen_CFLAGS=3D$(CFLAGS_FOR_BUILD)
> +-rpcgen_CPPLAGS=3D$(CPPFLAGS_FOR_BUILD)
> +-rpcgen_LDFLAGS=3D$(LDFLAGS_FOR_BUILD)
> +-
> + MAINTAINERCLEANFILES =3D Makefile.in
> +
> + EXTRA_DIST =3D rpcgen.new.1
> diff --git a/packages/nfs-utils/nfs-utils_1.1.2.bb b/packages/nfs-utils/n=
fs-utils_1.1.2.bb
> index 353eb57..7bff4f6 100644
> --- a/packages/nfs-utils/nfs-utils_1.1.2.bb
> +++ b/packages/nfs-utils/nfs-utils_1.1.2.bb
> @@ -3,11 +3,12 @@ PRIORITY =3D "optional"
> =C2=A0SECTION =3D "console/network"
> =C2=A0LICENSE =3D "GPL"
>
> -PR =3D "3"
> +PR =3D "4"
>
> =C2=A0DEPENDS =3D "e2fsprogs-libs tcp-wrappers libevent"
>
> =C2=A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.gz \
> + =C2=A0 =C2=A0 =C2=A0 file://cross-compile.patch;patch=3D1 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://nfsserver \
> =C2=A0 =C2=A0"
>
> --
> 1.6.2.rc2.22.g1d035
>
>


