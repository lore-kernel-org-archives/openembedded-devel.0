Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PL3NI-0002PT-V2
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 01:38:27 +0100
Received: by yxd5 with SMTP id 5so5570969yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 16:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=WTAh/ZACdyICm6HhxKcV9PkfdKojOimpl4tbC6X5Uy8=;
	b=egycoaACS6DE05bsj1eXKI6h5cCgQCK8NxU0QQ0W1UowVC18EGhVZDWABclqWTar1M
	haktHGzbpIS1EUTYZfD+hyFrErMzIBH//rP14bWLaiYygKTg4b9SMRk1T1V/jeYZETte
	FvkkRaOT+T1BZycbUf+SV/bDFA/0oGYEWULnk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=XG6AhXjSA7/b6ZrQIPqFMWbpRS70AvNobeDH4QLEIH17ynNPQQkwa2Xqf++vwvE127
	p/aM3BkwJJSKohY7tx9sO+ebOV9YgsnTgLSxOA7ErJgv0cuQPGhEMy/IGxHDPYYtGAi/
	r2THoI+2SRn5yp1c9NA/wFtLgKVfYTbyavefQ=
Received: by 10.90.99.8 with SMTP id w8mr9681403agb.0.1290559019033; Tue, 23
	Nov 2010 16:36:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 23 Nov 2010 16:36:38 -0800 (PST)
In-Reply-To: <AANLkTinsXW88Sgd7-RaBJDOsTDdz-DisV1+bkU7a1MRX@mail.gmail.com>
References: <4CEC4778.6070108@gmail.com>
	<AANLkTi=1Whw8861UwjF=uqu4qteWwz2bDBDrnHCNsc9E@mail.gmail.com>
	<AANLkTinsXW88Sgd7-RaBJDOsTDdz-DisV1+bkU7a1MRX@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Nov 2010 16:36:38 -0800
Message-ID: <AANLkTimr1sRm5jdFNo4Cbw0SHXk_KX96CtWVHzJxyYtS@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gnutls_2.10.2.bb: Fix parallel build failure.
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
X-List-Received-Date: Wed, 24 Nov 2010 00:38:27 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 23, 2010 at 3:31 PM, Graham Gower <graham.gower@gmail.com> wrote:
> On 24 November 2010 09:54, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Nov 23, 2010 at 3:00 PM, Graham Gower <graham.gower@gmail.com> wrote:
>>>
>>> In file included from core.c:32:
>>> enums.h:3:1: error: unterminated #ifndef
>>> In file included from core.c:40:
>>> enum-map.i.c:867:1: error: unterminated argument list invoking macro "SCM_SMOB_PRINT"
>>> In file included from errors.c:28:
>>> enums.h:3:1: error: unterminated #ifndef
>>>
>>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>>
>> did you send this to gnutl upstream ml ? what do they have to say about it ?
>> patch look ok to me though
>
> Yes. See the link to the commit in my patch header.
>
> ML post:
> http://lists.gnu.org/archive/html/gnutls-devel/2010-11/msg00058.html

super. Just wanted to confirm.

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


