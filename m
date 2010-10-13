Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5vJr-0003WY-Qb
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 09:00:14 +0200
Received: by iwn2 with SMTP id 2so2100711iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 23:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=jRkkyXm1l7k/Al2ie/b2NPJlwL9Zp9D+JHQb45IlIWs=;
	b=n/0ny4BHzCl8Cj216N7fI1QAOHY3ShDHfj5j7Vtx60IQ8nJUbjBhKPfhvNJ+NOcby2
	g2/GIwL3X4gXcGkM9tkSfoLEE/p/v9/dSlyBvtJ+asia36niDPWU5bTkFO2CpwxcSVFf
	wrU+NC7sST85Py3j2jB2/m4nnVsgBgTtGsttA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JeVsLzGFwQvw1uC1OjVq4sUcJKrv9EJgGQ8o9eNrmFDyeTg/kxPSJAJ9Tj46IUE4wW
	NcSl0t0BA62NrnRGilRpyaQXEmUrr6B1blU1FVdaw4WeQ6Xk8miSF8FfoS75WKfEpy03
	YJkMdS0YnofGKupy6T9Os1b6dO6nrB75F3ah8=
MIME-Version: 1.0
Received: by 10.231.148.83 with SMTP id o19mr6670191ibv.112.1286953180420;
	Tue, 12 Oct 2010 23:59:40 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 12 Oct 2010 23:59:40 -0700 (PDT)
In-Reply-To: <1286935114-4673-1-git-send-email-raj.khem@gmail.com>
References: <1286935114-4673-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 13 Oct 2010 08:59:40 +0200
Message-ID: <AANLkTinMcWBJG3WprZVTw038rMfO4pjNcyre-Bg3ZhMi@mail.gmail.com>
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
Subject: Re: [PATCH] distutils-common-base.bbclass: Prepend STAGING_LIBDIR to linker library search path.
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
X-List-Received-Date: Wed, 13 Oct 2010 07:00:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/13 Khem Raj <raj.khem@gmail.com>:
> * This was done generically in bitbake.conf this should be done on
> =A0demand and distutils based recipes seem to need it. So we define it
> =A0here.

Based on your commit message I expected a change in bitbake.conf too.
Am I mssing something here?

Frans

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0classes/distutils-common-base.bbclass | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/classes/distutils-common-base.bbclass b/classes/distutils-co=
mmon-base.bbclass
> index f66a5cd..b6caf24 100644
> --- a/classes/distutils-common-base.bbclass
> +++ b/classes/distutils-common-base.bbclass
> @@ -4,6 +4,8 @@ EXTRA_OEMAKE =3D ""
>
> =A0export STAGING_INCDIR
> =A0export STAGING_LIBDIR
> +# libtool 2.4 does not export with LDFLAGS but distutils need it
> +LDFLAGS_prepend =3D "-L${STAGING_LIBDIR} "
>
> =A0PACKAGES =3D "${PN}-dev ${PN}-dbg ${PN}-doc ${PN}"
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


