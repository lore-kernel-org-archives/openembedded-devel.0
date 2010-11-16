Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIPzY-0008Dq-Up
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 19:10:53 +0100
Received: by ywg8 with SMTP id 8so92699ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 10:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=FpXhTLEXcKjgm22WwcpnTc+Kx6rCBzApZoidN74xPIQ=;
	b=klJEahFC4bUxsJJBo9ewf0fwbtsLE41baEkCNm8DNhqKuk4GP+mxd1iXDaI4MJu0bA
	VvH9W5B9RA1TO/5HquOMNCwaKQulE549vNzSB8/7jRQFJfkklfeLore1g6tqO3YC2A3r
	CPAKOcQUNrOAAtEhg4aCUAGLJOjjilw9uT8zI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ZABDIwtj6gHx03+nAQxPmqW4dDdarGYLHWUGqXDp2wzavQzk+WXgWhWLksvceBtYRz
	B2zYEZHPWXkFPFvr/xj6EmiMYKvv5Te6qcF5JA4KUNGyfDeDl+h8FeHrUAhmn5W6WZfp
	uExl+qUulewvBaEEGerF95LC0y0PDZaL5xMFQ=
Received: by 10.91.42.30 with SMTP id u30mr10019134agj.102.1289930986685; Tue,
	16 Nov 2010 10:09:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 16 Nov 2010 10:09:25 -0800 (PST)
In-Reply-To: <1289930468-7867-1-git-send-email-harvey.tim@gmail.com>
References: <1289930468-7867-1-git-send-email-harvey.tim@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2010 10:09:25 -0800
Message-ID: <AANLkTinNfK87ceiCPVZXehvuMweZfp+jFQwio_Wu4QtN@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] iftop: new recipe
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
X-List-Received-Date: Tue, 16 Nov 2010 18:10:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 16, 2010 at 10:01 AM, Tim Harvey <harvey.tim@gmail.com> wrote:
> Signed-off-by: Tim Harvey <harvey.tim@gmail.com>
> ---
> =C2=A0recipes/iftop/iftop_0.17.bb | =C2=A0 11 +++++++++++
> =C2=A01 files changed, 11 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/iftop/iftop_0.17.bb
>
> diff --git a/recipes/iftop/iftop_0.17.bb b/recipes/iftop/iftop_0.17.bb
> new file mode 100644
> index 0000000..2cfa441
> --- /dev/null
> +++ b/recipes/iftop/iftop_0.17.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION =3D "Network usage monitor"
> +HOMEPAGE =3D "http://www.ex-parrot.com/pdw/iftop/"
> +SECTION =3D "console/network"
> +LICENSE =3D "GPLv2"

I read the license it should be GPLv2+ sorry

> +DEPENDS =3D "libpcap ncurses"
> +
> +SRC_URI =3D "http://www.ex-parrot.com/pdw/iftop/download/iftop-${PV}.tar=
.gz"
> +SRC_URI[md5sum] =3D "062bc8fb3856580319857326e0b8752d"
> +SRC_URI[sha256sum] =3D "d032547c708307159ff5fd0df23ebd3cfa7799c31536fa0a=
ea1820318a8e0eac"
> +
> +inherit autotools
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


