Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TTXoM-0001Cb-W2
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:54:24 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so569465dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 05:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=3VEWxjQp5opl+zDgxRJYWni94+N3aPizHyuRMAvkpfY=;
	b=BYuADZTcu8jGi9ccIQD9/uzBSY0j5zUhzw0IJqMbifztOT2wzz8bIzTQlcTXmAvuRt
	yjAEYZ02uWb1nK9fRiBNT8Y124QjTjqFW5YJHaV0M5ifFoU2zPRHxo6Oz0Cq+GAwqLWy
	8/siNvI/CdTQHGnKU1mRo01nkJM4tuvnDMvcZHkU2V2KmdgshvQpvLecJ9Zy9X9Q+moo
	xlbs/tNjKLkz6t0jRIC4hTIup+aQ8eaGHEi9w6PDWvuFx125J0lJM8iEPFUOa49ocWec
	D9Oq46zUl+pQs9TJbTkPB4CI+qAHgKmFfnH3Z1a5vC70QU2SOE4s9tk/7T9zKCcG+FDc
	y4KQ==
MIME-Version: 1.0
Received: by 10.68.224.161 with SMTP id rd1mr114054681pbc.49.1351687244980;
	Wed, 31 Oct 2012 05:40:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Wed, 31 Oct 2012 05:40:44 -0700 (PDT)
In-Reply-To: <1351687105.13864.110.camel@phil-desktop>
References: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
	<50910EFB.7010804@gmail.com>
	<1351685486.13864.97.camel@phil-desktop>
	<50911500.6010207@gmail.com>
	<1351685961.13864.101.camel@phil-desktop>
	<CAP9ODKq=8EwPNT3wqGAnVuweEj4wwYNGKLhhzHUaP0H-gRSnQg@mail.gmail.com>
	<1351687105.13864.110.camel@phil-desktop>
Date: Wed, 31 Oct 2012 10:40:44 -0200
X-Google-Sender-Auth: lUxNisAxMVBdcOxMl6JE9k_Cr4A
Message-ID: <CAP9ODKohF_YouEkj9pSGGJ2ePLSYL30m6XRq270Hp-oD5LJn_Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 1/3] meta-systemd: Move ntp recipes to 'meta-networking' sublayer
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
X-List-Received-Date: Wed, 31 Oct 2012 12:54:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 31, 2012 at 10:38 AM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2012-10-31 at 10:29 -0200, Otavio Salvador wrote:
>> Well, I cannot ask for a pool zone for OE or Yocto; it'd be good but
>> it is not yet done and I prefer to have it merged and changed once it
>> happens.
>
> The obvious problem with that approach is that "it" may never happen
> (especially if you're relying on some as-yet-unidentified third party to
> do the work) and, even if it does, arbitrarily many people might ship
> the broken configuration in the meantime.  Merging a change that we know
> is wrong seems like a bad plan.

It is better then a broken .service file IMO ;-)

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


