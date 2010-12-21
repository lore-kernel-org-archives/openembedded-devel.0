Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PVAp1-00064k-4r
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 23:36:43 +0100
Received: by gyh20 with SMTP id 20so1944361gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 14:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=a11bIxZVA92AqPi6N+2bXsCF32Cwk23Dnqz6VDuhaUw=;
	b=bbpNMjBOQMYEPa8I3WUVSKi1BIsLsKCGwMbyanSyvyGz5KW6oD3MEpOPUKn5DmeE+C
	4/e1tmmbMoI2RC2FjGavAmG444lmI5MpYaJWXm/yDTiXfnbGsRWDZXPQjCCJYYoXMK+X
	ujF4m963e6aSI4hH/XWLx5SEiTHUP0IpayaiI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=bOVvCeZ0hBrO5R9US/yx+b2/t+ePnhLCjfMDv2juhzLxCLQEIk5Pd6QgxZ82/gsD7k
	BEKV4JMXLoee0nkMr2sj8p/xXbWXoUYXFoxn/ZGnXsEXdGkH0RN5k2ixsZlJC+FKdXMH
	j3gaOSEOHyJHcP6Wo8sOMJAyuGQvePcHrh8XM=
Received: by 10.90.80.18 with SMTP id d18mr7734085agb.31.1292970992571; Tue,
	21 Dec 2010 14:36:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Tue, 21 Dec 2010 14:36:12 -0800 (PST)
In-Reply-To: <1292969027-18762-2-git-send-email-eric@eukrea.com>
References: <20101221150222.GB4665@gmail.com>
	<1292969027-18762-1-git-send-email-eric@eukrea.com>
	<1292969027-18762-2-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Dec 2010 14:36:12 -0800
Message-ID: <AANLkTik4ZXMff-vHGJTK4sJcEuUHuvGNcsGjGPgwLZng@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] asterisk: fix SRC_URI
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
X-List-Received-Date: Tue, 21 Dec 2010 22:36:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2010 at 2:03 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> * keep the higher version which fetch and patch
> * fix SRC_URI for all the asterisk recipes
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/asterisk-sounds/asterisk-sounds_1.2.1.bb =C2=A0 | =C2=A0 =
=C2=A02 +-
> =C2=A0.../asterisk/asterisk-core-sounds-en-alaw_1.4.8.bb | =C2=A0 =C2=A02=
 +-
> =C2=A0.../asterisk/asterisk-core-sounds-en-g729_1.4.8.bb | =C2=A0 =C2=A02=
 +-
> =C2=A0.../asterisk/asterisk-core-sounds-en-gsm_1.4.8.bb =C2=A0| =C2=A0 =
=C2=A02 +-
> =C2=A0.../asterisk/asterisk-core-sounds-en-ulaw_1.4.8.bb | =C2=A0 =C2=A02=
 +-
> =C2=A0.../asterisk-extra-sounds-en-alaw_1.4.7.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +-
> =C2=A0.../asterisk-extra-sounds-en-g729_1.4.7.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +-
> =C2=A0.../asterisk/asterisk-extra-sounds-en-gsm_1.4.7.bb | =C2=A0 =C2=A02=
 +-
> =C2=A0.../asterisk-extra-sounds-en-ulaw_1.4.7.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +-
> =C2=A0.../asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb =C2=A0 | =C2=A0 =
=C2=A02 +-
> =C2=A0.../asterisk/asterisk-moh-freeplay-g729_0.0.0.bb =C2=A0 | =C2=A0 =
=C2=A02 +-
> =C2=A0.../asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +-
> =C2=A0.../asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb =C2=A0 | =C2=A0 =
=C2=A02 +-
> =C2=A0recipes/asterisk/asterisk_1.4.23.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A014 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/recipes/asterisk-sounds/asterisk-sounds_1.2.1.bb b/recipes/a=
sterisk-sounds/asterisk-sounds_1.2.1.bb
> index 416afdb..e2c8923 100644
> --- a/recipes/asterisk-sounds/asterisk-sounds_1.2.1.bb
> +++ b/recipes/asterisk-sounds/asterisk-sounds_1.2.1.bb
> @@ -4,7 +4,7 @@ LICENSE=3D"GPL"
> =C2=A0DEPENDS=3D"asterisk"
> =C2=A0PR =3D "r1"
>
> -SRC_URI=3D"http://ftp.digium.com/pub/asterisk/releases/asterisk-sounds-$=
{PV}.tar.gz"
> +SRC_URI=3D"http://downloads.asterisk.org/pub/telephony/asterisk/releases=
/asterisk-sounds-${PV}.tar.gz"
>
> =C2=A0do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake DESTDIR=3D${D} install
> diff --git a/recipes/asterisk/asterisk-core-sounds-en-alaw_1.4.8.bb b/rec=
ipes/asterisk/asterisk-core-sounds-en-alaw_1.4.8.bb
> index b5f3e31..e2adb8f 100644
> --- a/recipes/asterisk/asterisk-core-sounds-en-alaw_1.4.8.bb
> +++ b/recipes/asterisk/asterisk-core-sounds-en-alaw_1.4.8.bb
> @@ -5,7 +5,7 @@ LICENSE=3D"GPL"
> =C2=A0#DEPENDS=3D"asterisk"
> =C2=A0PR =3D "r1"
>
> -SRC_URI=3D"http://downloads.digium.com/pub/telephony/sounds/releases/ast=
erisk-core-sounds-en-alaw-${PV}.tar.gz"
> +SRC_URI=3D"http://downloads.asterisk.org/pub/telephony/sounds/releases/a=
sterisk-core-sounds-en-alaw-${PV}.tar.gz"
>
> =C2=A0do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${localstatedir}/lib/asterisk/s=
ounds
> diff --git a/recipes/asterisk/asterisk-core-sounds-en-g729_1.4.8.bb b/rec=
ipes/asterisk/asterisk-core-sounds-en-g729_1.4.8.bb
> index 9cc6867..34b77b8 100644
> --- a/recipes/asterisk/asterisk-core-sounds-en-g729_1.4.8.bb
> +++ b/recipes/asterisk/asterisk-core-sounds-en-g729_1.4.8.bb
> @@ -5,7 +5,7 @@ LICENSE=3D"GPL"
> =C2=A0#DEPENDS=3D"asterisk"
> =C2=A0PR =3D "r1"
>
> -SRC_URI=3D"http://downloads.digium.com/pub/telephony/sounds/releases/ast=
erisk-core-sounds-en-g729-${PV}.tar.gz"
> +SRC_URI=3D"http://downloads.asterisk.org/pub/telephony/sounds/releases/a=
sterisk-core-sounds-en-g729-${PV}.tar.gz"
>
> =C2=A0do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${localstatedir}/lib/asterisk/s=
ounds
> diff --git a/recipes/asterisk/asterisk-core-sounds-en-gsm_1.4.8.bb b/reci=
pes/asterisk/asterisk-core-sounds-en-gsm_1.4.8.bb
> index bef02db..956b7e0 100644
> --- a/recipes/asterisk/asterisk-core-sounds-en-gsm_1.4.8.bb
> +++ b/recipes/asterisk/asterisk-core-sounds-en-gsm_1.4.8.bb
> @@ -5,7 +5,7 @@ LICENSE=3D"GPL"
> =C2=A0#DEPENDS=3D"asterisk"
> =C2=A0PR =3D "r1"
>
> -SRC_URI=3D"http://downloads.digium.com/pub/telephony/sounds/releases/ast=
erisk-core-sounds-en-gsm-${PV}.tar.gz"
> +SRC_URI=3D"http://downloads.asterisk.org/pub/telephony/sounds/releases/a=
sterisk-core-sounds-en-gsm-${PV}.tar.gz"
>
> =C2=A0do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${localstatedir}/lib/asterisk/s=
ounds
> diff --git a/recipes/asterisk/asterisk-core-sounds-en-ulaw_1.4.8.bb b/rec=
ipes/asterisk/asterisk-core-sounds-en-ulaw_1.4.8.bb
> index ed776fc..60c8c4e 100644
> --- a/recipes/asterisk/asterisk-core-sounds-en-ulaw_1.4.8.bb
> +++ b/recipes/asterisk/asterisk-core-sounds-en-ulaw_1.4.8.bb
> @@ -5,7 +5,7 @@ LICENSE=3D"GPL"
> =C2=A0#DEPENDS=3D"asterisk"
> =C2=A0PR =3D "r1"
>
> -SRC_URI=3D"http://downloads.digium.com/pub/telephony/sounds/releases/ast=
erisk-core-sounds-en-ulaw-${PV}.tar.gz"
> +SRC_URI=3D"http://downloads.asterisk.org/pub/telephony/sounds/releases/a=
sterisk-core-sounds-en-ulaw-${PV}.tar.gz"
>
> =C2=A0do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${localstatedir}/lib/asterisk/s=
ounds
> diff --git a/recipes/asterisk/asterisk-extra-sounds-en-alaw_1.4.7.bb b/re=
cipes/asterisk/asterisk-extra-sounds-en-alaw_1.4.7.bb
> index 554c71a..ac5c747 100644
> --- a/recipes/asterisk/asterisk-extra-sounds-en-alaw_1.4.7.bb
> +++ b/recipes/asterisk/asterisk-extra-sounds-en-alaw_1.4.7.bb
> @@ -5,7 +5,7 @@ LICENSE=3D"GPL"
> =C2=A0#DEPENDS=3D"asterisk"
> =C2=A0PR =3D "r1"
>
> -SRC_URI=3D"http://downloads.digium.com/pub/telephony/sounds/releases/ast=
erisk-extra-sounds-en-alaw-${PV}.tar.gz"
> +SRC_URI=3D"http://downloads.asterisk.org/pub/telephony/sounds/releases/a=
sterisk-extra-sounds-en-alaw-${PV}.tar.gz"
>
> =C2=A0do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${localstatedir}/lib/asterisk/s=
ounds
> diff --git a/recipes/asterisk/asterisk-extra-sounds-en-g729_1.4.7.bb b/re=
cipes/asterisk/asterisk-extra-sounds-en-g729_1.4.7.bb
> index 763f68c..67422bc 100644
> --- a/recipes/asterisk/asterisk-extra-sounds-en-g729_1.4.7.bb
> +++ b/recipes/asterisk/asterisk-extra-sounds-en-g729_1.4.7.bb
> @@ -5,7 +5,7 @@ LICENSE=3D"GPL"
> =C2=A0#DEPENDS=3D"asterisk"
> =C2=A0PR =3D "r1"
>
> -SRC_URI=3D"http://downloads.digium.com/pub/telephony/sounds/releases/ast=
erisk-extra-sounds-en-g729-${PV}.tar.gz"
> +SRC_URI=3D"http://downloads.asterisk.org/pub/telephony/sounds/releases/a=
sterisk-extra-sounds-en-g729-${PV}.tar.gz"
>
> =C2=A0do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${localstatedir}/lib/asterisk/s=
ounds
> diff --git a/recipes/asterisk/asterisk-extra-sounds-en-gsm_1.4.7.bb b/rec=
ipes/asterisk/asterisk-extra-sounds-en-gsm_1.4.7.bb
> index 6f2830c..688034f 100644
> --- a/recipes/asterisk/asterisk-extra-sounds-en-gsm_1.4.7.bb
> +++ b/recipes/asterisk/asterisk-extra-sounds-en-gsm_1.4.7.bb
> @@ -5,7 +5,7 @@ LICENSE=3D"GPL"
> =C2=A0#DEPENDS=3D"asterisk"
> =C2=A0PR =3D "r1"
>
> -SRC_URI=3D"http://downloads.digium.com/pub/telephony/sounds/releases/ast=
erisk-extra-sounds-en-gsm-${PV}.tar.gz"
> +SRC_URI=3D"http://downloads.asterisk.org/pub/telephony/sounds/releases/a=
sterisk-extra-sounds-en-gsm-${PV}.tar.gz"
>
> =C2=A0do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${localstatedir}/lib/asterisk/s=
ounds
> diff --git a/recipes/asterisk/asterisk-extra-sounds-en-ulaw_1.4.7.bb b/re=
cipes/asterisk/asterisk-extra-sounds-en-ulaw_1.4.7.bb
> index 3975975..201da89 100644
> --- a/recipes/asterisk/asterisk-extra-sounds-en-ulaw_1.4.7.bb
> +++ b/recipes/asterisk/asterisk-extra-sounds-en-ulaw_1.4.7.bb
> @@ -5,7 +5,7 @@ LICENSE=3D"GPL"
> =C2=A0#DEPENDS=3D"asterisk"
> =C2=A0PR =3D "r1"
>
> -SRC_URI=3D"http://downloads.digium.com/pub/telephony/sounds/releases/ast=
erisk-extra-sounds-en-ulaw-${PV}.tar.gz"
> +SRC_URI=3D"http://downloads.asterisk.org/pub/telephony/sounds/releases/a=
sterisk-extra-sounds-en-ulaw-${PV}.tar.gz"
>
> =C2=A0do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${localstatedir}/lib/asterisk/s=
ounds
> diff --git a/recipes/asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb b/recip=
es/asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb
> index 566882a..24548f6 100644
> --- a/recipes/asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb
> +++ b/recipes/asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb
> @@ -5,7 +5,7 @@ LICENSE=3D"GPL"
> =C2=A0#DEPENDS=3D"asterisk"
> =C2=A0PR =3D "r1"
>
> -SRC_URI=3D"http://downloads.digium.com/pub/telephony/sounds/releases/ast=
erisk-moh-freeplay-alaw.tar.gz"
> +SRC_URI=3D"http://downloads.asterisk.org/pub/telephony/sounds/releases/a=
sterisk-moh-freeplay-alaw.tar.gz"
>
> =C2=A0do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${localstatedir}/lib/asterisk/m=
oh
> diff --git a/recipes/asterisk/asterisk-moh-freeplay-g729_0.0.0.bb b/recip=
es/asterisk/asterisk-moh-freeplay-g729_0.0.0.bb
> index cadadc4..efe6d6e 100644
> --- a/recipes/asterisk/asterisk-moh-freeplay-g729_0.0.0.bb
> +++ b/recipes/asterisk/asterisk-moh-freeplay-g729_0.0.0.bb
> @@ -5,7 +5,7 @@ LICENSE=3D"GPL"
> =C2=A0#DEPENDS=3D"asterisk"
> =C2=A0PR =3D "r1"
>
> -SRC_URI=3D"http://downloads.digium.com/pub/telephony/sounds/releases/ast=
erisk-moh-freeplay-g729.tar.gz"
> +SRC_URI=3D"http://downloads.asterisk.org/pub/telephony/sounds/releases/a=
sterisk-moh-freeplay-g729.tar.gz"
>
> =C2=A0do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${localstatedir}/lib/asterisk/m=
oh
> diff --git a/recipes/asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb b/recipe=
s/asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb
> index b608b8f..6b62da3 100644
> --- a/recipes/asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb
> +++ b/recipes/asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb
> @@ -5,7 +5,7 @@ LICENSE=3D"GPL"
> =C2=A0#DEPENDS=3D"asterisk"
> =C2=A0PR =3D "r1"
>
> -SRC_URI=3D"http://downloads.digium.com/pub/telephony/sounds/releases/ast=
erisk-moh-freeplay-gsm.tar.gz"
> +SRC_URI=3D"http://downloads.asterisk.org/pub/telephony/sounds/releases/a=
sterisk-moh-freeplay-gsm.tar.gz"
>
> =C2=A0do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${localstatedir}/lib/asterisk/m=
oh
> diff --git a/recipes/asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb b/recip=
es/asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb
> index ac91615..05a96d6 100644
> --- a/recipes/asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb
> +++ b/recipes/asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb
> @@ -5,7 +5,7 @@ LICENSE=3D"GPL"
> =C2=A0#DEPENDS=3D"asterisk"
> =C2=A0PR =3D "r1"
>
> -SRC_URI=3D"http://downloads.digium.com/pub/telephony/sounds/releases/ast=
erisk-moh-freeplay-ulaw.tar.gz"
> +SRC_URI=3D"http://downloads.asterisk.org/pub/telephony/sounds/releases/a=
sterisk-moh-freeplay-ulaw.tar.gz"
>
> =C2=A0do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${localstatedir}/lib/asterisk/m=
oh
> diff --git a/recipes/asterisk/asterisk_1.4.23.1.bb b/recipes/asterisk/ast=
erisk_1.4.23.1.bb
> index af6967a..ed44508 100644
> --- a/recipes/asterisk/asterisk_1.4.23.1.bb
> +++ b/recipes/asterisk/asterisk_1.4.23.1.bb
> @@ -8,7 +8,7 @@ SECTION =3D "console/telephony"
> =C2=A0DEPENDS =3D "speex readline zlib openssl curl popt gnutls sqlite li=
bogg libvorbis"
> =C2=A0#RRECOMMENDS_${PN} =3D "logrotate"
>
> -SRC_URI=3D"http://downloads.digium.com/pub/asterisk/releases/asterisk-${=
PV}.tar.gz \
> +SRC_URI=3D"http://downloads.asterisk.org/pub/telephony/asterisk/old-rele=
ases/asterisk-${PV}.tar.gz \
> =C2=A0# =C2=A0 =C2=A0 =C2=A0file://sounds.xml.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Makefile.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://logrotate \
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


