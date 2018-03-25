Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1D9C66093C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 21:58:09 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id z7-v6so10492119iti.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 14:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gRvuFF9EmN/pFzPnShBUvZeA4ltyuVi99/RUPespOYc=;
	b=eX38HdNwvISz9V4pt+LsNeAut96zIxLGfm0PxzRQjnexBHluVWwCIlU3G40MHt/dxj
	ubNV/rUO9Js5PJi23OSWvW8ueSfvYzVaTxfi6DT6JcdmO+/aYHjCrN77FB+vmmTNTmL9
	R+dt1PbjHKW9JBO2ySVEPqcnf2v8/FllHqt6WXpbCwSCBnXqrbbGAs8nTboZYUHqgUet
	7+0Ivd36J01pCo3WrZutAjyVV0jRgzE6LaNq8dXWDied5bNoR4GQvYClh56GFugN3Rty
	qA6Fll49RcOya7yZrLz3ADyuV4FDlqA7Lzat5ZOg12xOYPVNcij1SGiIMt7sa0CUaHaX
	A5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gRvuFF9EmN/pFzPnShBUvZeA4ltyuVi99/RUPespOYc=;
	b=t1Pzp3MI/De0nnKq38qunnfazCN5CoKyUgK36PrihUywmzz5M414UUP1vNBUIasNfW
	yZwy4AYR9FcocTAQV/dX6u77Foi2dOvnW4F5kHbsrak8sK5Wg8u8F9gkcXLJdMWWZ0RT
	Mr7O4IfAp1o/8jJ4ujwvgVuFF+ajiZkfNiiilTZTZef2wEKKktosJPs6Pn4CifeJonvd
	qufX0jboCL/y5wNYfZ8tKaGaG2Ygtz2tdgbU87PULuz0yF+IvpEX5k/6LbTZexrdosuc
	xti3H5bIuT4riEq6v1BUQxznfIJgkBPJNM2uMv/E7JsqinRSwoNYJJvYvl2d+WYd9Gjy
	Pl9g==
X-Gm-Message-State: AElRT7H3TDKcB2DtyDrjgZj+DsSrftT/a8UZl1ETnJKW7Uqd3mliuJc4
	fQ5tjZ+ahp+w1bAPD1v9gBYRMHFtN03HS3uwS7RNhw==
X-Google-Smtp-Source: AG47ELtH0fdOroIUX3p4QlhnCh3WASn/Z4U1NErkd4AAzf0oEhfgY+bAWrUnGC8h85p+9ZyqD74eBWf/vzGP4QqaBZ4=
X-Received: by 2002:a24:f685:: with SMTP id
	u127-v6mr20049662ith.131.1522015091329; 
	Sun, 25 Mar 2018 14:58:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Sun, 25 Mar 2018 14:57:51 -0700 (PDT)
In-Reply-To: <9a608e4c-0752-eeb2-306c-f8804c584be2@gmail.com>
References: <9a608e4c-0752-eeb2-306c-f8804c584be2@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 25 Mar 2018 22:57:51 +0100
Message-ID: <CAJTo0Lb8zOtBb72hdhL4BzfTPss4JM00-WZOiOnqk5_tRUJyOw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] X11 proto changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Mar 2018 21:58:10 -0000
Content-Type: text/plain; charset="UTF-8"

On 24 March 2018 at 19:07, akuster808 <akuster808@gmail.com> wrote:
> It appears Xorg is deprecating most of it's proto header repos for a new
> all-in-1 repo xorgproto. This will most likely affect down stream
> layers. The question I have, is do we want this big churn to happen for
> Sumo or wait for 2.6 ?

Pretty late for Sumo and if the worst case thing happens and they
delete the repos (which would be unusual) then we can just point the
SRC_URI at the yoctoproject mirror site.

Moving forward in master I guess a xorgprotos recipe which PROVIDES
that bundle should be seamless.

Ross

