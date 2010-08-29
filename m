Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Opbps-0000XS-47
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 08:57:48 +0200
Received: by mail-iw0-f175.google.com with SMTP id 2so3819215iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 23:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0jsKn1NagvqsIqLiyRyR+7eRgNkV0BC7CFEl+BXXo2U=;
	b=pvoClhWneT9sf/qunM7NOVbOT8GtFzr1pALZEJnxAcaA94nsXhco53Te8ZEOt/UPlw
	DpWAQlo2SwpWMnb89hc0RhvsJJfidgtb2jOKhcG/0gOyzxD4SQLIYhWjSd3CJgZmGtGH
	+JG6mGxw7SO0qqQVn+7PI+MAY3jOjlLMJ+U34=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Sbxa4WZxw2mQWHf9yctFYg7DdI7TmuUxATBdBKUnh8qTKnmR2TnbOlCnHjFFn49FND
	cpAz7/WUzuniLqmW/oRnHgbYY0n2fhuBzfmUrTFRoMvht6AU6v68pxVCPsiXGQFE0Zwy
	ZFj87UCJX0XVcTwyNdbX6kaVA0yM4vo1HGVsE=
MIME-Version: 1.0
Received: by 10.231.30.76 with SMTP id t12mr576634ibc.161.1283065039240; Sat,
	28 Aug 2010 23:57:19 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sat, 28 Aug 2010 23:57:19 -0700 (PDT)
In-Reply-To: <1283027073-12308-15-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-15-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 08:57:19 +0200
Message-ID: <AANLkTikk20=-OeqgEPtyE3MaxPMp6Xxa3Pn2dF2X=O3m@mail.gmail.com>
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
Subject: Re: [PATCH 14/23] libmsip_svn.bb: Rename libmnetutil0->libmnetutil in DEPENDS
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
X-List-Received-Date: Sun, 29 Aug 2010 06:57:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.co

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/minisip/libmsip_svn.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/minisip/libmsip_svn.bb b/recipes/minisip/libmsip_svn=
.bb
> index 004eaa7..1b1299a 100644
> --- a/recipes/minisip/libmsip_svn.bb
> +++ b/recipes/minisip/libmsip_svn.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "C++ implementation Session Initiation Pr=
otocol (RFC3261)"
> =A0HOMEPAGE =3D "http://www.minisip.org"
> =A0SECTION =3D "libs/network"
> =A0PRIORITY =3D "optional"
> -DEPENDS =3D "libmnetutil0 libmutil0"
> +DEPENDS =3D "libmnetutil libmutil0"
> =A0PV =3D "0.2.2+svn${SRCDATE}"
> =A0LICENSE =3D "LGPL"
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


