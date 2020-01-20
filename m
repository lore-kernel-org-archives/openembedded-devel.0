Return-Path: <sumit.garg@linaro.org>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB116C1C4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 05:24:03 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id j26so32409235ljc.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 21:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3tEHYm9A5zd7CdBQ5QPyLkBY8SmWCZZOniZPlpP+v+s=;
	b=W/SfjhnXN82isjZKrrfoqZUo4zS9vcONGeR7uWuESYmztmU+Aq3e6/V+3XuLJXkqX9
	3uJNaQ0Q67v6AUJ3Ch7lAnufMcSaZEN16MwRk8weZGLqyAIVkSKg5WK9Zxq9pPetD6N8
	aAJB3P88kb+4Er+Mweq/cas1UxyCaWJ2ARD9pNhtoUcCfdok444VnDt/N2RH1Ru772Tw
	ovqsBH9qfvUPRqRnV8/xosBEej5/pXknB/I3YNVTiFScRSCm9/k8bzLb4X8P/k41Jtxu
	Q1WEqCYHapA3ZdNqSGRPq3XlxPHeHrRGQUNmRBWuQkFTh0fSaUEuQwlIH9FUmgXKgkhm
	syHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3tEHYm9A5zd7CdBQ5QPyLkBY8SmWCZZOniZPlpP+v+s=;
	b=fYM+DG/2gkm9WcGlcPrDn2auJQQKT4uFG2f5fML+59B0Qqk2D2c16nobryYenvLY+0
	bu+iccOwsa9OB1v73/q0pcvYCW8+EPh5V27gptDz6ql0x4e2+dH9mdweFgg6YRZntBp3
	hrNaqWOi+HLtavJv/Ip7M9U0/swumL+vDWTQYOImQ1nmg421R8/UWZE5dOgo6jTN7OKe
	+Pk2mGpnVakEPRevanadgGfLDimqyK0QsuT64F6gInUdzkixFmk4kS0yXiI6dr9ichnd
	UGTZKgoYVlBixak8V4jbwQLqXDozQFcW4qGCt75Rwizdh5aydHSgMCJxuCtBjLUEMcLF
	Za0w==
X-Gm-Message-State: APjAAAXuD+1NvPZmXDLNkKIFbpsUPfX3b4DHoVYLpos8ha7X9lJSU2iC
	gtOV4m7SVBDVSkaIofVrsGC3O1ZVoQDY5xTCJ/sOSw==
X-Google-Smtp-Source: APXvYqxr4n1C1Q2OjNrYAjUaBuUoRRYY3xtcAst3xhmZlz3QXjWfs4LWZU5KE7lOYt1mkRCPVyt7ZsB3YWjt3mCnwxo=
X-Received: by 2002:a2e:9b05:: with SMTP id u5mr12475076lji.59.1579497843506; 
	Sun, 19 Jan 2020 21:24:03 -0800 (PST)
MIME-Version: 1.0
References: <1579245551-14394-1-git-send-email-sumit.garg@linaro.org>
	<8912342c-0c14-9711-164a-f82a1a0eb85f@gmail.com>
In-Reply-To: <8912342c-0c14-9711-164a-f82a1a0eb85f@gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 20 Jan 2020 10:53:50 +0530
Message-ID: <CAFA6WYM15VpCYfuAHc83awpzgHA3dnGjQjCKYbaPbryvaB9mSw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] meta-networking: fix recipes build with external tool-set
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
X-List-Received-Date: Mon, 20 Jan 2020 05:24:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 18 Jan 2020 at 00:18, Khem Raj <raj.khem@gmail.com> wrote:
>
> On 1/16/20 11:19 PM, Sumit Garg wrote:
> > - drbd-utils: fix native tool dependency which was implicitly met while
> >    building with source GCC tool-set.
> > - unbound: Use HOST_SYS variable instead of TARGET_PREFIX for libtool as
> >    TARGET_PREFIX may vary from source GCC tool-set to external GCC
> >    tool-set. Also, libtool-cross is installed in recipe sysroot using
> >    HOST_SYS variable only.
> >
>
>
> Please divide this into two patches since they seem to solve different
> problems. Also remove meta-networking from commit summary line and
> replace it with recipe name.

Ack.

-Sumit

>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >   meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb | 2 ++
> >   meta-networking/recipes-support/unbound/unbound_1.9.4.bb  | 2 +-
> >   2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
> > index 286b0f6..01bb16a 100644
> > --- a/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
> > +++ b/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
> > @@ -23,6 +23,8 @@ UPSTREAM_CHECK_URI = "https://github.com/LINBIT/drbd-utils/releases"
> >   SYSTEMD_SERVICE_${PN} = "drbd.service"
> >   SYSTEMD_AUTO_ENABLE = "disable"
> >
> > +DEPENDS = "flex-native"
> > +
> >   inherit autotools-brokensep systemd
> >
> >   EXTRA_OECONF = " \
> > diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb b/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
> > index 03eb2fa..6200214 100644
> > --- a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
> > +++ b/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
> > @@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
> >
> >   EXTRA_OECONF = "--with-libexpat=${STAGING_EXECPREFIXDIR} \
> >               --with-ssl=${STAGING_EXECPREFIXDIR} \
> > -             libtool=${TARGET_PREFIX}libtool \
> > +             libtool=${HOST_SYS}-libtool \
> >   "
> >
> >
> >
>

