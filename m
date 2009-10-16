Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MytpB-0005GO-E6
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Oct 2009 22:55:00 +0200
Received: by qw-out-1920.google.com with SMTP id 4so649541qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2009 13:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1RAE3Tz3Zk9hJV7Y00ov2iB33wvS6l1r85WWPg5KQtc=;
	b=HvWhiqqEeym1UNAvd3VTp66fxntsZv0w19w6411xk9qzcBHy4INUBDtzvIkvJV61t4
	zY4YJ/jicHaPsTWddlKlgzfBu/+OpjIqiqeFZAXYpMuGZjM5y2zFHt3e7qJ+lgSGz8ET
	QlXNm9otoef0er08qitifrLT3ynRe+NZnwRg4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=N7mr9MyfNNAxUSrLfTPoNHmknLZsxWerboGBwCtUSYEtPv/9Viz10FWnqF9gBQqIo7
	6VQMYz15dWwo92MxE0UuLMeCofCwwDWS3Xw2PAa70IerAdjnaiTyaO6g3okTOh/+riFG
	JgZruBZx6aF4LGBnSonE+0Ev8kF22M3q2rJHo=
MIME-Version: 1.0
Received: by 10.229.40.200 with SMTP id l8mr306883qce.104.1255726441718; Fri, 
	16 Oct 2009 13:54:01 -0700 (PDT)
In-Reply-To: <4AD8888E.2080108@dresearch.de>
References: <4AD59AF2.50003@dresearch.de> <4AD8531B.6070208@dresearch.de>
	<4AD87CF8.8040706@dresearch.de>
	<1255704318.28050.19.camel@mill.internal.reciva.com>
	<4AD8888E.2080108@dresearch.de>
Date: Fri, 16 Oct 2009 13:54:01 -0700
Message-ID: <19c1b8a90910161354h7540f865m6d04f29902d3dcfb@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.149
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: glibc_2.9 compile failed for armv5te
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
X-List-Received-Date: Fri, 16 Oct 2009 20:55:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2009 at 7:51 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> Phil Blundell wrote:
>> Putting it in glibc.inc definitely seems like a bad idea unless there is
>> evidence to suggest that all versions of glibc have this problem.
>> Nobody else has reported it previously, so I am guessing that either it
>> is specific to 2.9 or it is in some way unique to your system.
>
> I totally agree.
>
>> Assuming that it is a general problem with 2.9 then a better solution
>> would obviously be to find and fix the dependency problem. =C2=A0Here's =
a
>> rough guide as to how to attack that:
>>
>> 1. Find the compile command that corresponds to the failing file
>> (setjmp.os or whatever it was). =C2=A0Modify the command to replace -c w=
ith
>> -E and remove the "-o ..." option, then run it by hand. =C2=A0This will
>> output the preprocessed source to standard output.
>>
>> 2. Inspect the preprocessed source to find out which symbol is not being
>> correctly defined.
>>
>> 3. Run a build without -j (so that it works) and then use grep to
>> establish which header file is meant to define the symbol in question.
>
> As you can see from the mails before the problem does not occur in the
> same file each time. I've made some clean(!) builds and have seen at
> least five different fails. =C2=A0:(

it could also be some weirdness in the assembler. You could try using
different version of binutils-cross

>
> Steffen
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


