Return-Path: <max.oss.09@gmail.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6A31B71F1B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jan 2015 19:38:42 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id v8so25193990qal.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jan 2015 11:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=h9VXyOHJ35BoQSJ100t0+G/v5jz8y1f6R3C1L01+82g=;
	b=fPnQVsCP/BfYLNqAxqbYa/3nnrg5DmK22QbsX70CEeKhQEmAaePI5q5RkIMbHf/mQQ
	kxQ18cOXbtyuKhZlnXdIgsxJd0OCGZv57mknuP2JOQYudw5qZKfeO4J3J+g8OQ6oLPOw
	GquNwz0DfF4A01A+RoAP6TmnPp1Evs2wB8Aw2kWwyLp3+s4EdiKkAVvTpGefLUMiQ8UG
	c2W6avLf/ODq9eou0mr4G6P1OcGixKqgRUYTGuSOLoV8WegokSmd9t97RIBU0k2rvn+G
	QTPdrOR1j14buaiES8Eg483LIf3b7Un6wtYAXt98x1hSkSgMqjCZJgI279v9Tca/Q7Ua
	nv2w==
MIME-Version: 1.0
X-Received: by 10.229.219.74 with SMTP id ht10mr45537542qcb.25.1421696322538; 
	Mon, 19 Jan 2015 11:38:42 -0800 (PST)
Received: by 10.140.30.229 with HTTP; Mon, 19 Jan 2015 11:38:42 -0800 (PST)
In-Reply-To: <D0E2AB9D.8D80%csmiley@icontrol.com>
References: <54B220B0.8070609@gmail.com> <54B222F2.4070802@gmail.com>
	<loom.20150113T130012-516@post.gmane.org>
	<20150113132422.GJ18240@mail.itconsulting-heinold.de>
	<CAP9ODKocqaD+cXFba28jxXyd75aRmWnpwNY3NNx1wVY4Q3wVuA@mail.gmail.com>
	<loom.20150115T002923-253@post.gmane.org>
	<CAP9ODKpZzfTV41SDZjacbMi9=_BKkA7AoTgU+az4+7oUDreB3Q@mail.gmail.com>
	<CAEHkU3WoztGsMLVriJWqFCSuYboaQAFf8G_y1EtYHiyrh3i0UQ@mail.gmail.com>
	<CAEHkU3VmOOfi+nmyB2gERxghmb7n0uNXaNhiQ1zbaYtH33vAaw@mail.gmail.com>
	<CAEHkU3UwSPmDXcXVeZpTWWjxvQ3DxJts7_Ci964f=Lrv8xNH0Q@mail.gmail.com>
	<CAP9ODKrmQ2hLL-NFUqrB_sa24wB+WyzTPsdkssYgkknFKNO65A@mail.gmail.com>
	<D0E2AB9D.8D80%csmiley@icontrol.com>
Date: Mon, 19 Jan 2015 20:38:42 +0100
Message-ID: <CAEHkU3WJWCyoxSVpM7z8HG_dq=RpoPfhPaQzLoh7+iMtwx63SA@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Colin Smiley <csmiley@icontrol.com>
Cc: Henning Heinold <heinold@inf.fu-berlin.de>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Alex de Cabo <alejandro.de-cabo-garcia@congatec.com>
Subject: Re: Query on meta-java layer openjdk-7-jre build
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
X-List-Received-Date: Mon, 19 Jan 2015 19:38:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Colin

2015-01-19 19:43 GMT+01:00 Colin Smiley <csmiley@icontrol.com>:
> Max, Otavio,
>
> Thank you for the continued work you're doing on this.
>
>
> On 1/19/15, 6:41 AM, "Otavio Salvador" <otavio@ossystems.com.br> wrote:
>
>>Hello Max,
>>
>>On Mon, Jan 19, 2015 at 9:56 AM, Max Krummenacher <max.oss.09@gmail.com>
>>wrote:
>>> I made some progress.
>>> We seem to be discussing two issues
>
> ...
>
>>> 2)
>>> qemu runs indefinitely.
>>> While hunting the above mentioned bug I found that when using qemu
>>> with the sysroot, i.e. using the -L <path-to-sysroot> parameter qemu
>>> executes and never returns.
>>> On my machine free shows increasingly used RAM but I was to impatient
>>> to ever see an OOM kill of qemu but maybe this is also what Colin
>>> experiences and probably also why Alex does have issues with the "-L"
>>> change.
>>
>>Awesome analysis; I've been looking for some free time to debug this
>>for a while do a HUGE thanks for all your work on this :-)
>>
>>> An strace qemu .... run shows that qemu runs in circles of recursive
>>> symlink in /usr/lib/udev/ptest/.... files.
>>> Using the fsl-arm setup with poky enables ptest. When udev has been
>>> compiled in this setup those testfiles have been staged and qemu
>>> chokes on them..
>>>
>>>http://lists.openembedded.org/pipermail/openembedded-core/2014-September/
>>>097098.html
>>>
>>> a) One way to go would be to fix udev in oe-core, e.g.
>>> index 0f8e9b6..a93b58d 100644
>>> --- a/meta/recipes-core/udev/udev/add-install-ptest.patch
>>> +++ b/meta/recipes-core/udev/udev/add-install-ptest.patch
>>> @@ -21,7 +21,7 @@ Upstream-Status: Pending
>>>  +    sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
>>>  +    $(MKDIR_P) $(DESTDIR)/test
>>>  +    (cd $(top_srcdir) && install $(TESTS) $(DESTDIR)/test)
>>> -+    tar -C $(DESTDIR)/test/ -xJf $(top_srcdir)/test/sys.tar.xz
>>> ++    cp  $(top_srcdir)/test/sys.tar.xz $(DESTDIR)/test/
>>>  --- a/test/udev-test.pl    2012-03-18 16:43:36.000000000 +0100
>>>  +++ b/test/udev-test.pl    2013-02-18 10:31:29.706357321 +0100
>>>  @@ -1459,11 +1459,13 @@
>>> diff --git a/meta/recipes-core/udev/udev/run-ptest
>>> b/meta/recipes-core/udev/udev/run-ptest
>>> index c6961ce..0e39806 100644
>>> --- a/meta/recipes-core/udev/udev/run-ptest
>>> +++ b/meta/recipes-core/udev/udev/run-ptest
>>> @@ -1,3 +1,5 @@
>>>  #!/bin/sh
>>>
>>> +tar -C test/ -xJf test/sys.tar.xz
>>>  make -k check-TESTS
>>> +make test-sys-distclean
>>> --
>>> 1.8.4.5
>>
>>It'd be great if you could prepare a patch to address this in OE-Core;
>>once it proves stable we can ask for it to be backported for Dizzy.
>
>
> If this is what is causing the meta-java qemu problems, wouldn't this have
> to be ported back to daisy as well? Daisy is the latest branch meta-java
> says it supports (it's the one I've been using, anyway).

If we have solution b) in meta-java then meta-java would no longer
need a change to OE-Core for this.
However a patch to OE-Core would benefit other projects.

The far more interesting question is if your OOM is fixed when doing
either of solution b) or c).


>
>
> Colin
>
>

Max

