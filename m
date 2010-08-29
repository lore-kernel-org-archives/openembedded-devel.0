Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpcFp-0003sg-NZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:24:41 +0200
Received: by mail-iw0-f175.google.com with SMTP id 2so3830162iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2bXSs+QQYsKbB6buRkru0PyXpnfHdUkWSquurFZ0MAc=;
	b=D+7hZAcqdyLCp0AVF5KluvQfFlDc2Kl3RhRspd/WriY/P9uYbvzZEkhKDjbFe7yzPy
	5di8bssq5JmMH5mRpCWyHQEH+cXSBun6PsTPo/UcwuXigsJoTPDWiPi7OxP6GYPV8dBo
	uip/fv/bVxZw3jyVuZnLpPdfMpdsBb8NUoabY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=X89R6jJS1qlBSu3nBsI5d+r4UhLcrrLsSyiySBdN079hMnGCJxCwAlHYUCikTqngPN
	I0MIM95j6Cgqh03Y4gmy049umwirJII9rTazjFi2rZYJ8Nnph/1eH5CZlchfD/Nvq7BX
	Dcm43ZPmBniuhHwP/YLG7quM9OgJPA6KE4gZU=
MIME-Version: 1.0
Received: by 10.231.190.203 with SMTP id dj11mr3435509ibb.93.1283066648462;
	Sun, 29 Aug 2010 00:24:08 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 00:24:08 -0700 (PDT)
In-Reply-To: <1283027073-12308-12-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-12-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 09:24:08 +0200
Message-ID: <AANLkTikzPtuCXCvpMidaGO82MiCiRyCsreQgTYUmDyAs@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 11/23] udev-compat141_141.bb: if machine is not one of spitz akita c70x poodle then it is not needed to RDEPEND'ed on udev-compat-wrapper
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
X-List-Received-Date: Sun, 29 Aug 2010 07:24:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/udev/udev-compat141_141.bb | =A0 =A06 +++++-
> =A01 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/udev/udev-compat141_141.bb b/recipes/udev/udev-compa=
t141_141.bb
> index 2411fc6..c39d4cb 100644
> --- a/recipes/udev/udev-compat141_141.bb
> +++ b/recipes/udev/udev-compat141_141.bb
> @@ -15,7 +15,11 @@ PACKAGES =3D "${PN} ${PN}-dbg"
> =A0PROVIDES =3D "udev-compat"
>
> =A0# Need udev with udev-compat-wrapper support and nothing else.
> -RDEPENDS_${PN} =3D "udev-compat-wrapper"
> +RDEPENDS_${PN}_spitz =3D "udev-compat-wrapper"
> +RDEPENDS_${PN}_akita =3D "udev-compat-wrapper"
> +RDEPENDS_${PN}_c7x0 =3D "udev-compat-wrapper"
> +RDEPENDS_${PN}_poodle =3D "udev-compat-wrapper"
> +
> =A0# Remove hotplug RPROVIDES
> =A0RPROVIDES_${PN} =3D "udev-compat"
>
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


