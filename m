Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PGx0w-0006qn-Ux
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 18:02:19 +0100
Received: by yxn35 with SMTP id 35so339588yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 09:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=V0QPiPAReCqPdx02efRprzJVlwa8shpn6xcPt2tFUTM=;
	b=Y1mg4uxV8zCghf4Mz0J+9wjzvqcdn6C2CscebMP0ZPV2/efJ3hglxOTNSGtGdzNPIh
	XcJqwNE8vEusIkV56leCrNKIKafp8y/u50cttjsSlLRD+b8h6AnCIJZ/yOo1rR6jBaKL
	03Gc/DOr51qAX+9V1o1kGBV/aj4Lc2P0BRvk4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=BkO+XHEIOhpOgVFkt484LianYD8WDTiTyhE6fFSnKQ6MacJNSuMNwt0CqLYACBh7ut
	zdBYXn0EOq2wwTN2NL+ZK1B6LT0aWitficpYcPp71Dc9oPIVdnEwDOQtjKGSO5qLSpQe
	Wmgiw5oRHIHM0jUSszGIl7mJtf/U7SnEcwuac=
Received: by 10.91.47.38 with SMTP id z38mr3451753agj.129.1289581270233; Fri,
	12 Nov 2010 09:01:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Fri, 12 Nov 2010 09:00:49 -0800 (PST)
In-Reply-To: <4CDD2445.5050506@nedap.com>
References: <4CDD2445.5050506@nedap.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Nov 2010 09:00:49 -0800
Message-ID: <AANLkTinc9uEft4-qihyr0AAhaLjOa=VT+X1KfOHnU8gO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: alignment errors
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
X-List-Received-Date: Fri, 12 Nov 2010 17:02:19 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 12, 2010 at 3:25 AM, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> Hi,
>
> I'm working on a recipe for ptpd2.
> When I run it on my armv5te I get traps:
>
> [ 5034.410000] Alignment trap: ptpd2 (523) PC=0x0000e7cc Instr=0xe5870004
> Address=0x0001d459 FSR 0x801
>
> What is the best way to tackle this?
> Do I have to add "__attribute__ ((packed))" on critical places?
>

avoid them they are inefficient and will paper over the real problem.
As Holger suggest
take gdb help to debug the problem and then fix it accordingly.

> Thanks!
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


