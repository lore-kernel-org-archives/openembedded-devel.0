Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OFZ3w-0001Sw-2x
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 22:43:21 +0200
Received: by iwn2 with SMTP id 2so1449957iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 May 2010 13:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nesmBVJN80rRKkgV73By/nQxRpwz4BKO28/ETqxjcYo=;
	b=hS1vGmmsuKMdDMoJs/oglre2gMIQWgMXecKJfwNbSwaFrvgOLLI4CQrqryeaF3O+/R
	ipgdisFYEEaBZfjaN/6o4a2MT3WikA/uPxR84uwuMGAObyt1MEYDjMcGZ0Ys0x3IDuZC
	y5IxofmSd0UmxGghQZMo1g/qYq8hj3xLfPxKs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=q/XTy1VTYZTP785t1xtQihpqyE+zXkW7bOonNtR6yX3yqaiVcXTiZqnmVdlXpdAKiD
	OKNf16V0CgPivvKAqzfVsjl6g0Y9GXs4A5LNUcQAda6/lDZjQxpzFUbkBFJwor6r61c8
	0m6bjcQ5LSpXV7nr3O7Uh2hl/i7KiZlpA9Wr8=
MIME-Version: 1.0
Received: by 10.231.178.135 with SMTP id bm7mr1807389ibb.73.1274474357813; 
	Fri, 21 May 2010 13:39:17 -0700 (PDT)
Received: by 10.231.30.67 with HTTP; Fri, 21 May 2010 13:39:17 -0700 (PDT)
In-Reply-To: <1274452686-17891-1-git-send-email-vjensen@gmx.de>
References: <alpine.LNX.2.00.1005162211110.21508@asterix.crazy-teaparty.dyndns.org>
	<1274452686-17891-1-git-send-email-vjensen@gmx.de>
Date: Fri, 21 May 2010 13:39:17 -0700
Message-ID: <AANLkTilrTp4aqvXB8ggicStZnp3LYj9474x5KedKNeUd@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3 1/3] libsocketcan: new recipes
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
X-List-Received-Date: Fri, 21 May 2010 20:43:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2010 at 7:38 AM, Vitus Jensen <vjensen@gmx.de> wrote:
> Build pengutronix' libsocketcan (netlink interface), used
> by newer versions of canutils. =A0can_netlink.h is really
> linux/can/netlink.h from linux-libc-headers but installed
> here to be independ of staged linux-libc-headers versions.

is there any reason to have an encapsulated copy of this header
besides being independent ?

> libsocketcan 0.0.8 automatically installs can_netlink.h,
> version 0.0.7 is patched to do so.
>
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
> ---
> =A0.../socketcan/files/install-can_netlink.h.patch =A0 =A0| =A0 21 ++++++=
++++++++++++++
> =A0recipes/socketcan/libsocketcan.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 16 +++++++++++++++
> =A0recipes/socketcan/libsocketcan_0.0.7.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A07 ++++++
> =A0recipes/socketcan/libsocketcan_0.0.8.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A04 +++
> =A04 files changed, 48 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/socketcan/files/install-can_netlink.h.patch
> =A0create mode 100644 recipes/socketcan/libsocketcan.inc
> =A0create mode 100644 recipes/socketcan/libsocketcan_0.0.7.bb
> =A0create mode 100644 recipes/socketcan/libsocketcan_0.0.8.bb
>
> diff --git a/recipes/socketcan/files/install-can_netlink.h.patch b/recipe=
s/socketcan/files/install-can_netlink.h.patch
> new file mode 100644
> index 0000000..36f5e10
> --- /dev/null
> +++ b/recipes/socketcan/files/install-can_netlink.h.patch
> @@ -0,0 +1,21 @@
> +commit 2470d91a6254b062aae8ab6120795a0f28344687
> +Author: Vitus Jensen <vitus@vitus.devnet.local>
> +Date: =A0 Tue May 18 16:59:01 2010 +0200
> +
> + =A0 =A0install can_netlink.h
> +
> +diff --git a/include/GNUmakefile.am b/include/GNUmakefile.am
> +index 4ba2798..eb35a3a 100644
> +--- a/include/GNUmakefile.am
> ++++ b/include/GNUmakefile.am
> +@@ -1,8 +1,6 @@
> +-noinst_HEADERS =3D \
> +- =A0 =A0 =A0can_netlink.h
> +-
> + nobase_include_HEADERS =3D \
> +- =A0 =A0 =A0libsocketcan.h
> ++ =A0 =A0 =A0libsocketcan.h =A0\
> ++ =A0 =A0 =A0can_netlink.h
> +
> + MAINTAINERCLEANFILES =3D \
> + =A0 =A0 =A0 libsocketcan_config.h.in \
> diff --git a/recipes/socketcan/libsocketcan.inc b/recipes/socketcan/libso=
cketcan.inc
> new file mode 100644
> index 0000000..367766c
> --- /dev/null
> +++ b/recipes/socketcan/libsocketcan.inc
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "Control basic functions in socketcan from userspace"
> +AUTHOR =3D "Luotao Fu"
> +HOMEPAGE =3D "http://www.pengutronix.de"
> +SECTION =3D "libs/network"
> +PRIORITY =3D "optional"
> +LICENSE =3D "LGPL"
> +
> +TAG =3D "v${PV}"
> +INC_PR =3D "r0"
> +
> +SRC_URI =3D "git://git.pengutronix.de/git/tools/libsocketcan.git;protoco=
l=3Dgit;tag=3D${TAG} \
> + =A0 =A0 =A0 "
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools_stage pkgconfig
> diff --git a/recipes/socketcan/libsocketcan_0.0.7.bb b/recipes/socketcan/=
libsocketcan_0.0.7.bb
> new file mode 100644
> index 0000000..7dd4fef
> --- /dev/null
> +++ b/recipes/socketcan/libsocketcan_0.0.7.bb
> @@ -0,0 +1,7 @@
> +TAG =3D "v${PV}"
> +require libsocketcan.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI +=3D "file://install-can_netlink.h.patch;patch=3D1 \
> + =A0 =A0 =A0 "
> diff --git a/recipes/socketcan/libsocketcan_0.0.8.bb b/recipes/socketcan/=
libsocketcan_0.0.8.bb
> new file mode 100644
> index 0000000..5598a0f
> --- /dev/null
> +++ b/recipes/socketcan/libsocketcan_0.0.8.bb
> @@ -0,0 +1,4 @@
> +TAG =3D "v${PV}"
> +require libsocketcan.inc
> +
> +PR =3D "${INC_PR}.0"
> --
> 1.6.4.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


