Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 457E96FF70
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 13:17:48 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id h18so4159123igc.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 06:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Q5U1MWHXGAWMe02QTy+dUO1Qzoso+P495GK7CrawC1w=;
	b=AABSF7YlsSNvvG/VYEbc+uSBdfCmt3hCZE+iL0y+yeiIj3zD5iQFDn+zpmIPfXiScP
	lwDQq0i9/BoHAs1HVn+DxH751av5KXNMcqdCRdPk5tapU8CqvTLj1rttPwC7lQC+MVBy
	35B3b/rd/RhnuaABvB9jbJX9fD6RTpD+fjETdG3rSP2cxEmndCs4E3X19z4WKYg65Co/
	6lY5NSaEvzBN7gPv5A4Q3U1vXglYQoTxMtgU+WKzfbE5umBYx8M+B7kr2cT6bNrH4Hsx
	cPyDrXLJtnvr8WvpKgrmSRMwrwf/gv1nJ50X3J4i0pQbxqQhXXcfGe5KHqEvscnvC4bS
	H1xg==
MIME-Version: 1.0
X-Received: by 10.43.160.137 with SMTP id mc9mr27248679icc.4.1403011069606;
	Tue, 17 Jun 2014 06:17:49 -0700 (PDT)
Received: by 10.64.127.38 with HTTP; Tue, 17 Jun 2014 06:17:49 -0700 (PDT)
In-Reply-To: <CALYKT1i+KV84OBNdWWbARGnbrVok8ARiBS0zR9dihJOebBV_sg@mail.gmail.com>
References: <CALYKT1i+KV84OBNdWWbARGnbrVok8ARiBS0zR9dihJOebBV_sg@mail.gmail.com>
Date: Tue, 17 Jun 2014 22:17:49 +0900
Message-ID: <CALYKT1htpMSYOKzCyCSDjuhAqFrXBGLQ0QZicDETjJaJZEn4Dg@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [Question] How can I use gebserver on oe?
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
X-List-Received-Date: Tue, 17 Jun 2014 13:17:52 -0000
Content-Type: text/plain; charset=UTF-8

Hi list,

I am sorry, I figured out that I didn't attach a serial cable!!
I am sorry again. Please ignore my question for this.

Sincerely
Journeyer

----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------


2014-06-17 22:11 GMT+09:00 Journeyer J. Joh <oosaprogrammer@gmail.com>:

> Hi list,
>
> I am trying to use gdbserver on oe with gdb-multiarch on ubuntu PC.
>
> When I try to invoke gdbserver as shown below :
> / # gdbserver /dev/ttyS0 /usr/bin/my_app
>
> I get error message shown below :
> Process /usr/bin/my_app created; pid = 1046
> Could not open remote device: Invalid argument.
> Killing process(es): 1046
>
> How can invoke gdbserver correctly?
> There is no file /dev/ttyS0 so I tried with /dev/ttys0 It is shown below:
> (There exists /dev/ttys0)
>
> / # gdbserver /dev/ttys0 /usr/bin/my_app
>
> Process /usr/bin/my_app created; pid = 1060
> Could not open remote device: Input/output error.
> Killing process(es): 1060
>
> One thing I am not sure is /dev/ttys0
> I need to use serial but I don't know what device name should I use.
>
> Can any one shine some light on my problem?
>
> Thank you very much.
> ----------------------------------------
> Journeyer J. Joh
> o o s a p r o g r a m m e r
> a t
> g m a i l  d o t  c o m
> ----------------------------------------
>
>

