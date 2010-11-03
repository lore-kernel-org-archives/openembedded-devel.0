Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zach.frey@gmail.com>) id 1PDSVr-000133-Du
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 02:52:22 +0100
Received: by wya21 with SMTP id 21so120092wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 18:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=E/XjWHMZp2+d2aVnnV9JQNmcz2pwVJV8MoyU1GLcs8M=;
	b=fLiE3uEnVqBmFptafN9xRjQIZPmRav7oBVJOGreqo7yewpuuzQe1voSTBdLgaTyVqk
	X8BtQiMCHqF2PZERk89yJRIjqn87i8RJMF0tqd2kzML6w1h6QPqKIePIME7O9qZB0Xwa
	D96woPbjxDzhZ5vAbDRyW0ygEFvVlj/2bxCfI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=EirC7ON4Yxh+JRSrJ1HXZCBbLYJdjFnw7H4EjCWFVvaUUUsbHmLgnc4++LBoAXtDaA
	y0P1taToEXhuZweyNymB88ZXtsKDj5/VxahqqNM4gQdUhFgEFBWKSk8icW0RftkO7x8M
	OdVdiaumvvShoiSxEre+le2IBm5R5nfdQJbdk=
MIME-Version: 1.0
Received: by 10.227.142.84 with SMTP id p20mr17766299wbu.182.1288749051700;
	Tue, 02 Nov 2010 18:50:51 -0700 (PDT)
Sender: zach.frey@gmail.com
Received: by 10.216.37.5 with HTTP; Tue, 2 Nov 2010 18:50:51 -0700 (PDT)
In-Reply-To: <AANLkTikr3k3+5fJhX9MfKF2DhSbEXn8Pa9SF0QZ6nCZ7@mail.gmail.com>
References: <AANLkTi=gi8pk_McpA58rvcOHdq-0Xpz+NyF2doWPO00B@mail.gmail.com>
	<AANLkTinCa9E0F3FOm6TXg6NLc48pSgmijeUfqgmhtRuw@mail.gmail.com>
	<AANLkTimE05gQ2pSmkYouZMW1=rAg=-5S_sGu0nTgjpzh@mail.gmail.com>
	<20101101194703.GA12018@gmail.com>
	<AANLkTi=TyPX5L5oUHYehsuvqr9FGSCaD_nj1Z8+P=8F_@mail.gmail.com>
	<20101101195748.GB12018@gmail.com>
	<AANLkTikr3k3+5fJhX9MfKF2DhSbEXn8Pa9SF0QZ6nCZ7@mail.gmail.com>
Date: Tue, 2 Nov 2010 21:50:51 -0400
X-Google-Sender-Auth: avQIjpYBroNfrAOMd8myc-W6hAg
Message-ID: <AANLkTimOLodSjV8+saSi1td==O7TgX1iqzJeQ=NT5mgB@mail.gmail.com>
From: Zach Frey <zach@znfrey.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: zach.frey@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Trouble compiling system-tools-backends
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
X-List-Received-Date: Wed, 03 Nov 2010 01:52:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 2, 2010 at 10:21 AM, Zach Frey <zach@znfrey.com> wrote:

>
>
> On Mon, Nov 1, 2010 at 3:57 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On (01/11/10 15:54), Zach Frey wrote:
>> > On Mon, Nov 1, 2010 at 3:47 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > >
>> > > Well it built fine for me on minimal distro with libtool 2.4 and
>> > > machine=efikamx
>> > > you could try using angstrom-2010 and see if that helps as it also
>> uses
>> > > libtool 2.4
>> > >
>> >
>> > OK, thanks -- I'll report if angstrom-2010 works for me or not.
>> >
>> >
>> > > other guess ...there could be build host difference as I am using
>> ubuntu
>> > > 10.10
>> > >
>> >
>> > Is Ubuntu 8.04 "supported", or is it old enough that I ought to expect
>> > problems?
>>
>> I think till the new LTS 10.04 release it was used by quite a few people
>> but now few of them might have switched to 10.04 LTS but it should
>> certainly be usable as build host IMO
>>
>>
> Thanks.  I do get the same results using angstrom-2010.
>
>
A question -- is the build supposed to be using the build host's automake,
or is it supposed to be using one from its downloaded toolchain?


Thanks,
Zach

