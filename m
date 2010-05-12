Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OC8Su-0000rJ-Ll
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 11:42:58 +0200
Received: by fxm11 with SMTP id 11so4607273fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 02:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=p0jcZOYya+dyftFRkw5km0rTrGOZ2wOQMnjK3+p1Lso=;
	b=InhjcI95em1jGN5nRQ5jEz2SJ34DB4dGGO4SPIYuViHQ9DGamNKY9vVvF6r3HfUoCv
	YuwfWJDxuqSrytBnq3lTv+DdNt3+WezlXO5VSqZl87Z34txTSAb179bZnbeiPlzvqb+S
	qIR8tIig49NiePjMo64BPsDqaqqLAm/7hap+I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vaj4gZaayIXULtjbbCjQtJ8UCff3tpwMk+z/WveKBg3djqdhr9nVc85ukjTukFdv56
	SmLy6/huaNSNkJDZkaaIX9W+whDL4EDiZwCK53zjeS7zqqlyXQLmJjuzVOziXBQ/wW7K
	OHtR3k4ym/+BUF0iMXJJu+1+Oldp6Q0/Ly2j0=
MIME-Version: 1.0
Received: by 10.223.26.206 with SMTP id f14mr7752370fac.96.1273657142703; Wed, 
	12 May 2010 02:39:02 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Wed, 12 May 2010 02:39:02 -0700 (PDT)
In-Reply-To: <201005111239.57770.khimov@altell.ru>
References: <20100510232720.GA13708@gmail.com>
	<201005111239.57770.khimov@altell.ru>
Date: Wed, 12 May 2010 11:39:02 +0200
Message-ID: <AANLkTinrTuitVH__A-t7tjdit9HLCf7AYFyl1w4vFLIo@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Move gcc 4.4.3 recipes in favour of 4.4.4
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
X-List-Received-Date: Wed, 12 May 2010 09:42:58 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2010 at 10:39 AM, Roman I Khimov <khimov@altell.ru> wrote:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F7=D4=CF=D2=CE=C9=CB 11 =CD=C1=D1=
 2010 03:27:20 =C1=D7=D4=CF=D2 Khem Raj =CE=C1=D0=C9=D3=C1=CC:
>> 4.4.3 is not so widely used in distributions unlike 4.4.2

Hi,

My guess: just because it's not preferred by sane-toolchain.inc?

>> I can also just add 4.4.4 and leave 4.4.3 as it is if someone wants
>> to keep using 4.4.3
>
> Using 4.4.3 here, think it'd be nice to move to 4.4.4.

what about updating
conf/distro/include/sane-toolchain.inc
to 4.4.4 if we don't find any new issue with it?

I haven't found any new issue with 4.4.3 (using it since it was
added), rebuilding images with 4.4.4 now.

Cheers,


