Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PIPBT-0008Lg-Jm
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 18:19:15 +0100
Received: by pwi8 with SMTP id 8so228943pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 09:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GDRXwBwCAdFA7J02HJKrZ73hGcVNM2nFcGzKRAXZSHk=;
	b=QwUuH+hDPhwXKfBcDWQzqXaS/KUUg5cZ68X9Bu4paSn/oiwLz9tmXsthkjEQWuzmMu
	LbaKdgz/WvipqOucp2yQxei/46XiIdx6Aes9zcTb5CeBT3AILWMxoCOoHU1gmUwTDjTd
	TBCE0T+CnwMGT/jl8dwzUxYXxzgFBtn/qk8Hs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=TZi2EYvLC7aXlvljTf4OyoNXxJUjzl6EhOGfGFFfbHCW7eGevkWo/n7xvBFwi5gUtU
	5MB1r4Bu5WXWEipGGk4Hj2VVZTsVkLTXymQ7AYnYZsp6YWLs7JtP8sDYuBHRl9GH21Pt
	e2/WFmtFEKoi/mhVR1XYJBY84FkfClMLbAH9U=
MIME-Version: 1.0
Received: by 10.231.35.194 with SMTP id q2mr5960812ibd.26.1289927878975; Tue,
	16 Nov 2010 09:17:58 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Tue, 16 Nov 2010 09:17:58 -0800 (PST)
In-Reply-To: <1289916799-21803-1-git-send-email-Martin.Jansa@gmail.com>
References: <1289916799-21803-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 16 Nov 2010 18:17:58 +0100
Message-ID: <AANLkTikGsTAfRiKjZJtFBYhBPXzVX6kD-JpPEYtiaQOq@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] udh.inc: use RDEPENDS_${PN}
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
X-List-Received-Date: Tue, 16 Nov 2010 17:19:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/11/16 Martin Jansa <martin.jansa@gmail.com>:
> ---
> =A0recipes/uhd/uhd.inc | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/uhd/uhd.inc b/recipes/uhd/uhd.inc
> index 3b5be58..d2e7903 100644
> --- a/recipes/uhd/uhd.inc
> +++ b/recipes/uhd/uhd.inc
> @@ -3,9 +3,9 @@ HOMEPAGE =3D "http://www.ettus.com"
> =A0LICENSE =3D "GPLV3+"
>
> =A0DEPENDS =3D "git-native python-cheetah-native boost libusb1 uhd-firmwa=
re"
> -RDEPENDS +=3D "uhd-firmware"
> +RDEPENDS_${PN} +=3D "uhd-firmware"
>
> -INC_PR =3D "r2"
> +INC_PR =3D "r3"
>
> =A0inherit cmake
>
> --
> 1.7.3.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


