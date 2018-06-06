Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7A99A76078
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 18:18:04 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id p23-v6so7376678qtn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2018 11:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=72ptOucBrRrPx+FYu2EWY3oxEfbB94vPnWRzejrj/MU=;
	b=T7M0U0/upLHlKepgvS7Ew5VPtewDZFfgQCLVVfqhcYZsz3WC0zwZB8jHzJLQZaO8jp
	lETKd6EauV02wb7n+JtDCLPsH7P7cQW1k2SYq0LDWqodFxG9pe1KLdUDeIVOG9ruiRl6
	E1XOgy6NdHfUEGAERbLIP1n/rgGwAJbI7qoGS8IoPEoYSG7JpTgW9HldIXsp8hvcql2m
	AF2m9daErjZlUIXHfYYxgSYj6fF+8OPJvNOc6fZYvDbhxsOyJvBoQuRpot/QKhEDTJ0R
	Ptpn3TMRP4rGLKnSbs2pPI/X8n1FkzfsDBGXikpNYn/wWpRyHg9YszCR40qBwyMYUrDr
	1wGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=72ptOucBrRrPx+FYu2EWY3oxEfbB94vPnWRzejrj/MU=;
	b=KjTOiORoHgljz5Zrff5goeppRdShfuBobh/SdtmbFhsL7y3BelWkY16vmYcVhl6TJk
	ngumI6FDqSXenHGaNynHHpst2u7gSvKDGWhzhyOZhnuTaRvo/wFQugI3jJJJy4a5mz3I
	Y+EHDk5BAfiFzlMQb7W0OE7MPMdtvuTD8QFhbUfVc1s8q3GZCJZ8CjGRXDwODDQCpCHR
	oyvsDBbrfhdlLaWAYCGbkVneGCoEu7FS+UdN8wFb+hOCvMcJOga8dQmPpbRw+WRHk1xr
	H5XhJG4nen9AWKd2dHm8vl/ydvSkb10Skjc8iHQUQxlkrrcsnKO9fdVXyw5QzhGtAXgt
	sCRw==
X-Gm-Message-State: APt69E3eIn/BJHu/CT0OvyhnFSlT/sklZOQcU2NIg2xFWq6e3SMPGUsh
	zpvQrQNUuJlcvQTgsiHZ4bQFOFRgIf0asCSDDmg=
X-Google-Smtp-Source: ADUXVKLwA18yprwrZmF8PEmIjFhVa5U+Myd/7LWJuBiM2l+oli60j+RnrgSUT2mbwGKRzvLk8KUV4jR0+p8A/Xi/+p4=
X-Received: by 2002:ac8:296:: with SMTP id
	p22-v6mr3915255qtg.188.1528309085258; 
	Wed, 06 Jun 2018 11:18:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 11:17:34 -0700 (PDT)
In-Reply-To: <CALbNGRRt+-YK_T60D-Cz-NfEbDZTRLy7bUCVgkqCyftGkshM9w@mail.gmail.com>
References: <20180604223911.14561-1-schnitzeltony@gmail.com>
	<CALbNGRSg8kYPO6x_jgXtK9Gi1gQDX7v4KbpTWVaWAQCEc=NXSg@mail.gmail.com>
	<CA+chaQcz=Ckh2=zSUBi969N-v7dJG-K2F1OXLxtnG8JLUahXYQ@mail.gmail.com>
	<CAMKF1so+ux5C6v3x_uBqiF1PjrjuYBtT7ViayqMez-oS6SbwLA@mail.gmail.com>
	<CALbNGRRt+-YK_T60D-Cz-NfEbDZTRLy7bUCVgkqCyftGkshM9w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jun 2018 11:17:34 -0700
Message-ID: <CAMKF1sqWH_vznwG=Ot_YBoBL+1mcP5xw3VPqdmYdF8a1zHTVbA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtwebkit: do not skip build - use cmake as build system
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
X-List-Received-Date: Wed, 06 Jun 2018 18:18:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 6, 2018 at 11:15 AM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> On Wed, Jun 6, 2018 at 7:20 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Jun 6, 2018 at 10:13 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>>> Thanks Andreas for taking care of this, I was planing to look at it lat=
er
>>> and then I forgot about it when I wanted to push first 5.11 recipes.
>>>
>>> With gcc8 I see small issue:
>>> http://errors.yoctoproject.org/Errors/Details/179245/
>>>
>>> In fedora they just added -fpermissive in:
>>> https://bugzilla.redhat.com/show_bug.cgi?id=3D1582954
>>>
>>> Are you interested in fixing it properly? I don't use qtwebkit
>>> anywhere (switched
>>> to qtwebengine long time ago), so I don't mind adding -fpermissive as w=
ell.
> Yes - I will check - have still recipes in meta-qt5-extra depending
> on. Maybe I should check which dependency is still necessary or just
> left over. One question: is gcc8 already upstream in oe-core because I
> ran tests with quite recent masters allover.
>>>
>>
>> IMO adding -fpermissive is acceptable for this package, its on a lifelin=
e anyway
> Dead ones live longer :)

indeed in memories.

