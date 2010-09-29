Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P0zRt-0004wa-Qk
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 18:24:06 +0200
Received: by iwn2 with SMTP id 2so1237078iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 09:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=er5K5PCFDRUnk6AA0VXGXYtFxuNmHV3KH3FpCprPto0=;
	b=Tq6kURxr6MwIdYxRifhcviBwpHbWIXuR3e1rTruaMW0Aj44KWvwemoHbMEJdG5WVUB
	Y716M4+N8O0UfhNX250KVQ6EQ7ttfGjLWopy21/Yw7sg+niWF8HthS71//zx+4/cg0WV
	7OVOkoNBuzBwJv3rpOWjeHY92duIlONh3GFXM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hQX4rfTnHK5S00t7bHUFs9/9t/w1x/vRXQZG9ED2o454XyKPRfatjl6cFl3QEwZsjW
	9bw0G6aooR+Qyq5COTWltsx06+KzSyIN2kPwbvdByZUlYmG4hDgZFc82Mtxlhj6HVsZ6
	LryHSMSXnX4AM0oKpPg5Jj2G38vJio7DMBKFs=
MIME-Version: 1.0
Received: by 10.231.166.139 with SMTP id m11mr2018294iby.136.1285777433593;
	Wed, 29 Sep 2010 09:23:53 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Wed, 29 Sep 2010 09:23:53 -0700 (PDT)
In-Reply-To: <1285776294-15073-1-git-send-email-chase.maupin@ti.com>
References: <1285776294-15073-1-git-send-email-chase.maupin@ti.com>
Date: Wed, 29 Sep 2010 18:23:53 +0200
Message-ID: <AANLkTinLedQV+-eejzidtYa3P9nHWBCZmBH1CoNp3A0J@mail.gmail.com>
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
Subject: Re: [PATCH] am-benchmarks: update to latest version
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
X-List-Received-Date: Wed, 29 Sep 2010 16:24:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/29 Chase Maupin <chasemaupin03@gmail.com>:
> * Updated the SRCREV to the latest version of this project
> =A0which includes support for multiple platforms.
>
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> ---
> =A0recipes/ti/am-benchmarks_svn.bb | =A0 12 +++++++++---
> =A01 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/ti/am-benchmarks_svn.bb b/recipes/ti/am-benchmarks_s=
vn.bb
> index 51ac6af..1160503 100644
> --- a/recipes/ti/am-benchmarks_svn.bb
> +++ b/recipes/ti/am-benchmarks_svn.bb
> @@ -4,15 +4,21 @@ LICENSE =3D "BSD"
> =A0SECTION =3D "system"
> =A0PRIORITY =3D "optional"
>
> -SRCREV =3D "33"
> -PV =3D "1.0"
> +SRCREV =3D "56"
> +PV =3D "1.1"
> =A0PR =3D "r1+svnr${SRCPV}"
>
> +ARCHITECTURE_dm365 =3D "arm9"
> +ARCHITECTURE_da850-omapl138-evm =3D "arm9"
> +ARCHITECTURE_omap3 =3D "cortex-a8"
> +ARCHITECTURE_ti816x =3D "cortex-a8"
> +ARCHITECTURE ?=3D "<UNDEFINED>"

Don't have the full recipe handy, but is this latter UNDEFINED needed?
I would expect a COMPATIBLE_MACHINE somewhere causing the latter never
to happen.
Then again it might be a good safeguard.

Frans.
> +
> =A0INSANE_SKIP_${PN} =3D "True"
>
> =A0SRC_URI =3D "svn://gforge.ti.com/svn/am_benchmarks/;module=3Dtrunk;pro=
to=3Dhttps;user=3Danonymous;pswd=3D''"
>
> -S =3D "${WORKDIR}/trunk"
> +S =3D "${WORKDIR}/trunk/${ARCHITECTURE}"
>
> =A0do_compile() {
> =A0 =A0 =A0 =A0# don't build debug version
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


