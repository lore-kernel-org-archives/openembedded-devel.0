Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id DF8A165D2F;
	Mon, 21 Apr 2014 03:14:05 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id rd18so3506864iec.1
	for <multiple recipients>; Sun, 20 Apr 2014 20:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=z8jU8Lsp7g2QSQTShy25c6v0Zbj2j4S4eRD22DDfn5o=;
	b=C8tpLZjKlTJOwjEt+Rs4y2vIcyBi1sX4cv3RCorAUuBk5JdK2/jhajps7c9Mr8JfFI
	HxA5FDvUy/bZ3y0cFTO29dZJMEvmxNqI1PqVcllbdurXv5rAcO9SIe4uPMUk0SCr3fAT
	/ycgswApKYqeEnp3AgUiztOs/t8rKqcCc5wyONW4Mvw4ETSl1JvmKIrScHIY6pl2Q53t
	7b38HP+TgvQ6vSmq7XVx0pOsjI1qK+copKxraxdUYcBufjZJ7D/n3zBfG8I3AEBwR+yz
	u6KMAe1mdb+z9SJtjZvnmuvLR70q3KB1QGyYVt329KYigqWDfnxNxFBbkWlCLN9Q28RJ
	Mcdw==
MIME-Version: 1.0
X-Received: by 10.50.30.167 with SMTP id t7mr19359386igh.17.1398050046626;
	Sun, 20 Apr 2014 20:14:06 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Sun, 20 Apr 2014 20:14:06 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Sun, 20 Apr 2014 20:14:06 -0700 (PDT)
In-Reply-To: <CAPbeDCkwiD0ZKAYS=AAkUEQnZvVNvFjNAgqtmJ8mcW_HXSV_DA@mail.gmail.com>
References: <20140418183632.GG2486@jama>
	<CAPbeDCnP_Qr1fUS9MAFZ4mLCRcoNJ=M1n8Umx-8m6m0b8Sxm0w@mail.gmail.com>
	<CAPbeDCkwiD0ZKAYS=AAkUEQnZvVNvFjNAgqtmJ8mcW_HXSV_DA@mail.gmail.com>
Date: Sun, 20 Apr 2014 20:14:06 -0700
Message-ID: <CAMKF1soHe6Yt1yzdWJC-hfy+o5dLPMeKmLHVj6nTXPadXF2Ntg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, test-dependencies 2014-04-18
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
X-List-Received-Date: Mon, 21 Apr 2014 03:14:09 -0000
Content-Type: text/plain; charset=UTF-8

On Apr 20, 2014 10:16 AM, "Jacob Kroon" <jacob.kroon@gmail.com> wrote:
>
> On Sat, Apr 19, 2014 at 1:03 PM, Jacob Kroon <jacob.kroon@gmail.com>
wrote:
>
> > On Fri, Apr 18, 2014 at 8:36 PM, Martin Jansa <martin.jansa@gmail.com
>wrote:
> >
> >> And more importantly floating dependencies, reply here
> >> when you start working on some of these.
> >>
> >> Found differences:
> >> ccid/ccid/latest lost dependency on  flex
> >> console-tools/console-tools/latest lost dependency on  flex
> >>
> >
> > I'll have a go at resolving the console-tools/flex floating dep.
> >
>
> If I understand things correctly: libfl.so from flex provides default
> implementations for yylex() and yywrap(). console-tools/loadkeys provides
> its own implementations for these, so linking with libfl.so is not
> necessary.
>
> In order to remove the floating dependency I can patch to either remove
> @LEXLIB@ from LDADD, or I can pass "-Wl,--as-needed" in LDFLAGS, both ways
> seems to get rid of the dependency on libfl.
>
> Any preferred way of handling this ?

remove LEXLIB from LDFLAGS
>
> /Jacob
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

