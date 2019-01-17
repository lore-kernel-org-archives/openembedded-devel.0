Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id C963E79CCB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 20:18:36 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id E614F5C0187;
	Thu, 17 Jan 2019 21:18:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1547756316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=3E5uzgxBgOneD26OLYcF22+YSpALRQ87e6wWbfA8SSQ=;
	b=N6l2zpXx/MNfNJBWu/EbHFdbADP7OvRgIa6TfNOV5O7x5amzoAY+KPmJfnQS0Qxme/ggaI
	GIfRa+80ODJJ0Pl/JCyz5ZBqskT9MIQgL6Gu7isXV8RYG61JRKbXezaq0ycRkld8Hlp9gI
	KJYaHb7hz4NWy/c0vwtA3oJzCj9RCvA=
MIME-Version: 1.0
Date: Thu, 17 Jan 2019 21:18:36 +0100
From: Stefan Agner <stefan@agner.ch>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
In-Reply-To: <CALbNGRQ=wGD6j3zH7y1P4JDFzQ9jOShsbBV2rpTaC_CNPA3Mig@mail.gmail.com>
References: <20190117162629.47677-1-stefan@agner.ch>
	<20190117162629.47677-2-stefan@agner.ch>
	<CALbNGRTMjFogycr0vsaLDxLeQi-ZVvHb6bu2pm9QebwaWdH3bw@mail.gmail.com>
	<8079727a69d7f33cc1936930d52fb55d@agner.ch>
	<CALbNGRQ=wGD6j3zH7y1P4JDFzQ9jOShsbBV2rpTaC_CNPA3Mig@mail.gmail.com>
Message-ID: <a9f13d522deacb543eb9426f228e716f@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.7
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/5] networkmanager: introduce polkit package config
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
X-List-Received-Date: Thu, 17 Jan 2019 20:18:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.01.2019 21:01, Andreas Müller wrote:
> On Thu, Jan 17, 2019 at 8:09 PM Stefan Agner <stefan@agner.ch> wrote:
>>
>> On 17.01.2019 18:50, Andreas Müller wrote:
>> > On Thu, Jan 17, 2019 at 5:27 PM Stefan Agner <stefan@agner.ch> wrote:
>> > Hi Stefan,
>> >
>> > sorry but don't like this patch as is:
>> >>
>> >> From: Stefan Agner <stefan.agner@toradex.com>
>> >>
>> >> Currently polkit is enabled if systemd is in package config. Those
>> >> two things are orthogonal: NetworkManager can be used with systemd
>> >> and without polkit just fine.
>> > Did you test this (=change networkmanager connections settings) as an
>> > unpriviledged user?
>>
>> Works as expected: need to be root to change connection settings :-)
>>
>> We plan to use D-Bus and D-Bus policies (<policy> tags) to allow some
>> settings to unpriviledged users/groups.
>>
>> >>
>> >> Introduce a new polkit package config and enable it depending on
>> >> whether polkit is in DISTRO_FEATURES.
>> >
>> > * it changes the current behaviour and the default suggested by
>> > configure.ac: 'we usually compile with polkit support.' and
>> > meson.build sets polkit by default.
>>
>> Yes, this changes default behavior. I did not do that lightly, but I
>> think it is sensible to have a global policy on polkit, and also let
>> NetworkManager follow it. I guess the change in default behavior needs
>> to be pointed out in the documentation e.g. in the chapter "Moving to
>> the Yocto Project 2.7 Release".
>>
>> Throughout OpenEmbedded we had vastly different behavior wrt polkit.
>> ConnMan disables it by default without any option to enable it. Quite
>> some packages make it dependent on systemd, some have just a local
>> package config polkit etc...
>>
>> We have a WiFi capable headless device with restricted flash and would
>> like to use NetworkManager. Using polkit pulls in mozjs, which is rather
>> large. We do not need interactive authentication capabilities, since our
>> device does not allow direct user interaction...
>>
>>
>> > * as far as I know there is no polkit DISTRO_FEATURE in metaverse yet.
>>
>> Hm, yes, we definitely should add polkit. How can I do this?
>>
>> >
>> > I suggest to add polkit PACKAGECONFIG if systemd is in DISTRO_FEATURES
>> > - if you don't want polkit you can add a PACKAGECONFIG_remove =
>> > "polkit" somewhere.
>>
>> Yes, I know that. We had this in place so far.
>>
>> However, rather than having a bunch of PACKAGECONFIG, I'd rather have a
>> distro wide policy on polkit. I did send an email to oe-core with a
>> cover letter, and since that patch got merged, I was assuming that
>> polkit as a distro policy is the way to go.
>> http://lists.openembedded.org/pipermail/openembedded-core/2019-January/278021.html
>>
> Ahh - I see am too late in the game - decision was already made - go
> on and forget my last email.

Probably should have sent out this patch set changing meta-oe stuff at
the same time to get the broader overview, sorry about that.

NetworkManager is really the most drastic change here, since this is a
prominent package where the change changes the current default. So if
you have any suggestion to ease the transition, I am happy to look into
it.

--
Stefan

