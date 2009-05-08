Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2F5P-0002D6-8L
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 03:41:15 +0200
Received: by an-out-0708.google.com with SMTP id b6so659578ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2009 18:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=lQ9q1HWZ27KXT5lUeqPjqE0oLmhBQzv4MYOhyDpucMU=;
	b=rMcDyq+iLuAii1z8xdzBvjvHFlST0ZzklZdcpAWLXsoCb47zgnEfmV2kmQWzDW2b0H
	tQpvK+CXWRhQtqNVFLUUoUbtzqdJiZBIa0kAvN4Ur+0txZ8m2mDP9hVGsMHgiLH3PkK8
	D3tEOD4mtAZczWuqaPfAdPUfPr3EqhkepM/iA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=EDuyRuRfm/3H8RCsZoibEng4aLZuoahpdn9FFhZVYCCW7R5rnuiGnVPlENfHeHQGGL
	LJkhBoypsCZGTzx91CGd22cNPX8U4OpIp8GfmPhL4NMX1GekoEwI9Yvj8pmuCnQJkIhb
	Vo/GxXsNIcpOnvP1VGNru0UInP9s3q843Op0E=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.153.6 with SMTP id a6mr7143247ane.66.1241746505615; Thu, 
	07 May 2009 18:35:05 -0700 (PDT)
In-Reply-To: <4A035FAB.4040405@cbnco.com>
References: <4A03277B.1090402@cbnco.com>
	<1241720835-17998-1-git-send-email-msmith@cbnco.com>
	<1241720835-17998-2-git-send-email-msmith@cbnco.com>
	<c384c5ea0905071218v3978ea4cpe791a5283f05c2df@mail.gmail.com>
	<be7a9f3d0905071226m78b94d44u50a4e63c927200f5@mail.gmail.com>
	<4A033D54.2000709@cbnco.com>
	<c384c5ea0905071305s1b180deal8c5fd09b5d646308@mail.gmail.com>
	<4A035FAB.4040405@cbnco.com>
Date: Thu, 7 May 2009 22:35:05 -0300
X-Google-Sender-Auth: 78fc9136ae7c602f
Message-ID: <be7a9f3d0905071835x5d551897l84bf64f9133c13e4@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/3] grub: use ${libdir}, not /usr/lib
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
X-List-Received-Date: Fri, 08 May 2009 01:41:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Michael,

On Thu, May 7, 2009 at 7:24 PM, Michael Smith <msmith@cbnco.com> wrote:
> I'd prefer not to work with grub2 for now. From the website, it looks like
> it might still be a bit alpha. Grub 0.9x is also alpha, but at least I've
> already learned some of its secrets. :)

Not really; it is the probably choice of Debian for next release and
it has few missing features[1] only. It adds much nice features and is
a more clear codebase.

1. http://wiki.debian.org/GrubTransition

Besides that all, I'd choose grub2 since no feature that we're going
to use at an embedded system is missing and upstream is open for
contributions for it. In grub (they call it grub-legacy) we need to
handle the patches by ourselfs and that is one of the main reasons
(besides other more technical) that Debian is going to move from GRUB
to GRUB2 ASAP.

I'd say that technically speaking grub2 is the right choose for OE
since it will demand less work to maintain and keep it up to date.

My 2c.
-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


