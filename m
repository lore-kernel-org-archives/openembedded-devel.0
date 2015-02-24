Return-Path: <otavio.salvador@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id A900371633
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 17:57:50 +0000 (UTC)
Received: by wevk48 with SMTP id k48so26858877wev.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 09:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=myeeObaIeYMp3JhvCilG+YVH8f5syzieMW0IIsQu8Ko=;
	b=mGYymxO1raCCazqWg1ygnym8+zXUlUrlxO0vC3YYu7aZrvlQiivp7OEwZgHkZ7aWFW
	mo/Pky3fC6Av11rZR/1zVbfgQhTdXkDes6kWqzWG2fN2FkIf+kO/mFgdSgzleTD0IdNq
	tqeErPyEzfNvaxWm4F93ebLob1IHqIqERmOhow6n7SIEiht9buqQrxEb4D+ZY2oZGAuf
	Bmjyv555NADo50V2BRjmDOHmiETiaHRbqBkf3ou8tte24FeonxO51Kp6SRRbZqpMvSqu
	C+Q5veG4MrIp97K/5T1y2/ZXGjhXEeBqhp5D264BtMCzHl6BVAT+bGF1NOd5nL+HJhHH
	AD6A==
MIME-Version: 1.0
X-Received: by 10.180.8.10 with SMTP id n10mr31926174wia.79.1424800671156;
	Tue, 24 Feb 2015 09:57:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.27.11.18 with HTTP; Tue, 24 Feb 2015 09:57:51 -0800 (PST)
In-Reply-To: <2039424.onani1CoMk@peggleto-mobl5.ger.corp.intel.com>
References: <F81DC1078564A34BB4DA30CAE03814D127697625@ORSMSX104.amr.corp.intel.com>
	<CAP9ODKpdNS16hMUpiuogNna=YpO-m8LgCD5O87XBKFysKeQH3Q@mail.gmail.com>
	<2039424.onani1CoMk@peggleto-mobl5.ger.corp.intel.com>
Date: Tue, 24 Feb 2015 14:57:51 -0300
X-Google-Sender-Auth: VMH7NC1mAVgwO43AFQOnftuOVOI
Message-ID: <CAP9ODKpz2e5usvJNihsA9Cq9wSzxoP1-oLdULupAvxXnFqd19Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Why no recipe for openjdk-headless?
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
X-List-Received-Date: Tue, 24 Feb 2015 17:57:51 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 24, 2015 at 2:54 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tuesday 24 February 2015 14:06:41 Otavio Salvador wrote:
>> On Tue, Feb 24, 2015 at 4:00 AM, Bruce, Henry <henry.bruce@intel.com> wrote:
>> > I'm putting together an OS image that includes  a Java headless
>> > application. Having used the openjdk7-jre-headless package on Ubuntu I
>> > was hoping to find a matching recipe, but sadly none exist,.  The
>> > openjdk7-jre recipe requires the X11 distro feature which adds
>> > unnecessary luggage for a small footprint IoT solution. Thanks to a
>> > bbappend from https://github.com/woglinde/meta-java/issues/45 I can
>> > minimize footprint, but a headless recipe would be a better solution.
>> > I'm fairly new to Yocto so could someone explain the challenges of a
>> > headless recipe and where one might start when creating one?
>>
>> Patches are welcome. I think the link you posted has a good base of
>> work done so you could start there and later follow the README file to
>> post the patches here.
>
> Perhaps more concretely, this would presumably be a place where you would use
> PACKAGECONFIG to add and remove the appropriate dependencies and also options
> in EXTRA_OECONF. It looks like that bbappend has a mixture of things that are
> and aren't related to building without X. Henry, I'm not sure if you've come
> across PACKAGECONFIG yet but just in case, here is an example from our
> mpeg2dec recipe:
>
> PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 libxext libxv"
>
> (Obviously you'd need to use values appropriate for the openjdk recipe in
> the second line.)

The only drawback I see from the PACKAGECONFIG solution, for this
specific case, is that I can see use cases where one product will use
headless and another use complete Java and this would impose or
machine specific packages or split distros.

However I also think that MOST people will use headless so maybe we
could add the PACKAGECONFIG and default to headless and handle the
exception when it happens...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

