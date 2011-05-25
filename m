Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QPEl7-00051F-5p
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 16:08:25 +0200
Received: by fxm19 with SMTP id 19so6130331fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2011 07:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=krRL2q3w/OijNwX9m8HVQBdAvgnQU3lzUwX+JZdorYY=;
	b=rySc+yQfPixulQzPcQ9CbNZVLVyxpTEEiOX5CsV7X4Q0JzbjZQskYUl+uCjTWiTdIz
	B++F4JQl+1bFbJ0QS+BHq/XaN7wAB6LqfXy+gtpCMH1TdXY/x4jkIo+2rPOmrrkhOlLC
	O9I5T5g8UozrbNzioZQVfkLzgpEnojtT0YruQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ZguPNWAMaihBCDCcjyjSW9vJgIkv5arVc5iRHn/7RSsZIlZUPrZFTUpsJaUKB+2PWD
	ME3cpbTjVZRSIsRAFmMxDRMxswZa9eHymw/OwPwA4LDLy3pl7ZimpivPLLa4C4H/mGEM
	aNZWn7uxMUcOhDfdb2vqeKKE15QXOZawkO+Ow=
MIME-Version: 1.0
Received: by 10.223.25.152 with SMTP id z24mr5261126fab.133.1306332322788;
	Wed, 25 May 2011 07:05:22 -0700 (PDT)
Received: by 10.223.93.206 with HTTP; Wed, 25 May 2011 07:05:22 -0700 (PDT)
In-Reply-To: <iri8ce$acf$1@dough.gmane.org>
References: <AEF4F94AE6BD724F91B503AC1AFED2392C5E8391CF@STOEXMBXC03.domain01.net>
	<iri8ce$acf$1@dough.gmane.org>
Date: Wed, 25 May 2011 16:05:22 +0200
Message-ID: <BANLkTinKOubx9XLKn-0fbW796egGL+rTZw@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: kbd and console-tools collision when using systemd
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
X-List-Received-Date: Wed, 25 May 2011 14:08:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 25, 2011 at 08:42, Koen Kooi <koen@dominion.thruhere.net> wrote:
> On 25-05-11 08:00, Anders Darander wrote:
>> We have recently switched our local distro to use systemd for the
>> init-process. This works fine for our HW-target (apart from some
>> non-optimal configuration, but that is something we're looking into).
>> Our HW-target is based on the at91sam9g20.
>
> That's good to hear!

Yep, although we still have some configurations left in order to get a
clean boot, systemd seems to be really nice. We just have to relearn
how to create a good init-sequence.

>> Local distro uses task-boot.bb Qemu -> keymps -> RDEPENDS
>> console-tools Systemd -> RRECOMMENDS kbd
>>
>> This leads to lots of clashes with e.g. usr/bin/dumpkeys,
>> usr/bin/unicode_stop etc. Currently we have solved this by using a
>> local copy of task-boot.bb in one of our layers, which lets the
>> machine feature keyboard include kbd-keymaps instead of keymaps.

> You can work on this problem on two fronts:
>
> 1) disable the vconsole service in systemd

I have to admit that I'll have to look further into this. Though, I'd
guess that the vconsole service might be usefull on the qemu-target...

> 2) switch task-boot to kbd

Yes, this is the solution we're currently using. (Using a local copy
of task-boot.bb).

> Option 1) is avoiding the real problem, but it's nice to have anyway,
> since "most" of the OE platforms work well enough with fbcon to not need
> fancy keymaps and fonts.

Hm, maybe we could disable the vconsole-service anyway... I haven't
really looked into that part yet. Doing that we might very well be
able to get rid of the RRECOMMEND on kbd... Well, I'm just guessing
here. kbd should be pretty useless on the real HW-target, so this
might actually be a better long-term solution in _this_ product.

> I briefly looked at kbd vs console-tools during systemd bringup and it
> seems that kbd is the best long term answer.

That should definitely be the best long-term solution for a general system.

I wonder what the size differences between kbd, kbd-keymaps etc. vs.
console-tools and keymaps would be. It might be worthwhile to check,
if the kbd based solution isn't much larger, it might be possible to
change the default in task-boot.bb. At least on a long term. (Also
remembering that quite a few desktop distros has switched to kbd).

> Systemd v28 will also drop the dependency on hwclock, so your system can
> be even smaller :)

Ah, that's good to know!

Regards,
Anders


