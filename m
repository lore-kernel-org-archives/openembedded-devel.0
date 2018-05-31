Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id B1CD260602
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 10:43:43 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id i5-v6so24776922otf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 03:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mh5YdhEgZADhCbY/bpRm4TKfYfy9R5Wu5tdPyKNUzSY=;
	b=pXSAnr3CpL+OULBBVcVd/1M5FMYuoTz3yz8MKUa3rw/DgTYWguiX/n++hmogvn9XVH
	pkzcF/VIErM5okOIitzaYUurLcqeMgop4jpwCLX6e1zAVsQ5Ev27EOLXTMP9N6ts58zA
	5LSUL8ZUSnoPP4D5YtAI9po0vFRn27jw8UX4TjK0BiKCz+9tLFIWTTef9DpmMUS+bVaX
	pkRKFvLsTroTJpeqaoHg9MpqBFt/lOeqQFAJKkhqlP6CzpcgwQOlqrzMisFzB2p0KlCi
	gMOlgHrZmNK5Wrane95JEZc0GDvyffEoQb8GSeAXbW7/ogmH/57CI276dEItuxuq5TfV
	VsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mh5YdhEgZADhCbY/bpRm4TKfYfy9R5Wu5tdPyKNUzSY=;
	b=Qqtm5Nk+zTehGMlTXyK+5beTTEInCcwRsQGMLq3NF1hHkXbV+sznfCwjBxW5hwduoz
	/P+9oQZ8Zha62KFAIQSC0/1Xi+3ruK2/6qfVUtMWJnCJ/1JIedj9UGJ0sviZluuIEnkb
	xH8VTe+ac+pV7YhP9bye9mWp0XZoj6vjCBTohHygT8ozdjQwW1sBEaW0YIQ8roRqgBNw
	aI1q6U/zGHPAuy3zvN8QCn75UOTGEJaIOZJ6VovVAob0EdIiYbwN9ty0QiUkKOaduYMo
	kdjG3ZRVtykUDg1ogSXYosJH7KqSLRRgVi5n+57b0P/dNHOQIhbnTcqi84bFHHY+LxOc
	Fwqg==
X-Gm-Message-State: ALKqPwcKOHEVKkzJc7berag6xv61eb+P8f1XpOXl1mHikWxtfkQRYnJc
	J7s9Li/W/11JVn4CjgAGPMC8B5J7kskxJEvdRz8=
X-Google-Smtp-Source: ADUXVKK0x4g01NFAWczH71bnaMRFvJNaAvhpig5LPAELjqFDSZO6ScLqzzlczUWGbv7WbvxgO/YUZpfDo22yogUeNp0=
X-Received: by 2002:a9d:3df4:: with SMTP id
	l107-v6mr3987818otc.73.1527763424256; 
	Thu, 31 May 2018 03:43:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:490b:0:0:0:0:0 with HTTP; Thu, 31 May 2018 03:43:43
	-0700 (PDT)
In-Reply-To: <ce457d1a5cd7cc0bbebc6db4afa18011df24e6e7.camel@andred.net>
References: <CALbNGRTZOo_EaPNuQWB0iV-OVUy-uwKgt-PGwBz3O=ROqMZBxQ@mail.gmail.com>
	<ce457d1a5cd7cc0bbebc6db4afa18011df24e6e7.camel@andred.net>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 31 May 2018 12:43:43 +0200
Message-ID: <CALbNGRTU=A9Ekgaa=yySMx-h3j2RmrFRrV6LxbtLFmHEwWxC=Q@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Avoid version going backwards for beta versions
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
X-List-Received-Date: Thu, 31 May 2018 10:43:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 31, 2018 at 12:28 PM, Andr=C3=A9 Draszik <git@andred.net> wrote=
:
> Hi,
>
> On Thu, 2018-05-31 at 01:32 +0200, Andreas M=C3=BCller wrote:
>> Hi,
>>
>> There was a pre-release for fluidsynth-2.0.0.beta and I expect the
>> release will be fluidsynth-2.0.0. How would I name the beta recipe to
>> avoid version going backwards with 2.0.0?
>>
>> I know there was a thread where Martin gave hints how to achieve but I
>> can't find it - sigh.
>>
>> Please help a forgetful old man :)
>
> What I tend to do is something like:
>
> fluidsynth-1.99+2.0.0.beta
^ I think this is what I was looking for.
>
> In debian based distros, the tilde will always cause sorting to be lower
> than the version specified before the tilde, so e.g.
>
> fluidsynth-2.0.0~beta.1
>
> works as expected, and I *think* this latter approach works in OE, too.
Will try.

Thanks

Andreas

