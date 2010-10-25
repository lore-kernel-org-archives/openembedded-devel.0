Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PAUFm-0003vd-G7
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 23:06:51 +0200
Received: by gwaa11 with SMTP id a11so2938286gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5BsNS2O8Uqx/beIxkWbkGxfKcucJVjQ2doLSyCA9mrc=;
	b=ZkXvtZakC8ouYU92WKKsV2w69cCAJaXDxHmAEr14bBWeE6BOujxCX6flBLvGPLwSaO
	r1X0Gmj9WKkyNZZGQu8Em4CYAQy6onhYzUMfpYZQEbKU0fPguKKCLcw1PwfEYxlNUaXW
	zwFgLSuSG5lhJt4/CnQASF3Xrl3/lIuEHS0eQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hWTIEOaCK1Ysr2UULduy112IOTPI9FXOy/aTDijfxw/J/ax8x7RJ5JfgdJoOGkRvTv
	qujbql18uwykkYH14Chpdd6uAVpPXGX+QUbva5SCgIWCMTOKcf5v+3LCNTteRjeuqtRB
	CC08XzQ1pwLty+R1VGFzsoRRrRerARuVTt0fs=
MIME-Version: 1.0
Received: by 10.42.229.3 with SMTP id jg3mr5716428icb.19.1288040768496; Mon,
	25 Oct 2010 14:06:08 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 25 Oct 2010 14:06:08 -0700 (PDT)
In-Reply-To: <1288011288-23015-1-git-send-email-obi@opendreambox.org>
References: <AANLkTi=NVcuF1rS7=otWPYLeYJFE-ec6kj6Jovnx4xL1@mail.gmail.com>
	<1288011288-23015-1-git-send-email-obi@opendreambox.org>
Date: Mon, 25 Oct 2010 23:06:08 +0200
Message-ID: <AANLkTineb=ocvNqEcRAat6N7PnXc60ar5TdkHM8qjPAT@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH resend] oestats-client.bbclass: Fix "AttributeError: 'NoneType' object has no attribute 'startswith'" if OESTATS_SERVER is not set
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
X-List-Received-Date: Mon, 25 Oct 2010 21:06:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/25 Andreas Oberritter <obi@opendreambox.org>:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> Acked-by: Chris Larson <chris_larson@mentor.com>
> ---
> =A0classes/oestats-client.bbclass | =A0 =A05 +++--
> =A01 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/classes/oestats-client.bbclass b/classes/oestats-client.bbcl=
ass
> index a98c9d1..f64d21f 100644
> --- a/classes/oestats-client.bbclass
> +++ b/classes/oestats-client.bbclass
> @@ -181,12 +181,13 @@ python oestats_eventhandler () {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return
>
> =A0 =A0 =A0 =A0server =3D bb.data.getVar('OESTATS_SERVER', e.data, True)
> - =A0 =A0 =A0 if not server.startswith('http://') and not server.startswi=
th('https://'):
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 server =3D "http://%s" %(server)
> =A0 =A0 =A0 =A0builder =3D bb.data.getVar('OESTATS_BUILDER', e.data, True=
)
> =A0 =A0 =A0 =A0if not server or not builder:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return
>
> + =A0 =A0 =A0 if not server.startswith('http://') and not server.startswi=
th('https://'):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 server =3D "http://%s" %(server)
> +
> =A0 =A0 =A0 =A0if getName(e) =3D=3D 'BuildStarted':
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0oestats_start(server, builder, e.data)
> =A0 =A0 =A0 =A0elif getName(e) =3D=3D 'BuildCompleted':
> --
> 1.7.1

pushed, thank you


