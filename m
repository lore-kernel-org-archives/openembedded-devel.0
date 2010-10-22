Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9DPW-0001i2-T0
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 10:55:39 +0200
Received: by iwn6 with SMTP id 6so7095iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 01:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4D0zp+Wqii7eCnbiKvpJUgmhacQSz/pOdmVRmM1e6vI=;
	b=I21uJl9Lg2o/yF5Q36hIeVYmBNAHx1/j4SbEq7K63a8++rqC0wUaiYA3AoYoVU9YzH
	yMHGEHOFWny/fSyAEDn3+dqwN9Aag8VXATDh6j0ka+82oETYF3BJstN7Sp/LuKvOqo7C
	6hJWAXgfiPnsB/UtjfqEzIhxXs59dLgkcLFio=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hNFy3flm7+6+MlMtNaTzwtgqb+JXjBTTrDRieBVA2Y8eVL1rKC+dDZPW/a8oi2HcYs
	De1esXZb2qnyCtMwQ2S9rrHOCmuxDecDJExzlcOYSt0j9HMiecJdXn09VXeCs3AiH2AD
	63vYUOjNRJAU9niieRb5pDLcbeETFAsb0fEJ4=
MIME-Version: 1.0
Received: by 10.231.167.67 with SMTP id p3mr2233919iby.20.1287737699661; Fri,
	22 Oct 2010 01:54:59 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 22 Oct 2010 01:54:58 -0700 (PDT)
In-Reply-To: <1287074146-3705-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1287074146-3705-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Fri, 22 Oct 2010 10:54:58 +0200
Message-ID: <AANLkTimXSqoW=vm6HCtB_fJV209samsN88e7hyWZJNwD@mail.gmail.com>
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
Subject: Re: [PATCH 1/7] gsmd.inc: remove useless RDEPENDS_append = ""
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
X-List-Received-Date: Fri, 22 Oct 2010 08:55:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

ping; i know this is a fairly trivial patch but as it is a recipe I am
not familiar with, I would appreciate it if e.g. the recipe maintainer
would send an ack

2010/10/14 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0recipes/gsm/gsmd.inc | =A0 =A01 -
> =A01 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/gsm/gsmd.inc b/recipes/gsm/gsmd.inc
> index 1b8ad29..5210edd 100644
> --- a/recipes/gsm/gsmd.inc
> +++ b/recipes/gsm/gsmd.inc
> @@ -16,7 +16,6 @@ S =3D "${WORKDIR}/gsm"
> =A0inherit autotools pkgconfig update-rc.d
> =A0# handle update-rc.d RDEPENDS_${PN} manually, we don't need it on
> =A0# anything but gsmd
> -RDEPENDS_append =3D ""
>
> =A0INITSCRIPT_NAME =3D "gsmd"
> =A0INITSCRIPT_PARAMS =3D "defaults 35"
> --
> 1.6.4.2
>
>


