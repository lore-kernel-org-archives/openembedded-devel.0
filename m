Received: from mail-vb0-f44.google.com ([209.85.212.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U8ReZ-0003Eg-Up
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2013 09:37:24 +0100
Received: by mail-vb0-f44.google.com with SMTP id fr13so5687320vbb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2013 00:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=gjzE9xmExIw+y/hb97Mn0RU5ZGlqlgHCRbVmRQeQlzE=;
	b=oJbfUrHHnDEyYarwqHBUZyoGAqZw5TtXjfkvpWhjDDPFpyvQ1Gs3itvxNj0l539GIo
	trh3VWXk/AKzDyICfkvP/C4jsEwKwg535uyoBMtf+vcAFTLrOjUzdfOCTX3i7eKNhBwU
	jeNFJw7PeN8ZtQurxGpvs4kMOmxTE9O7WXssB1wfH9RZvMaIAK1GvHGuzBwrT91YIpFV
	R9q+7eocDFt+TIYOr5y8NnsJ3+4bRa50jVBlkZ38RZWrvDBryhIq9J95d/GLiSpw4fL5
	wZqP7lFZRu5f4EkoH/DiDl+Z8hhEu6fOK1gYn3FNiPeluksOceiJnuxlrKUD258jZPB/
	itYA==
MIME-Version: 1.0
X-Received: by 10.52.28.101 with SMTP id a5mr26100436vdh.92.1361434867688;
	Thu, 21 Feb 2013 00:21:07 -0800 (PST)
Received: by 10.52.185.168 with HTTP; Thu, 21 Feb 2013 00:21:07 -0800 (PST)
In-Reply-To: <20130220231002.GW3300@jama>
References: <1359152782-23743-1-git-send-email-schnitzeltony@googlemail.com>
	<1359152782-23743-5-git-send-email-schnitzeltony@googlemail.com>
	<20130126115141.GH16904@jama.palm1.palmone.com>
	<CALbNGRQepRvg6+EVXzuSZA4a+JTuknBEHm=PJ0L=0a0hGpoX7w@mail.gmail.com>
	<20130219082744.GT3300@jama>
	<CALbNGRSwt6Sa_hui48k+iMJu4PaespyXcO3kEW4hCgsDL5iP8w@mail.gmail.com>
	<20130219174527.GU3300@jama>
	<CALbNGRRcTwiPWsi6KUoxB6RnpJkh=TjAD8FadX+LP+So1u7KPA@mail.gmail.com>
	<20130220231002.GW3300@jama>
Date: Thu, 21 Feb 2013 09:21:07 +0100
Message-ID: <CALbNGRSjZA1TuoGuH4upLMmibiydKnGt6AQzJfWCqmbNMJnTZg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/meta-systemd/V2 4/5] geany: initial add 1.22
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2013 08:37:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 21, 2013 at 12:10 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Wed, Feb 20, 2013 at 07:00:58PM +0100, Andreas M=C3=BCller wrote:
>> On Tue, Feb 19, 2013 at 6:45 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> >> > Any news on it?
>> >> >
>> >> > --
>> >> No - I tried to reproduce without success and then decided to come
>> >> back later. Suggestion: Let me know if it fails again in world - then
>> >> we can think about removing it again.
>> >
>> > Yes it does, here is log from last build
>> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.worl=
d.20130219_043012.log/
>> >
>> I think I found the culprit. As soon as I can build something which is
>> close to current master (at the moment I cannot even parse) I'll send
>> out a patch.
>
> True, should I merge khem's patch for PN-systemd -> PN and then revert
> it later if discussion on oe-core ML ends with decision to revive
> PN-system again?
>
> I'm using that patch to test patches for master on jenkins world build.
>
> --
I would wait with this patch till discussion is over. But I am afraid
Boss Ross doesn't even want to start it [1] :). Have private 'release'
which is working fine from times where last oe-core / systemd.bbclass
was not in.

Regarding geany: I will prepare a patch in my environment. If it works
for world we can close this one.

Andreas

[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2013-January/035=
105.html


