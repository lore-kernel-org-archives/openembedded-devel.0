Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7E97A6E5E9
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 21:00:10 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 71-v6so5764325oie.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2018 14:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CzqU8xH8Yd1mTkn3oGCW3XJcJ1hchMPu5N0mb4MSbK8=;
	b=Z4t2TR/zbv8AL9byf4oM8OEIxI93ZIW5mpDxGxaZf7l2z/rj+1bihJDgLPDxM+UqTM
	BPEQISYHs78wJEwkHQ1S9XhIhnpgEv9IFjHFpjUy46TRCUxuf/8VoIbGpFJo6V0Nzou0
	x/LOVkjlcxIg7JrOHa63pVQBjwB6vyEyV6dU0zMbAhRm/5lq0Zhq33g5IsPm4FyukACx
	y0+nUy/Tjf6SOYY0zvxEp5kvjI3uU6CjTlp2NZfhPLbc5ghpaiOdBvS1Eyo4mFiAAFx7
	hTfu7dMB4qGQiB4pIObGtjjVWomUcgl/i8p6CUHm2Gx22CJnmGUHSF5asjmHCqCLpWne
	hXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CzqU8xH8Yd1mTkn3oGCW3XJcJ1hchMPu5N0mb4MSbK8=;
	b=USm0bjzltdb9mvJ4siqLF7ylQkL7rcyfSmQalJwDBlCauh9lOlT6wC2HiJGZaVRxeu
	x826vnmtFBq0szxm3q11PrmMdm2lO0MPkPMAuWs0KI/yZy+6+xsxcme8I6M6makIXDLU
	OSjLbYfrUVgtEHgnLHFIAWE10pfHbVaUzIlELySS3pjlryfgHVpblvrg71pnrEbcrV2Q
	uvo1pYHxCXEA6xXf9mmeOhKxI2qMAgd2J7QqUIETMl4FQuOeMymiuZslm2cxlDLiU9l8
	DhbJGaS6o564j16Iz6+JgVDRCdz+WYAJL1Emtn8bkEwYhhOsWImo0ZOPiz0sOW/PTiza
	3bBA==
X-Gm-Message-State: ALQs6tAgqWOYLF/v616qKqgH/N2B4OXLEb+UhhhaKkimxsmIGfY5nF9D
	Q4t8hqBSQd8me7sgVX6/Vs4rTkHTqv5soJCEFrA=
X-Google-Smtp-Source: AIpwx48ah0v/vJeHxJ3jtOm2CBHgJd7MB1xYNkyrW4J4qEhQfwE/0Y6oSF9vlkahL0LjogWLwTZqfxOf7E93mcL2tOc=
X-Received: by 2002:aca:afc7:: with SMTP id
	y190-v6mr21292427oie.285.1523221211131; 
	Sun, 08 Apr 2018 14:00:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Sun, 8 Apr 2018 14:00:10 -0700 (PDT)
In-Reply-To: <7699bd0f-bcf3-ffb1-6973-f7cf5835d7ec@gmail.com>
References: <48f2945a-e330-4bc8-a4da-ab970b63ea5f@gmail.com>
	<20180319155951.GW4418@bill-the-cat.ec.rr.com>
	<7699bd0f-bcf3-ffb1-6973-f7cf5835d7ec@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 8 Apr 2018 23:00:10 +0200
Message-ID: <CALbNGRQt57sNkjeU6Bk3C1fM2WF-iz5mec_pHTGooX5zYfrszw@mail.gmail.com>
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
X-List-Received-Date: Sun, 08 Apr 2018 21:00:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 8, 2018 at 10:39 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 03/19/2018 08:59 AM, Tom Rini wrote:
>> On Sun, Mar 18, 2018 at 02:32:15PM -0700, akuster808 wrote:
>>> Hello all,
>>>
>>> I have been reviewing the meta-openembedded sub-layers and I plan on
>>> taking the following actions:
>>>
>>> Please keep your comments focused on the 3 items below.
>>>
>>>
>>> 1) I plan on resetting the sub-layer maintainers. Several maintainers
>>> listed have been inactive.
>>>
>>> If a currently listed maintainer is interested in continuing, please
>>> send me an email.  I plan on removing in-active maintainers in 12 days (
>>> March 30th).
> Patches going out today.
>
>>>
>>>
>>> 2) I plan removing meta-filesystem and moving recipes to other layers.
> Based on Martin's response, I keep meta-filesystem around one more release.
>>>
>>>
>>> 3)  Meta-gnome, I have heard feed back regarding this layer. Does it
>>> make sense to remove it and push needed recipes out to  other layers?
>>>
>>>
>>> I want to get any restructuring done prior to sumo release to lessen
>>> impact on the Sumo maintainer.
>> I would suggest that for sumo, any layers that do get moved /
>> re-distributed / whatever, a "dummy" version be kept in place that says
>> where it moved to (or where recipes were migrated to, or whatever is
>> appropriate) and then they can be dropped in master.
>>
> For meta-gnome I decided to BLACKLIST all remaining recipes with planes
> to remove them for Thud.  This follows the current blacklist policy.
>
> - Armin
>
Sorry but this email slipped through for me. Was busy getting sumo
into shape. BTW: have still not the slightest idea what patches might
get applied - so I'll stop to send out more.

FWIW

* I want to continue maintaining meta-xfce.
* I still don't like killing meta-gnome. But go on I'll do my own
layer for those recipe I take care of. I am tired of people
complaining instead sending patches. This is kind of consumer
mentality I wouldn't expect here.

Andreas

