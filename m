Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PE6Pt-0005ys-Oz
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 21:28:14 +0100
Received: by gxk26 with SMTP id 26so1856029gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 13:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=bY3gQZtqUADs2svn7xDz3LrZw+O8baSxls18csSt3+w=;
	b=mWyv6ugDCj5p0Vz7pJgio4PkUFZRKwl4tPT6y7BapWxsxsZjtlIXWQJwu+jPs3m9mD
	53FRXC/Q1zeG+oQuH7FpQFu+PXovNisxNftese5Mgz6oNpMN5+6sJIn+VosBC0mUK2rt
	zIJrSmonqXzH7Egu5GLFbM1WmbHSgauAmZ//4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=EhI8jeVbDyJSBfHWB8xovRDk50gtbdYVA8MR/EsNXwDHyL6P4uNlC+scC01MpsG2LB
	unpAtfhg6A4oqXwD4W39YhmYWH0zOTVWOM+kXJyKyPlQypncDJceqpEX7527FnJPO4na
	uRUPlyJSo0R/6C1Dq32yUPLV8jyeunI79Q3pA=
Received: by 10.90.57.2 with SMTP id f2mr192140aga.118.1288902441051; Thu, 04
	Nov 2010 13:27:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Thu, 4 Nov 2010 13:27:00 -0700 (PDT)
In-Reply-To: <4CD2FAF0.4080905@freyther.de>
References: <1288864342-20973-1-git-send-email-eric@eukrea.com>
	<4CD2FAF0.4080905@freyther.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Nov 2010 13:27:00 -0700
Message-ID: <AANLkTi=CpHWfcVS6MGXH9NSSttCmWzitHQE8=heBUE_S@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH/RFC] qt4-embedded: tune QT_ARCH for armv6
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
X-List-Received-Date: Thu, 04 Nov 2010 20:28:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 4, 2010 at 11:26 AM, Holger Freyther <holger+oe@freyther.de> wr=
ote:
> On 11/04/2010 10:52 AM, Eric B=C3=A9nard wrote:
>> this is a RFC, I think it can also be used on qt 4.6.x and on armv7.
>> Setting QT_ARCH to armv6 enable some asm optimized functions in QT.
>
> Do you know the consequences of this change? E.g. in the painting
> engine unaligned memory access will be allowed. I am not sure that Nokia =
has
> ever benchmarked what is faster (aligned/unaligned) access. So it would b=
e
> very interesting to know the perf difference. E.g. use qttracereply to me=
asure it.
>
> Phil do you happen to know why unaligned access got allowed starting from
> armv6? How fast will it be?
>

The instructions can cope with unaligned data so the performance will
not be impacted but its only upto
32-bit data above that the fault will still be generated and not all
instructions can operate on unaligned data
only ones operating on 32-bit data can do it.

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


