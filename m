Return-Path: <eduardo@monkey.io>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id C9717606D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 17:51:17 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id d68so39058734ywe.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 10:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=monkey-io.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=spgkaZuA6e1aAenayTqFH+eYzZwj2GtBarhg/6RE1Cc=;
	b=tsG/9Qvjcy0gLh9C90SPkUb3KBeo3N9D30cN77BDQf+WSD1VUe3b+cQ5tE+iCG0nIL
	6LVXmjw3kigItQc5ssHWZTBsELWayviMHKkb9HSCjzpwv/CZCyapsp6E0dc1axP7NFWw
	5J0PbuV7pTdGYgF4Qkp0xYrvSVGtmJQjWsH5n2129Fr28dY+QlOK7m2zHw0DUgcaYPHO
	3fqVHXdaDiXWEkdEeKRS0Nz2XPzq3vcWYaKKRvmIij5+CLdrPWRMKu5QA1kuVYy6dMoV
	xfAFf9sAHRDyeb43k6UAE1a3KGXtdpHh0Rr4nhhPUpgAxuRNsSW9TMl6po8ueE25sHlQ
	o+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=spgkaZuA6e1aAenayTqFH+eYzZwj2GtBarhg/6RE1Cc=;
	b=EW0y2nvIy3JaIFeitIywakRodm/tifey/MzG0EZd6tDlB85kwrmm050F5FOgon293N
	W8OLaHHzRG63/1TShh8pc/RWitw3hscp2QYZ/n4LO7+rYVTjHaMp6CGgC+PL4lGbR4aL
	LHhb0QFov+X8szO8cLCLRWFFOTsBlgtCtU7YPyk6pHek6a829PWen9rByru1EmBB+l9G
	FkAalkOheVV5BAQLvhGaOq159SPDIod0DbPGiecnLEd88A7lQBTQ0LCtPnt7/tU3H0i7
	Fb9SGJ30EaLQDxEgaBfcWNEXr1T/2mSpbJqEfrbit3pBWi0yfcOneNTPD3BlgheEbwpa
	rZGw==
X-Gm-Message-State: AD7BkJJAaAvm0rpMS5SagKFe4xEZ9pBRxcz32Jn1pwxsegLw/TnR6ZTXna1NdpfHiwajUcwxbG9milw774/i/Q==
MIME-Version: 1.0
X-Received: by 10.129.31.139 with SMTP id f133mr3582970ywf.288.1459531249941; 
	Fri, 01 Apr 2016 10:20:49 -0700 (PDT)
Received: by 10.13.203.1 with HTTP; Fri, 1 Apr 2016 10:20:49 -0700 (PDT)
In-Reply-To: <CAEaCVQjGbaWfr5ZT7-4S1jNStoWUQ3QJyNhZ+-nOYpe2EBvZgA@mail.gmail.com>
References: <1459406572-8144-1-git-send-email-eduardo@monkey.io>
	<20160401133809.GF2567@jama>
	<CAEaCVQjmZGJOX332YqUH8eLOAGURiKXS4-f40P6KqNE7FgZ9qQ@mail.gmail.com>
	<CA+chaQfbTZu=JZO2FaLLCSFZtzHpL3=x3qrA16EAWrB=Yx+Unw@mail.gmail.com>
	<CAEaCVQjGbaWfr5ZT7-4S1jNStoWUQ3QJyNhZ+-nOYpe2EBvZgA@mail.gmail.com>
Date: Fri, 1 Apr 2016 11:20:49 -0600
Message-ID: <CAEaCVQjW0cmMDNyc3LhZQxv+RWfVmx9Bj-qgQx9AH1_+0=sTDA@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] fluentbit: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Apr 2016 17:51:18 -0000
Content-Type: text/plain; charset=UTF-8

on this case should be "RDEPENDS_${PN} = "zlib" OK ?

On Fri, Apr 1, 2016 at 11:01 AM, Eduardo Silva <eduardo@monkey.io> wrote:

> Oh, sorry I misunderstood. The program requires zlib to run, so it's a
> build (headers) and runtime dependency.
>
> On Fri, Apr 1, 2016 at 10:57 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> Then it's probably build time dependency as the warning says, not runtime
>> dependency like you did.
>>
>> Read what the component build does, if it checks for zlib in configure
>> then
>> you really need to add it to DEPENDS not RDEPENDS_${PN}.
>>
>> On Fri, Apr 1, 2016 at 6:53 PM, Eduardo Silva <eduardo@monkey.io> wrote:
>>
>> > > +LIC_FILES_CHKSUM =
>> > "file://${S}/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
>> >
>> > >
>> > > LIC_FILES_CHKSUM is relative to ${S}, so LIC_FILES_CHKSUM =
>> > > "file://LICENSE.. should work fine
>> > >
>> > >
>> > Thanks, I have updated my local copy
>> >
>> >
>> > > > +
>> > > > +RDEPENDS_${PN} = "zlib"
>> > >
>> > > If it does link with libz then the runtime dependency should be added
>> > > automatically by shlibs code in package.bbclass if it's not the case
>> > > can you add comment explaining why it needs to be added explicitly?
>> > >
>> > >
>> > I added that because I got a QA warning message:
>> >
>> > WARNING: QA Issue: fluentbit-dev rdepends on zlib, but it isn't a build
>> > dependency? [build-deps]
>> > WARNING: QA Issue: fluentbit rdepends on zlib, but it isn't a build
>> > dependency? [build-deps]
>> >
>> > what's your suggestion in this case ?
>> >
>> > best
>> >
>> >
>> >
>> > > > +
>> > > > +inherit cmake
>> > > > --
>> > > > 2.5.0
>> > > >
>> > > > --
>> > > > _______________________________________________
>> > > > Openembedded-devel mailing list
>> > > > Openembedded-devel@lists.openembedded.org
>> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> > >
>> > > --
>> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> > >
>> > > --
>> > > _______________________________________________
>> > > Openembedded-devel mailing list
>> > > Openembedded-devel@lists.openembedded.org
>> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> > >
>> > >
>> >
>> >
>> > --
>> > Eduardo Silva
>> > Monkey Software
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>
>
> --
> Eduardo Silva
> Monkey Software
>



-- 
Eduardo Silva
Monkey Software

