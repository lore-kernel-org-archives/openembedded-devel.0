Received: from [64.18.0.186] (helo=exprod5og108.obsmtp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>) id 1Lenwt-0004mB-8H
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 11:03:49 +0100
Received: from source ([12.71.149.1]) (using TLSv1) by
	exprod5ob108.postini.com ([64.18.4.12]) with SMTP
	ID DSNKSa5Q+wViVPZ/J87i7YSJsNoDYbRY/+kq@postini.com;
	Wed, 04 Mar 2009 01:59:25 PST
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Cinmlip05.e2k.ad.ge.com with ESMTP; 04 Mar 2009 04:59:20 -0500
Received: from ind-3n4b83jh1.amer.consind.ge.com (HELO [192.168.219.128])
	([3.138.54.81])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 04 Mar 2009 04:59:20 -0500
Message-ID: <49AE5117.5020806@gefanuc.com>
Date: Wed, 04 Mar 2009 09:59:51 +0000
From: Martyn Welch <martyn.welch@gefanuc.com>
Organization: GE Fanuc Intelligent Platforms Ltd.
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20090303204954.CCB9CE8008@amethyst.openembedded.net>	<1236119119.10602.62.camel@andromeda>
	<49ADB183.5070709@balister.org>
	<1236120999.10602.70.camel@andromeda>
In-Reply-To: <1236120999.10602.70.camel@andromeda>
Subject: Re: [oe-commits] Koen Kooi : angstrom 2009.X: bump automake-native to 1.10. 2 since some idiot deleted 1.10
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
X-List-Received-Date: Wed, 04 Mar 2009 10:04:27 -0000
X-List-Received-Date: Wed, 04 Mar 2009 10:04:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:
> Am Dienstag, den 03.03.2009, 17:38 -0500 schrieb Philip Balister:
>> Michael 'Mickey' Lauer wrote:
>>> Am Dienstag, den 03.03.2009, 21:49 +0100 schrieb GIT User account:
>>>> Module: openembedded.git
>>>> Branch: org.openembedded.dev
>>>> Commit: eee859a9c348871d6d644ece76bc57b151cc80e8
>>>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=eee859a9c348871d6d644ece76bc57b151cc80e8
>>>>
>>>> Author: Koen Kooi <koen@openembedded.org>
>>>> Date:   Tue Mar  3 21:47:57 2009 +0100
>>>>
>>>> angstrom 2009.X: bump automake-native to 1.10.2 since some idiot deleted 1.10
>>> Ah, are we in that mood again? Take more pills.
>> We need to have a serious discussion about deleting recipes. I know the 
>> deletion of python 2.5 will force me to address the 2.5->2.6 upgrade in 
>> gnuradio before the upstream developers are ready.
>>
>> We need a way to remove recipes, but doing it as part of adding a new 
>> recipe is causing problems for OE users.
> 
> Yes, we need to have a serious discussion about lots of things
> surrounding the OpenEmbedded project, before the popularity kills the
> project. Judging from the amount of interest though, I don't see that
> happening -- neither short term nor long term.
> 

Ok, so if a serious discussion is out of the question, lets just have a normal discussion.

I see this issue to be partially related to the on going discussions regarding submissions. I assume that the "Commit_Policy"[1] on the wiki is either unofficial, out-of-date or optional as it states:

* Changes to core toolchain components need review (gcc, binutils, 
   libtool, pkgconfig, automake, autoconf etc.)

Where:

"Review" is defined as posting it on the mailing lists and getting positive agreement from two or more core developers. 

Now a quick check of my OpenEmbedded mail folder doesn't chuck up any messages with automake in the title that have a patch with this commit. Maybe I'm looking on the wrong mailing list.

Given that the commit policy does seem to be quite a sensible suggestion (it's part of the mechanism that seems to work quit well for the Linux kernel), maybe it needs a little bit of work to qualify it a little (which mailing list for example) and get some more links to it (for example there is no mention of a commit policy in the "adding packages"[2] section of the "Getting started guide".

If nobody objects, I will happily add the link.

Martyn

[1] http://wiki.openembedded.net/index.php/Commit_Policy
[2] http://wiki.openembedded.net/index.php/Getting_started#Adding_Packages

-- 
Martyn Welch MEng MPhil MIET (Principal Software Engineer)   T:+44(0)1327322748
GE Fanuc Intelligent Platforms Ltd,        |Registered in England and Wales
Tove Valley Business Park, Towcester,      |(3828642) at 100 Barbirolli Square,
Northants, NN12 6PF, UK T:+44(0)1327359444 |Manchester,M2 3AB  VAT:GB 729849476


