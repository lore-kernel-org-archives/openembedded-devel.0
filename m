Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SUlnP-0000iI-SO
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 23:30:12 +0200
Received: by wibhn14 with SMTP id hn14so5571809wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 14:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=shfvlb8caJ1wBJUUCF+1yZr29sGHhUIPNxX90a1ybMo=;
	b=O6ppG13siSExHSd9dFaslKC/AWMBwl98hwohCp7gwFqd7qdow2nf9OLqIRv++gjMLF
	XToHRgjxiQTC+x1QGp55K/AidSW4USgdMalhHVFQbos9Enf4qxxwSliC0zKLK8m/7Pnt
	A6n6KKm5IqunuJsxd1Ba4/UJg9hOE0IVeFiH6D3ZXY+mRbxyZuI9flIYKEY13j8Mdfx4
	LSYcdWOW5rBC2xXOiv9mo7bqm6WgM7zlnZqF2wgf1oFzD7L3Y3vYAK4WPwWZwdtR3rxf
	uloL43LdL8CgwT0T3LoE0v7rI1Xbv4bFANfZ8VYf8c6Rv/8geTHt2GzG5CJVfhxnqxdl
	YfQQ==
Received: by 10.180.109.229 with SMTP id hv5mr485936wib.0.1337203210198; Wed,
	16 May 2012 14:20:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.63.175 with HTTP; Wed, 16 May 2012 14:19:39 -0700 (PDT)
In-Reply-To: <009001cd33a6$3cc91050$b65b30f0$@slingshot.co.nz>
References: <CADZ6=asJ+xLvpodv=u9duDuWs=dp8mLamv=Sj6yJc6B5sjWMrw@mail.gmail.com>
	<jove3h$7qg$1@dough.gmane.org>
	<CADZ6=auuzv9dF1p58wVXPFdckBUmgk6nmucnarWpqdxMbyHpaw@mail.gmail.com>
	<009001cd33a6$3cc91050$b65b30f0$@slingshot.co.nz>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 May 2012 14:19:39 -0700
Message-ID: <CAMKF1srRxYjck6k5uTgBzvcpr7K1CqWAumqbD1vk3T20=Aa9Xg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Where do I override DISTRO_FEATURES?
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
X-List-Received-Date: Wed, 16 May 2012 21:30:12 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 16, 2012 at 1:55 PM, R U Local <roystonvasey@slingshot.co.nz> wrote:
> Dear Thilo, Anyone else,
> How did you get oe-core/Angstrom-v2012x to build a working system using a 2.6.37 kernel?
> I'm in a similar position using TI AM3517. The latest angstrom is built around systemd which requires a 2.6.38 or better kernel.
> I've had to reluctantly revert back to oe-classic and angstrom 2011.03.
> Any hints on getting oe-core/Angstrom-v2012x working with a 2.6.37 kernel would be great.

I have had systemd work with 2.6.34 Koen has some options he mentions
you need to enable in kconfig

http://dominion.thruhere.net/koen/cms/recommended-kernel-config-options-for-a-modern-angstrom-system


