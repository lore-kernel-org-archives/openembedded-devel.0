Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpcH7-0005SK-HX
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:25:58 +0200
Received: by iwn2 with SMTP id 2so3830875iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=d+hovj/LRHwZ0VPfKOPpdYzaPpFioOWH3xlx8IYhTN8=;
	b=ggmQ2BUhoqqShr9yFI0UA3Wkc/h+N55UDpE8dyA/BsmaqDjbwvsQ9mVCs+AtzNNvyE
	iUL34U83SdHTN7xvUSSHHrKe3Z2mjfN9G7C4J8srshZSExOz77tYFAAYeMnv8QWvsthB
	nDC9bTe0CSuS8wU5Q4/q7+M3LodcuXzAubsQo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=R7/ntFCeM8EFt6OtI85g6JNFlwMXopgj+NExBbRAaO6GzZQJqyLSfSjFJDBGmc4YEu
	v+c8RbnQuy3tVI1GrfFrHaMHBlplBWJqsXhXikRxm2ek26bQpB9vMXVvaUpdG+qogig1
	bAPbClTM2BH1rl2XVG1LIMSVqd3NvkovN3IlI=
MIME-Version: 1.0
Received: by 10.231.183.81 with SMTP id cf17mr3493207ibb.32.1283066725638;
	Sun, 29 Aug 2010 00:25:25 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 00:25:25 -0700 (PDT)
In-Reply-To: <1283027073-12308-7-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-7-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 09:25:25 +0200
Message-ID: <AANLkTik-7oaZUABzC2ui0Oa8sAiPahHsR0x1K_g66Y9p@mail.gmail.com>
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
Subject: Re: [PATCH 06/23] sugar-fructose.bb: sugar-web-activity is not provided by any recipe dont DEPEND on it.
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
X-List-Received-Date: Sun, 29 Aug 2010 07:25:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I seem to recall from previous discussion that it will still build.
Haven't tested that part.
Still:
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/sugar/sugar-fructose.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/sugar/sugar-fructose.bb b/recipes/sugar/sugar-fructo=
se.bb
> index ad0db39..697ac21 100644
> --- a/recipes/sugar/sugar-fructose.bb
> +++ b/recipes/sugar/sugar-fructose.bb
> @@ -1,3 +1,3 @@
> =A0DESCRIPTION =3D "Sugar fructose activities"
>
> -DEPENDS =3D "etoys sugar-web-activity"
> +DEPENDS =3D "etoys"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


