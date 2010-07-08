Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OXAvW-0006IW-4M
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 12:35:26 +0200
Received: by iwn34 with SMTP id 34so2033608iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 03:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=MA6JDzEnLvV6qE3V1sZYd5RGD4UCAm8AEJn4CyE/PC4=;
	b=M2bqcWc2GV13xaNYc2fs25aIc+IF6DEj4vdfLDA5OIZsIDy38E+IL9lug5q0isV7RH
	MQsNTIUyckf+/dzbBKPSBEqh5wa0a/CtwoVHLFAQHq1yfmtDq5fKDG8togteTJe6duwV
	Bnu6Blmn5Qdglh6tsSWHrtTR0sFRJOjR8K1xs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=wA6HntIJ3RyFvvWlUi+rN+vuemC22UNvKW8h7Axj2q0xfOtgrvt8wSxeZy2X06DaMj
	D1KGAHMr/6S7o01WMO64Oup42dxkr6TLj25iS5QZ0Yo2dwi1VDLV4mWQpeCVXMRAgAbz
	iBvhIw4bM0smw5L8hUTsaFoOhl9dheIErTEsE=
Received: by 10.231.160.17 with SMTP id l17mr3305743ibx.102.1278624689102; 
	Thu, 08 Jul 2010 14:31:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 8 Jul 2010 14:31:09 -0700 (PDT)
In-Reply-To: <1278624574.15825.30.camel@lenovo.internal.reciva.com>
References: <1278444743-4924-1-git-send-email-rep.dot.nop@gmail.com> 
	<1278444743-4924-4-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTimnWBxCFMLlns8Q8LJ-3BvpWqqTNkqZ8ZlWbQdo@mail.gmail.com> 
	<1278622050.15825.18.camel@lenovo.internal.reciva.com>
	<AANLkTinf_zr9QQdPJyevN-ve62_Pqi3WDNygAgABPt32@mail.gmail.com> 
	<1278624574.15825.30.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jul 2010 14:31:09 -0700
Message-ID: <AANLkTikn4ygx6v-P4WvZWHvxD9rQAq5kyDuMdolDPbdn@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][v3 3/4] uClibc: redo configuration
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
X-List-Received-Date: Fri, 09 Jul 2010 10:35:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 8, 2010 at 2:29 PM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2010-07-08 at 14:03 -0700, Khem Raj wrote:
>> If I am not wrong you can still do interworking and not have bx (using
>> mov pc,lr)
>
> That's not an interworking instruction in ARMv4T, and I don't think it
> is in ARMv5TE either. =A0You might be thinking of pop {pc}, which is
> interworking in ARMv5TE, but even this is not interworking in v4t.

tst lr, #1
moveq pc, lr
bx lr

Thats how its done on armv4 for EABI

>
> p.
>
>
>


