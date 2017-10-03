Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id E2E1A77CD8
	for <Openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 11:23:51 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id d10so6958806lfg.11
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 04:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tfSOrwZWtSDFeva4ULPlX4UDXlD0evRrGHsRqIdSZFo=;
	b=vCGb7gEYjOWpHYur7etPmo/Tp+CsGTK8USLxlK+SQzqs1T/kNiR5aR+1jcuR/RNjFi
	CH2T68xkf/7YbWIF4/t5rv6hmUwPz5Ng56IQECD8KQthvyPuY6DNh/EnDmfg9CRkMWIG
	Oz96aZwLwfwX2hlu006F9UCGBX39qXr8J24lrto1JeRkqR3Mwbk124sSmDduUX6M3A/J
	l0kHu+wWi+tHxS8Ipy/nwVP6Hk6sQXTabf2VyLWswKUyx/+EmqtBKw66uS1zdojGeEIu
	zEEuIpq9LIPymsUietcUhjEB3mVYdXFIPDlfb6cetPX9FACa28S7KI52YmQxo013Q5OJ
	nfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tfSOrwZWtSDFeva4ULPlX4UDXlD0evRrGHsRqIdSZFo=;
	b=axgNRmddRJvdAMa7VklFcmdtWl5fIQhI4hZEgBrnxf/sYQtIQO5PC5qwH7ISCjird2
	Oq/7ljaP9g3sKfwE2T2a0usNDttdGg5DUZbCUGiTpPE1HJJmSmJ62dyMKZpNYjV5VCyb
	jo6omX5LeX/lIe58Fl4jfrRfz7Tqdw6BCvMoi/mBteORweyxqx8lWLjH4SF2PFzphwPe
	y7lyju9szJkixwQ9tLitDf7p/NWawRQ1e8mCvs5AT6E9Ij1pwrqXK3v46f6DPPg4dRKh
	hoDclLwBkfCsKDKoQSrmztjBJUMBqa/PR6gzCeXXeRPw0RInD6ODQY3BPrLWk9K+zFow
	5/Bw==
X-Gm-Message-State: AMCzsaW3akL/09hNOSbaO8s4RnUJF7SauXrhLbiKFXQDK5O0gktK9oPe
	afXUurdK5tKT+7VBcezOz1WnBMpYXTxSBpIrnnU=
X-Google-Smtp-Source: AOwi7QBCRv0VQCpLqOsMJtItfZp86w4wfEDmEBG+ynvyfvfZbRq12Puy89iyhelEYJZpQvWorvCDHZdexmWNbieR3lI=
X-Received: by 10.25.152.6 with SMTP id a6mr4451691lfe.171.1507029832367; Tue,
	03 Oct 2017 04:23:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.44.200 with HTTP; Tue, 3 Oct 2017 04:23:31 -0700 (PDT)
In-Reply-To: <CAJTo0LbH5C+36B2osvedCtF90-Mxr0RPMvUiqbFi4N0Pn1ukMA@mail.gmail.com>
References: <20171003094039.30186-1-ricardo.ribalda@gmail.com>
	<CAJTo0LbH5C+36B2osvedCtF90-Mxr0RPMvUiqbFi4N0Pn1ukMA@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 3 Oct 2017 13:23:31 +0200
Message-ID: <CAPybu_383nTm_Jj6DtY8nCks5pu7t4uHxjdSQhuWG3Y+ZTO_3g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OpenEmbedded Devel List <Openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Add sdl-config to HOSTTOOLS
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
X-List-Received-Date: Tue, 03 Oct 2017 11:23:52 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ross

On Tue, Oct 3, 2017 at 12:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 3 October 2017 at 10:40, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>>
>> Without this patch bitbake cannot find sdl-config
>>
>> ERROR:  OE-core's config sanity checker detected a potential
>> misconfiguration.
>> Either fix the cause of this error or at your own risk disable the checker
>> (see sanity.conf).
>> Following is the list of potential problems / advisories:
>>
>> libsdl-native is set to be ASSUME_PROVIDED but sdl-config can't be found
>> in PATH. Please either install it, or configure qemu not to require sdl.
>
>
> First, wrong list, this should go to openembedded-core@ instead of -devel@.

Ups, my bad. sorry about that. I first tried to bitbake mailing list
but it bounced the mail.

>
> qemu's configure prefers pkg-config instead of sdl-config, so why doesn't
> that work for you?

Long story short.

-My configuration was using ASSUME_PROVIDED += "libsdl-native".
probably because I have not changed the local.con for a long while.
-On June I posted https://patchwork.openembedded.org/patch/141112/,
which I wrongly believed that it was merged.
-Also on June Richard posted f0d128ea0dfc2c403ff53a1ac1db3521854b63d5,
that was merged


I am now building without the assume_provided and so far it is working fine.


Maybe we should remove all ASSUME_PROVIDED "libsdl-native" references
on the code?:

ricardo@neopili:/tmp/poky$ git grep ASSUME_PROV | grep sdl
documentation/ref-manual/migration.xml:     ASSUME_PROVIDED += "libsdl-native"
meta-poky/conf/local.conf.sample:# by libsdl-native then uncomment the
ASSUME_PROVIDED line below.
meta-poky/conf/local.conf.sample:#ASSUME_PROVIDED += "libsdl-native"


Best regards!

