Received: from [74.125.92.150] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N1Pzo-0006LM-Bk
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 21:40:23 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1271732qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 12:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=dEy1dN1soSX+OcEXFn6nipUvnrr9tAVe7PWQxd/zERc=;
	b=nuA2PR7ipr5n2f7vdLgoKwh5XF7jiIQUV+V3/f+z46DqyRLdVytNnWF7Ttk3babBbc
	zHmdD6+tR7fTkhodnf3FmuzbTDkngzQcpw8h0t+DGpvtaaRaszqrbuLaQJctSzUkgyJX
	5o/4MlhFYEMXCMmo7r6hrw52YU9H/E0AkbDw0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=omyTbQN4u9hpzHiJmRb5Lyl/z8zmuh2DNDeH0bdHxayIFlaUIleCTug/A/ykza2OOH
	mR3wSn+AfjI8ufe3AISTzeiOdaykfkN/x+LEvNzqyboCWzq0SFMlborxf0p7GmZ5L2zU
	gksGSs46a/1NgED/a8hzYejUntfsREj9tkvbw=
MIME-Version: 1.0
Received: by 10.229.40.200 with SMTP id l8mr201667qce.104.1256326758617; Fri, 
	23 Oct 2009 12:39:18 -0700 (PDT)
In-Reply-To: <4AE1B7D6.8070904@epfl.ch>
References: <4AE0BEFA.4020905@mlbassoc.com>
	<19c1b8a90910221735t5c91498ft9a692cd75c442db4@mail.gmail.com>
	<200910230326.13922.holger+oe@freyther.de> <4AE1B7D6.8070904@epfl.ch>
Date: Fri, 23 Oct 2009 12:39:18 -0700
Message-ID: <19c1b8a90910231239w7230fd66h39c5b4ce0beb9428@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.150
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SDK problems
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
X-List-Received-Date: Fri, 23 Oct 2009 19:40:23 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 23, 2009 at 7:04 AM, Valentin Longchamp
<valentin.longchamp@epfl.ch> wrote:
> Holger Hans Peter Freyther wrote:
>>
>> On Friday 23 October 2009 02:35:31 Khem Raj wrote:
>>
>>> One reason could be that its not getting right libc to link with. You
>>> could check <staging>/usr/lib/libc.so
>>> and it should be a text file which points to right libc to link with.
>>> On glibc it was different than in eglibc
>>> eglibc one should work. I do not know about glibc as I do not have
>>> working version of glibc here.
>>
>> Okay,
>>
>> thanks to Khem on irc and pointing me to -Wl,-verbose there is something
>> fishy with the libc_nonshared.a in the SDK. I have no idea what kind of
>> problem but the workaround is to copy libc_nonshared.a from the OE staging
>> to
>>
>> /usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/lib.
>>
>
> Thanks for the workaround, it works for me. Any idea/hint on how to correct
> this ?

As Holger pointed out on IRC it could be becasue static library is
being stripped.
so stop this stripping

>
> Regards
>
> Valentin
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


