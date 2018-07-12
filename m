Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 17929754C8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 18:31:23 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id y8-v6so19040596uan.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 11:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+b7oHczPc8GJpjtybywYsH2XoUxqyRIwZ3RQL7lZh4Y=;
	b=mZ6EQoQn6nZ5vYnvN6qAAOAxU4+6rm+Ecv8GAqdQAp3ek6nv1le9JwDAiGb91hgyUx
	k6ysJJLesPwWHUBp16S5ISRxTVILJdFN6Ep24Kt8gcgco/QdIeJB3V+GGFqGvsTcbEJG
	fGQpt7i+xhXKofTUC9ZZ9VDTEWsF5mPGRwp7AQ250Zm1bDtFDSKFa1I3oo8Y8puQhZxC
	w4yQdsLwi9FcrSZu3jIVJGZlmcCqGYXpUnP3Vprpcy2ubVHsvMGV6M6mGyH8zSrpiLR9
	5FA7Ko5BZyV4rwm0temeOYL//vUf7jGAUhoV3qpTJyX+7hC+NOI1xqI2ZDda/NETmN6Q
	43rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+b7oHczPc8GJpjtybywYsH2XoUxqyRIwZ3RQL7lZh4Y=;
	b=RTjgZmd1CIB7fwCmyPvmX+Kl7xV2zlSkzhC5QE2ThvqyFnkZbP99uQOPc52DuLDdtk
	xzDrbW5dTqtRODWwf2E3g8/N3YSi4FVAqXTiTMlEFMZQfbD0trc+U8woYdfqz0T9/Mqh
	CT24yFYCnQvliOJNdijRtIwx5PzWGFYUZk+cWhRtkgaW9ROrjytxdjUk7hpsesTvNgdp
	o+7mRPVKTn9xYyw0h6hhQhVuHtVOcMAF18VONa2l2WvkwvcAUW4WrE/gzjVCdLtlsZSr
	7wPuCXgG2auwODyVy6/YUubun/ml7owTzwtiFmP8ruwka3gEZWSU6Gwfx6cqxcGbsDVq
	zxBQ==
X-Gm-Message-State: AOUpUlGyyRZZe4938el89tz+L5dN720bTaw54dAkbfqEnul9eFHq+m15
	6E7HvsRWQjzotKwLjw2rdZBJlnCqI5p/zKVctjE=
X-Google-Smtp-Source: AAOMgpexTasyIGLX/tHYz4O+FS9dZMuimBhfzdQxgnQ+QHYjp/ICCo1DqBllNBMYlHooqutFdO4kBXxNDJ4e1RIZ/9I=
X-Received: by 2002:ab0:7296:: with SMTP id
	w22-v6mr2191875uao.184.1531420284084; 
	Thu, 12 Jul 2018 11:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <471e7a0975e7869080f37ffc4cbc51de58fb74fa.1531397025.git-series.martin@geanix.com>
	<e7a2ce58-4bbe-f44f-2349-2bbed2920241@geanix.com>
In-Reply-To: <e7a2ce58-4bbe-f44f-2349-2bbed2920241@geanix.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Jul 2018 12:30:57 -0600
Message-ID: <CAMKF1spZ7Qzj4wyjDL0gyL8Voax8STgdA8TUoDY6hX34rGk6+A@mail.gmail.com>
To: martin@geanix.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] ell: update to 0.6
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
X-List-Received-Date: Thu, 12 Jul 2018 18:31:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think you can send a new patch just doing this on top of original patch.
On Thu, Jul 12, 2018 at 12:09 PM Martin Hundeb=C3=B8ll <martin@geanix.com> =
wrote:
>
> Hi Khem,
>
> On 2018-07-12 14:05, Martin Hundeb=C3=B8ll wrote:
> > Remove upstreamed patch to fix musl build, and replace with another
> > (submitted) patch to fix a new musl issue.
> >
> > Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> >
> > ---
> >
> > Changes in v2:
> > - Added patch to fix musl build
> > ---
> >   meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-ins=
tead-of-linux-hea.patch | 39 +++++++++++++++++++++++++++++++++++++++
> >   meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.patch =
                        | 39 ---------------------------------------
> >   meta-oe/recipes-core/ell/ell_0.4.bb                                  =
                        | 19 -------------------
> >   meta-oe/recipes-core/ell/ell_0.6.bb                                  =
                        | 20 ++++++++++++++++++++
> >   4 files changed, 59 insertions(+), 58 deletions(-)
> >   create mode 100644 meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_=
arp.h-from-libc-instead-of-linux-hea.patch
> >   delete mode 100644 meta-oe/recipes-core/ell/ell/0001-ell-fix-build-wi=
th-musl-libc.patch
> >   delete mode 100644 meta-oe/recipes-core/ell/ell_0.4.bb
> >   create mode 100644 meta-oe/recipes-core/ell/ell_0.6.bb
> >
> > diff --git a/meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-fr=
om-libc-instead-of-linux-hea.patch b/meta-oe/recipes-core/ell/ell/0001-dhcp=
-include-if_arp.h-from-libc-instead-of-linux-hea.patch
> > new file mode 100644
> > index 0000000..df3c055
> > --- /dev/null
> > +++ b/meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc=
-instead-of-linux-hea.patch
> > @@ -0,0 +1,39 @@
> > +From d8236d1d789f496a193dae5d2a15d706b81f6482 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Martin=3D20Hundeb=3DC3=3DB8ll?=3D <martin@geanix.com=
>
> > +Date: Thu, 12 Jul 2018 10:19:50 +0200
> > +Subject: [PATCH] dhcp: include if_arp.h from libc instead of linux hea=
ders
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +To: ell@lists.01.org
> > +
> > +Compilation with musl libc fails due to redefinition of 'struct
> > +arp{req,req_old,hdr}' in linux/if_arp.h, since it is already defined a=
nd
> > +included in net/if_arp.h (through net/ethernet.h -> net/if_ether.h).
> > +
> > +The only symbols used from if_arp.h is ARPHRD_ETHER, so it should be
> > +safe to avoid the compile error by including the if_arp.h header from
> > +the c-library instead.
> > +
> > +Upstream-Status: Submitted [https://lists.01.org/pipermail/ell/2018-Ju=
ly/001242.html]
>
> The upstream status is now:
> Upstream-Status: Backport
> [https://lists.01.org/pipermail/ell/2018-July/001244.html]
>
> Change it locally if you like. Otherwise I'll send a quick patch when
> this one hits master.
>
> // Martin

