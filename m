Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 077DB7979C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 19:10:26 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id y207-v6so29119625oie.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 12:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5emi/qZeteqyhLKCQ+lJISdoqi0xtfHomGOZkAvtSRU=;
	b=s4DpJ9Yp+UqlfDKLP9Hfa030yOcupb6Z+eysGHJcb0OXbVqu8DapMuvcKUijyPNhsc
	VB4HWt7/2xzERXvFf2sO5vA+Ex+D2V4ph8j6jV1a+Zmwl4HBiaoxLLOHq83Kke0WXMcA
	PchownhxpRniR3+O6xQ8xygj6zOEk8ieEp1aTKQObsAhmQsh/2V3lheL1/gmkQiXQMTY
	97XXsuiaCTlk3c88/2Ii4yiNuwczhQZyDWtNzpgCLTNWByIB+rfsG9jnfugz4RsKCj2S
	4cDxZm/NrHMwSm3aUAsvN7ExnpvhrvZ3UlSBKQMzL0Ms6BLNopbPXmByl6dCoIX/8Fbo
	1ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5emi/qZeteqyhLKCQ+lJISdoqi0xtfHomGOZkAvtSRU=;
	b=K/2JgP9g7QsfjmB5l5VxKOkDD4sudGOmvpIVv2647Hk9/GGK9cq6cOza2Fa/nDnOV0
	pTeuqQ6MP6ES88BKLE/W3wuui2aAxZs3x2qfha0EwqP3UdxwQ2BbafMwIwIOLCfrfgC3
	dZAIEB/poXpOcKt2pkzujJW5/0jyjqmLidnyj6zNx2aSFJuN7YSS/EfJ99UnIMWN34N1
	28Xlh56VMbayYxQ6clNVB8JXQmVrnnjuvTxT+AikULiqSmDB9mnhOhiKMHb9rQbwBU+m
	UjVltE9MGye5C4h/m5Y0Iy/OIgQnKJecmpUsTffRDspuOLQBvs47waodlQyZG2DfiRbf
	AZVw==
X-Gm-Message-State: APzg51D6Bj+Hnq1dombWpQiCJFlazb0MtHDKL0nh8M3HETRwbenD9q+K
	FBeNJ9Dk/BmUb+/kcByUj1yulnnv5gFwNl3PCLqO5lYT
X-Google-Smtp-Source: ANB0VdbeCOqEWNOOJVobvXMSNiZsbJSUwZOcowYRqI0/yiAjL/ZUp6JuM11ejTXz6nQmnD4UsCA0J4BnryDZ02Cuc7o=
X-Received: by 2002:aca:c34b:: with SMTP id
	t72-v6mr10187925oif.338.1536347427848; 
	Fri, 07 Sep 2018 12:10:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:490c:0:0:0:0:0 with HTTP;
	Fri, 7 Sep 2018 12:10:27 -0700 (PDT)
In-Reply-To: <CAMKF1srtxPsZum6ePBxCeyehxYJbC8YoN-QXD0Pfw+BSR=JR=g@mail.gmail.com>
References: <20180907102842.24197-1-schnitzeltony@gmail.com>
	<CAMKF1speuTVVk+o9svpy-Chudk18WGvMcvEEd70dsw8x+9Kdag@mail.gmail.com>
	<CALbNGRT4HbiFCxVT9CYEX=-cOKCT0HfKkAJ35F5FH2e5xJWzDg@mail.gmail.com>
	<CAMKF1srtxPsZum6ePBxCeyehxYJbC8YoN-QXD0Pfw+BSR=JR=g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 7 Sep 2018 21:10:27 +0200
Message-ID: <CALbNGRS3keNpDHCVF4i-z2+AD683bi7-MeeOafq8Em42Sdmd+g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] blueman: rdepend on packagegroup-tools-bluetooth instead of bluez5-obex
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
X-List-Received-Date: Fri, 07 Sep 2018 19:10:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 7, 2018 at 7:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Sep 7, 2018 at 9:54 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>>
>> On Fri, Sep 7, 2018 at 4:08 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > hi Andreas
>> >
>> > On Fri, Sep 7, 2018 at 3:29 AM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
>> >>
>> >> Have a better out-of-the-box experience
>> >>
>> >
>> > Making a recipe rdep on a meta recipe is sort of too coarse grained
>> > the vice versa is expected
>> > can we encode all needed recipes in rdep ?
>> That just causes redundancies - what is the problem exactly?
>
> Not generally hard opinionated on it. But I think
> packagegroups generally cater to images no to individual recipes.
>
Hi Khem,

The idea was to make blueman work without further ado. Adding it made
blueman usable - before it could not connect to nothing. BTW: It was
me who introduced blueman. When I tested - it displayed devices and
since it was not a top priority I decided to take care for details
later.
The reason I chose to use packagegroup-tools-bluetooth is that the
packages added matched exactly the needs. It even takes care for
DISTRO_FEATURE pulseaudio. Regarding redundancy: I would like to to
same in meta-qt5-extra/bluedevil situation is similar there. So in
case something is missing or not necessary,
packagegroup-tools-bluetooth is the target of interest.

How about using RRECOMMEND - it is slightly less 'agressive' and makes
packagegroup-tools-bluetooth not mandatory (for packagemanager other
than opkg)?

Andreas

