Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id BA74D794E0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 14:46:01 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id h4-v6so6519753qtj.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 07:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fPwZnHQDVdiMMKQftwplF7tvweuPfVq/WTrs8uroBmw=;
	b=qfUlnwj2BLFeO3Ho8pygBrImJWMa9UhaX83GFNf565DsrCbodiweUiduq/Bpd2QeEW
	d4LwE2zkLwhm9490ljaVkIP3iq48qaxmleC3Z2ZZC0/xqSMoq3jAShqgy8qwWpAk9rwo
	W5EUDEJEmGbNUc2Px1REBoxc4JexJKp0G8DhYX/ShhhfafDXhQ/1HceKedd2jYCgC5pk
	AbbC0Ntj/udBKvCgE/sjF75g8B56QDm0scS0+7+NhBkqxF+vRL+QoOpyocb2e3miaWgm
	9CxTHOvtr/vqP2qnFVpahgg2SxLOS1Zfgh78IKfjiITvf6B5nn6owLvuO1/6mBaQWVRC
	Gv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fPwZnHQDVdiMMKQftwplF7tvweuPfVq/WTrs8uroBmw=;
	b=EgoVcNCJWdsFBbzxnaVzGgV3/q7M0mr6CssyuLFwgBbYG/GcNwREex6TvFtyv1N78J
	o0f31QVuMSne7k9HK4ofHgzHUudd1tSYUvLccBJC7rfWMtOO/vfQmjNmn+wtSdH1dQXM
	fzN87Kz2+JFepQic35baSxmAFy5fSkFi8AMgF/nHeA/TB+KPkfy3vLhJ/RQ9BZh8yY5/
	fQHvmQU32IF9PgspbxIqWlFWmCwVlYt72XVABDnIuKJZz22ouXxgsNZAVlcpddfJZGaH
	dPudsRxatYDRPwXzuxM86lMG6ksYkj4z/qc0vnwbwOKxDjfHqHmbDzUSANJjd1k8EPDy
	ceAQ==
X-Gm-Message-State: APzg51AywJjVmiOG//ovLPEe7kDQIZnADx84dC+RlDCqP+Kuqw0Li+JJ
	8EG61ze+EB4lD/J0aP4IviV2hD7eSZZ9jUTvkI/kBA==
X-Google-Smtp-Source: ANB0VdZOMMseDSIc9gHzTfTQgqdETaAGM7TtHGfHgCcCozJy4l4VlOdx29q51ECoQWd9cHGMOQ4OHPh7uQiqwkxbv7Y=
X-Received: by 2002:a0c:b925:: with SMTP id
	u37-v6mr2610782qvf.82.1535035562263; 
	Thu, 23 Aug 2018 07:46:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:3690:0:0:0:0:0 with HTTP; Thu, 23 Aug 2018 07:46:01
	-0700 (PDT)
X-Originating-IP: [83.218.80.243]
In-Reply-To: <4f921ce1-dfc2-f051-30e1-33033c65c41c@gmail.com>
References: <20180823122731.27991-1-oleksandr.kravchuk@pelagicore.com>
	<4f921ce1-dfc2-f051-30e1-33033c65c41c@gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Date: Thu, 23 Aug 2018 16:46:01 +0200
Message-ID: <CAGoQ_if3mXJNQ4z4XNB0q6zOtvoSipRJLB8Ncc9=FwUzaz_JdA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org,
	Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: Re: [meta-oe][rocko] libsodium: update to 1.0.16
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
X-List-Received-Date: Thu, 23 Aug 2018 14:46:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 23, 2018 at 4:23 PM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 08/23/2018 05:27 AM, Oleksandr Kravchuk wrote:
> > From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> >
> > Added link to bug tracker and updated md5sum of LICENSE, which has been
> > updated with the copyright year.
> >
> > Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../recipes-support/libsodium/libsodium_1.0.11.bb   | 12 ------------
> >  .../recipes-support/libsodium/libsodium_1.0.16.bb   | 13 +++++++++++++
>
> We normally don't update packages in stable releases. Is this a bug fix
> only updated ?
> In order for the to land in Rocko, Sumo would require the same change.
>

SRC_URI points to broken URI and v1.0.11 was marked as unsupported by the
project:
https://download.libsodium.org/libsodium/releases/old/unsupported/

I thought since this is a minor release anyway, it would make sense to
update
the package instead of updating SRC_URI, since who knows how long it will
be there for.


>
> - armin
> >  2 files changed, 13 insertions(+), 12 deletions(-)
> >  delete mode 100644 meta-oe/recipes-support/libsodium/
> libsodium_1.0.11.bb
> >  create mode 100644 meta-oe/recipes-support/libsodium/
> libsodium_1.0.16.bb
> >
> > diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
> b/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
> > deleted file mode 100644
> > index cbcbe96cd..000000000
> > --- a/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -SUMMARY = "The Sodium crypto library"
> > -HOMEPAGE = "http://libsodium.org/"
> > -LICENSE = "ISC"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=c9f00492f01f5610253fde01c3d2e8
> 66"
> > -
> > -SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-
> ${PV}.tar.gz"
> > -SRC_URI[md5sum] = "b58928d035064b2a46fb564937b83540"
> > -SRC_URI[sha256sum] = "a14549db3c49f6ae2170cbbf4664bd
> 48ace50681045e8dbea7c8d9fb96f9c765"
> > -
> > -inherit autotools
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.16.bb
> b/meta-oe/recipes-support/libsodium/libsodium_1.0.16.bb
> > new file mode 100644
> > index 000000000..57f38fec2
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/libsodium/libsodium_1.0.16.bb
> > @@ -0,0 +1,13 @@
> > +SUMMARY = "The Sodium crypto library"
> > +HOMEPAGE = "http://libsodium.org/"
> > +BUGTRACKER = "https://github.com/jedisct1/libsodium/issues"
> > +LICENSE = "ISC"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=7f5ecba1fa793fc1f3c8f32d6cb5a3
> 7b"
> > +
> > +SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-
> ${PV}.tar.gz"
> > +SRC_URI[md5sum] = "37b18839e57e7a62834231395c8e962b"
> > +SRC_URI[sha256sum] = "eeadc7e1e1bcef09680fb4837d448f
> bdf57224978f865ac1c16745868fbd0533"
> > +
> > +inherit autotools
> > +
> > +BBCLASSEXTEND = "native nativesdk"
>
>


-- 
Oleksandr Kravchuk
http://oleksandr-kravchuk.com/

