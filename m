Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PivXk-0007JX-9S
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 22:07:44 +0100
Received: by iwn8 with SMTP id 8so3635947iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 13:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=XM9yI8B3SChywWvVkBLNnpmOy223DIwHrR1YLLsS+ow=;
	b=iuKGCqq4+sbPvhFrM2CGzk8s+kKh8nAWP8Q2GmezyJ5JYbf3lsSZoYTPgxl//dqwxD
	MQWXLS8QSiE4DxxfjNsrGLVcP0TgP+q2/afyB06KY0Qr1exWIpMs31kynvj0UOj0IsAp
	cEPxXyy/XNT20E6teW77Vq9a1rzaObB2nUop8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=iVOAhB5Xoyeue81cTsnKhoDfZX3KWYcERRHjUlJzZny9WYR/CDwR2det/+pArPlzLc
	7rEtpHYQw8rNZjn7GuBf9Z6MnzrYn3IIycZraraa6x0M4W6/W05pUmOMhy1ZCpvp4zs4
	FNWPiI8yRAatAfyF9MX0/DSmyUdd0hkB351kw=
MIME-Version: 1.0
Received: by 10.231.30.193 with SMTP id v1mr644852ibc.8.1296248813676; Fri, 28
	Jan 2011 13:06:53 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Fri, 28 Jan 2011 13:06:53 -0800 (PST)
In-Reply-To: <1296240753-10120-4-git-send-email-tom_rini@mentor.com>
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
	<1296240753-10120-4-git-send-email-tom_rini@mentor.com>
Date: Fri, 28 Jan 2011 22:06:53 +0100
Message-ID: <AANLkTinUm_hLzi-E4OoXHCSoqLR=r0EeMOt+shQa++2w@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/5] automake: Add perl-native as a dep rather than perl-runtime-native
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
X-List-Received-Date: Fri, 28 Jan 2011 21:07:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/28 Tom Rini <tom_rini@mentor.com>:
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0recipes/automake/automake.inc | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/automake/automake.inc b/recipes/automake/automake.in=
c
> index e378c04..1eae3c0 100644
> --- a/recipes/automake/automake.inc
> +++ b/recipes/automake/automake.inc
> @@ -2,8 +2,8 @@ DESCRIPTION =3D "A tool for automatically generating Make=
files."
> =A0LICENSE =3D "GPL"
> =A0HOMEPAGE =3D "http://www.gnu.org/software/automake/"
> =A0SECTION =3D "devel"
> -DEPENDS_virtclass-native =3D "autoconf-native"
> -RDEPENDS_automake-native =3D "autoconf-native perl-native-runtime"
> +DEPENDS_virtclass-native =3D "autoconf-native perl-native"
> +RDEPENDS_automake-native =3D "autoconf-native perl-native"
> =A0RDEPENDS_automake +=3D "\
> =A0 =A0 autoconf \
> =A0 =A0 perl \
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


