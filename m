Return-Path: <ricardo@foundries.io>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2D2D4745C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 02:18:11 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id y200-v6so2258575lfd.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2018 19:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fyr2V/dX9xdTyGz1aYA+GobaIJJwCJFQqZFJFAMrWuM=;
	b=C2d4q4yowIbYJT6O6IcypFm88ahtaGmHmpF9DezZw3OgibHdhBsm2FDGr0W4QQv6uv
	9vd+euefHnidEwXoHRhvaWD54J4TpPjx7QqWvSXsqTRq9Z2p1PzBuB6+3KxZtGlY14Ke
	o57VDNGpdVVtzsvyi95wbryd0agGtFE7g4GfcAr/Ffd9th2ko+6wGyfF3kd4VDWKqeRH
	OTTRG1uj5Vl/4XmzIY0MSfnn5ka6rvF7Grcecie60W0vTCLoE5A+epl6che+zRYyhWEv
	588caKEFZPPteKKTwL971xDhZCptAiDjKvHT2MUaIWyWZjA6CPHQe73OIA17AIZoeYRE
	Ad+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fyr2V/dX9xdTyGz1aYA+GobaIJJwCJFQqZFJFAMrWuM=;
	b=ExI+0EBm/dPc0vM/GEufiyIX/RILLyd4e2VkdwsADXaTcsOoSSe+TWYjzG0jGDQjHG
	JaLbWSVJ/V0WOUDcvIfS65e65q/sCczvcF3CXYnuaPkJs+xGvevfkMGmc4iy/RQkR1nL
	ZCM/wtsobBU2Tw/+YLeVcSWYf2Xiji02hFKd3APcefhDeLdZ9/q0DWtxY5CzxlB+JTqm
	HyjifuE5wRBoSEi4pFnSmjcNLEiyMYxdPeLC73RCLTK3lzD2xsoTu6Di3MAI/Flw3J8c
	lDfL8kRYjHLjvsTN267G0WL+ReJIouaLH2a2MWbJzXNpV6RAFbEhUC2Bjds3Y/g1OULZ
	+L2w==
X-Gm-Message-State: AOUpUlFvuy1DAsOtTL0EnDN8LSETB2IUc0N9UsoAFLUSSsnppKt2JHFD
	F36CBQlyM1dKpiMbCeybYo/cx9/+HimSsRON+1zC
X-Google-Smtp-Source: AA+uWPylBdMZhJrNIkVytT8zg6vy0QR6062qzkldsRSQiXXiMP0I7DvcR8gDu7NAKhVuUgr8n/7gBlH6poTtWi0NdPw=
X-Received: by 2002:a19:ef13:: with SMTP id
	n19-v6mr2659250lfh.48.1534385891678; 
	Wed, 15 Aug 2018 19:18:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:e611:0:0:0:0:0 with HTTP; Wed, 15 Aug 2018 19:17:31
	-0700 (PDT)
In-Reply-To: <CAE-gg=6XBsP+Nm0fdSrmou6bYWYYcb4=W7P78KJt=7MTrh98-g@mail.gmail.com>
References: <1533092773-22300-1-git-send-email-ricardo@foundries.io>
	<CAMKF1sqAMyN2QErgLn1VZ4hxXjm-fGdRTnZ5ZeBEs5mXOqEL+g@mail.gmail.com>
	<CAE-gg=6XBsP+Nm0fdSrmou6bYWYYcb4=W7P78KJt=7MTrh98-g@mail.gmail.com>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Wed, 15 Aug 2018 23:17:31 -0300
Message-ID: <CAAaKDhEao-tigyhko=j3AWGxJd4kzryQ1r2tLf6DrNMmwxEWnw@mail.gmail.com>
To: Andy <andreas.kling@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 16 Aug 2018 02:18:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 14, 2018 at 3:50 PM, Andy <andreas.kling@gmail.com> wrote:
> Hi,
>
> Am Do., 2. Aug. 2018 um 10:34 Uhr schrieb Khem Raj <raj.khem@gmail.com>:
>>
>> Hi Ricardo
>>
>>
>> On Tue, Jul 31, 2018 at 8:06 PM Ricardo Salveti <ricardo@foundries.io> wrote:
>> >
>> > Mozjs fails to start on several architectures due broken build
>> > optimizations when building with GCC >= 6.
>> >
>> > Set -fno-schedule-insns2 as workaround (flag also used by Firefox and
>> > Debian).
>> >
>> > Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
>> > ---
>> >  meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb | 5 +++++
>> >  1 file changed, 5 insertions(+)
>> >
>> > diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
>> > index da80b63..adc27ac 100644
>> > --- a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
>> > +++ b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
>> > @@ -30,6 +30,11 @@ CONFLICT_DISTRO_FEATURES_mipsarchn32 = "ld-is-gold"
>> >
>> >  DEPENDS += "nspr zlib"
>> >
>> > +# Avoid broken JIT on several architectures (from Firefox and Debian)
>> > +# https://bugzilla.mozilla.org/show_bug.cgi?id=1245783
>> > +CFLAGS += "-fno-schedule-insns2"
>> > +CXXFLAGS += "-fno-schedule-insns2"
>> > +
>>
>> Could you test with -fno-tree-vrp -fno-strict-aliasing
>> -fno-delete-null-pointer-checks instead of -fno-schedule-insns2
>>
>
> at least polkit is able to start again using
>
> CFLAGS += "-fno-tree-vrp -fno-strict-aliasing -fno-delete-null-pointer-checks"
> CXXFLAGS += "-fno-tree-vrp -fno-strict-aliasing -fno-delete-null-pointer-checks"
>
> before I got:
> Assertion failure: !joinable()
> in cortexa7t2hf-neon-poky-linux-gnueabi/mozjs/52.8.1-r0/mozjs-52.8.1/js/src/threading/Thread.h:122

Finally able to test this locally across multiple builds, and these
flags seems to be working fine as well.

Looking around and it seems fedora is also using the flags you
suggested, should we use them instead of '-fno-schedule-insns2'? If
so, I can prepare another patch with the new changes.

Thanks,
-- 
Ricardo Salveti

