Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id D8CD365E73
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Apr 2014 08:26:00 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id ar20so7071095iec.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Apr 2014 01:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=6fLm8dMCSaAqg6a+HzUySaCRzxXN3wO8u1N/0lD06p8=;
	b=vENyP0Dt45RX5ppWSm7f0M5Xlyf/mn2bR+S5RKjvqJzHgYRAsRJRaVN255t6bfSjMw
	8LoiJJ0LpJZAL0q5e1ODC7BrErnhOVvfbYaXJAMh2C6UwCbwZ45Z0CubYNPGHXxHNwHe
	B+Qxt6Yv/XPw7Jbb9zLfDeBNjtcZz18LLBKXOfDUNaGOVqvGgfMNYDZaCy5YByKEh8N7
	dHV613yszKSznFVabgxZKs0eLi81aRtwK3hcBM3U+7lbNrmU2ODi73Ym3H5PIZjWjWHL
	4IX07nmLdKM1MaCZKGOj0H3f1ownGAMWDBRgmEqXjQ9g3pysqbO9HVxzDwr5grphcSR6
	dY9Q==
MIME-Version: 1.0
X-Received: by 10.42.82.148 with SMTP id d20mr5916085icl.50.1397377561738;
	Sun, 13 Apr 2014 01:26:01 -0700 (PDT)
Received: by 10.64.230.100 with HTTP; Sun, 13 Apr 2014 01:26:01 -0700 (PDT)
In-Reply-To: <CALYKT1ja5AtU45KxEXqZSvFiwfUDZpT5539zzoWs1=wh7c89Tw@mail.gmail.com>
References: <CALYKT1ja5AtU45KxEXqZSvFiwfUDZpT5539zzoWs1=wh7c89Tw@mail.gmail.com>
Date: Sun, 13 Apr 2014 17:26:01 +0900
Message-ID: <CALYKT1hh2+XUNyOkAs8wfwtPavsKYwniu--FrcRuRzjMZNMr_Q@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: How can I place gdbserver in my target system?
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
X-List-Received-Date: Sun, 13 Apr 2014 08:26:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

If I just grep gebserver source code and place it into my oe sourcecode and
build an image, I believe I can place gdbserver into my target system.

After I did this, if I use general purpose gcc crosstoolcahin(cross gdb).
can I cross debug?

I'd rather first just do this ... and I will update my question.

Thank you!
Sincerely
Journeyer

----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------


2014-04-13 17:21 GMT+09:00 Journeyer J. Joh <oosaprogrammer@gmail.com>:

> Hi,
>
> I want to debug my application on target embedded system using cross gdb.
> To do this I learned that I need to place a proper gdbserver in my target
> system.
>
> My target system runs by oe-core.
> Then how can I prepare gdbserver for my target?
>
> And also I'd like to know how can I get a proper cross toolchain for usin=
g
> cross gdb for oe-core system.
>
> Now what I have is only general arm cross toolchain. And I believe this
> toolchain is not proper for oe-core system.
> oe-core uses not a cross build system - It's built under some kind of
> sandbox environment. This makes some difficulties for me.
>
> Previously I've asked a question - how can I use gdb in oe?. I raised new
> question because this time I need to know about how to install gdbserver.
>
> Thank you Brian Hutchinson, Mats K=E4rrman for the previous answers.
> Thank you for someone who might answer me in advance.
>
> Sincerely
> Journeyer
>
> ----------------------------------------
> Journeyer J. Joh
> o o s a p r o g r a m m e r
> a t
> g m a i l  d o t  c o m
> ----------------------------------------
>
>

