Received: from mout.perfora.net ([74.208.4.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <charles.woloszynski@handheldmedia.us>)
	id 1NElnj-00005X-W6 for openembedded-devel@lists.openembedded.org;
	Sun, 29 Nov 2009 16:35:07 +0100
Received: from [10.0.1.199] (ip68-100-74-251.dc.dc.cox.net [68.100.74.251])
	by mrelay.perfora.net (node=mrus1) with ESMTP (Nemesis)
	id 0LkNil-1NplHr2dSt-00cMdI; Sun, 29 Nov 2009 10:20:47 -0500
Message-Id: <E70C26B4-5D20-4CEA-AC49-794CFEB6F6C3@handheldmedia.us>
From: Charles Woloszynski <charles.woloszynski@handheldmedia.us>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <1259505030.24812.8.camel@gregoire-laptop>
X-Mailer: iPhone Mail (7A400)
Mime-Version: 1.0 (iPhone Mail 7A400)
Date: Sun, 29 Nov 2009 10:20:38 -0500
References: <mailman.3.1259492402.612.openembedded-devel@lists.openembedded.org>
	<1259505030.24812.8.camel@gregoire-laptop>
X-Provags-ID: V01U2FsdGVkX1+8erOPr9rAAjE+EBWoTdwycQp8NaiZ5N+5RhJ
	c7EGqYhB8AA+Ps4FXo84kgfSVOvvVIdhjSyUqBndLNbLVtAXzZ
	DdaqBX8fItU38FmwzUcMQsz+8p08R4CvEVcfHCA0z7VN6yYBZT fOQ==
X-SA-Exim-Connect-IP: 74.208.4.194
X-SA-Exim-Mail-From: charles.woloszynski@handheldmedia.us
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Initramfs and kernel
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
X-List-Received-Date: Sun, 29 Nov 2009 15:35:07 -0000
Content-Type: text/plain;
	charset=utf-8;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: quoted-printable

Why does your initramfs depend on the kernel?  Are you using kernel  
modules in the initramfs?

I thought the idea of initramfs was to decouple the kernel from the  
Filesystem image AMAP.

Trying to learn from your adventure (since I plan to use an initramfs  
on the future)

Charlie
On Nov 29, 2009, at 9:30 AM, Gregoire Gentil <gregoire@gentil.com>  
wrote:

> Hello,
>
> I'm building an initramfs image for a beagleboard-like platform. I
> managed to make it work but I have a kind of circular dependency,
> meaning:
>
> I build initramfs (which depends kernel), I add to the .config of  
> kernel
> the path of the initramfs.cpio.gz, then I need to rebuild the kernel  
> to
> have the initramfs inside the uImage...
>
> I obviously don't do it right. How is initramfs supposed to work in  
> OE?
>
> Gr=C3=A9goire
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


