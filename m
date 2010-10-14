Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P6OM3-0006Oo-PB
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 16:00:25 +0200
Received: by wwe15 with SMTP id 15so6806937wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 06:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=vipz6Thse+J7Lt70ZUn3AMVa3Swz8opdO2IpQrqeNtg=;
	b=GjHPnqh6WACK8t3yXYkKltk0Smx1OrsD/mWvzFhJzfsrcPLx+vV2/ZgLu/HsHMMjVs
	nW1ddXecjuzDYZ8jmgXf+XOCX9I7Zmq95kolC21a6z45evnaXmoj573y1Y+rrjJ4tYYk
	/X+9YVboRbLvlYNO0gjRvEPdjkYutHufTxdtI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=TP3WrK+jSkhY98U/nRf6svLhBVLdDTV2tSeO5/m9QFuJBtk12HxOxzJwYik+2nfB7m
	qSaWO5J9oCTzLWND5Ee9bVQRmdIWCmieBFwYNoJzA+69c/fXnWZFm/Qq9Dy9whfxv4eq
	C9zvJ657hIXSsdgu3LKhiGMQCXu0L8D4HCp0E=
Received: by 10.227.132.199 with SMTP id c7mr9838810wbt.89.1287064794161; Thu,
	14 Oct 2010 06:59:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Thu, 14 Oct 2010 06:59:33 -0700 (PDT)
In-Reply-To: <i97082$i6g$2@dough.gmane.org>
References: <131E5DFBE7373E4C8D813795A6AA7F080310FFA839@dlee06.ent.ti.com>
	<AANLkTik1nA1jC9f-Vvep2=8U9+VXAWBwPFaRaZC0f4Op@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA874@dlee06.ent.ti.com>
	<AANLkTinfQjRpwjYYL-6+He_z3tB6wm3kcW0CSEAqFVuh@mail.gmail.com>
	<i97082$i6g$2@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 14 Oct 2010 06:59:33 -0700
X-Google-Sender-Auth: 5zf6bsnI4XFaZRK8ExQWls8dxGQ
Message-ID: <AANLkTikHdhZ4ouoyA5UdyxoZBeR+f-bhHfMBwiaA6bCo@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Question about OVERRIDES precedence
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
X-List-Received-Date: Thu, 14 Oct 2010 14:00:25 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 14, 2010 at 6:23 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 13-10-10 23:38, Chris Larson wrote:
> > On Wed, Oct 13, 2010 at 2:30 PM, Maupin, Chase <chase.maupin@ti.com>
> wrote:
> >
> >> That was my thought as well but I can consistently cause this issue.  I
> >> have tested a quick change that seems to fix the issue by reversing the
> list
> >> before it is used in the for loop.  My change was:
> >
> >
> > From discussion on IRC, we think we should just reverse the definition of
> > OVERRIDES in OE, this avoids compatibility issues associated with
> changing
> > the implementation.
>
> Isn't the definition covered in the bitbake docs? I'm in favour of
> fixing bitbake instead working around it in OE.
>

As far as I can tell:
1. The bitbake docs don't cover the ordering.
2. The behavior isn't a bug, it's a mismatch between OE's definition and
bitbake's implementation, and bitbake has been this way since 2003.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

