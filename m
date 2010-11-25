Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lazy.gopher@gmail.com>) id 1PLZp8-000731-3J
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 12:17:12 +0100
Received: by gyd12 with SMTP id 12so406904gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 03:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=76p82lhWuuytgj4tE31e2mYGgDPD0ihCd3Cjw11Jp2M=;
	b=cZxh7G0gLA6LoucSduklS/7hlHs5tYTRE7Dy53rupY30FgqFkGKQ5ku/9VMvGbI3g1
	+XYTO58SxwmWSwTrYfvMeW2/QU5ee9zXVLUtZfSBEx6p9CYYLuTPZKGWfCDsxs8eSX+M
	9aheTFp+d5S5Q1/ot7fdAHBbsjmZBVqUONSNA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=hofDXgUAy1AOGALUs1R2d+mO6eduDZeLbmAnIZ/TOGE7/F1fTkvqexVkrlnuxfRxgz
	3VUXz4WstFxCm/Wa3T3M8OaN8vNzzK+Cn8SYhOq1KA1i4WXYWMhTZO3+kWYFv7WmRdEp
	48L0EclqZbNg4c93iYQ5toxJG2ZxFuJTTxdLA=
MIME-Version: 1.0
Received: by 10.91.17.20 with SMTP id u20mr2512602agi.96.1290683752826; Thu,
	25 Nov 2010 03:15:52 -0800 (PST)
Received: by 10.90.116.18 with HTTP; Thu, 25 Nov 2010 03:15:52 -0800 (PST)
In-Reply-To: <1290664003-17257-1-git-send-email-jayen@cse.unsw.edu.au>
References: <1290664003-17257-1-git-send-email-jayen@cse.unsw.edu.au>
Date: Thu, 25 Nov 2010 12:15:52 +0100
Message-ID: <AANLkTinV+PWoPR9DuTHskOcLWCMU_h+suGQt1HNc4cMf@mail.gmail.com>
From: Maksym Parkachov <lazy.gopher@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: lazy.gopher@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jayen Ashar <jayen@cse.unsw.edu.au>
Subject: Re: [PATCH] IceE: New program
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
X-List-Received-Date: Thu, 25 Nov 2010 11:17:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jayen,

I'm sorry to say, but your patch has a several issue, first and
foremost is that it will not compile on the system without slice2cppe
installed. You could use the slice2cppe binary supplied in the
sources, but it will not work even on x86-64 without 32-bit libraries
installed, not even mentioning, if your host is not x86. So, you
package should first provide native slice2cppe in order to compile
library.

Second issue, related, that you don't provide all dependencies. As far
as I remember, it depends on mcpp and bzip2 at least. And as I
mentioned on the native version of the package itself. I did commit
the mcpp couple of weeks ago in oe, but it still needs to be patched
to address one of the bug (see zeroc forums)

Third, you install way too much on the embedded system. Why do you
need all the tools on the target, you probably need just libice.so. It
needs splitting into multiple packages, probably the debian way is
good. And I did't check, but you probably install slice2cppe x86
version on the target, don't you ?

The good news, that I have in my local tree the version which
addresses all above-mentioned problems, but unfortunately, I didn't
have a time to bring it to commitable state. If you could wait week or
so, I will submit new version, or you could implement all the things
yourself and submit new version.

I'm not core developer but, NACK.

Regards,
Maksym Parkachov.


On Thu, Nov 25, 2010 at 6:46 AM, Jayen Ashar <jayen@cse.unsw.edu.au> wrote:
> * Starting with 1.3.0
> * ZeroC Ice is a CORBA-like middleware solution. IceE is a subset of Ice =
used in
> * =C2=A0embedded systems.
>
> Signed-off-by: Jayen Ashar <jayen@cse.unsw.edu.au>
> ---
> =C2=A0recipes/zeroc-ice-e/zeroc-ice-e.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 24 ++++++++
> =C2=A0recipes/zeroc-ice-e/zeroc-ice-e/configure.patch | =C2=A0 11 ++++
> =C2=A0recipes/zeroc-ice-e/zeroc-ice-e/cross.patch =C2=A0 =C2=A0 | =C2=A0 =
68 +++++++++++++++++++++++
> =C2=A0recipes/zeroc-ice-e/zeroc-ice-e_1.3.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 =C2=A03 +
> =C2=A04 files changed, 106 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/zeroc-ice-e/zeroc-ice-e.inc
> =C2=A0create mode 100644 recipes/zeroc-ice-e/zeroc-ice-e/configure.patch
> =C2=A0create mode 100644 recipes/zeroc-ice-e/zeroc-ice-e/cross.patch
> =C2=A0create mode 100644 recipes/zeroc-ice-e/zeroc-ice-e_1.3.0.bb
>
> diff --git a/recipes/zeroc-ice-e/zeroc-ice-e.inc b/recipes/zeroc-ice-e/ze=
roc-ice-e.inc
> new file mode 100644
> index 0000000..654747a
> --- /dev/null
> +++ b/recipes/zeroc-ice-e/zeroc-ice-e.inc
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "Embedded edition of the ZeroC Ice\
> +ZeroC Ice is a CORBA-like middleware solution. IceE is a subset of Ice u=
sed in embedded systems. This is a dummy package that depends on the full s=
et of IceE packages."
> +HOMEPAGE =3D "http://www.zeroc.com/icee/index.html"
> +SECTION =3D "devel"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPL"
> +DEPENDS =3D ""
> +
> +INC_PR =3D "r0"
> +
> +SRC_URI =3D "http://www.zeroc.com/download/IceE/1.3/IceE-${PV}-linux.tar=
.gz \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cross.patch;patch=3D1"
> +
> +S =3D "${WORKDIR}/IceE-${PV}"
> +
> +do_configure() {
> + =C2=A0oe_runmake configure
> +}
> +
> +do_install() {
> + =C2=A0oe_runmake install prefix=3D${D}/${prefix} install_slicedir=3D${D=
}/${datadir}/IceE-${PV}/slice
> +}
> +
> +FILES_${PN} +=3D " ${datadir}/IceE-${PV}"
> diff --git a/recipes/zeroc-ice-e/zeroc-ice-e/configure.patch b/recipes/ze=
roc-ice-e/zeroc-ice-e/configure.patch
> new file mode 100644
> index 0000000..cfb7e3a
> --- /dev/null
> +++ b/recipes/zeroc-ice-e/zeroc-ice-e/configure.patch
> @@ -0,0 +1,11 @@
> +--- cppe/config/Make.rules~ =C2=A0 =C2=A02010-11-14 17:54:54.000000000 +=
1100
> ++++ cppe/config/Make.rules =C2=A0 =C2=A0 2010-11-14 17:55:39.861202351 +=
1100
> +@@ -41,7 +41,7 @@
> + # Define LP64 as yes or no if you want force a 32 or 64 bit. The defaul=
t
> + # is platform-dependent
> + #
> +-#LP64 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D yes
> ++LP64 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D=
 no
> +
> + # ---------------------------------------------------------------------=
-
> + # Ice-E supports a number of optional features that are enabled via
> diff --git a/recipes/zeroc-ice-e/zeroc-ice-e/cross.patch b/recipes/zeroc-=
ice-e/zeroc-ice-e/cross.patch
> new file mode 100644
> index 0000000..3e15d93
> --- /dev/null
> +++ b/recipes/zeroc-ice-e/zeroc-ice-e/cross.patch
> @@ -0,0 +1,68 @@
> +--- a/cppe/config/Make.rules =C2=A0 2008-12-18 19:17:40.000000000 +1100
> ++++ b/cppe/config/Make.rules =C2=A0 2010-11-14 17:47:23.331363971 +1100
> +@@ -12,7 +12,7 @@
> + # if it does not exist.
> + #
> +
> +-prefix =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D /opt/IceE-$(VERSION)
> ++prefix =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0?=3D /opt/IceE-$(VERSION)
> +
> + #
> + # Define OPTIMIZE_SIZE as yes if you want to build with minimal size.
> +@@ -22,7 +22,7 @@
> + #
> +
> + #OPTIMIZE_SIZE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D yes
> +-#OPTIMIZE_SPEED =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D ye=
s
> ++OPTIMIZE_SPEED =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D yes
> +
> + #
> + # Define STATICLIBS as yes if you want to build with static libraries.
> +@@ -35,13 +35,13 @@
> + # Define GUMSTIX as yes if building for gumstix target.
> + #
> +
> +-#GUMSTIX =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D yes
> ++GUMSTIX =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D yes
> +
> + #
> + # Define LP64 as yes or no if you want force a 32 or 64 bit. The defaul=
t
> + # is platform-dependent
> + #
> +-#LP64 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D yes
> ++LP64 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D=
 no
> +
> + # ---------------------------------------------------------------------=
-
> + # Ice-E supports a number of optional features that are enabled via
> +--- a/cppe/include/IceE/Time.h 2008-12-18 19:17:40.000000000 +1100
> ++++ b/cppe/include/IceE/Time.h 2010-11-14 18:21:46.304480446 +1100
> +@@ -12,6 +12,9 @@
> +
> + #include <IceE/Config.h>
> + #include <ostream>
> ++#ifndef _WIN32
> ++# =C2=A0 include <sys/time.h>
> ++#endif
> +
> + namespace IceUtil
> + {
> +--- a/config/Make.common.rules.icee =C2=A0 =C2=A02008-12-18 19:17:40.000=
000000 +1100
> ++++ b/config/Make.common.rules.icee =C2=A0 =C2=A02010-11-14 19:35:26.270=
825893 +1100
> +@@ -155,7 +155,7 @@
> + =C2=A0 =C2=A0 slicedir =3D $(ice_dir)/slice
> + endif
> +
> +-install_slicedir =C2=A0 =C2=A0 =C2=A0=3D $(prefix)/slice
> ++install_slicedir =C2=A0 =C2=A0 =C2=A0?=3D $(prefix)/slice
> +
> + #
> + # Set environment variables for the Slice translator.
> +@@ -232,7 +232,7 @@
> + endif
> +
> + ifeq ($(mkdir),)
> +- =C2=A0 =C2=A0mkdir =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D mkdir=
 $(1) ; \
> ++ =C2=A0 =C2=A0mkdir =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D mkdir=
 -p $(1) ; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 chmod a+rx $(1)
> + endif
> +
> diff --git a/recipes/zeroc-ice-e/zeroc-ice-e_1.3.0.bb b/recipes/zeroc-ice=
-e/zeroc-ice-e_1.3.0.bb
> new file mode 100644
> index 0000000..dcf5080
> --- /dev/null
> +++ b/recipes/zeroc-ice-e/zeroc-ice-e_1.3.0.bb
> @@ -0,0 +1,3 @@
> +require zeroc-ice-e.inc
> +
> +PR =3D "${INC_PR}.0"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


