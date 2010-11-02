Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PD8lf-0004MU-Si
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 05:47:15 +0100
Received: by gwaa11 with SMTP id a11so3931883gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 21:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=5myRbw6Hcp24/HV0XEDdtlZUUDwE4Xnz3tP2fzf5ob4=;
	b=C/1OyrNNiiil3p1hjRmd7C+LIwsS9b3Q0JQ20CYGzDnp7ct1+R1HjhpmaYakiC1U9w
	/DcmyW6NT6vokoiMsWpXGrt2ThNiJmmne9WTuAC+feCclisNydp62xUMq4H2qCjTsq5J
	cdcaeGxb2GS6aQRTAwB9fnuNi492DNhAKpiQE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=iOOBsej/hEqu+ixMUR2AcfgKAJ5NqQJfh3kFosTfe1E2toQ4MKTOVEiXt7jJ77PD5J
	5GHYgFp4FKynI0eTNPoY8uKAYDajilVIK1OLe/xbBai6bfol5swl/gWAGDgzyHQT0ETB
	RQ0PNd4z66yqbtHA+lezgAZTIjuF0iIIbPepc=
Received: by 10.91.27.32 with SMTP id e32mr826108agj.37.1288673153572; Mon, 01
	Nov 2010 21:45:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Mon, 1 Nov 2010 21:45:32 -0700 (PDT)
In-Reply-To: <1288647332-20685-2-git-send-email-eric@eukrea.com>
References: <1288647332-20685-1-git-send-email-eric@eukrea.com>
	<1288647332-20685-2-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Nov 2010 21:45:32 -0700
Message-ID: <AANLkTi=uGgpTQsmJeAYXTQoRv8z6fDzFcHSLKvWN21+y@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] busybox: 1.17.3 is stable and can be the default fallback version
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
X-List-Received-Date: Tue, 02 Nov 2010 04:47:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 1, 2010 at 2:35 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/busybox/busybox_1.17.3.bb | =C2=A0 =C2=A04 +---
> =C2=A01 files changed, 1 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/busybox/busybox_1.17.3.bb b/recipes/busybox/busybox_=
1.17.3.bb
> index 6f23662..6956bde 100644
> --- a/recipes/busybox/busybox_1.17.3.bb
> +++ b/recipes/busybox/busybox_1.17.3.bb
> @@ -1,7 +1,5 @@
> =C2=A0require busybox_1.1x.inc
> -PR =3D "${INC_PR}.0"
> -
> -DEFAULT_PREFERENCE =3D "-1"
> +PR =3D "${INC_PR}.1"
>
> =C2=A0SRC_URI +=3D "\
> =C2=A0 file://busybox-1.17.3-sort.patch =C2=A0\
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


