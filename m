Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQQXF-0002FX-Oi
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 May 2012 23:59:33 +0200
Received: by laai10 with SMTP id i10so1661540laa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 May 2012 14:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=fG/PRmf/Z3EyXuxpLeHx/uOHXq/MwTFMDnAtUd7gsow=;
	b=POxLMZal9uul3VdNhIRoc+bQihicq6Pfr/G2uOJAe4vMsls+bEHSR5DHuhwEW8VkXD
	CgZRNHPin8mlS5N123u3m1LLOu0JADOxWieVpq1Mblm5hpLmRp4z2LGtf1LRZkShgWG6
	fFg1QDZ4844ZBbvHHGumXVkRGg36DUtRxWbWzWvj79OMMLod2ZkMNacFRiIVqqWojRm2
	c9w0sWpbSkowxTA5Lb3Kw/QjOpiQxpxxMTWiCVWWkz05mqjVPVGxvFjPw5O/viyYQkKZ
	hVd+/Xig8ZFQTKdcQPUuFjPdzfSF8y5DMNRr85UUZVCAM/DMfAxh0J8j6JUNKHlMJf5V
	0Ltw==
Received: by 10.152.133.144 with SMTP id pc16mr426079lab.0.1336168186544; Fri,
	04 May 2012 14:49:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 4 May 2012 14:49:16 -0700 (PDT)
In-Reply-To: <1336166708-14019-1-git-send-email-gizero@gmail.com>
References: <1336166708-14019-1-git-send-email-gizero@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 May 2012 14:49:16 -0700
Message-ID: <CAMKF1soRXCLFQLgVzCsjzJS6W-gGGAUs0AwMh0B7WtfrEEPC2A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libmodbus: ported recipe from classic and updated
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
X-List-Received-Date: Fri, 04 May 2012 21:59:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 4, 2012 at 2:25 PM, Andrea Galbusera <gizero@gmail.com> wrote:
> * based on recipe by Radoslav Kolev which was in classic
> * updated to latest released version 3.0.2
> * also provide an _git version with up-to-date SRCREV and
> DEFAULT_PREFERENCE =3D "-1"

You should always prefix the subject line with layername e.g.
[meta-oe]... so you get appropriate maintainers attention

Do we really need the git version ? if not then drop it.

> * common part factorized as libmodbus.inc
>
> Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> ---
> =C2=A0meta-oe/recipes-extended/libmodbus/libmodbus.inc =C2=A0 | =C2=A0 13=
 +++++++++++++
> =C2=A0.../recipes-extended/libmodbus/libmodbus_3.0.2.bb =C2=A0| =C2=A0 =
=C2=A08 ++++++++
> =C2=A0.../recipes-extended/libmodbus/libmodbus_git.bb =C2=A0 =C2=A0| =C2=
=A0 13 +++++++++++++
> =C2=A03 files changed, 34 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus.inc
> =C2=A0create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.0=
.2.bb
> =C2=A0create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_git=
.bb
>
> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus.inc b/meta-oe/r=
ecipes-extended/libmodbus/libmodbus.inc
> new file mode 100644
> index 0000000..8e0e011
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus.inc
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "A Modbus library"
> +DESCRIPTION =3D "libmodbus is a C library designed to provide a fast and=
 robust \
> +implementation of the Modbus protocol. It runs on Linux, Mac OS X, FreeB=
SD, \
> +QNX and Windows."
> +HOMEPAGE =3D "http://www.libmodbus.org/"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"

PRIORITY is no longer used drop it.

> +LICENSE =3D "LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D4fbd65380cdd2559510790=
08b364516c"
> +
> +INC_PR =3D "r0"

if you are just having 1 recipe i.e. dropping git recipe then change that
to PR

> +
> +inherit autotools pkgconfig
> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb b/meta=
-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
> new file mode 100644
> index 0000000..7a99f72
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
> @@ -0,0 +1,8 @@
> +require libmodbus.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI =3D "http://github.com/downloads/stephane/libmodbus/libmodbus-${=
PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "1aaacce9d9779d3a84f7d1a75774c943"
> +SRC_URI[sha256sum] =3D "927ec90e0e299a7d4ec7086b1e2590566bdfc3bbc22e1220=
4229361c029f2615"
> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_git.bb b/meta-o=
e/recipes-extended/libmodbus/libmodbus_git.bb
> new file mode 100644
> index 0000000..793a9d6
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus_git.bb
> @@ -0,0 +1,13 @@
> +require libmodbus.inc
> +
> +SRCREV =3D "23dd803f3f2b7be668408fa938e8d665249b4fba"
> +
> +PV =3D "3.0.2+gitr${SRCPV}"
> +
> +PR =3D "${INC_PR}.0"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +SRC_URI =3D "git://github.com/stephane/libmodbus;branch=3Dmaster;protoco=
l=3Dgit"
> +S =3D "${WORKDIR}/git"
> +
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


