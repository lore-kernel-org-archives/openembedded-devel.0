Return-Path: <nick83ola@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id EF6CE786DA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2018 00:15:27 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id k190-v6so16396782oib.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 17:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=D2LiKJi9kVhUCf0pX7fi79h7FrOGwuePZcFGRfXM06g=;
	b=nVQuF3X7RnG+SLiKplt79zh+XPW8Nrv7Ag9l+d3D1uRkzGlYv5cLisHaLQLoBFe/PF
	lV3EWwnJfVneuyH6yiXvAE3GcwngYA3ur58qj1O0O3eg6TSkakG5j9n3ud0UH3gJXI8k
	ehhE1AeTz8/RIQ55VKw3qG05wtXwGZPrCXVpWzLTEZv02uei7K8T2IwpIZ19PWx8UKiD
	ul2kxhYuapYnoAj3DdBA1XlxensT4i7Eo0/rTcorEbrqaNMOXGd7XFj3B2ZPj6ZDXtC8
	U2DfCyAZNHBNcRhVIX0du1Fkz9qZ7FHCI1pz36ZXfjeAXoMKlQctg9A6ijKUku2GMDH6
	dKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=D2LiKJi9kVhUCf0pX7fi79h7FrOGwuePZcFGRfXM06g=;
	b=gXv48VYpL8H8aoStpcehqti54fyZMZoJyO9Z2EI+bSY71BRBwMzis5JT14Y/yX51ub
	rDIPkIo3dZM0lIMJvHQh6nGZgjTEWzPlPUfmNJoxw/ZFQx75S6FTGklAqhxynAhC41po
	i4TZf7Q7qAuR3X+PVIIQwl/yrviwABwoISJq6SxoXnuzlRaSnVJlEQMGIdXIyWAAPeOV
	90TCJoMRwnnqCrjlpC79y7la9+zrgwCe+IX5JIvypUHPQFrLoqhI5Gwl+mPTRnHs4FOC
	WlN8poJbpulNVpNvwTHg/qDgY1+MeDn2C42h7T8kEERMDSvWV87YSnchOZB/flNQLnny
	2X9w==
X-Gm-Message-State: APt69E0mUhyyRm1D4Cm4LiBxPcOymqY9QQ4wf+7XDXcHo4OzMbk9Gb89
	vBeSnf/NeY3cbzwJrUz12hiBd1mXOKKr7u5XDhM=
X-Google-Smtp-Source: ADUXVKLM4JwRZpwNo3/w1hRT0ZyS8tTjNqtEC4UPHRZwD24cjPWC6aFHzOAnGubT17rp7iW7hOp4gEix0S5VjPekRLw=
X-Received: by 2002:aca:ea55:: with SMTP id
	i82-v6mr7946044oih.260.1528676128935; 
	Sun, 10 Jun 2018 17:15:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5f8d:0:0:0:0:0 with HTTP; Sun, 10 Jun 2018 17:15:08
	-0700 (PDT)
In-Reply-To: <CAMKF1sppP0MemDjUN=J2RuUKPspRJh6S0BmmQKG4AYZgMQBv8A@mail.gmail.com>
References: <20180605133909.11319-1-nick83ola@gmail.com>
	<20180605133909.11319-2-nick83ola@gmail.com>
	<5113980.YQSFpsKea5@peggleto-mobl.ger.corp.intel.com>
	<CABPh3UMQ8uhWpxiX-zqQ4XjaMrPfPfBhRKQ=aJW=TjjH-+jULA@mail.gmail.com>
	<CAMKF1sppP0MemDjUN=J2RuUKPspRJh6S0BmmQKG4AYZgMQBv8A@mail.gmail.com>
From: nick83ola <nick83ola@gmail.com>
Date: Mon, 11 Jun 2018 01:15:08 +0100
Message-ID: <CABPh3UMoyrr6ccuBgbW2GS=knai7tMB_GR-FXyyfCB_dO3i3dQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] mosquitto: add mosquitto-examples package
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
X-List-Received-Date: Mon, 11 Jun 2018 00:15:28 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks

:-)

Nicola Lunghi

On 7 June 2018 at 18:09, Khem Raj <raj.khem@gmail.com> wrote:
> they are in master-next
>
> On Thu, Jun 7, 2018 at 2:32 AM, nick83ola <nick83ola@gmail.com> wrote:
>> ping
>>
>> On 6 June 2018 at 00:33, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>>> On Wednesday, 6 June 2018 1:39:09 AM NZST Nicola Lunghi wrote:
>>>> From: Nicola Lunghi <nicola.lunghi@jci.com>
>>>>
>>>> the mosquitto install populate some .example files in
>>>> /etc/mosquitto. move thise example files in a separate package
>>>>
>>>> The PACKAGE_BEFORE_PN is needed because otherwise those examples
>>>> end in the base mosquitto package
>>>>
>>>> Signed-off-by: Nicola Lunghi <nicola.lunghi@jci.com>
>>>> ---
>>>>  .../recipes-connectivity/mosquitto/mosquitto_1.4.15.bb        | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/meta-networking/recipes-connectivity/mosquitto/
>>> mosquitto_1.4.15.bb b/meta-networking/recipes-connectivity/mosquitto/
>>> mosquitto_1.4.15.bb
>>>> index c71f1e467f..8dd2124c41 100644
>>>> --- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
>>>> +++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
>>>> @@ -62,6 +62,8 @@ do_install() {
>>>>
>>>>  PACKAGES += "libmosquitto1 libmosquittopp1 ${PN}-clients"
>>>>
>>>> +PACKAGE_BEFORE_PN = "${PN}-examples"
>>>> +
>>>>  FILES_${PN} = "${sbindir}/mosquitto \
>>>>                 ${bindir}/mosquitto_passwd \
>>>>                 ${sysconfdir}/mosquitto \
>>>> @@ -79,6 +81,8 @@ FILES_${PN}-clients = "${bindir}/mosquitto_pub \
>>>>                         ${bindir}/mosquitto_sub \
>>>>  "
>>>>
>>>> +FILES_${PN}-examples = "${sysconfdir}/mosquitto/*.example"
>>>> +
>>>>  SYSTEMD_SERVICE_${PN} = "mosquitto.service"
>>>>
>>>>  INITSCRIPT_NAME = "mosquitto"
>>>>
>>>
>>> Both of these look good to me, FWIW
>>>
>>> Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>>
>>> Cheers,
>>> Paul
>>>
>>> --
>>>
>>> Paul Eggleton
>>> Intel Open Source Technology Centre
>>>
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

