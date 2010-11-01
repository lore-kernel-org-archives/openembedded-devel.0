Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PCyCJ-0007KR-1n
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 18:29:31 +0100
Received: by gxk26 with SMTP id 26so2022839gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 10:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=roQI9ED4yshA5+2PSCCFY8Pg38tF1Ai7zt1T0iGW5IU=;
	b=VFrvxU89oizcBefmH203L/F/W9lGRZ6yZ68Z1To/YPakW59F6EnjZJGemVeNbSuJpx
	RGubaUwRpG6GvmhTtE4ECS0uusER1WXGBiOUyCPb16lVCTGNbVySu/UKcAX7YvULQZiP
	9fVuC3I107Ya1rkiFomJW/Es+aFAa6epBrZlU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=BborMghmULgWTZUbLd6uF+6qE/Q132C1s/VrMZtjDWIbQKYAFvMgkVmVpK4yb+z+6l
	R3URJaJnhm7TMJ2rZ7HRwVncMgFT1WnO9yLFzLyR1LoZC9og5azHR6UjKYsP3LyI6wX1
	47FAJtkxmbtluLxx3CH0qcO0lgOUYTk7bhHTI=
Received: by 10.90.118.14 with SMTP id q14mr28455agc.146.1288632519176; Mon,
	01 Nov 2010 10:28:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Mon, 1 Nov 2010 10:28:18 -0700 (PDT)
In-Reply-To: <1288619281-4363-1-git-send-email-anders@chargestorm.se>
References: <1288619281-4363-1-git-send-email-anders@chargestorm.se>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Nov 2010 10:28:18 -0700
Message-ID: <AANLkTi=ojjY5TzgFKLtrZug9Yk9=fMNZyDkLC_sYK8pz@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Updated resolvconf to 1.46.
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
X-List-Received-Date: Mon, 01 Nov 2010 17:29:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 1, 2010 at 6:48 AM, Anders Darander <anders@chargestorm.se> wro=
te:
> 1.45 is no longer downloadable from Debian.
>

remove 1.45 and add 1.46. Resend the patch with this change please.

> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
> =C2=A0recipes/resolvconf/resolvconf_1.46.bb | =C2=A0 33 +++++++++++++++++=
++++++++++++++++
> =C2=A01 files changed, 33 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/resolvconf/resolvconf_1.46.bb
>
> diff --git a/recipes/resolvconf/resolvconf_1.46.bb b/recipes/resolvconf/r=
esolvconf_1.46.bb
> new file mode 100644
> index 0000000..8991f7f
> --- /dev/null
> +++ b/recipes/resolvconf/resolvconf_1.46.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION =3D "Resolvconf is a framework for keeping track of the syst=
em's \
> +information about currently available nameservers. It sets \
> +itself up as the intermediary between programs that supply \
> +nameserver information and programs that need nameserver \
> +information."
> +SECTION =3D "console/network"
> +LICENSE =3D "GPL"
> +AUTHOR =3D "Thomas Hood"
> +HOMEPAGE =3D "http://packages.debian.org/resolvconf"
> +DEPENDS =3D "bash"
> +RDEPENDS_${PN} =3D "bash"
> +PR =3D "r1"
> +
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
> +
> +do_compile () {
> + =C2=A0 =C2=A0 =C2=A0 :
> +}
> +
> +do_install () {
> + =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir} ${D}${sbindir} ${D}${=
base_sbindir} ${D}${localstatedir}/run/resolvconf/interface
> + =C2=A0 =C2=A0 =C2=A0 install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
> + =C2=A0 =C2=A0 =C2=A0 cp -pPR etc/* ${D}${sysconfdir}/
> + =C2=A0 =C2=A0 =C2=A0 install -m 0755 bin/resolvconf ${D}${base_sbindir}=
/
> + =C2=A0 =C2=A0 =C2=A0 install -m 0644 README ${D}${docdir}/${P}/
> + =C2=A0 =C2=A0 =C2=A0 install -m 0644 man/resolvconf.8 ${D}${mandir}/man=
8/
> +}
> +
> +PACKAGE_ARCH =3D "all"
> +
> +
> +SRC_URI[md5sum] =3D "b276fc8834793f5c969ed7b57cb51660"
> +SRC_URI[sha256sum] =3D "2996caa40fbe2e2c5b2558e2333bd520558aa21250a6ecc7=
310ca3e6f231292b"
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


