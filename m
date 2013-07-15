Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 243FE619DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2013 16:40:03 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id f4so15832267oah.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2013 09:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=e6fY7GM74QAB600LrZ5S6A7wEPijRR72gAH/qM5mdns=;
	b=IPLgPNlw42YOIJf21LyOnWMl9ryNS35E8cnm0RtahjUbloCDTF+Ck6NY8rr6DqUXc2
	Ykhba+nZvsFFNc2CT6hQchP3MD/+M/LzRL7dKqMmi3CTYchfSJw5lh35vD/Q7qgNhMcV
	7hnB0267DdVphDx6CHnE5xJKEdZ2ukTCrFexmmxp4f43MLYVoCR2NHH7eLhBJCuBMyNd
	wMnl7CygPwyx34S7n53tOTVqHB+HvNhEaOeerVyg1PTiAAgOFspJyXtQAXG5QxSMfWB8
	XJoyZ5JZrbI26bKlxdac4fvG4qmkI5vCfmFYEV46cui1XWW97pbDmJtewzMo3eBsy9T7
	dz3w==
MIME-Version: 1.0
X-Received: by 10.182.165.133 with SMTP id yy5mr44437836obb.89.1373906403358; 
	Mon, 15 Jul 2013 09:40:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Mon, 15 Jul 2013 09:40:03 -0700 (PDT)
In-Reply-To: <5498122.1xgS5ZiCM9@helios>
References: <cover.1373726565.git.paul.eggleton@linux.intel.com>
	<20130715123759.GB3842@windriver.com>
	<CAP9ODKp3=Lf7C710t8AeC+o9jA46oQFEokUiHuSW+L4W-uJFJA@mail.gmail.com>
	<5498122.1xgS5ZiCM9@helios>
Date: Mon, 15 Jul 2013 13:40:03 -0300
X-Google-Sender-Auth: rEpoURSJ8NcKwLM6eltzQJvrl6g
Message-ID: <CAP9ODKqjG_Nj-mthddkf38--f79T=VhZjt9k0oPZwUJc187wTg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/3] Add mosh and dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jul 2013 16:40:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 15, 2013 at 12:36 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 15 July 2013 12:02:59 Otavio Salvador wrote:
>> On Mon, Jul 15, 2013 at 9:37 AM, Joe MacDonald
>>
>> <Joe.MacDonald@windriver.com> wrote:
>> > [[oe] [meta-oe][PATCH 0/3] Add mosh and dependencies] On 13.07.13 (Sat
> 15:47) Paul Eggleton wrote:
>> >> Add a recipe for mosh, and for dependencies migrate libio-pty-perl from
>> >> OE-Classic and bring in protobuf from meta-virtualization.
>> >>
>> >> I considered putting this in meta-networking, however meta-virtualization
>> >> will still need protobuf and it already depends on meta-oe, and
>> >> officially meta-networking does not depend on meta-oe so splitting these
>> >> would not really work with the current layer dependencies.
>> >
>> > That's not strictly true anymore, actually.  It was my intent and I
>> > think there's value in it, but CRDA (already in meta-networking) depends
>> > on python-m2crypto (in meta-oe).  I discovered it in my world build a
>> > few weeks ago and hadn't yet managed to get round to seeing if there was
>> > a clean way to separate the two.
>> >
>> > I absolutely don't want the stated intent that meta-networking be
>> > standalone be a barrier to adding packages to it that clearly belong to
>> > it.
>> >
>> > That's my way of saying I've no objection right now to including this in
>> > meta-net.
>>
>> I agree; maybe we could add those inside meta-oe subdir? so people can
>> opt in enable them or not.
>
> Sorry Otavio, what are you suggesting exactly?

To have a meta-networking/meta-oe with recipes which requires it.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

