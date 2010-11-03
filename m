Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDTXk-00012h-EI
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 03:57:44 +0100
Received: by ywo32 with SMTP id 32so162398ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 19:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=ngQd5zLvivjmCD2OZKLH4oouyzjyhdQhJc/LFKwztaY=;
	b=jSOpaNCJi2fhp/fhyxPnd99D9AD8nI1RoRz69h+kR+5SyqN2cm7GQNEO8ikk0a6j7M
	EPz6ublu9jAJ1k3bremp3ylfUjCqdmaLF/FLGk5hM8vK0Wn4v5rtSHSpBRQFpOnV7fgR
	nCuDGAgmWCnE1YGXk1E+xqPWxqjQ8/XOkZTBQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=sil/YczkSzx+lZStzZb25Y5T1evHhLECQjuQNxejRNzRMqd6Av56Xk0rJ6otUNNDPA
	76Lib2DFwWZv5Ms9IJ6q/3MVDtojX0P1qJOyB8n9QdQRf8aIgBOZBkIEeZGRo/fumbbR
	Eszvot+1v4Klyu6pfCFDApGg/TCXNSUdFJ9No=
Received: by 10.90.20.1 with SMTP id 1mr228466agt.145.1288753013401; Tue, 02
	Nov 2010 19:56:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Tue, 2 Nov 2010 19:56:33 -0700 (PDT)
In-Reply-To: <AANLkTimOLodSjV8+saSi1td==O7TgX1iqzJeQ=NT5mgB@mail.gmail.com>
References: <AANLkTi=gi8pk_McpA58rvcOHdq-0Xpz+NyF2doWPO00B@mail.gmail.com>
	<AANLkTinCa9E0F3FOm6TXg6NLc48pSgmijeUfqgmhtRuw@mail.gmail.com>
	<AANLkTimE05gQ2pSmkYouZMW1=rAg=-5S_sGu0nTgjpzh@mail.gmail.com>
	<20101101194703.GA12018@gmail.com>
	<AANLkTi=TyPX5L5oUHYehsuvqr9FGSCaD_nj1Z8+P=8F_@mail.gmail.com>
	<20101101195748.GB12018@gmail.com>
	<AANLkTikr3k3+5fJhX9MfKF2DhSbEXn8Pa9SF0QZ6nCZ7@mail.gmail.com>
	<AANLkTimOLodSjV8+saSi1td==O7TgX1iqzJeQ=NT5mgB@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Nov 2010 19:56:33 -0700
Message-ID: <AANLkTi=LRGff3rc0++-+2PAKMWLitWZWOC3TGTUO4kYQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Wed, 03 Nov 2010 02:57:44 -0000
Content-Type: text/plain; charset=UTF-8

> A question -- is the build supposed to be using the build host's automake,
> or is it supposed to be using one from its downloaded toolchain?

well automake is used from the contained versions. We use the version
from native staging which
is the version we build. The automake installed on your host is not
used unless you do some stuff
with assume provided.

>
>
> Thanks,
> Zach
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


