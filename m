Received: from mail-iw0-f202.google.com ([209.85.223.202])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NVg2h-0003Ss-4W
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 07:52:26 +0100
Received: by iwn40 with SMTP id 40so351548iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 22:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=mU0AqI0et6jxiLgFMOnpomcc9xGZkKG6AfiQbQD1uxc=;
	b=nKHHt7a22HNnuBAFFNy3MzE56Zh/NFm/PthVEtYEQwaMAcgIePFzmKcHHtGCBWcLo7
	Tqt98UWrUFCkBQv87F2ODS1HZIm7sM1Kk82GN9AYL7IV0yZEDBrKrMM7wa21vd+w6Cmx
	qlmB/zWFQ0patYuq0L5GKoTmGHWS8rXZ8lj6g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Sjrp9I7jCjgCnIe45J2EeOVZ6+4a4bJD2LK2IJTaNOy/6ZlU3JQXCWUucB91N0B7a4
	NZt6f2xp/7BPMpCBkXXYH0cfKjaB1op5uZXKsAa7c1LZXTnrL6e4E7Xem6SUU/D5iAy1
	rKgN+ah70Sz52G16HrYMvScon/3eDlfW+RgMg=
MIME-Version: 1.0
Received: by 10.231.153.213 with SMTP id l21mr609677ibw.24.1263538210892; Thu, 
	14 Jan 2010 22:50:10 -0800 (PST)
In-Reply-To: <359399015.1263503103.164409104.44434@mcgi35.rambler.ru>
References: <318819580.1263399029.155991028.16785@mcgi25.rambler.ru>
	<4B4EDCED.6000107@gefanuc.com> <4B4EE2DA.5080106@rambler.ru>
	<4B4EE7B5.3040206@gefanuc.com> <20100114202541.GD3529@gmail.com>
	<359399015.1263503103.164409104.44434@mcgi35.rambler.ru>
Date: Thu, 14 Jan 2010 22:50:10 -0800
Message-ID: <19c1b8a91001142250x36e06d46nc00a1ab10bafecb7@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.202
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Adding a new Machine question
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
X-List-Received-Date: Fri, 15 Jan 2010 06:52:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 14, 2010 at 1:05 PM, Perepelica Alexander
<alexondi@rambler.ru> wrote:
> After some conf changes I get unknown device sda - but I look at kernel
> config seems all is ok

try one of /dev/hda or dev/sda1 or /dev/hda1

>
> * Khem Raj <raj.khem@gmail.com> [Thu, 14 Jan 2010 12:25:41 -0800]:
>>
>> On (14/01/10 09:45), Martyn Welch wrote:
>> > Perepelica Alexander wrote:
>> > > When I try boot image in qemu I see
>> > > booting kernel ... and nothing.
>> > >
>>
>> Did you set the console properly. i.e. -append "console=ttyS0" on qemu
>> invocation ?
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
>
> --
> Thank you.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


