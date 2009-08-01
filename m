Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MXBO4-0006hQ-HK
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Aug 2009 12:00:24 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1254361qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Aug 2009 02:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ZgFMx7AgjMXCc3wPb00ckSZVRXUKlZXGQsP7H2gaf2A=;
	b=kQz1yBZXhezfGd8azBiJCsYFNF6JP6SXaIHOboVc3NlfKYahDByJdWXVcFlmTOxd2t
	1edOxfry877/gyZxwVi1AFIOlklBbyA2Gu2Edm3jUgFZ+uNsbr0lQeIrdrqwVr36+Jh8
	0+1BJin2Yr9ikAy33OzHbsia6hCCdNKUhtwh0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xKNh34eZkiZ0pvtvTcO1lb8WCnPkCFY9+M37zbFsvWAQ5ZUcCGItW6PKtMhvMXDMGP
	O7XTzY8Zcf2B9YnyOX+CK2s8rSVLnRV5zyVYkmgrql1MYaDsyV4JIK3hlOb07nnEXr9c
	JMNU+dXsTDw2QVaSV4tIsAIJuhye801ebSBQs=
MIME-Version: 1.0
Received: by 10.229.95.4 with SMTP id b4mr652706qcn.40.1249119912181; Sat, 01 
	Aug 2009 02:45:12 -0700 (PDT)
In-Reply-To: <200907311524.44818.marcin@juszkiewicz.com.pl>
References: <4A6FD077.1060001@gmail.com> <4A72D676.6060304@xora.org.uk>
	<6ec4247d0907310535h345a22a9sfe98c6cae8336aaf@mail.gmail.com>
	<200907311524.44818.marcin@juszkiewicz.com.pl>
Date: Sat, 1 Aug 2009 19:15:12 +0930
Message-ID: <6ec4247d0908010245y69aa6830n36f9ceca0e9211ff@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] remove duplicated code from linux.inc
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
X-List-Received-Date: Sat, 01 Aug 2009 10:00:24 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

2009/7/31 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:
> Dnia pi=B1tek, 31 lipca 2009 o 14:35:19 Graham Gower napisa=B3(a):
>> And for those playing at home, the value to assign to UBOOT_ENTRYSYM

Of course, that should have read UBOOT_ENTRYSYMBOL.

>> for a given arch can be found by grepping
>> linux/arch/${ARCH}/kernel/vmlinux.lds.S for 'ENTRY'.
>
> So according to your post for ARM it will be 'stext':
>
> 15:10 hrw@home:linux-2.6.30$ grep ^ENTRY arch/arm/kernel/vmlinux.lds.S
> ENTRY(stext)
>
> For AT91SAM9263-EK we get:
>
> 15:10 hrw@home:linux-2.6.30$ arm-angstrom-linux-gnueabi-nm vmlinux|grep
> stext
> c0008000 T _stext
> c0008000 T stext
>
> But when I boot this device I have:
>
> ## Booting kernel from Legacy Image at 22200000 ...
> =A0 Image Name: =A0 Angstrom/2.6.30/at91sam9263ek
> =A0 Image Type: =A0 ARM Linux Kernel Image (uncompressed)
> =A0 Data Size: =A0 =A02074384 Bytes =3D =A02 MB
> =A0 Load Address: 20008000
> =A0 Entry Point: =A020008000
> =A0 Verifying Checksum ... OK
> =A0 Loading Kernel Image ... OK
>
> So entry point is different.

Yes, the linux kernel links to a virtual address. If u-boot leaves the
MMU disabled on your platform then you will need to use a physical
address. I haven't checked u-boot to see if this is common or not.

Does the resulting uImage with entry point c0008000 boot for you?

-Graham


