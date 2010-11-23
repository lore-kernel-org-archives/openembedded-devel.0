Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PL2Lh-00019G-QO
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 00:32:34 +0100
Received: by wwb39 with SMTP id 39so344693wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 15:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=y3akN7qvdj4huo6ceoEzEp0SNJPA8hM+vQXZNrTtRIE=;
	b=EoLKbSYiv33MtLI5r0g46dQs8QxrFfEPNvd2jdhBr59zaftWMexkgv2IRxiSsvQYA8
	M0hfsb0FzPuw1R0saMWGuXrMYJxCJFl3EWJ/LT4VUoxTN5rGKqO5hxamVva6H0l1KMsB
	ptQ177vavnzLKCVsIpuGLhaxxG8CUycNnjAoU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dQ4UvOibdYUaMRy9PfSJ6O27QM+XALT2m1XWrf6hjSEbqSG0pKlymluZqJ03iGBZCj
	IPRr9Kr6X4LZ4eJ6/cLpB3YrHZkSReJujj8W9Px5/UemR0yNvo7f+mijG4T+B7dh7jvG
	Y51H2Ujn8EXx+KSDE/f3dPNFOS3YrehV+PRew=
MIME-Version: 1.0
Received: by 10.227.170.78 with SMTP id c14mr7878733wbz.49.1290555078963; Tue,
	23 Nov 2010 15:31:18 -0800 (PST)
Received: by 10.227.32.147 with HTTP; Tue, 23 Nov 2010 15:31:18 -0800 (PST)
In-Reply-To: <AANLkTi=1Whw8861UwjF=uqu4qteWwz2bDBDrnHCNsc9E@mail.gmail.com>
References: <4CEC4778.6070108@gmail.com>
	<AANLkTi=1Whw8861UwjF=uqu4qteWwz2bDBDrnHCNsc9E@mail.gmail.com>
Date: Wed, 24 Nov 2010 10:01:18 +1030
Message-ID: <AANLkTinsXW88Sgd7-RaBJDOsTDdz-DisV1+bkU7a1MRX@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Tue, 23 Nov 2010 23:32:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 24 November 2010 09:54, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Nov 23, 2010 at 3:00 PM, Graham Gower <graham.gower@gmail.com> wrote:
>>
>> In file included from core.c:32:
>> enums.h:3:1: error: unterminated #ifndef
>> In file included from core.c:40:
>> enum-map.i.c:867:1: error: unterminated argument list invoking macro "SCM_SMOB_PRINT"
>> In file included from errors.c:28:
>> enums.h:3:1: error: unterminated #ifndef
>>
>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>
> did you send this to gnutl upstream ml ? what do they have to say about it ?
> patch look ok to me though

Yes. See the link to the commit in my patch header.

ML post:
http://lists.gnu.org/archive/html/gnutls-devel/2010-11/msg00058.html


