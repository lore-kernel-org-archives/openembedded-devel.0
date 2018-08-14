Return-Path: <andreas.kling@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id E30B779062
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 18:50:41 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id q12-v6so22257126qtp.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 11:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yIFL+CKhxTrmd4v6MWw9b/yR0BGqNcY/l6CA8Cl7edA=;
	b=rifqlGDkPE04PAVi2G+5EV+StpZICLH/Tx2Ih27UZ4nt1q6mnhp/qZ7nhcmR6wgDRE
	Dhz/KG0KuS4dtaCeak7KFjNq14afWekOI6g3bhGHEEnXQgUOhUrY3rJSWCqqia6ldYCD
	fBd/AxAmfj2bUKSjV9HRoqTSGNMvsSDSLRNRkWjZ6SivTWaeQdUCk8cgZvXTor3wIwqy
	0j333aR5Nvn9ofKKbLM5Woeo58nbSuAhbCOVirC1Y9dn8NQJgneIk3HVdbs56lZ+2Lur
	Xj6nCOREbhDVcjxB2hVbcdBZjBszp5uvh9o1qoSEAoInraKbQ9M7vXaKTahR2zxW8UhP
	GITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yIFL+CKhxTrmd4v6MWw9b/yR0BGqNcY/l6CA8Cl7edA=;
	b=ZMmjEev2edPTBjuzT0UqpZiQL1k3hGaZ4CmRxzTz2QhZ7cD/wd9QOgOI+C8kCYtXkm
	Xo8T9KQGO6lllOQfR8adFAwK+R2Uzn1rmUWNC3lBPc5x/lFcVS1cL472x2/R1/ORrY5Y
	k6c+dbncHY4DjiUgw0DiEM0PokLcRqQVy4nJa0YLD6r3UH5wStMQMZYar4WL3u1EVoXN
	6SBKa8lAUaC8FpMlJnxNbOQHOVEg76ubJUgsAqdG+ldQrCPrD89lwsBKBQRUaztWPlTm
	E7tR2M+urMM77Cfp8wjca8sfZeq7eUbiY3BP73uX5VQK6yW53np1ANK77F/U5xo4Mzu9
	lDOA==
X-Gm-Message-State: AOUpUlEfGXCr27QNWy3QM0nf6a8gHiFf7R5yh7aRwxYyySOfXCm5BHUS
	ipwRJ18c4zoLjmQ/H1EOUXr3qOiATdYSRVh72x8=
X-Google-Smtp-Source: AA+uWPy2b27w5a6DvKevTam+FHQuFZdr+8CyqxsGERiMAc9tX6UCLuasguwh7kT7h61pzjmzkEdj6sEGUlpz2SYA6jA=
X-Received: by 2002:a0c:e505:: with SMTP id
	l5-v6mr20113451qvm.128.1534272642709; 
	Tue, 14 Aug 2018 11:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <1533092773-22300-1-git-send-email-ricardo@foundries.io>
	<CAMKF1sqAMyN2QErgLn1VZ4hxXjm-fGdRTnZ5ZeBEs5mXOqEL+g@mail.gmail.com>
In-Reply-To: <CAMKF1sqAMyN2QErgLn1VZ4hxXjm-fGdRTnZ5ZeBEs5mXOqEL+g@mail.gmail.com>
From: Andy <andreas.kling@gmail.com>
Date: Tue, 14 Aug 2018 20:50:31 +0200
Message-ID: <CAE-gg=6XBsP+Nm0fdSrmou6bYWYYcb4=W7P78KJt=7MTrh98-g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Tue, 14 Aug 2018 18:50:42 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Am Do., 2. Aug. 2018 um 10:34 Uhr schrieb Khem Raj <raj.khem@gmail.com>:
>
> Hi Ricardo
>
>
> On Tue, Jul 31, 2018 at 8:06 PM Ricardo Salveti <ricardo@foundries.io> wrote:
> >
> > Mozjs fails to start on several architectures due broken build
> > optimizations when building with GCC >= 6.
> >
> > Set -fno-schedule-insns2 as workaround (flag also used by Firefox and
> > Debian).
> >
> > Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> > ---
> >  meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
> > index da80b63..adc27ac 100644
> > --- a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
> > +++ b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
> > @@ -30,6 +30,11 @@ CONFLICT_DISTRO_FEATURES_mipsarchn32 = "ld-is-gold"
> >
> >  DEPENDS += "nspr zlib"
> >
> > +# Avoid broken JIT on several architectures (from Firefox and Debian)
> > +# https://bugzilla.mozilla.org/show_bug.cgi?id=1245783
> > +CFLAGS += "-fno-schedule-insns2"
> > +CXXFLAGS += "-fno-schedule-insns2"
> > +
>
> Could you test with -fno-tree-vrp -fno-strict-aliasing
> -fno-delete-null-pointer-checks instead of -fno-schedule-insns2
>

at least polkit is able to start again using

CFLAGS += "-fno-tree-vrp -fno-strict-aliasing -fno-delete-null-pointer-checks"
CXXFLAGS += "-fno-tree-vrp -fno-strict-aliasing -fno-delete-null-pointer-checks"

before I got:
Assertion failure: !joinable()
in cortexa7t2hf-neon-poky-linux-gnueabi/mozjs/52.8.1-r0/mozjs-52.8.1/js/src/threading/Thread.h:122

Andy

