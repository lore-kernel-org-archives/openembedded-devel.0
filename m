Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4666179210
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 02:28:18 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id u21-v6so2342515qku.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2018 19:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rTnfimUURDLRMXXh6vJreepgHhKJcLjNw3Dy4A5WUxM=;
	b=vhOj7CObUSWwnxdCrn9g063/ePvcevBqDune0IQem0/i5eZ4He8Rmk2nie7/SNNWZ+
	q+HtnB/9AZSL8vDMJg4yoVs/bW72nBfxschDXsi6KzoR1PW/5prmpQzAghkDbRxcF5G2
	5w1PIPjGzLjdkLiB02Ox72HaLmGz46NNJOlzK9VvXyYYGptevHx9Wit4j7heMmW9SMiA
	7Tyg7Ssy9eM4yagT39TE7uaSRayqQrDq1fq9JAPKEWqgWYNx9nqxK4Qj+rV27q4tOvFr
	FethiCAJsQnaKqbEml5VFY6w1KcE2EnuVczMqDX6grbZ1QyGa59Jm+4W+Fz6YYBgLxKG
	EgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rTnfimUURDLRMXXh6vJreepgHhKJcLjNw3Dy4A5WUxM=;
	b=JAC0JjJlm3TjGd16e4OPllSufWbsxrzAbTuEz9GMr+ZbOaRkHV981TWgtcgD3mtL1m
	5F7JMd5Eiac2+h5NwXd+82wUFlmdu/aEjx7IhLBGlffu7fuq/nxfswHeJnav2aEASMnr
	lcNwtlKyrWZ9fhWWNOLj8FZqO7WmXe6XInUqgbNKg1Kr7FrZoZE6Y0KiYkM8Q5kEWQe7
	0LqcQs0xcKCYBwevSEmaDv0wmtCSTsDrhnmUP+IEJyvqh3wpi3De5JQe3ToKW6s6cQtK
	HEjzkMMi9AYfknMgBbL02WTzH62yhROVWC2magrbSF9ktmzoNA/OD1auzHTu+aoORg3u
	xN6w==
X-Gm-Message-State: AOUpUlE32czsGXWiKJE/nTdB8t1Kj4cvNvo06FEe2MoP/AdwJIbRprzR
	WxmIiyOY2RIhgJiTP2oqiUDUeNgxdHibV4NGxAA=
X-Google-Smtp-Source: AA+uWPx8fYHGR0zOPSNY294ja5OWJDRUfiZCk7PrAlGlDLJZiQ18U4IHz8Ngfaot43CoW05l4O9D3dstFlS8AM1lmaw=
X-Received: by 2002:a37:417:: with SMTP id 23-v6mr25212827qke.12.1534386498792;
	Wed, 15 Aug 2018 19:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <1533092773-22300-1-git-send-email-ricardo@foundries.io>
	<CAMKF1sqAMyN2QErgLn1VZ4hxXjm-fGdRTnZ5ZeBEs5mXOqEL+g@mail.gmail.com>
	<CAE-gg=6XBsP+Nm0fdSrmou6bYWYYcb4=W7P78KJt=7MTrh98-g@mail.gmail.com>
	<CAAaKDhEao-tigyhko=j3AWGxJd4kzryQ1r2tLf6DrNMmwxEWnw@mail.gmail.com>
In-Reply-To: <CAAaKDhEao-tigyhko=j3AWGxJd4kzryQ1r2tLf6DrNMmwxEWnw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Aug 2018 19:27:52 -0700
Message-ID: <CAMKF1spA4j3-S+4iDdbv7uyX2nicW7CqRn6=g3UgPCok3m7eFg@mail.gmail.com>
To: ricardo@foundries.io
Cc: Andy Kling <andreas.kling@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mozjs: set -fno-schedule-insns2 on both CFLAGS and CXXFLAGS
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
X-List-Received-Date: Thu, 16 Aug 2018 02:28:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 15, 2018 at 7:18 PM Ricardo Salveti <ricardo@foundries.io> wrote:
>
> On Tue, Aug 14, 2018 at 3:50 PM, Andy <andreas.kling@gmail.com> wrote:
> > Hi,
> >
> > Am Do., 2. Aug. 2018 um 10:34 Uhr schrieb Khem Raj <raj.khem@gmail.com>:
> >>
> >> Hi Ricardo
> >>
> >>
> >> On Tue, Jul 31, 2018 at 8:06 PM Ricardo Salveti <ricardo@foundries.io> wrote:
> >> >
> >> > Mozjs fails to start on several architectures due broken build
> >> > optimizations when building with GCC >= 6.
> >> >
> >> > Set -fno-schedule-insns2 as workaround (flag also used by Firefox and
> >> > Debian).
> >> >
> >> > Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> >> > ---
> >> >  meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb | 5 +++++
> >> >  1 file changed, 5 insertions(+)
> >> >
> >> > diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
> >> > index da80b63..adc27ac 100644
> >> > --- a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
> >> > +++ b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
> >> > @@ -30,6 +30,11 @@ CONFLICT_DISTRO_FEATURES_mipsarchn32 = "ld-is-gold"
> >> >
> >> >  DEPENDS += "nspr zlib"
> >> >
> >> > +# Avoid broken JIT on several architectures (from Firefox and Debian)
> >> > +# https://bugzilla.mozilla.org/show_bug.cgi?id=1245783
> >> > +CFLAGS += "-fno-schedule-insns2"
> >> > +CXXFLAGS += "-fno-schedule-insns2"
> >> > +
> >>
> >> Could you test with -fno-tree-vrp -fno-strict-aliasing
> >> -fno-delete-null-pointer-checks instead of -fno-schedule-insns2
> >>
> >
> > at least polkit is able to start again using
> >
> > CFLAGS += "-fno-tree-vrp -fno-strict-aliasing -fno-delete-null-pointer-checks"
> > CXXFLAGS += "-fno-tree-vrp -fno-strict-aliasing -fno-delete-null-pointer-checks"
> >
> > before I got:
> > Assertion failure: !joinable()
> > in cortexa7t2hf-neon-poky-linux-gnueabi/mozjs/52.8.1-r0/mozjs-52.8.1/js/src/threading/Thread.h:122
>
> Finally able to test this locally across multiple builds, and these
> flags seems to be working fine as well.
>
> Looking around and it seems fedora is also using the flags you
> suggested, should we use them instead of '-fno-schedule-insns2'? If
> so, I can prepare another patch with the new changes.
>

yes we should, disabling a instructions schedule pass is too broad
when we can get over by doing a bit less

> Thanks,
> --
> Ricardo Salveti

