Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PbKck-0008K5-Mh
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 23:17:30 +0100
Received: by gwaa12 with SMTP id a12so4822205gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 14:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=buepSOeqSn39hmEmMnMOq6kf33hPdH2lbFCN3OJrjD0=;
	b=X8jxuexP2z+F5DD35fj0Grk114/5R3jtfdloKHcW9qyvWWkgMqXp2i3eoMAOAhQG9q
	1ixVGouyQR9bGP4BZmboMCV5SvTtmO+RK34QzLBeqxZb5jbPXVQ89y1o8HaxA4iCfmrl
	hH6QZBMB3vcvAZ39c1bV0begb7QAzG3agYGzE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=T3klucXnzw20IDiSITUaa/pKKERMVtFVCFC+Mbdmw5oCvuBmkOukeb0ivWHW0f71MJ
	nmmCa/ygHmB2oIT7qMMYJgp9b56oi2SNdTFex24fUF9sUlO+DEDZzrMjp0hTTeVzAWGf
	oq2ZGAf164l88OHXeJnMRZGi5TsRfFM3u0L/k=
Received: by 10.91.163.27 with SMTP id q27mr3885511ago.139.1294438623574; Fri,
	07 Jan 2011 14:17:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 7 Jan 2011 14:16:42 -0800 (PST)
In-Reply-To: <1294436836-28074-3-git-send-email-eric@eukrea.com>
References: <1294436836-28074-1-git-send-email-eric@eukrea.com>
	<1294436836-28074-2-git-send-email-eric@eukrea.com>
	<1294436836-28074-3-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Jan 2011 14:16:42 -0800
Message-ID: <AANLkTi=31BuBptiBpykDUK1awzQP3jThQDikvtx3myfP@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/3] i2c-tools: update to latest 3.0.3
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
X-List-Received-Date: Fri, 07 Jan 2011 22:17:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 7, 2011 at 1:47 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> from CHANGES :
> =C2=A0Makefile: Let the environment set CC and CFLAGS
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Integrate py-smbus into the buil=
d system
> =C2=A0README: Point users to the linux-i2c mailing list
> =C2=A0decode-dimms: Handle CRC of FB-DIMM and DDR3 SDRAM memory modules
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Add support for DD=
R3 SDRAM
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Fix decoding of SD=
R SDRAM bytes 12-14
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Add side-by-side f=
ormatting option
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Add merged cells f=
ormatting option
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Try harder to deco=
de the manufacturing date
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Handle read errors=
 on sysfs
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Decode voltage int=
erface level of DDR SDRAM
> =C2=A0decode-xeon: Delete
> =C2=A0eepromer: Fix array initialization overrun
> =C2=A0i2cdetect: Drop legacy reference to ISA bus
> =C2=A0i2cset: Add support for short writes with PEC
> =C2=A0i2c-stub-from-dump: Use udev settle to speed up initialization
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Unload i2c-stub automatically if needed
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Add support for multiple dumps
> =C2=A0tools: Properly handle /dev/i2c not being a directory
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Increase limit on I2C bus number
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>


Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0recipes/i2c-tools/i2c-tools_3.0.2.bb | =C2=A0 27 ------------------=
---------
> =C2=A0recipes/i2c-tools/i2c-tools_3.0.3.bb | =C2=A0 26 ++++++++++++++++++=
++++++++
> =C2=A02 files changed, 26 insertions(+), 27 deletions(-)
> =C2=A0delete mode 100644 recipes/i2c-tools/i2c-tools_3.0.2.bb
> =C2=A0create mode 100644 recipes/i2c-tools/i2c-tools_3.0.3.bb
>
> diff --git a/recipes/i2c-tools/i2c-tools_3.0.2.bb b/recipes/i2c-tools/i2c=
-tools_3.0.2.bb
> deleted file mode 100644
> index 44559ef..0000000
> --- a/recipes/i2c-tools/i2c-tools_3.0.2.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -DESCRIPTION =3D "Set of i2c tools for linux"
> -SECTION =3D "base"
> -LICENSE =3D "GPLv2"
> -
> -PR =3D "r5"
> -
> -SRC_URI =3D "http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-${PV}=
.tar.bz2 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Module.mk \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
> -
> -inherit autotools
> -
> -do_compile_prepend() {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${WORKDIR}/Module.mk ${S}/eepromer/
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i 's#/usr/local#/usr#' Makefile
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i 's#CC\t:=3D gcc#CC\t:=3D ${CC}#' Make=
file
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "include eepromer/Module.mk" >> Makefil=
e
> -}
> -
> -do_install_append() {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${includedir}/linux
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 include/linux/i2c-dev.h ${D}=
${includedir}/linux/i2c-dev-user.h
> - =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${includedir}/linux/i2c-dev.h
> -}
> -
> -SRC_URI[md5sum] =3D "b546345ac19db56719dea6b8199f11e0"
> -SRC_URI[sha256sum] =3D "0b4d6455a30a3264a60b4d3be55855d996d52ea4f162a2f0=
4ffff378e24f98a2"
> diff --git a/recipes/i2c-tools/i2c-tools_3.0.3.bb b/recipes/i2c-tools/i2c=
-tools_3.0.3.bb
> new file mode 100644
> index 0000000..7d6d668
> --- /dev/null
> +++ b/recipes/i2c-tools/i2c-tools_3.0.3.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION =3D "Set of i2c tools for linux"
> +SECTION =3D "base"
> +LICENSE =3D "GPLv2"
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-${PV}=
.tar.bz2 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Module.mk \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
> +
> +inherit autotools
> +
> +do_compile_prepend() {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${WORKDIR}/Module.mk ${S}/eepromer/
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i 's#/usr/local#/usr#' Makefile
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "include eepromer/Module.mk" >> Makefil=
e
> +}
> +
> +do_install_append() {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${includedir}/linux
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 include/linux/i2c-dev.h ${D}=
${includedir}/linux/i2c-dev-user.h
> + =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${includedir}/linux/i2c-dev.h
> +}
> +
> +SRC_URI[md5sum] =3D "511376eed04455cdb277ef19c5f73bb4"
> +SRC_URI[sha256sum] =3D "23b28e474741834e3f1b35b0686528769a13adc92d2ff560=
3cbda1d6bd5e5629"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


