Return-Path: <nickgn1@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id BC40360601
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 04:05:23 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id rp18so23429124iec.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jan 2015 20:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=o71KB0xQSdV3uP4ZwZhzMFPYCJRKwUB7cObesyzmU08=;
	b=JjVz1lEbvU20CP+LFyqe0ZfE6CyCaXNsRxtL5FuWXKz/d3XJbKI4taWEkc2SYBZb2m
	jchcx4w0QQ5vz9tGgWWipTElGPJw5lQpE+0th4efiPOF6Olyle9ugvnV2y1ja6f4ACjL
	NdlmBk3eTUy6rCKa1te/YRcN/DCQfIK2sGecWSddT4W+aVLU8Tbc8ZUmqXKv7AhJUJW/
	5qFAgLFqw1+xH+j+iLE/itkhP7UUDtb6809jAXTPLc50VZFlsHM7ljuzInDvg/ZtFP8e
	5PSPs4eraBy2ioems7OcGChwzDWY0AAdTkvpDp+Oae17L+K1mEjksPrLzit7+t58lEdR
	tC3w==
MIME-Version: 1.0
X-Received: by 10.50.8.7 with SMTP id n7mr13380756iga.16.1421035524525; Sun,
	11 Jan 2015 20:05:24 -0800 (PST)
Received: by 10.64.135.72 with HTTP; Sun, 11 Jan 2015 20:05:24 -0800 (PST)
In-Reply-To: <20150111152245.GC2465@mail.itconsulting-heinold.de>
References: <CAOg63ZwrYDg+n=631P18+9VFLQVkBPgQdLvWkQnnQxnOJ=sz8w@mail.gmail.com>
	<20150111152245.GC2465@mail.itconsulting-heinold.de>
Date: Mon, 12 Jan 2015 09:35:24 +0530
Message-ID: <CAOg63ZxM-Q4GBeEOcr6i1YGS+p5y4mbU__XAVcU7SziMgzhDrw@mail.gmail.com>
From: Nikhil Gend <nickgn1@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: openjdk-7 failed with exit code '1' for angstrom linux image V2.3
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
X-List-Received-Date: Mon, 12 Jan 2015 04:05:30 -0000
Content-Type: text/plain; charset=UTF-8

Could you please tell me how to revert the qemu updates as i am new to this
openembedded-core stuff.

Thanks and regards
Nikhil Gend

On Sun, Jan 11, 2015 at 8:52 PM, Henning Heinold <
henning@itconsulting-heinold.de> wrote:

> On Sun, Jan 11, 2015 at 09:31:08AM +0530, Nikhil Gend wrote:
> > Dear Sir,
> >
> > I am building angstrom linux image V2.3 for toradex colibri-t20 module
> and
> > I got error while compiling openjdk-7 as
> >
>
> > |      12836 Segmentation fault      (core dumped) | qemu-arm -cpu
> cortex-a8 -s 2097152 ./mkbc - bytecodes_arm.s
> > | make[7]: *** [bytecodes_arm.s] Error 139
> > | make[7]: *** Waiting for unfinished jobs....
>
>
> We are using qemu to build the arm bytycode assembler unfornatly the
> update of qemu in openembedded-core breaks the build
> and nobody had the time to look deeper into it. As a workaround you try to
> revert the qemu updates on your local branch.
>
> Bye Henning
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

