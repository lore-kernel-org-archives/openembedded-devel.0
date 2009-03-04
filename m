Received: from [217.146.130.193] (helo=chlothar.bnv-bamberg.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ba0547@bnv-bamberg.de>) id 1LewpB-0004SI-PC
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 20:32:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bnv-bamberg.de; s=mail2008; h=Subject:From:To:In-Reply-To:
	References:Content-Type:Date:Message-Id:Mime-Version:
	Content-Transfer-Encoding; bh=IRPKiXh3RWRWMM+jpYxZGXayybnM1swcFH
	tb5pKS2Bc=; b=I2VQLedSI+o7X1gUrbKNureHSK50Vr1uzZcvitZYMpZdbQXIL/
	FW4V+IG6q96lcnSj8z7ttCeTbqoV0fhGyZRf5ZyEDae1xZPjGiUkw8IR2AWFpEZO
	8WBd4Zby5YWPnqSP571Te2UjBU+rKAZAPjiI7aKNim74JhsUCdY7+wkkU=
Received: from localhost ([127.0.0.1] helo=chlothar.bnv-bamberg.de)
	by chlothar.bnv-bamberg.de with esmtp id 1Lewl6-0005yM-FK 
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 20:28:00 +0100
Received: from w0659.w.pppool.de ([89.58.6.89] helo=[192.168.2.3])
	by chlothar.bnv-bamberg.de with esmtpa (Exim 4.69)
	(envelope-from <ba0547@bnv-bamberg.de>) id 1Lewl6-0005vE-4E
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 20:28:00 +0100
From: harald <ba0547@bnv-bamberg.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1236187501.10602.130.camel@andromeda>
References: <1236178967.4249.7.camel@debian.dorg.org>
	<1236187501.10602.130.camel@andromeda>
Date: Wed, 04 Mar 2009 20:27:56 +0100
Message-Id: <1236194876.4249.16.camel@debian.dorg.org>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Linux/Opie/Angstroem on Fujitsu Siemens Loox 420
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
X-List-Received-Date: Wed, 04 Mar 2009 19:32:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hello,

this cannot be enabled while using a gcc version below 4.0. The
following text is in kernel help 

"Use the ARM EABI to compile the kernel (AEABI)

This option allows for the kernel to be compiled using the latest
ARM ABI (aka EABI). This is only useful if you are using a user
space environment that is also compiled with EABI.

Since there are major incompatibilities between the legacy ABI and
EABI, especially with regard to structure member alignment, this
option also changes the kernel syscall calling convention to
disambiguate both ABIs and allow for backward compatibility support
(selected with CONFIG_OABI_COMPAT).

To use this you need GCC version 4.0.0 or later."

Used the kernel which was built together with "opie-image", did not yet
look if this feature is enabled in this kernel.

Regards, Harald.

Am Mittwoch, den 04.03.2009, 18:25 +0100 schrieb Michael 'Mickey' Lauer:
> Am Mittwoch, den 04.03.2009, 16:02 +0100 schrieb harald:
> > managed to build a complete opie-image with
> > openembedded. Read that my Fujitsu Siemens Pocket Loox is very similar
> > to HP Ipaq 4000. So i built system for this machine type. Unfortunately
> > the system does not start througth. It hangs after "freeing init
> > memory:88k", then some lines appear with some bluetooth informations.
> > That's all.
> 
> Sounds like an EABI/OABI kernel/userland problem. Make sure your kernel
> contains the ABI support you build userland with.
> 



