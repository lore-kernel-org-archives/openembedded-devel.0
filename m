Received: from [217.146.130.193] (helo=chlothar.bnv-bamberg.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ba0547@bnv-bamberg.de>) id 1LjhON-0003jj-En
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 23:04:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bnv-bamberg.de; s=mail2008; h=Subject:From:To:In-Reply-To:
	References:Content-Type:Date:Message-Id:Mime-Version:
	Content-Transfer-Encoding; bh=kZi1Ivut8AJvtyVjDjwoiLr/u2EG7nQkXH
	1J49uYP4k=; b=sdoTFWaLVdJM6qvw36nW20KGwNqd5Id3oEwe84xNsXiQrGmxAt
	F8F5v5F5NYAxOdwfihdNf7xrTx3opazLAk58hVesF3MRJEzGEoxi4EyEcWw3fXta
	uOMQjPVFOu4u8KrG/Va9vFtxk4z7X412ArWCk+glBwrLfkeLdidxlNcdg=
Received: from localhost ([127.0.0.1] helo=chlothar.bnv-bamberg.de)
	by chlothar.bnv-bamberg.de with esmtp id 1LjhNc-0004je-0z 
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 23:03:24 +0100
Received: from w3d50.w.pppool.de ([89.58.61.80] helo=[192.168.2.5])
	by chlothar.bnv-bamberg.de with esmtpa (Exim 4.69)
	(envelope-from <ba0547@bnv-bamberg.de>) id 1LjhNb-0004hI-4s
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 23:03:23 +0100
From: harald <ba0547@bnv-bamberg.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1236187501.10602.130.camel@andromeda>
References: <1236178967.4249.7.camel@debian.dorg.org>
	<1236187501.10602.130.camel@andromeda>
Date: Tue, 17 Mar 2009 23:03:12 +0100
Message-Id: <1237327392.18278.6.camel@debian.dorg.org>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 217.146.130.193
X-SA-Exim-Mail-From: ba0547@bnv-bamberg.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Tue, 17 Mar 2009 22:05:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

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

Hello,

now i have compiled a kernel with EABI/OABI support for my loox. it
workes with all precomiled images from angstrom org or
http://amethyst.openembedded.net/~koen/narcissus/

unfortunately it does not work for any kind of root image i created with
OE. none of those worked yet. i don't think that this is a problem of my
kernel now. the built in kernel of some rootfs images does also not
start and seems to hang with the same message/point.

hope someone will be able to help me. 

thanks.



