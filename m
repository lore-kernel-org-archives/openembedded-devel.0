Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PAWCu-0002y1-I1
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 01:12:01 +0200
Received: by iwn42 with SMTP id 42so177712iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 16:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=5d5Knx9yiq5EhmGSH0z4yEYCHfdFj15Rl1et0Q5ZmxU=;
	b=ewsd+CEqhSA61Zb+0pbbIC9SLTJHdlT6HUq9hlLi2BO/YFs+0DhiDsJ15EKSA7wxvr
	gx/TEatqBi9919CkXyRH4UFj8DaAKXpddpbHakuVRPOyLrKswl0JLSbz3Z2sc2Q8xVh7
	p3/rtq1l12d5adwfcaLg7FdwFOQlQ2uDXfUek=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=h/dVps3QRow5HIr0geRcbGHHvshDa7xePg5Klqp5IGNefnxnaJWLUsaHRTiePr4HUu
	OnbIJ0iog8gHsC7aLKFi7eRd5yodTbc2YBXzGAUgzbuIBDzZdG7YLNW51NCX0BRfndLX
	mMNz08RQsh/5s1cBbkMToGlXp2LK6J/90n3ko=
Received: by 10.42.153.138 with SMTP id m10mr135027icw.261.1288048276259; Mon,
	25 Oct 2010 16:11:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.164.194 with HTTP; Mon, 25 Oct 2010 16:10:56 -0700 (PDT)
In-Reply-To: <1287668010-11310-2-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
	<1287668010-11310-2-git-send-email-Chase.Maupin@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Oct 2010 16:10:56 -0700
Message-ID: <AANLkTi=CLOGKy0SVwkrz77H54poU0mhg0QYHe3cFgWDC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH 01/22] autoconf: update package LICENSE
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
X-List-Received-Date: Mon, 25 Oct 2010 23:12:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2010 at 6:33 AM, Chase Maupin <chasemaupin03@gmail.com> wro=
te:
> * Update the LICENSE fields to reflect the licensing used in
> =C2=A0the source code.
>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

thanks I reviewed and applied the patch series

> ---
> =C2=A0recipes/autoconf/autoconf.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A02 +-
> =C2=A0recipes/autoconf/autoconf213_2.13.bb | =C2=A0 =C2=A01 +
> =C2=A0recipes/autoconf/autoconf_2.61.bb =C2=A0 =C2=A0| =C2=A0 =C2=A02 ++
> =C2=A03 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/autoconf/autoconf.inc b/recipes/autoconf/autoconf.in=
c
> index 35b0289..fe12daf 100644
> --- a/recipes/autoconf/autoconf.inc
> +++ b/recipes/autoconf/autoconf.inc
> @@ -1,6 +1,6 @@
> =C2=A0DESCRIPTION =3D "A package of M4 macros to produce scripts to \
> =C2=A0automatically configure sourcecode."
> -LICENSE =3D "GPL"
> +LICENSE =3D "GPLv3+-with-Autoconf-Configure-Script-Exception-v3.0"
> =C2=A0HOMEPAGE =3D "http://www.gnu.org/software/autoconf/"
> =C2=A0SECTION =3D "devel"
> =C2=A0DEPENDS +=3D "m4-native"
> diff --git a/recipes/autoconf/autoconf213_2.13.bb b/recipes/autoconf/auto=
conf213_2.13.bb
> index d060bbd..cd55073 100644
> --- a/recipes/autoconf/autoconf213_2.13.bb
> +++ b/recipes/autoconf/autoconf213_2.13.bb
> @@ -1,4 +1,5 @@
> =C2=A0require autoconf.inc
> +LICENSE =3D "GPLv2+"
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz"
> =C2=A0EXTRA_OECONF =3D "--program-transform-name=3Ds/\$/2.13/"
> =C2=A0EXTRA_OEMAKE =3D 'acdatadir=3D"${datadir}/autoconf-${PV}" infodir=
=3D"${datadir}/autoconf-${PV}/info"'
> diff --git a/recipes/autoconf/autoconf_2.61.bb b/recipes/autoconf/autocon=
f_2.61.bb
> index 9542e21..4588608 100644
> --- a/recipes/autoconf/autoconf_2.61.bb
> +++ b/recipes/autoconf/autoconf_2.61.bb
> @@ -1,5 +1,7 @@
> =C2=A0require autoconf.inc
>
> +LICENSE =3D "GPLv2+"
> +
> =C2=A0PR =3D "${INC_PR}.1"
>
> =C2=A0SRC_URI +=3D "file://autoreconf-include.patch \
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


