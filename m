Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 233AC601DF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2015 06:08:52 +0000 (UTC)
Received: by iebgx4 with SMTP id gx4so6289863ieb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 23:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yORBIRtmOQ5f3SIq1OIApJMzbXhAa5vhmK6UKZ+zPx8=;
	b=Dzr3uAxl2zSA0Nl1dLb7Tco2Ih+w2fALWjcaJBbENd5BGN35c682hStxSw466Jz1oB
	Ah+59or8qWt3BlgEoy+W6iHaXjrnLwZWUxD/SYZkeUqNtBQX+Z3FvuuV3N5IOVvwZ3gf
	RIHFMyqZhQYLbHPxkA3JSWZZAqgVUI2hlm6wAX/YCKLNG4jyMHz1laQ8pCXAqhCYev1X
	NnhByPXXBM2D5WF3f8T3jZa0IVRCDtAPscnTrQnHCZL5sk+I9av+EjYj+PXB6BrVl5jc
	NqBP+wSrpwi7dapHUQvyNXJBS7nzuLmh1rH9JtNO3NFkEX0yFKxfc1ye1imZ3RFoXhTn
	7ZsQ==
X-Received: by 10.42.164.7 with SMTP id e7mr38349370icy.70.1432015733776; Mon,
	18 May 2015 23:08:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Mon, 18 May 2015 23:08:23 -0700 (PDT)
In-Reply-To: <1432015346.7345.5.camel@pco026>
References: <1431959981.7345.2.camel@pco026> <2040476.ASQcAD4fVn@dev2>
	<1432015346.7345.5.camel@pco026>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 May 2015 23:08:23 -0700
Message-ID: <CAMKF1sq7FmeoBeWAANrX0tXays+pi=PLZrmMg8qTt3kt7Jjj3Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: CUPS ppd drivers
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
X-List-Received-Date: Tue, 19 May 2015 06:08:53 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 18, 2015 at 11:02 PM, Steven Descheemaeker
<stevend@limotec.be> wrote:
>
> Marc Reilly schreef op di 19-05-2015 om 10:42 [+1000]:
>> Hi Steven,
>>
>>
>> I got printing going a couple of years ago for HP printers, (the only type we
>> needed to support). I haven't been keeping track since, so I'm not sure what
>> the current state of recipes in yocto is.
>>
>> We only need to be able to print pdfs. It's not fast, but it works.
>>
>> On Monday, May 18, 2015 04:39:41 PM Steven Descheemaeker wrote:
>> > Hello,
>> >
>> > I'm trying to add printer support to my embedded board. I'm able to
>> > build cups but there aren't any driver packages.
>> >
>> > Are there any recent packages for printer drivers? I already tried to
>> > build gutenprint/foomatic myself but I'm relatively new to yocto so I'm
>> > not that good in writing recipes my own.
>> >
>> > Anyone can help me out with this ?
>>
>>
>> What type of printer are you using?
>>
>> For HP printers, use the hplip drivers. There is a detect/add printer script
>> which is handy for adding USB printers.
>> For other brands, I'm not sure. I think there were some recipes for canon and
>> epson printers.
>>
>> Below is a list of the packages in the image related to printing, the python
>> packages are for the hplip add scripts, and the perl is (i think) for the
>> foomatic filters.
>>
>> Cheers,
>> Marc
>>
>>
>>
>> IMAGE_PRINTING_INSTALL = " \
>>       ghostscript \
>>       ghostscript-cups \
>>       cups \
>>       cups-doc \
>>       cups-lib \
>>       cups-libimage \
>>       foomatic-filters \
>>       poppler \
>>       poppler-data \
>>       hplip \
>>       hplip-ppd \
>>       hplip-cups \
>>       hplip-backend \
>>       hplip-filter \
>>       python-syslog \
>>       python-pprint \
>>       python-compression \
>>       python-shell \
>>       python-xml \
>>       python-unixadmin \
>>       python-html \
>>       python-resource \
>>       python-terminal \
>>       python-lang \
>>       python-stringold \
>>       python-netclient \
>>       python-fcntl \
>>       "
>>
>> PRINTPERL = " \
>>       perl-module-strict \
>>       perl-module-posix \
>>       perl-module-fcntl  \
>>       perl-module-exporter-heavy \
>>       perl-module-cwd \
>>       perl-module-sigtrap \
>>       perl-module-io-handle \
>>       perl-module-data-dumper \
>>       perl-module-bytes \
>>       "
>>
>>
>>
>>
>
> Hello Marc,
>
> For HP I already found hplip indeed, but I need more than only HP as
> printer brand. I'm searching for recipes like gutenprint/foomatic with a
> large amount of printer drivers for different brands.
>

does this help

http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb

