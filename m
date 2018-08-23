Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id D08A571A74
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 15:48:37 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id o15-v6so6783463qtk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9d/xxKuUF83d/HRrM4eRFYTYurTWKIIAbAQT3CeF5NU=;
	b=frYTyZCJW9OhSK9d3Hx3Hy5yMRuL3M/9PF799vwkTvrU8ziojd3BI1spggdbAhI45I
	6hoglPtMzxZ354ginIdzxBvU9utjUt2e63Q5BoORZb7vc7G/Prn0KmBQGDtmdARjrz1j
	s0K1YJ7Fdd2w7OVF3MDsXyc5IpNH6YnUGNPzm4KIDc6oDrT/Mr1YSgub3wrvJnXuBwhD
	45jkahNWbHofXh4G1wCgDYn6ndxeWHc7kBDvcMkX0Rl+kPWJlUljOJfc9P6wkzok1KCJ
	tP84MPy8S61QqxnjKfRNJJ+rxoojB960e81o5VWafTztUDedu3D+2JvkSR3qdlo8ijSz
	3ICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9d/xxKuUF83d/HRrM4eRFYTYurTWKIIAbAQT3CeF5NU=;
	b=S2DEvvGcUyRfW+tiT4Aca4LqDOvc6NV6NB+cdJT9P7Lk7682ww86Cof7YmZCmXqqKH
	ZriU3i+F3Bq7lHC+bcJvVl60sbOYrsz6r5l3zSsT728r2WhQ8/VnwiD3Q298CPRV5rsx
	TxP5Unvt/xdkav4DWipSZPcCOyYdV4irGOVeiEC+kDJABJu88/G0DsMnUtPnzyx3B7IB
	tQDDzAI0f/kHVseOhfOQxcqLU4/Xxi04MlNcEnhrfjJh59PpKKymQoXX16WI2lRR0cYM
	RZRd8XbJggiPlwI89xq/8FsaibxXNpJx+TFUbFmBO0wsDFN4gJaC0CB/NaXbTEJvh1Of
	KyeQ==
X-Gm-Message-State: APzg51D3131soMC2q+Jhq+SpnR7dtmUMIFOjpOPlkE9cOuO0c0bpW/PN
	KVv2XTcN8QAoTlU1vCDbAFoqoSlPqeNe+v4+zyg=
X-Google-Smtp-Source: AA+uWPyelK+6TBKJmmRtP8TN1zIf+vj/VVAlGG4bwpzfk730ZG/RTXab3mt9TQ3KoLmvzq8ZGQWxX1XNDrEPq2sOa+I=
X-Received: by 2002:aed:3848:: with SMTP id
	j66-v6mr24740728qte.218.1535039318427; 
	Thu, 23 Aug 2018 08:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20180823122731.27991-1-oleksandr.kravchuk@pelagicore.com>
	<4f921ce1-dfc2-f051-30e1-33033c65c41c@gmail.com>
	<CAGoQ_if3mXJNQ4z4XNB0q6zOtvoSipRJLB8Ncc9=FwUzaz_JdA@mail.gmail.com>
In-Reply-To: <CAGoQ_if3mXJNQ4z4XNB0q6zOtvoSipRJLB8Ncc9=FwUzaz_JdA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Aug 2018 08:48:12 -0700
Message-ID: <CAMKF1soObwjuXWncaZTd998d5bNkkaYnHM+rQO+HcMD2FbLUhw@mail.gmail.com>
To: open.source@oleksandr-kravchuk.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	dev@sashko.rv.ua
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
X-List-Received-Date: Thu, 23 Aug 2018 15:48:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 23, 2018 at 7:46 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> On Thu, Aug 23, 2018 at 4:23 PM, akuster808 <akuster808@gmail.com> wrote:
>
> >
> >
> > On 08/23/2018 05:27 AM, Oleksandr Kravchuk wrote:
> > > From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> > >
> > > Added link to bug tracker and updated md5sum of LICENSE, which has been
> > > updated with the copyright year.
> > >
> > > Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  .../recipes-support/libsodium/libsodium_1.0.11.bb   | 12 ------------
> > >  .../recipes-support/libsodium/libsodium_1.0.16.bb   | 13 +++++++++++++
> >
> > We normally don't update packages in stable releases. Is this a bug fix
> > only updated ?
> > In order for the to land in Rocko, Sumo would require the same change.
> >
>
> SRC_URI points to broken URI and v1.0.11 was marked as unsupported by the
> project:
> https://download.libsodium.org/libsodium/releases/old/unsupported/
>
> I thought since this is a minor release anyway, it would make sense to
> update
> the package instead of updating SRC_URI, since who knows how long it will
> be there for.

it seems to be a bugfix release Armin we should be ok.

>
>
> >
> > - armin
> > >  2 files changed, 13 insertions(+), 12 deletions(-)
> > >  delete mode 100644 meta-oe/recipes-support/libsodium/
> > libsodium_1.0.11.bb
> > >  create mode 100644 meta-oe/recipes-support/libsodium/
> > libsodium_1.0.16.bb
> > >
> > > diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
> > b/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
> > > deleted file mode 100644
> > > index cbcbe96cd..000000000
> > > --- a/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
> > > +++ /dev/null
> > > @@ -1,12 +0,0 @@
> > > -SUMMARY = "The Sodium crypto library"
> > > -HOMEPAGE = "http://libsodium.org/"
> > > -LICENSE = "ISC"
> > > -LIC_FILES_CHKSUM = "file://LICENSE;md5=c9f00492f01f5610253fde01c3d2e8
> > 66"
> > > -
> > > -SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-
> > ${PV}.tar.gz"
> > > -SRC_URI[md5sum] = "b58928d035064b2a46fb564937b83540"
> > > -SRC_URI[sha256sum] = "a14549db3c49f6ae2170cbbf4664bd
> > 48ace50681045e8dbea7c8d9fb96f9c765"
> > > -
> > > -inherit autotools
> > > -
> > > -BBCLASSEXTEND = "native nativesdk"
> > > diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.16.bb
> > b/meta-oe/recipes-support/libsodium/libsodium_1.0.16.bb
> > > new file mode 100644
> > > index 000000000..57f38fec2
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/libsodium/libsodium_1.0.16.bb
> > > @@ -0,0 +1,13 @@
> > > +SUMMARY = "The Sodium crypto library"
> > > +HOMEPAGE = "http://libsodium.org/"
> > > +BUGTRACKER = "https://github.com/jedisct1/libsodium/issues"
> > > +LICENSE = "ISC"
> > > +LIC_FILES_CHKSUM = "file://LICENSE;md5=7f5ecba1fa793fc1f3c8f32d6cb5a3
> > 7b"
> > > +
> > > +SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-
> > ${PV}.tar.gz"
> > > +SRC_URI[md5sum] = "37b18839e57e7a62834231395c8e962b"
> > > +SRC_URI[sha256sum] = "eeadc7e1e1bcef09680fb4837d448f
> > bdf57224978f865ac1c16745868fbd0533"
> > > +
> > > +inherit autotools
> > > +
> > > +BBCLASSEXTEND = "native nativesdk"
> >
> >
>
>
> --
> Oleksandr Kravchuk
> http://oleksandr-kravchuk.com/
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

