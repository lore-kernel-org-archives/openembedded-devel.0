Return-Path: <liu.ming50@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 670BE781FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 17:00:27 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id k43so681140uaf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 10:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O90INsOIzTyNWnF4Jrl4sZZE10Zeo1NezQigBjMeWK0=;
	b=lsla+bl7ZBVILecYMS5s7zJe2m1wGq5gvbfadeOlqRIQtsWlP/HIzzQr5p9cQ0TnVd
	mz2//L3YnYVlv0l+xYCpNr7ME18sqEfH0Kq7jmhHG3/cVFKVs+DG60dC7VJKJNfudGDd
	wtQJ1jHNyEAf69/CG5+5lEEtCIEcYMaJJlo/jr73YvKEoXIq9+Wuz2u36o/jGsjF0PYJ
	Xfpv228qlcjKaCMuAr9EJ/g5VdmlTN5qKKfa005hMT/GVdugdtqlgKTPzVfWeiSX8dt9
	QVJrBLBdtnF2C9dPyTTRxYVyXBGI/dCUrxliuYy4r3TCNt12XGFbsI/SMPZXuT5zHrpE
	tJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O90INsOIzTyNWnF4Jrl4sZZE10Zeo1NezQigBjMeWK0=;
	b=B1lOpSlpjeXtPkHu+XwvA47zcCoytlghFWsEXccj9h1XDsnnXuxXo9rBcjfWn56+Va
	5evbNqH5wJhjd8gvyxd6Q+p3Yus90+bXb/Fc8hmOiBxHpNGmmxFNz2ebROMXIaNbQ67L
	Kkos2piIlQunIfidW4LcPpHZnrPdI4wsizDbJbpZcw5OQnaMZ4WkbWZ2wAxe18ZykK2W
	OdFq0Tq9uuNMCTNQBXf8Aw+drm8xYJlnqQpsveS9bV7h/KaHF5Iwg37r+3jqsEPEHJiB
	CyKw+HgAZpnlMGcRPdZ1oYqp4wuvVxy5s1DfiHjRwugFy34MjcwPEPJDOcU3BctoN+nn
	poQA==
X-Gm-Message-State: AHYfb5iQYdcVcQZz1Qk9y0SEd7q+Na5z7iM4JiER6BYO6Y7uq/5hOJnf
	6gvuKE/e4RPY4vofKp7fNiu6VHAT0w==
X-Received: by 10.176.83.110 with SMTP id y43mr7948584uay.118.1502384429228;
	Thu, 10 Aug 2017 10:00:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.120.212 with HTTP; Thu, 10 Aug 2017 10:00:28 -0700 (PDT)
In-Reply-To: <CAMKF1srNfV-EksvqJXpHTFDkC78svRf5VoVt3mau3cG6+JT9MQ@mail.gmail.com>
References: <1502377935-30119-1-git-send-email-liu.ming50@gmail.com>
	<2f7ad030-fd8a-c925-5435-fe73cebbc443@gmail.com>
	<CALatG=6hnNTwGzz1FrFhiCGkj16xHHz_57SKGJjQfY7vWsLNuQ@mail.gmail.com>
	<CAMKF1srNfV-EksvqJXpHTFDkC78svRf5VoVt3mau3cG6+JT9MQ@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 10 Aug 2017 19:00:28 +0200
Message-ID: <CALatG=6VkELBWU7hKFXgPPS-fT_OFEs2=27347n5OHtrnH6Ciw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] json-spirit: Add -latomic to LDFLAGS
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
X-List-Received-Date: Thu, 10 Aug 2017 17:00:28 -0000
Content-Type: text/plain; charset="UTF-8"

Hi, Khem:

OK, got it, will send a V2 soon.

//Ming Liu

2017-08-10 17:58 GMT+02:00 Khem Raj <raj.khem@gmail.com>:

> On Thu, Aug 10, 2017 at 8:36 AM, Ming Liu <liu.ming50@gmail.com> wrote:
> > Hi, Khem:
> >
> > I added that since I observed the error only on a armv5e machine, error
> did
> > not show up on cortexa8/x86_64 machines, so I attempted to guess that
> option
> > would not be always needed, for instance, if some ARCH support atomic
> > instructions.
>
> We should add it for armv5 alone then, for other arches, gcc does provide
> needed atomics.
>
> >
> > //Ming Liu
> >
> > 2017-08-10 17:19 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> >>
> >> On 8/10/17 8:12 AM, liu.ming50@gmail.com wrote:
> >> > From: Ming Liu <peter.x.liu@external.atlascopco.com>
> >> >
> >> > This fixes following errors when compiling with clang:
> >> > | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference
> to
> >> > '__atomic_load_4'
> >> > | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference
> to
> >> > '__atomic_compare_exchange_4'
> >> > | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference
> to
> >> > '__atomic_fetch_sub_4'
> >> > | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference
> to
> >> > '__atomic_fetch_add_4'
> >> >
> >> > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> >> > ---
> >> >  meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb | 2 ++
> >> >  1 file changed, 2 insertions(+)
> >> >
> >> > diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
> >> > b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
> >> > index 53bbf7e..2f456bf 100644
> >> > --- a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
> >> > +++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
> >> > @@ -17,6 +17,8 @@ S = "${WORKDIR}/json_spirit_v${PV}"
> >> >
> >> >  DEPENDS = "boost"
> >> >
> >> > +LDFLAGS += "-Wl,--as-needed -latomic -Wl,--no-as-needed"
> >>
> >> Do we need --as-needed
> >>
> >> > +
> >> >  inherit cmake
> >> >
> >> >  FILES_${PN}-dev += "${datadir}/cmake/Modules/
> FindLibJsonSpirit.cmake"
> >> >
> >>
> >>
> >
>

