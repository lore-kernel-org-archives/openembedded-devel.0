Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id E7E8972EA2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 15:40:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1525016459; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=n6ZLVEksCUtJYt5tTfl8/Het4dv50o7Lf5vvCaaHG/g=;
	b=gQlem3fHymi0JQ9uoGd9R7z00cek/CVZUMy3QqCli7JTQRyliRW3OpIgg1bSa9KgoRfL3Uh7
	M9DHfoULmVOLCFzRcAtc5eWWT/33/lxDfczDOPrjeVAaqkyioXcr+Mk5Hd05RTunE5AuYJou
	C9xvAuHwn/eo1u4MH7Kf35LKMgA=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mxa.mailgun.org with ESMTP id 5ae5e78b.7f6807681c70-smtp-out-n03;
	Sun, 29 Apr 2018 15:40:59 -0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id d26-v6so7707968ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 08:40:59 -0700 (PDT)
X-Gm-Message-State: ALQs6tAaZiY8prPC/MMaA+A0nqjGJvtSVrqZr4pPm3jF+l166NfPOeyG
	pltbhdBC1eADK0qRf4rfMeJomhxptJWsGm2DZ4Y=
X-Google-Smtp-Source: AB8JxZrQog+tCS6+TPNjtacizGAfFNQiYQ2XnWVlEsI2dTv83e674Fd/QoROnXE+Or85L01lSR/xjpy90PFxAC9cUKk=
X-Received: by 2002:a6b:c6cb:: with SMTP id
	w194-v6mr9247694iof.131.1525016458847; 
	Sun, 29 Apr 2018 08:40:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.140.12 with HTTP; Sun, 29 Apr 2018 08:40:58 -0700 (PDT)
In-Reply-To: <CAMKF1spYD5R9QoLaZR+TjHx9AzWkoTbrAwxQXURD5SvfNTAQRw@mail.gmail.com>
References: <CAC+thW3RAbh6_2b8_Lzqx-UnE8xzFsW=1z0E9C1KXBukD02ecg@mail.gmail.com>
	<CAMKF1spLgyayuJG0LMoEbWNw9=D2zmXE0aiK8p2n-iwV5sxBUg@mail.gmail.com>
	<CAC+thW0hX39De-zuRBmE30=BSwE0KxN7s9sE4Mb5BViT0f-HLA@mail.gmail.com>
	<CAMKF1spYD5R9QoLaZR+TjHx9AzWkoTbrAwxQXURD5SvfNTAQRw@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Sun, 29 Apr 2018 11:40:58 -0400
X-Gmail-Original-Message-ID: <CADNbA1rP_fr-g8=HQdNnp5=nf8qvk+1EPA=1omv-Y=L1gQQ2Cw@mail.gmail.com>
Message-ID: <CADNbA1rP_fr-g8=HQdNnp5=nf8qvk+1EPA=1omv-Y=L1gQQ2Cw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] README: contradictory indications?
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
X-List-Received-Date: Sun, 29 Apr 2018 15:40:59 -0000
Content-Type: text/plain; charset="UTF-8"

There are several recipes in meta-python that have dependencies in meta-oe:

gateone, python-dbus{mock}, python-pyzmq, python-snimpy

python-futures is also needed by a few recipes in meta-python.

I had thrown together a patchset a while to remove the dependency when
there was talk of splitting things out into separate repos, but I never
submitted it to the ML.

On Sun, Apr 29, 2018 at 11:22 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Apr 29, 2018 at 7:59 AM, Andrea Galbusera <gizero@gmail.com>
> wrote:
> > On Sat, Apr 28, 2018 at 10:03 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Thu, Apr 26, 2018 at 12:10 AM Andrea Galbusera <gizero@gmail.com>
> wrote:
> >>>
> >>> Hi,
> >>>
> >>> I see that README in meta-python contains conflicting information
> >>> about layer's dependencies. The introductory paragraph states that
> >>> "modules in this layer need to be independent of openembedded-core and
> >>> meta-openembedded/meta-oe", then a few lines below both of these
> >>> layers are listed within meta-python's dependencies.
> >>>
> >>> To me, looks like the sentence in the introduction does not hold true
> >>> and can be removed. If you can help clarify what the correct
> >>> information is, I can send a patch to fix the documentation bits.
> >>
> >>
> >> Usually it shoudl be just core layer
> >
> > That's not the case, at least out of the box. Without meta-oe in
> > bblayers bitbake complains with:
> >
> > ERROR: Layer 'meta-python' depends on layer 'openembedded-layer', but
> > this layer is not enabled in your configuration
> >
> > Then, would be ok to drop 'openembedded-layer' from
> > LAYERDEPENDS_meta-python in conf/layer.conf? Parsing-wise it seems of
> > no hurt...
>
> I think if there is a dependency on meta-oe that could be beyond
> parsing e.g. compiling
> a recipe might assume another recipe from meta-oe during compile,
> ideally packageconfig
> for such features would be ideal. We can validate the dependencies via
> building each recipe
> from meta-python without meta-oe in layermix.
>
> It would be better to document whats actually happening in code even
> though it is less
> than ideal.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

