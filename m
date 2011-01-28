Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PivWz-0007Hw-1H
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 22:06:57 +0100
Received: by iwn8 with SMTP id 8so3635320iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 13:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=x53nLc6/yM/mymP6HMYI944huXuF8iQlRppVqovNJ5s=;
	b=WFChnGW9Od6gM6n7iQaxLvLJs94TRmrpkSUDvGx9wXXGe3+mAOBjLZRNLfH3TWQo84
	FtzEcWbYwJTcmDu6N1owHRjVV9oCCudS1e0mynWjrxaBwvwfojk2sjYWcKJcL2OHeCWo
	tZcxeDdJLvmqyy68LJnuq/+FOkJtMbYkx8E/0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rvsiZulUXO1jnZrjpa1DQZ7y5FyJB7ePW3vZbasBL8x2XdNyr/p2fD3xKuGqA6UqH+
	qbX9sKuOZ9VFPQJdC84EYTclQBlPhiO+xVDRT0Z6amiikLaPCREzarK+Qdxb65ODNc58
	Ip861d8tu0ut5F6oQhxIGuUfagWrLDxPm8B/A=
MIME-Version: 1.0
Received: by 10.231.37.12 with SMTP id v12mr3271800ibd.83.1296248764871; Fri,
	28 Jan 2011 13:06:04 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Fri, 28 Jan 2011 13:06:04 -0800 (PST)
In-Reply-To: <1296240753-10120-5-git-send-email-tom_rini@mentor.com>
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
	<1296240753-10120-5-git-send-email-tom_rini@mentor.com>
Date: Fri, 28 Jan 2011 22:06:04 +0100
Message-ID: <AANLkTikxf01-+Xx2ARu_WrDtD+3nHREZM+-dd4_=LZbx@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 4/5] autoconf: Add perl-native as a dep
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
X-List-Received-Date: Fri, 28 Jan 2011 21:06:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/28 Tom Rini <tom_rini@mentor.com>:
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0recipes/autoconf/autoconf.inc | =A0 =A06 +++---
> =A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/autoconf/autoconf.inc b/recipes/autoconf/autoconf.in=
c
> index 1815b5d..2f8c122 100644
> --- a/recipes/autoconf/autoconf.inc
> +++ b/recipes/autoconf/autoconf.inc
> @@ -3,10 +3,10 @@ automatically configure sourcecode."
> =A0LICENSE =3D "GPLv3+-with-Autoconf-Configure-Script-Exception-v3.0"
> =A0HOMEPAGE =3D "http://www.gnu.org/software/autoconf/"
> =A0SECTION =3D "devel"
> -DEPENDS +=3D "m4-native"
> +DEPENDS +=3D "m4-native perl-native"
> =A0RDEPENDS_${PN} =3D "m4 perl gnu-config"
> -DEPENDS_virtclass-native =3D "m4-native gnu-config-native"
> -RDEPENDS_${PN}_virtclass-native =3D "m4-native gnu-config-native"
> +DEPENDS_virtclass-native =3D "m4-native gnu-config-native perl-native"
> +RDEPENDS_${PN}_virtclass-native =3D "m4-native gnu-config-native perl-na=
tive"
>
> =A0INC_PR =3D "r13"
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


