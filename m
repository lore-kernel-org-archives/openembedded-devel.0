Received: from [85.37.16.24] (helo=smtpout23.attiva.biz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pisa.t@teledata-i.com>) id 1LU0N0-0008U3-FJ
	for openembedded-devel@openembedded.org; Mon, 02 Feb 2009 16:05:54 +0100
Received: from FBCMFE02B08.fbc.local ([192.168.30.96]) by smtpout23.attiva.biz
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Mon, 2 Feb 2009 15:57:53 +0100
Received: from [193.100.100.77] ([80.207.73.242]) by FBCMFE02B08.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 2 Feb 2009 15:57:50 +0100
From: Paolo Cremonese <pisa.t@teledata-i.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <49832BE7.6090801@gmail.com>
References: <1233059140.7818.4.camel@ubuntu2> <497F0D92.4040904@gmail.com>
	<1233136141.7444.3.camel@ubuntu2> <49802D8A.6020208@gmail.com>
	<1233227644.6517.5.camel@ubuntu2>  <49832BE7.6090801@gmail.com>
Date: Mon, 02 Feb 2009 15:57:59 +0100
Message-Id: <1233586679.6429.5.camel@ubuntu2>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-OriginalArrivalTime: 02 Feb 2009 14:57:50.0338 (UTC)
	FILETIME=[9E187E20:01C98546]
Subject: Re: Build problems
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
X-List-Received-Date: Mon, 02 Feb 2009 15:05:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fine, waiting for GRUB patch. (what is "hrw" ?)

My target has not hard disk, only CF.
To run the image, do I need a RAMFS ?
And in this case, I have to add it to the GRUB "menu.lst" ?


title		Test Minimalist Image Angstrom
root		(hd0,0)
kernel		/boot/bzImage-2.6.21
initrd		/boot/initrd.img root=3D/dev/ram0 rw init=3D/linuxrc



Ciao,
Paolo

On ven, 2009-01-30 at 17:33 +0100, Marco Cavallini wrote:
> > On mer, 2009-01-28 at 11:03 +0100, Marco Cavallini wrote:
> >> Paolo Cremonese ha scritto:
> >>> OK, I have built the image wihout errors, thank you.
> >>>
> >>> Now, what I have to do to create a bootable compact flash with the
> >>> image?
> >>>
> >>> Thanks in advance,
> >>> Paolo
> >> Paolo,
> >> I'm just working on a system like your, but with i486.
> >>
> >> 1. prtition your CF
> >> 2. format CF ext3
> >> 3. load (untar) yourimage.tar into CF
> >> 4. install bootloader (GRUB)[1]
> >>
> >> [1] GRUB build in OE is broken at the moment, I'm patching it ;-)
> >>
>=20
> GRUB patch is ready and should be pushed soon by hrw.
>=20
> Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
> --
> Marco Cavallini | KOAN sas | Bergamo - Italia
>  embedded and real-time software engineering
>    Atmel third party certified consultant
> Phone:+39-035-255.235 - Fax:+39-178-22.39.748
>       http://www.KoanSoftware.com
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



