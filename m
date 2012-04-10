Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SHk0t-0000qt-EJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 00:58:15 +0200
Received: by lbky2 with SMTP id y2so259849lbk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2012 15:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=hyhDVvoujCK3tFp36O9+nFWvSgu/6vNM7KKm/FPFwnk=;
	b=a6fTTmj0wtIeyziKjtS3ZMMS4DLNS7+UUQfIXyVeg8a+qi7pNi7mL1UjJhGVk8m8Rw
	yOTN96KMF8zXSOMozHwqBnHLOLzNPUpoFsW7Bm87ZS6Ghoaxc/xVHw/xPs9618Z1bxh2
	vNz+mevEWZQ9vVI2iqoxk5nbszHMK/HtLK6r02NqpWR8kyHgFMPusCnAhUgzvN5qZhqF
	kG5pMtKBTCZ1hBlmG1IDVNiHBlJxPk2NpC1AwvlhJReSUNgQLXIR44C0cU9Sz3UjFCMq
	va8Px9k3O+S+yuol/KFfbfkLmKOW0T1plnDCucMTaoGKKPOrEqU4XGmUnVIbMLUsWqNA
	5CPQ==
Received: by 10.112.100.170 with SMTP id ez10mr2014025lbb.15.1334098137086;
	Tue, 10 Apr 2012 15:48:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Tue, 10 Apr 2012 15:48:26 -0700 (PDT)
In-Reply-To: <20120410064131.GA3583@jama.jama.net>
References: <4F80ACD6.8080901@gmail.com> <20120410064131.GA3583@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Apr 2012 15:48:26 -0700
Message-ID: <CAMKF1sotvfR6o0rU7dkVxwFVPcApWorM8bLsov+Gk8-OPKRU5Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: meta-linaro and toolchain-layer
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
X-List-Received-Date: Tue, 10 Apr 2012 22:58:15 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 9, 2012 at 11:41 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> I haven't tried gcc-4.7 on my armv4t machines yet, because I fear
> similar issues like with binutils gold (which are still not resolved),
> because nobody uses armv4t much nowadays :/.

yes I have tried qemuarm/armv4t build along with qemuarm/armv5t build
as a test on 4.7
it boots systemd-image fine. But I would expect others to chime in and
provide some
testing help on their platforms/machines, I am still actively fixing
and rebasing
the 4.7 patches so expect a bit of churn there

>
> The same I fear from 4.6 from meta-linaro, but maybe they will be
> responsive as you were, when I reported issues on armv4t with some new
> patch added by linaro..

I will make sure that happens and I will be maintaining the layer at
above location
and see how the interaction goes and will help in maintaining the layer

>
> So using meta-linaro for gcc-4.6 and gcc-4.7 is fine, but please keep
> current "snapshot" of gcc-4.6 (oe-core+toolchain-layer patches)
> somewhere as safe version before meta-linaro 4.6 is well tested on all
> devices.

yes essentially we can recover is any time and in worst case I have to maintain
meta-linaro in which case we can merge both into one and maintain it
but I will actively
seek linaro's help in maintaining the layer.

>
> Cheers,


