Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OzBIB-000591-1C
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 18:38:38 +0200
Received: by iwn2 with SMTP id 2so727738iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 09:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=jY1bxeRAlv1x8JfEEHZdaQ+8PXJm9YPWqj1Fc6CvAa4=;
	b=e2EDMRaTfQVFPhuyZL6Ftx7GGBf/LosLySJUv4ExgP4UFH4G266vdQ0wGIKQCrRA84
	j/X70i8U2+E2o0i4MmEJthG4bDrDdREWV6hoB8Zv3ILRUGFbjnGmPdCKGrpxhpQHL3CX
	sjDMD6XrWXtGYHREC1vHJuLWig7YjrNPW3iwQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=H48cZSnA7cTTu6HX3GHDvFzmGlQnanwbhLQ1dzxGzcCCCs5mj52AJIubMdmIi/CUxA
	2zh08iAPnmju0d2dLP5x+ulShsMu04v+jPa6pkGQVJuCosg0XKb8qHWay+wMJ4hfuf4W
	tVVRwQ8knStMhRzylFuHke9m7s9iy7QHOlUn0=
MIME-Version: 1.0
Received: by 10.231.11.72 with SMTP id s8mr3475647ibs.110.1285346305837; Fri,
	24 Sep 2010 09:38:25 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 24 Sep 2010 09:38:25 -0700 (PDT)
In-Reply-To: <1285344575-25214-1-git-send-email-chase.maupin@ti.com>
References: <1285344575-25214-1-git-send-email-chase.maupin@ti.com>
Date: Fri, 24 Sep 2010 18:38:25 +0200
Message-ID: <AANLkTikvhSjXEDHjAhjLiYOKVO4=j1mxSai-Dt1fPkn-@mail.gmail.com>
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
Subject: Re: [PATCH] fbset_2.1: add dependency on bison-native
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
X-List-Received-Date: Fri, 24 Sep 2010 16:38:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/24 Chase Maupin <chasemaupin03@gmail.com>:
> * fbset requires bison in order to build. =A0This patch adds
> =A0bison-native to the DEPENDS. =A0This has the following benefits:
> =A0 =A0* The user does not have to have bison installed on their
> =A0 =A0 =A0host system
> =A0 =A0* The version of bison can be specified in the configuration
> =A0 =A0 =A0files instead of being the version on the host system.
> =A0 =A0 =A0In my case the version of bison used on my host was adding
> =A0 =A0 =A0GPLv3 licensing with exceptions but other systems would
> =A0 =A0 =A0build and provide GPLv2 with older versions of bison
> =A0 =A0* Adds predictability for version of bison being used
> =A0 =A0 =A0between builds. =A0The first time fbset is built bison-native
> =A0 =A0 =A0may not have been built and the host version of the tool
> =A0 =A0 =A0is used. =A0The next time bison-native has been built and
> =A0 =A0 =A0the staged version is used.
>
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0recipes/fbset/fbset_2.1.bb | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/fbset/fbset_2.1.bb b/recipes/fbset/fbset_2.1.bb
> index 029f751..04ea35f 100644
> --- a/recipes/fbset/fbset_2.1.bb
> +++ b/recipes/fbset/fbset_2.1.bb
> @@ -8,8 +8,9 @@
> =A0DESCRIPTION =3D "The fbset console tool"
> =A0LICENSE =3D "GPLv2"
> =A0RRECOMMENDS_${PN} =3D "fbset-modes"
> +DEPENDS =3D "bison-native"
>
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0SRC_URI =3D "http://ftp.debian.org/debian/pool/main/f/fbset/fbset_2.1.=
orig.tar.gz \
> =A0 =A0 =A0 =A0 =A0 =A0file://makefile.patch"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


