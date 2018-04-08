Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id B7FFC72EC9
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 21:33:29 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id f63-v6so5818799oic.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2018 14:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4TxycSZUnesMlUvcMKle3y9F424anXm3zt3gkluAyzc=;
	b=heu1fhIFk4Ykn6fyqOESQ0BMKxd2cuSTxQXBcIg6lolvIZJuzXOGcMADfFWRMfLDsB
	CD8XqhE1qlqWq6eLiwTJtB5IfQLfDFURQo7r6DEeGQ/cgJGMxxZ22e75HpqN+omHq2M/
	qwjLLXmQMUHML4R3dLmjVxp6n4bwR/VSSyHchQdvzALwA713sZSJ4XlfOx7qj8SlRwlW
	A58a6huSrqpyemnIqobtscDxAffS3uIZLzcGplp1lf9xDPA6S+CX6KbF4G9qmnVLlDR0
	Pteo4lbIb/Xww5nito1uYpZBZp2pNprDQH2tZ/9vKrP08i5ryOTkFzVKSsbbohni70jF
	rMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4TxycSZUnesMlUvcMKle3y9F424anXm3zt3gkluAyzc=;
	b=YXfjRV7kNk5Da06lUVJh6gKzAOqOFSpCWpUi9HFcR9gLcybBu0X84dVIqWFNN0HZ/o
	5xmVwebiWOb50owGD3aJ3ElALF2+2PNnv2smF7HWI5PqbwH8wyc5sVWPGIUHIuRbtKOH
	tROfYjww/SawPM/eYiZEM3uFSu32xLn/PduwZko0WVC5kZj8QxAQ2qAO5WIBx57MSUUw
	SsEi++2BNrgFAg56pdzRiM9oJsCQQA8BVXWJkTwwDc3YFSvgbYzvr+GygTlF57XX9r9N
	YsHbCOnbK02f25aYHJdz0gFcOYY2wTpPGtQUxS9jTUPBpll8e+9eukJt8MQivU11i+lo
	4/rw==
X-Gm-Message-State: ALQs6tB7+4JUEvxLzo6JlBokztygOW26igIw7J8FagmFGbpTp/FfjzXc
	1+Ob8FqAWTMKY3ge4MWFUEzzlFtIFJJ0eacLxrA=
X-Google-Smtp-Source: AIpwx48YkeWL2kpJv6re+W5PHYwFhR2oRCOZqbL0FlOFG0HQcxMQtCXnTLIJD+CU6sFHYXM32SBTq04HeFrB5yr07KM=
X-Received: by 2002:aca:d0d5:: with SMTP id
	j82-v6mr15202929oiy.276.1523223210436; 
	Sun, 08 Apr 2018 14:33:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Sun, 8 Apr 2018 14:33:29 -0700 (PDT)
In-Reply-To: <CALbNGRQt57sNkjeU6Bk3C1fM2WF-iz5mec_pHTGooX5zYfrszw@mail.gmail.com>
References: <48f2945a-e330-4bc8-a4da-ab970b63ea5f@gmail.com>
	<20180319155951.GW4418@bill-the-cat.ec.rr.com>
	<7699bd0f-bcf3-ffb1-6973-f7cf5835d7ec@gmail.com>
	<CALbNGRQt57sNkjeU6Bk3C1fM2WF-iz5mec_pHTGooX5zYfrszw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 8 Apr 2018 23:33:29 +0200
Message-ID: <CALbNGRSX+RpV2EQLXK-hYmqsi_1TPXurdL6a7VJNzRR3Tzxg8g@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Tom Rini <trini@konsulko.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-openembedded Layers
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
X-List-Received-Date: Sun, 08 Apr 2018 21:33:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 8, 2018 at 11:00 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> On Sun, Apr 8, 2018 at 10:39 PM, akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 03/19/2018 08:59 AM, Tom Rini wrote:
>>> On Sun, Mar 18, 2018 at 02:32:15PM -0700, akuster808 wrote:
>>>> Hello all,
>>>>
>>>> I have been reviewing the meta-openembedded sub-layers and I plan on
>>>> taking the following actions:
>>>>
>>>> Please keep your comments focused on the 3 items below.
>>>>
>>>>
>>>> 1) I plan on resetting the sub-layer maintainers. Several maintainers
>>>> listed have been inactive.
>>>>
>>>> If a currently listed maintainer is interested in continuing, please
>>>> send me an email.  I plan on removing in-active maintainers in 12 days=
 (
>>>> March 30th).
>> Patches going out today.
>>
>>>>
>>>>
>>>> 2) I plan removing meta-filesystem and moving recipes to other layers.
>> Based on Martin's response, I keep meta-filesystem around one more relea=
se.
>>>>
>>>>
>>>> 3)  Meta-gnome, I have heard feed back regarding this layer. Does it
>>>> make sense to remove it and push needed recipes out to  other layers?
>>>>
>>>>
>>>> I want to get any restructuring done prior to sumo release to lessen
>>>> impact on the Sumo maintainer.
>>> I would suggest that for sumo, any layers that do get moved /
>>> re-distributed / whatever, a "dummy" version be kept in place that says
>>> where it moved to (or where recipes were migrated to, or whatever is
>>> appropriate) and then they can be dropped in master.
>>>
>> For meta-gnome I decided to BLACKLIST all remaining recipes with planes
>> to remove them for Thud.  This follows the current blacklist policy.
>>
>> - Armin
>>
> Sorry but this email slipped through for me. Was busy getting sumo
> into shape. BTW: have still not the slightest idea what patches might
> get applied - so I'll stop to send out more.
>
> FWIW
>
> * I want to continue maintaining meta-xfce.
> * I still don't like killing meta-gnome. But go on I'll do my own
> layer for those recipe I take care of. I am tired of people
> complaining instead sending patches. This is kind of consumer
> mentality I wouldn't expect here.
>
Just to make it clear: I am totally disappointed of the way things are
handled here and what the priorities are:

I've invested a lot of time in several layers for sumo to

1. keep recipes up to date
2. remove outdated recipes and helping people depending on them
3. fix bugs
4. ask for when is sumo is going to appear here exactly without
getting an answer

There are ~60 patches pending for me and again: I have no idea what
status they are in or if there is some rebase necessary or if they're
going to get blacklisted.

Forget me as maintainer for something here and go on blacklisting.
While you are at it how about blacklisting meta-xfce?

Over and out

Andreas

