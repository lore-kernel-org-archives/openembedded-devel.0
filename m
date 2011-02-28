Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pu8s2-0006Lx-TW
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 20:35:02 +0100
Received: by bwz10 with SMTP id 10so3973827bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 11:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=pGKExdsLaxyN2oLDW2wRGAyQJtd5eF9zrsCUfF1we4g=;
	b=PlZ4fhR4+LX0cBa4J0UKgTWpEzY7qFPIAu6cMWah/i4A59vz6dGnmX5S/tANvY45DQ
	zzbSzVpJj5LkAU1kXWyHgWQnktBU+kd7pyapPnpVUbV8TPX3vZM2zWybP7QQrmo++ey8
	wAz/A+PfAtdO5Tdmhb90trD57Oqmg3UsO0Rt8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=vCX8OMGjJdizGk1VdJYBT15X7HvCQDudvyuyXRFUyETE92rqLDmBgb7F0r6nMu1Wzg
	jD1BF5fmD1ks7i/VxNDGee7XhmS74gXuDoM+G3OQFogbNeCrfkN6u9vrX/kEvJOyNSud
	HT9jfTz0bQJls1zFPHBsmzySpKiz32q54Tbzk=
MIME-Version: 1.0
Received: by 10.204.59.76 with SMTP id k12mr5337277bkh.70.1298921617392; Mon,
	28 Feb 2011 11:33:37 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Mon, 28 Feb 2011 11:33:37 -0800 (PST)
In-Reply-To: <1298913422.23547.20.camel@phil-desktop>
References: <AANLkTiknqQ6xLj8LFv4=17ymwSbVhD3C9kVe2qkviXhX@mail.gmail.com>
	<1298664057.3818.0.camel@lenovo.internal.reciva.com>
	<AANLkTin2WuKF=f_aOzi=28FmVTaxFVJa0uNb9TjfL2SB@mail.gmail.com>
	<1298666406.3818.4.camel@lenovo.internal.reciva.com>
	<AANLkTinUjtis22ZnLaP7uc0fa9nzxvhWod2uv43ZcJH=@mail.gmail.com>
	<1298669695.3818.5.camel@lenovo.internal.reciva.com>
	<AANLkTi=afktV1HC4Jdq_ammNdA+h4iMAWdJT809s+LMv@mail.gmail.com>
	<1298905700.23547.6.camel@phil-desktop>
	<AANLkTimyU4bSm9tM2LO5bMoqiFQqZXxt5Js7fg0B_HhJ@mail.gmail.com>
	<1298913422.23547.20.camel@phil-desktop>
Date: Mon, 28 Feb 2011 19:33:37 +0000
X-Google-Sender-Auth: fHxMRAKdrRKftC3mBWphWF2CWLs
Message-ID: <AANLkTimomznky1rBn5QTqzS16O6Lk3VxHUx1pG+ULe3v@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Missing GLIBC_<version> tags on binaries
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
X-List-Received-Date: Mon, 28 Feb 2011 19:35:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2011 at 17:17, Phil Blundell <philb@gnu.org> wrote:
...
> That's definitely not a patch that you ought to check in, though. =A0For
> wider consumption I guess there ought to be some kind of knob that
> DISTROs can tweak to select the linker of their choice. =A0As far as I
> know there isn't any such mechanism at present.

One interesting way to "fix" the issue is to explicitly link against
-lpthread however it seems *wrong*.

It seems to be a gcc bug since -pthread is suppose to handle all the
needed background for it to work and seems to be doing it wrong.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


