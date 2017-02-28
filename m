Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5481771CAA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 20:47:05 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id x24so27503851uab.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 12:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bnsTR4W7FkaP9Wf6ul94D7A+Ogo8brfMaAIHdgjbhpk=;
	b=E4zPIOwwQG6UuU7hHBg+DSUs2gvP+1itadJSIsz5e1DB0Gg3HV5KdyGUR1Imr9IX6X
	T06TfgSzfPIDSd7mO0l+68fnpHII216ouZwspQFNTX+bNeTN/G78ZEAMBAwtN1RxZlLF
	vhOrf4s5We9ZR7jTSP7yvbjRCs4dTUqxscNvrmsuOGrLkDPkeZqglB6pLqW0T4hHUnHw
	HtifmnORa77vc8gimst5Fu0u3ebECdXWDAUqHaP4Dodwn+yoj6yDh4ZFFj8zdUQsTGNo
	iZpohNxiJBNL1ztro1vxU+iViufIJBDkslpZI/n9U6BymJ3bzFwZKoQgAK6NUZt4qrNx
	4OMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bnsTR4W7FkaP9Wf6ul94D7A+Ogo8brfMaAIHdgjbhpk=;
	b=LzgecQyf4Na3SgGjvx2HeOCR/Qu4nMnKpnL73Mi3OLggfePVQGsBl5V/aNL6r0IlL6
	XxTVwtEJLWFbjKeeKP2MohSPzRv0kNTYhvtCPSUy0zANZkcYAIp3YEs0xZkMJU6AGnFY
	jzZQ6XulOERO2FkFCVNSTUy6tCcYybB126SOD1SljrCIbd9PJ/DSCKCgGpojxamHcCRY
	IFChGj0nWj9Bo6RulCVCiVnQr9MOFyj40Xb1S+7LUlvrsjwSkLsC6o2lj8Ad6hN0MXPI
	r2iFLyKon/o++E2s57cb5iZMdspkJbOS4tCceuGfh3Fx+0sPVc6DmkGKXLxjvcab43Lz
	q+Qw==
X-Gm-Message-State: AMke39kSTOiaayYFJP2vUb6RfvzrtfgumsPCYyL1PwXAYaqkXS6z4+n1mGiqBbx5rKJTY/QY7EVEoAZdynIbRA==
X-Received: by 10.31.197.196 with SMTP id v187mr1969816vkf.84.1488314827256;
	Tue, 28 Feb 2017 12:47:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Tue, 28 Feb 2017 12:46:36 -0800 (PST)
In-Reply-To: <CAO7m3AknvqH4=3OgwsLOK2n+tkvzdwKL_RKgb0pJHxq545YLNw@mail.gmail.com>
References: <CAO7m3AknvqH4=3OgwsLOK2n+tkvzdwKL_RKgb0pJHxq545YLNw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Feb 2017 13:46:36 -0700
Message-ID: <CAMKF1souGpoa05-X_avop-P72MCVcgZGTMzb6NdjqqkOLKsr3A@mail.gmail.com>
To: Thomas Besemer <thomas.besemer@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: <libuvc> Meta Layer
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
X-List-Received-Date: Tue, 28 Feb 2017 20:47:06 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 28, 2017 at 1:42 PM, Thomas Besemer
<thomas.besemer@gmail.com> wrote:
> Does anybody know if there is a Meta Layer for <libuvc>?  I've been poking
> around, can't seem to find one.  What I have found is this:
>
>   https://github.com/ktossell/libuvc
>
> I'm working with Morty release for Yocto/OE/Wandboard, using SDK for
> toolchain.  When I try to compile above, I am getting errors around
> <jpeg-native>, but have not spent much time trying to resolve.
>
> Suggestions?

if layers.openembedded.org does not have it then you might have to
write a recipe for it.

>
> Thanks,
>
> tom
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

