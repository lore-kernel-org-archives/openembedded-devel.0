Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oz2dz-0003T1-Qx
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 09:24:33 +0200
Received: by iwn2 with SMTP id 2so373696iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 00:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=dW06AC/FnDhfD49OvJTRhUMrZZ+Q2wp1nfn0G2ct+4A=;
	b=WQzmZJozVum+PHV/eNHDCjDR81nahE7UrZyiR3dgQxUppH7Pe+kTtFqP/zEjNkyEDr
	MPmDZ704gJfdSF9xvKP5XPaapKyCTsZVuAZbC50YM2eftCe9NpgUW4tekuOtkZdvLMdD
	ySpCdIK6aTwU5UtYH3Gp+QQr7ZmfE6Suq4X4k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dZ/JE9ZNukVcQGBGo4wdH0mU9x5sK/dAV05KprQ9fMY7KYdEJ9nw3BlbuzRd2470oE
	+3qoB+/dNtnnkJBsUucTJfJD0VFNLS7aL4t7ueUsmX0l2+2SDomQzdcIIwUvcfaJnlov
	P5qQT/mbO8EUn2f8nEDdCs0BtzZ+h8H9mDm14=
MIME-Version: 1.0
Received: by 10.231.166.139 with SMTP id m11mr3369409iby.136.1285313065453;
	Fri, 24 Sep 2010 00:24:25 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 24 Sep 2010 00:24:25 -0700 (PDT)
In-Reply-To: <4C9950EA.2070306@gmail.com>
References: <4C9950EA.2070306@gmail.com>
Date: Fri, 24 Sep 2010 09:24:25 +0200
Message-ID: <AANLkTim8cnSprD7+T_vZF-nrJ24V8u6PnZGjpUd0q+gd@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] mythfront-config.bb: Fix do_unpack for machines other than epia.
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
X-List-Received-Date: Fri, 24 Sep 2010 07:24:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/22 Graham Gower <graham.gower@gmail.com>:
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
> =A0recipes/mythfront/mythfront-config.bb | =A0 14 ++++++++------
> =A01 files changed, 8 insertions(+), 6 deletions(-)
>
Thanks for unbreaking this.
I've never noticed this, but I must say I didn't really peek into this one.

Some concerns wrt the rest of the recipe though

> diff --git a/recipes/mythfront/mythfront-config.bb b/recipes/mythfront/my=
thfront-config.bb
> index b87e0be..79ba428 100644
> --- a/recipes/mythfront/mythfront-config.bb
> +++ b/recipes/mythfront/mythfront-config.bb
> @@ -1,11 +1,12 @@
> =A0PV =3D "1.10"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0RDEPENDS_${PN} =3D "font-misc-misc"

This is not sufficient. There should also be a dependency on mythtv
itself and on lirc (but maybe mythtv will drag than one in)

> =A0LICENSE =3D "MIT"
> -SRC_URI =3D "file://tftp.sh file://xorg.conf"
> +SRC_URI =3D "file://tftp.sh"
>
> -SRC_URI_append_epia =3D " file://serial.sh"
> +SRC_URI_append_epia =3D " file://serial.sh \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://xorg.conf"
>
> =A0do_install() {
> =A0 =A0 =A0 =A0install -d ${D}${sysconfdir}/udhcpc.d/
> @@ -14,9 +15,6 @@ do_install() {
> =A0 =A0 =A0 =A0install -d ${D}${sysconfdir}/mythtv
> =A0 =A0 =A0 =A0ln -sf /var/lib/config/mysql.txt ${D}${sysconfdir}/mythtv

This is already done if you install mythtv-database
>
> - =A0 =A0 =A0 install -d ${D}${sysconfdir}/X11
> - =A0 =A0 =A0 install -m 0644 ${WORKDIR}/xorg.conf ${D}${sysconfdir}/X11

Not sure if this is good. for epia there is an xorg.conf, but it is
not in the SRC_URIL for non-epia, so it cannot be installed for these
(unless you get it from somewhere else)

> -
> =A0 =A0 =A0 =A0ln -sf /var/lib/config/lircd.conf ${D}${sysconfdir}/lircd.=
conf

and i would say lirc should perhaps do this.
>
> =A0 =A0 =A0 =A0install -d ${D}/dev
> @@ -30,3 +28,7 @@ do_install() {
> =A0 =A0 =A0 =A0fi
> =A0}
>
> +do_install_append_epia() {
> + =A0 =A0 =A0 install -d ${D}${sysconfdir}/X11
> + =A0 =A0 =A0 install -m 0644 ${WORKDIR}/xorg.conf ${D}${sysconfdir}/X11
> +}
> --

Enjoy, Frans.


