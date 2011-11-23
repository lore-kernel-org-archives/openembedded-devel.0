Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTJCj-0007hK-QV
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Nov 2011 21:14:01 +0100
Received: by ywb20 with SMTP id 20so1667355ywb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2011 12:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=VsgqNOQa2M51BuY4V5Vu/zyqSAE7EcyI08Z20xO/BDM=;
	b=PkiGkuxwNXPJP6wlybpVG1oy5IQ/zvgcL5ewgftXFCUNv9OC2YLiBUn920lLM07QsG
	s3aRZjus9Fff+7p9umKG25opkX7POpO2eRkSRbCwM7PVANl2T5FYbxekxBLH4IsfaWiC
	OThn1X0i7G3FYeG6YGpZJcRQwXwfFfF48GieM=
Received: by 10.152.104.236 with SMTP id gh12mr15824527lab.49.1322078842064;
	Wed, 23 Nov 2011 12:07:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 23 Nov 2011 12:06:51 -0800 (PST)
In-Reply-To: <1322044489-25810-1-git-send-email-Martin.Jansa@gmail.com>
References: <CA+chaQdUFUswZg-aYtWdEiF0C3fVFtrmMP8uH+AMKtbH2yGkKg@mail.gmail.com>
	<1322044489-25810-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2011 12:06:51 -0800
Message-ID: <CAMKF1sqefAi5zQoX8hyFXuo8Xus6r3=8KyQ_E4SyCvGewi9KzA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] abiword: fix no-undefined param
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
X-List-Received-Date: Wed, 23 Nov 2011 20:14:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2011 at 2:34 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =C2=A0.../abiword/abiword/fix.no.undefined.param.patch =C2=A0 | =C2=A0 30=
 ++++++++++++++++++++
> =C2=A0meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb =C2=A0| =C2=A0 =
=C2=A05 ++-
> =C2=A02 files changed, 34 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 meta-gnome/recipes-gnome/abiword/abiword/fix.no.=
undefined.param.patch
>
> diff --git a/meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.pa=
ram.patch b/meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.param=
.patch
> new file mode 100644
> index 0000000..954b50d
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.param.pat=
ch
> @@ -0,0 +1,30 @@
> +diff -uNr abiword-2.8.6.orig/src/Makefile.am abiword-2.8.6/src/Makefile.=
am
> +--- abiword-2.8.6.orig/src/Makefile.am 2009-09-09 15:11:01.000000000 +02=
00
> ++++ abiword-2.8.6/src/Makefile.am =C2=A0 =C2=A0 =C2=A02011-11-23 09:06:0=
6.000000000 +0100
> +@@ -44,7 +44,7 @@
> +
> + libabiword_2_8_la_LDFLAGS =3D \
> + =C2=A0 =C2=A0 =C2=A0 $(DEPS_LIBS) \
> +- =C2=A0 =C2=A0 =C2=A0--no-undefined \
> ++ =C2=A0 =C2=A0 =C2=A0-no-undefined \
> + =C2=A0 =C2=A0 =C2=A0 -avoid-version \
> + =C2=A0 =C2=A0 =C2=A0 -export-dynamic
> +
> +@@ -107,7 +107,7 @@
> +
> + AbiWord_LDFLAGS =3D \
> + =C2=A0 =C2=A0 =C2=A0 $(DEPS_LIBS) \
> +- =C2=A0 =C2=A0 =C2=A0--no-undefined \
> ++ =C2=A0 =C2=A0 =C2=A0-no-undefined \
> + =C2=A0 =C2=A0 =C2=A0 -avoid-version \
> + =C2=A0 =C2=A0 =C2=A0 -export-dynamic \
> + =C2=A0 =C2=A0 =C2=A0 -headerpad_max_install_names
> +@@ -129,7 +129,7 @@
> +
> + abiword_LDFLAGS =3D \
> + =C2=A0 =C2=A0 =C2=A0 $(platform_ldflags) \
> +- =C2=A0 =C2=A0 =C2=A0--no-undefined =C2=A0 =C2=A0 =C2=A0\
> ++ =C2=A0 =C2=A0 =C2=A0-no-undefined =C2=A0 =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 -avoid-version =C2=A0 =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 -export-dynamic
> +
> diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb b/meta-gno=
me/recipes-gnome/abiword/abiword_2.8.6.bb
> index 1746769..2d0ec97 100644
> --- a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
> +++ b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
> @@ -2,9 +2,12 @@ require abiword-2.5.inc
> =C2=A0DEPENDS +=3D " loudmouth libwmf-native gtkmathview asio"
> =C2=A0RCONFLICTS_${PN} =3D "abiword-embedded"
>
> +PR =3D "r1"
> +
> =C2=A0SRC_URI =3D "http://www.abisource.com/downloads/abiword/${PV}/sourc=
e/abiword-${PV}.tar.gz;name=3Dabiword \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://autogen-common.sh \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://nodolt.patch"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://nodolt.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix.no.undefined.param.patch"
>
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Decd3ac329fca77e2d0e412be=
c38e1c20"
>

while the content of this patch is ok it would be nice to have patch
header e.g. is this patch needed upstream or is it
a backport and some history that you shared in other email would make
sense to have that as commit comment


