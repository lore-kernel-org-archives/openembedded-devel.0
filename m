Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9DPj-0001sG-5X
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 10:55:51 +0200
Received: by gxk22 with SMTP id 22so433581gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 01:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OHNAGM9W1DiMRwaN8SQO9Hntvh/80vsURW0LFz60NWI=;
	b=uVu8Y5BDMiJsAeXKWILZ2gVBAtIEe2/+vBj2Hg8EqTFt2bW5qRVTzs3nyvAUK0SOFm
	KQgzokuOnjQXcwzs3EZSefDBuhRUqn89Sfb4rAoQGXI75nlRkSSw0CijViT+0SECptfV
	HRzONVaYLbm1fZi8kSOiYz7sPtlfNc75m7NM0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=M8E0iZJ7m4X2rkXo05x4juVfyWyYCzC3wYLiHILmTaEVzFJUXbs5j/+P8vMDBANDtU
	x9S5KmwwzDgt0wbytEoZw5KS4M5AWsJ0QfaDbSZOT/dTthZUOaNt2e3nwnKqN4zT6Jk+
	HNwXwblRATRvtnsl0PktTI5PXgQlDuqOkrvYk=
MIME-Version: 1.0
Received: by 10.42.208.75 with SMTP id gb11mr1768328icb.290.1287737713296;
	Fri, 22 Oct 2010 01:55:13 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 22 Oct 2010 01:55:13 -0700 (PDT)
In-Reply-To: <1287074146-3705-2-git-send-email-fransmeulenbroeks@gmail.com>
References: <1287074146-3705-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-2-git-send-email-fransmeulenbroeks@gmail.com>
Date: Fri, 22 Oct 2010 10:55:13 +0200
Message-ID: <AANLkTi=yjmGoLPhPsSZMc_sa+ZXurgPvJpzK1z-EDvpj@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/7] directfb_2.18: remove useless LDFLAGS_append = ""
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
X-List-Received-Date: Fri, 22 Oct 2010 08:55:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

ping; i know this is a fairly trivial patch but as it is a recipe I am
not familiar with, I would appreciate it if e.g. the recipe maintainer
would send an ack

2010/10/14 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0recipes/directfb/directfb_1.2.8.bb | =A0 =A02 --
> =A01 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/directfb/directfb_1.2.8.bb b/recipes/directfb/direct=
fb_1.2.8.bb
> index 35eb7c6..a6cf68f 100644
> --- a/recipes/directfb/directfb_1.2.8.bb
> +++ b/recipes/directfb/directfb_1.2.8.bb
> @@ -22,8 +22,6 @@ EXTRA_OECONF =3D "\
> =A0 --disable-x11 \
> =A0"
>
> -LDFLAGS_append =3D ""
> -
> =A0LEAD_SONAME =3D "libdirectfb-1.2.so.0"
>
> =A0SRC_URI[md5sum] =3D "ac13d21682aa368df4e177ae5b51ad2d"
> --
> 1.6.4.2
>
>


