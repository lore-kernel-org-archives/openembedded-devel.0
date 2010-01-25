Received: from mail-iw0-f197.google.com ([209.85.223.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NZIbD-0006DS-8w
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 07:39:03 +0100
Received: by iwn35 with SMTP id 35so1030567iwn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 22:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=q/1y8/m7FPmdvANJ6oypc6fAju85wCYhwDJH8+/hc1w=;
	b=EC2228ENSa93wMXWn8qI7viRTG7uiYZFHWBn2dt/lZ39lGXiZXPjuWLnq0ZibtZ7rm
	u0s4u+w9IUQJb1mKgYX6gnGvvlORkIDfP7/uyn+dfKtY8k5D9E9tD6/5ZG60w62AmOvn
	ACEGDddP+JpniHZYl0CM9Yo8BHzA4kikRFQ7g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=peill0k2c8/RHb8ksUamfNLDxhBwNgJUikGx+IX/HMADUI7QNGZwOksXRCFXVO3NhQ
	0U/qQ7+CptTe//ALPn5XyrzDjoz2cRhSxNXiPmBDD69GqsuyFi5Sn7/HGTD4R8Ul1BSp
	tKbteYdkD/cSk8fWwPqNbzTbFQTBZarZ4nc1M=
MIME-Version: 1.0
Received: by 10.231.151.207 with SMTP id d15mr2508071ibw.44.1264401398769; 
	Sun, 24 Jan 2010 22:36:38 -0800 (PST)
In-Reply-To: <op.u60m9axmmn1qzu@guohr-laptop-ubuntu>
References: <op.u60m9axmmn1qzu@guohr-laptop-ubuntu>
Date: Sun, 24 Jan 2010 22:36:38 -0800
Message-ID: <19c1b8a91001242236w53852eb2s8ef6dfbeb0ac57e3@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.197
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: linux-titan-sh4-2.6.21: offset to unaligned destination error when compiling linux-titan-sh4 kernel
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
X-List-Received-Date: Mon, 25 Jan 2010 06:39:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 23, 2010 at 6:45 PM, Guo Hongruan <camelguo@gmail.com> wrote:
> Hi guys:
> =A0I tried to compile openembedded using the following configuration:
> MACHINE=3Dtitan
> DISTRO=3Dmicro
> LIBC=3Deglibc
> =A0When compiling linux kernel. I met the lots of errors like below:
> | =A0 CC =A0 =A0 =A0lib/random32.o
> | {standard input}: Assembler messages:
> | {standard input}:460: Error: offset to unaligned destination
> | make[2]: *** [net/802/psnap.o] Error 1
>
> Has anyone ever built kernel for titan machine successfully?

I have only tried toolchain builds which worked. Care to provide a preproce=
ssed
file in  a   bug report ?

>
> Thanks a lot!
>
> --
> Guo Hongruan, Embedded Linux Consultant
> Skype: camelguo
> Twitter: camelguo
> http://www.gulessoft.co
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


