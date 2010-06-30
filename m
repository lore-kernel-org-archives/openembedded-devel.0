Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <challinan@gmail.com>) id 1OTm9b-0006BO-Fw
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 03:31:56 +0200
Received: by pxi12 with SMTP id 12so155464pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 18:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=9FX5fGUjaEWQhURhMGiGa/0GtWmkL6sMQggQy2RbZsE=;
	b=Ym0iwO/U4DUg/PekD2Tx8AJTYPl4G8C9vUuUfeHGKpvXBOf8i7wZg/JEoE+YYqB88P
	rp7CH9YbDRMHv/P7vXIhT3a+pRZ+SEbxA3rUKxx2nHmY5CWWhSwFLLfpaHqhfFdxyy7N
	unbgYLyUT2PwepaAlZ4saPuVe8JV86HALfef8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=b7isFp1BK+tJw7Q26ewLIyDYFy0z133ds8WWl3lrVMaYcMo7ZaCExOERYby1VzEYJs
	A3qhkzXeH2RpXVZBULgOxvRsANCSVgXXTsUFG72IdFTKQoCwJ468l44o+D61+qxKbWow
	tgsH2vzpZGox/4ehX6NpVz7NjE48MNNXUb52s=
MIME-Version: 1.0
Received: by 10.142.122.6 with SMTP id u6mr9074704wfc.183.1277861230792; Tue, 
	29 Jun 2010 18:27:10 -0700 (PDT)
Received: by 10.142.132.16 with HTTP; Tue, 29 Jun 2010 18:27:10 -0700 (PDT)
In-Reply-To: <D1248977-0BA9-49ED-B748-4C131AAB39D9@keylevel.com>
References: <933C8D2B-2A4E-46EE-A342-ED5EB3636F38@keylevel.com>
	<AANLkTilmoW3cU9hcM1PbN8-yDTM36uzkNB5CwU8obJf1@mail.gmail.com>
	<92233E3F-2CFC-4F88-A780-1A15D7D94A00@keylevel.com>
	<AANLkTim3wnL18BjsIrLiKZC5NRc70UG77N1GtOiISghA@mail.gmail.com>
	<69E07E36-D08B-4CD2-9B79-EF876EE47C52@keylevel.com>
	<20100629223859.GE12539@jama>
	<D1248977-0BA9-49ED-B748-4C131AAB39D9@keylevel.com>
Date: Tue, 29 Jun 2010 21:27:10 -0400
Message-ID: <AANLkTimHu_IwTMM2CyZv0Hz6yOsHsJyMGyGh-iYyKBWJ@mail.gmail.com>
From: Chris Hallinan <challinan@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: challinan@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'swapper' process using 100% cpu when system idle
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
X-List-Received-Date: Wed, 30 Jun 2010 01:31:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jun 29, 2010 at 8:01 PM, Chris Tapp <dokuwiki@keylevel.com> wrote:
> Well, I've changed the kernel version from 2.6.35-rc3 to 2.6.25.
>
> The 'swapper' process is still running at 100% cpu and the cpu never idles
> when nothing else is active (under Qemu and my hardware).
>
> Any other ideas what can cause this?
>

Well, I can only guess, but you may have a misbehaving application.  I
experienced something similar on a laptop, and didn't even know it
until I unplugged and took an airplane ride.  In 2 hours, my 6+ hour
battery was dead...an HP scanner driver was consuming 99% CPU even
though the scanner was not even plugged into the laptop!  Bad me for
trusting, and bad HP for a dumb design (or even dumber bug!)

If you can, try selectively killing applications until the condition
goes away.  Also, you didn't mention how much memory you're system
has, you may be overwhelming it.  And by 'swapper' I presume you mean
kswapd?

Alternatively, start out with as minimal a system as possible, ie just
start a shell, then mount /proc and see what's going on using ps/top,
etc. Then manually walk through your system init until you find the
offender, if it's userspace at all.  Given that you changed kernel
versions and still have the issue, that points more towards apps.

Good luck,

Chris


