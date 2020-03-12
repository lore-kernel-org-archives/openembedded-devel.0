Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id EE56861C45
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 14:15:07 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id df19so1399563edb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=z/DmN6Qpy5/SV79dTzZ2GE+ZCdYveq7lp0nuhwEUF2A=;
	b=e/MOpbb97iBHk0PjdLgqvHIZRUX/o7ht860t303sR8W2s9q0iE+Evjp+KZN1wO7jaf
	cI8c0qQi07KlQLcnEyPNEUF+aeW8VRrGPe5WHFZWxR3cjfGehFf4d3X5D8srhSKZhLTn
	IQMVLavSMoSZpFWp9CyJzxlQHBf7RWUq3Ijapak2ml1c3Tlcdpx2blGKbsZL2V7Ih7Rt
	GF1KCFZryVAZw8/oms54HZZivABw4X2ctIejsY3qr2zGaOLkwhmu/Jd1YIMBv0tYtbWS
	W1rnmpMGBh9tg8/KC8oMcuZR18fvFMnWNmdchtNFwsryFynxhF1srEa5n+2ES3LJgNQD
	Z8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=z/DmN6Qpy5/SV79dTzZ2GE+ZCdYveq7lp0nuhwEUF2A=;
	b=RpAURMwHwf5DLZ+clOYqnaIpoX3w84wXah6D2npFFgIetG+QSclBRJGHzKiR9skbR1
	Q4NzIiuC9kyTxq0NB+vWLbrOYKb6OUWB0kazUQaBsJSknlLFihVWpOEQgvm/eQurH4Jo
	H1PXLydAa68FX87gkgAljnG9jv4kO21BJ9yeinE/lrxq3fTX7Vbe2yjyl+YcmXmbF5xq
	EpsSq8ecbPsWn0b3GeKsVu1jA6UBccvKhy8IJOe38LPgrJrcSIz4aWTuj+IZxJ34D1E7
	hybdRndG20DyLnebktYCKvv6CqqRTDQoTKV12BMUiluxDrZZMZG4FGdkf80UluP7CUgK
	65mA==
X-Gm-Message-State: ANhLgQ0FoWLOZSptsEqAZHt79PSAkPV9taBWk4rakIOPqhi2l8DcHfhR
	kol5GIo1grA5XV+LBZxU+/dYq89hX6n30s9Uf2GB2nWL
X-Google-Smtp-Source: ADFU+vvWp68S4JxQrKxjdNCh419JUYxkMwlWnDxfVxqmCrjF9e5qYVWsKoXf3cy/B23ohB69uLo5SqpkF5XegSpvTOE=
X-Received: by 2002:a17:906:6995:: with SMTP id
	i21mr1227399ejr.320.1584022508593; 
	Thu, 12 Mar 2020 07:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200229185539.3905864-1-raj.khem@gmail.com>
	<CA+chaQfxab4+mepbvxdNkoj4h9T1T5Qq4TWwne2teiexjyuwnA@mail.gmail.com>
	<CAMKF1srZjHaeuTD0FLv0kmmn+Gwq9QThHxhGXB0+WSBSo2bEJg@mail.gmail.com>
	<CA+chaQeF7U2C+t+zugHFry2bpxiFbfa294_A_dnfmdvJ-3pw9A@mail.gmail.com>
	<CAMKF1spqvnHXTOMWX8VV4QponpKun+2tpZS4hAG5JpDDdv8xgQ@mail.gmail.com>
In-Reply-To: <CAMKF1spqvnHXTOMWX8VV4QponpKun+2tpZS4hAG5JpDDdv8xgQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 12 Mar 2020 15:14:56 +0100
Message-ID: <CA+chaQcTRNcXnWX67kRts_K6cBdR9gun3qdqBX5nREts0ymH-g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] sysdig: Upgrade to 0.26.5
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
X-List-Received-Date: Thu, 12 Mar 2020 14:15:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It doesn't seem to build for aarch64 without the jit in luajit:

| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=3D1 cmake --build
/OE/build/tmp-glibc/work/aarch64-oe-linux/sysdig/0.26.5-r0/build --target
all --
| ninja: error: 'libluajit-5.1.so', needed by 'userspace/sysdig/csysdig',
missing and no known rule to make it
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of
'/OE/build/tmp-glibc/work/aarch64-oe-linux/sysdig/0.26.5-r0/temp/run.do_com=
pile.51845'
failed with exit code 1:
| ninja: error: 'libluajit-5.1.so', needed by 'userspace/sysdig/csysdig',
missing and no known rule to make it
| WARNING: exit code 1 from a shell command.

On Tue, Mar 3, 2020 at 4:27 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Tue, Mar 3, 2020 at 5:53 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> Should I send the patch to move grpc from meta-networking to meta-oe to
>> fix this or do you have it already?
>>
>
> Please send I don=E2=80=99t have it ready
>
>>
>> On Mon, Mar 2, 2020 at 6:22 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> On Mon, Mar 2, 2020 at 4:27 AM Martin Jansa <martin.jansa@gmail.com>
>>> wrote:
>>> >
>>> > Hi,
>>> >
>>> > added dependency on grpc exists only in meta-networking, so this fail=
s
>>> to parse now.
>>> >
>>>
>>> I think grpc is common enough to belong to meta-oe as well.
>>>
>>> > Cheers,
>>>
>>

