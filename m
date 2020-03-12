Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id AA95B61BB7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 18:13:19 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l21so5137332qtr.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 11:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=BYbwJZ0eyBdp21un/0q+oRnJHJj+UsgSP/ZZdQFXSS8=;
	b=iWrjEPO7OPHvCI88VIhMRCwGKfI5O6mSNdW0jUnOFgbzf+y1NofMUQfqYMw4cOItVj
	zb/wx2FVcoSyzDHP2SzwITrEs3bY0FSRTvg0/jrITN9L5Kf2zQOKl4YG8SF1IMRrcQ4a
	6+F6OLRd+L1N8WmfOQEaqvMPyzxPcpjgb2EDu0OnRAA+JwaOPaLgGUFRdWW82LMVmdvQ
	qCZ7PmFj7MI6kSLQ4nko7XtEnkILyUtw1bTufbzMCRcg8y23I411U+P6t6aJCXuxj74n
	z6NWY3vVCfWJO2C0wHCO+FYDeT2qfCiPTj6gLZjFjGQXIY2ADuesih/8VG81eIPNmaK5
	Yn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=BYbwJZ0eyBdp21un/0q+oRnJHJj+UsgSP/ZZdQFXSS8=;
	b=ea87TXo8jQr4cVUMUydaGHBOq62beQKZvf9QP6cfdUsf6eu94S1BIbbTyPB7EaQ/jw
	Q2mbUhmdX03b3/y40hZwlgl3+69P4o4D+V02hnADXXEozDK1Zh8fq/VGRxBRmOkCFVvS
	6KoT/h4F2UKD3Zwa+43Q2dGtsm0dhFVvudbsgQ4YgSPEIZpRZRMjGox4cZSDXSjrfz2b
	nyZ4rDG010aeztJ6W2uMW8zznmiP+BZ/W6uHQlFsYqP2XufyY0cPsMpN9xrm2fu7uDnl
	Se3vUBpZTWiiM9FpAB5KkxzvK+t0Fy3Po0vEBFr+PlSxhweZUARDh71HaUvIJEqrH1JN
	WeSA==
X-Gm-Message-State: ANhLgQ08Tx8lZ+xJyTGZ3jBAk6dmpmmmRSWz43Qz6+8VmQ0EI6FN1nSR
	hcXcdMvJicVdo/ab06AvGEahPjAnYZpWNjUIih8=
X-Google-Smtp-Source: ADFU+vvppzgY32nATHVi6QDqNms7AicjXucimyTRq2RkCJb5YRwFt0jjMoKfL4cGLlPLHmuHMavfxIoUfhtu3Wy6kFo=
X-Received: by 2002:ac8:7511:: with SMTP id u17mr8349040qtq.316.1584036800154; 
	Thu, 12 Mar 2020 11:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200228150345.11829-1-brgl@bgdev.pl>
	<CAP9ODKqbfrnLUBzE+WkGceSo+qBimGPUFUcgRuZmS3vwJZqpwA@mail.gmail.com>
	<CAMRc=MftVskWMFZQhbFKZLwNAR9a1+4zbayWTbXFuSJgG-ZgbA@mail.gmail.com>
	<CAP9ODKpVW6qxw7+5oA7auBMW1ApLdqjicZf8Ahe3RhYG8QjmgQ@mail.gmail.com>
	<CAMRc=MeJ0R81s-ui7J78pe89JE6c-_wx3RGUZx-tzMLc3pzthQ@mail.gmail.com>
	<dd3d6ea7-2bac-6a06-823d-fd070f547784@gmail.com>
	<CAMRc=MevN3tAfBkLZuOiW0BVbOWkq_T_HiD6XTMwh5d32xrGeQ@mail.gmail.com>
	<CAMRc=MehBSu1RpPkzP=xiFqt3wpJrf4FhV889jcPxUHPnf0GLg@mail.gmail.com>
	<CAP71Wjz1n_Csm762xbsxUK-3i3OYm-rfh=9Ccf28USLgJjRiFQ@mail.gmail.com>
	<CAMRc=Md1Udxq0eOUzNH=Pr3corUEa88_wdTJJFyurjMvJcfaAQ@mail.gmail.com>
In-Reply-To: <CAMRc=Md1Udxq0eOUzNH=Pr3corUEa88_wdTJJFyurjMvJcfaAQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Mar 2020 11:12:53 -0700
Message-ID: <CAMKF1spHPHW7xk5icpG5qVhYTSjuawWidw24o=tVWEve8_MDkg@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-ota][PATCH] meta-ota: add support for binary-delta images in a new layer
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
X-List-Received-Date: Thu, 12 Mar 2020 18:13:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2020 at 10:51 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> =C5=9Br., 11 mar 2020 o 14:28 Nicolas Dechesne
> <nicolas.dechesne@linaro.org> napisa=C5=82(a):
> >
> > hi Bartosz,
> >
> > On Wed, Mar 11, 2020 at 9:04 AM Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
> >>
> >> wt., 3 mar 2020 o 14:56 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=
=82(a):
> >> >
> >> > If this is not something that should be part of meta-openembedded - =
is
> >> > there any way to have it hosted at https://git.yoctoproject.org/cgit=
/
> >> > as an official yocto layer? I'm sorry if this is a dumb question, I
> >> > don't know exactly what the policy is for that.
> >> >
> >>
> >> Hi Khem,
> >>
> >> gentle ping on this. What is the procedure of hosting a layer at OE?
> >
>
> Hi Nicolas,
>
> thanks for the response.
>
> >
> > it depends what you mean here.
> >
> > 1. Hosting on git.yoctoproject.org is mostly for layers supported by YP=
 membership, these layers are under the responsibility of the YP TSC [1]
> > 2. Hosting on git.openembedded.org is under the responsibility of the O=
E TSC [2]
> >
>
> I'm not sure what that means exactly in terms of making a layer
> official. I can only guess that non-members can't make their layers
> part of the project for political reasons.

I would suggest to send the proposal to oe-tsc mailing list
tsc@lists.openembedded.org

>
> > We recently started an initiative using gitlab, to host layers: https:/=
/gitlab.com/openembedded/community, though it's not picking up much for now=
. But that would be another option, Paul B. or myself could give you access

openembedded gitlab presence as an organization is new and being
experimented with eventually
it might or might not become more prominent.

> >
>
> Yes, that is one way, but I just don't like githubs, gitlabs and other
> bitbuckets. I prefer regular mailing list flow + cgit whenever
> possible.
>
> > You might want to host the layer on your own (github, gitlab or anywher=
e else). I understand why you think that hosting on yoctoproject.org would =
make it 'more' official, however hundreds of layers are 'self hosted' and i=
t's usually not a big concern.
> >
>
> They are also scattered all over and significant part of them are not
> being actively maintained. Hosting it at some official git would at
> least mean that if I ever stop working on it, someone else could take
> over without moving the git tree. It would also make it more visible
> and make it possible for the development to happen on the official
> mailing list.
>
> Anyway: is the material I described in this thread something that
> could be committed to various existing parts of meta-openembedded
> without creating a new layer?
>
> > In any case you should register your layer in the OE layer index.
> >
>
> Sure.
>
> >
> > [1] https://wiki.yoctoproject.org/wiki/TSC
> > [2] https://www.openembedded.org/wiki/TSC
>
> Thanks,
> Bartosz Golaszewski

