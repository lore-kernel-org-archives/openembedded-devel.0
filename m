Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Kintk-0006Lt-KX
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Sep 2008 12:16:36 +0200
Received: by fg-out-1718.google.com with SMTP id l26so263272fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2008 03:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=vG0T9nqAJD2DiD3weZb/O18F9+s5E2ollyKagk7caW0=;
	b=r7tMZZBQ6JlMV0iCyLbAZkA3wHv/km0Mg/e9J0/rrtNkvc5L6iiEHSP1Ud3X6FXJEl
	r2myb/aL3MQ/4K2yMsAYeKgYGcf/vGmwlEZawXXS6gh+SsfyTcRybAh7QdlBUJFAe2Cg
	hhP/dH9QMWQgzVsHLhyAtInsmIMqIlq839AvU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=rnkAKKDvAAC+4ZWvQm6fFnQvi/L+SvZeJEHPvVhNT2gF547ny3CtY4kUyXUiRm4iik
	haaSaH2wgGldwDSPdMHuc8Xo6xZZE9Z2X/w+gmdqaSLU6QteiEfE13J933q3w4EwD5Ig
	YQvwrjnzjydlPe6bH95ts2dXMbZKUCdSKcWe8=
Received: by 10.187.167.18 with SMTP id u18mr2191076fao.70.1222337575613;
	Thu, 25 Sep 2008 03:12:55 -0700 (PDT)
Received: by 10.187.224.10 with HTTP; Thu, 25 Sep 2008 03:12:55 -0700 (PDT)
Message-ID: <d1b08f940809250312h35eaa66cv2b1a9ec7856994d4@mail.gmail.com>
Date: Thu, 25 Sep 2008 12:12:55 +0200
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gbalaq$39s$1@ger.gmane.org>
MIME-Version: 1.0
References: <20080923110049.B007318806A@amethyst.openembedded.net>
	<48D8D5B3.8010708@gmx.de> <gbalaq$39s$1@ger.gmane.org>
Subject: Re: [oe-commits] : zaurus-2.6.inc: a string always is true, so test for the contents of it
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
X-List-Received-Date: Thu, 25 Sep 2008 10:16:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> I did not test that yet, since I want to get a 'normal' boot working first
> on this &*$@*$(@ c700.

You mean even the normal zImage kernel does not boot?

One user reported this to me about zImage-kexecboot on SL-C700:

/*
To my knowledge, it does not reboot. It says "Rebooting the system..."
and then nothing happens. When I do a full power cycle (battery
removal because it ignores the battery switch), I just get a dark
screen and nothing indicating that it is in some sort of boot process.

So, no, I don't see a boot menu.

I'm betting that this is based on a difference between the C700 and the C860.
*/


