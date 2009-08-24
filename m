Received: from [209.85.218.221] (helo=mail-bw0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1MfWc0-0007Gl-Iv
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 12:17:16 +0200
Received: by bwz21 with SMTP id 21so1234434bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 02:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=ycKdTUdepdFk4wDWCmCTrqBGyTFcuDvztQjkl60QqFk=;
	b=w5B29OJhLAfTYKNcPcg+fU3JslS0JsONHblsg2gkyuV9XRWLJbm7B4JswJrdDyLDmn
	DM/wja4Df600WWeUVqNXxGzpdj745+s9QlrSlNwcYTNrUYBSh/uCvrFtTOEB5bN5rVKl
	Zb/M4nG0e5IohCKQHaGJyhYkJ2g62iPFmDge4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=GPb9mkQwI+VJCE1hd3UpDLzbOzx1wL6Wf+UqFQfmrTSsbQC0cUSH3NXGDbGhA75gIU
	wEPlwrksJ/lr31lQ5j6Oc/Fo73gJ5MG5bHT4s8GEO/kGsgQuMD8TU33TmhhFboOGo7Es
	XoE+AwP6f3wDt7XgbwwF46d1pb0rEkV7j9Wlw=
MIME-Version: 1.0
Received: by 10.103.84.12 with SMTP id m12mr1783024mul.79.1251107971538; Mon, 
	24 Aug 2009 02:59:31 -0700 (PDT)
In-Reply-To: <91283b620908240250i3e35959bn26a29d99047b455d@mail.gmail.com>
References: <91283b620908220300u6770aaebo7aa89b1b1b91e2fd@mail.gmail.com>
	<200908230453.13119.holger+oe@freyther.de>
	<91283b620908240250i3e35959bn26a29d99047b455d@mail.gmail.com>
Date: Mon, 24 Aug 2009 10:59:31 +0100
Message-ID: <91283b620908240259s66c46b9bm3302978c59f7b3cd@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Musicbrainz
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
X-List-Received-Date: Mon, 24 Aug 2009 10:17:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I've fixed it.

I added oe_soinstall and pulled the so file in for compilation.

Cheers,
Stuart

2009/8/24 Stuart Gray <stuart68@gmail.com>

> I have included the full log files for the compilation with my bb file.
>
> I am fairly new to Linux and OE, but from the run_compile log file I
> thought I should be adding an include which points to the libstdc++.so.6.
>
> I have the OE User Manual and I am continually reading through the sections
> to find a solution. I tried to append the TARGET_LDFLAGS, but it was not
> very successful, it looked like it could not find the compiler.
>
> Thanks for any further guidance you can give.
> Stuart
>
> 2009/8/23 Holger Hans Peter Freyther <holger+oe@freyther.de<holger%2Boe@freyther.de>
> >
>
> On Saturday 22 August 2009 12:00:54 Stuart Gray wrote:
>> > hi,
>> >
>> > Has any one successfully compiled libmusicbrainz_3.0.2.
>> >
>> > I have this compiling but it fails at the linking stage as it cannot
>> find
>> > the library libstdc++.so.6.
>> >
>> > I have tried various EXTRA_OEMAKE, OECONF, OECMAKE, but none will add
>> the
>> > option to the linking stage. Can anyone give me some pointers.
>>
>> Hey Stuart,
>>
>> please stop cross-posting. My emails bounce from the gumstix mailinglist
>> and
>> this is not fun...
>>
>> With the limited information I have I would propose to:
>>        - Link with g++ instead of gcc
>>        - Or link to -lsupc++ (e.g. you change ammend the TARGET_LDFLAGS)
>>
>> z.
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>

