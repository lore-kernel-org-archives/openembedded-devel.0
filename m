Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oz2gr-0005dY-3B
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 09:27:30 +0200
Received: by iwn2 with SMTP id 2so375732iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 00:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=FOQS1nLPdaHRc6AfbWUjXXBzTa18N52tfw9A1eEzSmo=;
	b=UfK5a1MZlceGkIO/bUSj3UAZ8OOtt0DOwQRUpM59r4xKxWXviYEKd1RrVaaTlKubu8
	Ih2+tojRq7BsPo1jQufJ5yov2GMii+Ug4SloruuHwrT554h+di1wdMV5rr44eI4OmVkZ
	FEvKkzHWRl9zqSYk090v4YuncigvpJBfX/nmQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vglFGjRxYL9x/5VRYgV64hUGADb4Wk3hDlWKp9TzIBxyMOrLbmYUMdpeEUqv0GdIvD
	jnHjE8aEU1qLAUpbn2O5u0oDil52itHWUGOTIDWQwOI0eva4GP/UliUUGsjVKeDfXQ75
	C+CMY0H7YajmCSZUUowMpkIVxIRxGT+aabiiY=
MIME-Version: 1.0
Received: by 10.231.159.203 with SMTP id k11mr3395813ibx.115.1285313243340;
	Fri, 24 Sep 2010 00:27:23 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 24 Sep 2010 00:27:23 -0700 (PDT)
In-Reply-To: <1285262101-25477-1-git-send-email-eric@eukrea.com>
References: <AANLkTikKwmBvHMEGESdXgOo5PTqk=CAGr19kWOJ-ZwM4@mail.gmail.com>
	<1285262101-25477-1-git-send-email-eric@eukrea.com>
Date: Fri, 24 Sep 2010 09:27:23 +0200
Message-ID: <AANLkTimRpFageKfT5vNvc4V3nzZxFp++UaNB_47b9=Ph@mail.gmail.com>
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
Subject: Re: [PATCH v2] liburi-perl: update to 1.5.5
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
X-List-Received-Date: Fri, 24 Sep 2010 07:27:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/23 Eric B=E9nard <eric@eukrea.com>:
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
> v2 : update to 1.55, URL fix is no more necessary

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
> =A0recipes/perl/liburi-perl_1.52.bb | =A0 18 ------------------
> =A0recipes/perl/liburi-perl_1.55.bb | =A0 18 ++++++++++++++++++
> =A02 files changed, 18 insertions(+), 18 deletions(-)
> =A0delete mode 100644 recipes/perl/liburi-perl_1.52.bb
> =A0create mode 100644 recipes/perl/liburi-perl_1.55.bb
>
> diff --git a/recipes/perl/liburi-perl_1.52.bb b/recipes/perl/liburi-perl_=
1.52.bb
> deleted file mode 100644
> index d9cf315..0000000
> --- a/recipes/perl/liburi-perl_1.52.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -DESCRIPTION =3D "Manipulates and accesses URI strings"
> -SECTION =3D "libs"
> -LICENSE =3D "Artistic|GPL"
> -#RDEPENDS_${PN} +=3D " libmime-base64-perl libnet-perl"
> -PR =3D "r3"
> -
> -SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/URI-${PV}.=
tar.gz"
> -
> -S =3D "${WORKDIR}/URI-${PV}"
> -
> -inherit cpan
> -
> -BBCLASSEXTEND=3D"native"
> -
> -PACKAGE_ARCH =3D "all"
> -
> -SRC_URI[md5sum] =3D "d6ba96cc3e650af6537675e016e83d3e"
> -SRC_URI[sha256sum] =3D "3d325b52c9d1e7aa2fbf67131f1f5ee39964cbe54e864bcf=
b9808af274a9eb4a"
> diff --git a/recipes/perl/liburi-perl_1.55.bb b/recipes/perl/liburi-perl_=
1.55.bb
> new file mode 100644
> index 0000000..1f602e2
> --- /dev/null
> +++ b/recipes/perl/liburi-perl_1.55.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "Manipulates and accesses URI strings"
> +SECTION =3D "libs"
> +LICENSE =3D "Artistic|GPL"
> +RDEPENDS_${PN} +=3D " perl-module-extutils-makemaker perl-module-mime-ba=
se64"
> +PR =3D "r4"
> +
> +SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/URI-${PV}.=
tar.gz"
> +
> +S =3D "${WORKDIR}/URI-${PV}"
> +
> +inherit cpan
> +
> +BBCLASSEXTEND=3D"native"
> +
> +PACKAGE_ARCH =3D "all"
> +
> +SRC_URI[md5sum] =3D "e66a2ab45da92a2c5f67a495c88999f5"
> +SRC_URI[sha256sum] =3D "34ece72deedebfe7d52da90990e49d79e7c62319837def69=
ed943316bfb74291"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


