Received: from [85.33.31.84] (helo=smtpout084B.attiva.biz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pisa.t@teledata-i.com>) id 1LSUyh-0008AC-OU
	for openembedded-devel@openembedded.org; Thu, 29 Jan 2009 12:22:35 +0100
Received: from FBCMFE02B19.fbc.local ([192.168.31.237]) by
	smtpout084B.attiva.biz with Microsoft SMTPSVC(6.0.3790.1830); 
	Thu, 29 Jan 2009 12:14:57 +0100
Received: from [193.100.100.77] ([80.207.73.242]) by FBCMFE02B19.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 29 Jan 2009 12:13:51 +0100
From: Paolo Cremonese <pisa.t@teledata-i.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <49802D8A.6020208@gmail.com>
References: <1233059140.7818.4.camel@ubuntu2> <497F0D92.4040904@gmail.com>
	<1233136141.7444.3.camel@ubuntu2>  <49802D8A.6020208@gmail.com>
Date: Thu, 29 Jan 2009 12:14:04 +0100
Message-Id: <1233227644.6517.5.camel@ubuntu2>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-OriginalArrivalTime: 29 Jan 2009 11:13:51.0924 (UTC)
	FILETIME=[AA863F40:01C98202]
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
X-List-Received-Date: Thu, 29 Jan 2009 11:22:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

OK, I done all but GRUB.

My CF is connected through an USB adapter, and is seen as /dev/sdb

I can navigate into the filesystem.

I try to install GRUB using

sudo grub-install /dev/sdb

but the answer is

/dev/sdb does not have any corresponding BIOS drive.

Do I have necessarly to connect the CF using an IDE port?

Thanks in advance.

Ciao,
Paolo


On mer, 2009-01-28 at 11:03 +0100, Marco Cavallini wrote:
> Paolo Cremonese ha scritto:
> > OK, I have built the image wihout errors, thank you.
> >=20
> > Now, what I have to do to create a bootable compact flash with the
> > image?
> >=20
> > Thanks in advance,
> > Paolo
>=20
> Paolo,
> I'm just working on a system like your, but with i486.
>=20
> 1. prtition your CF
> 2. format CF ext3
> 3. load (untar) yourimage.tar into CF
> 4. install bootloader (GRUB)[1]
>=20
> [1] GRUB build in OE is broken at the moment, I'm patching it ;-)
>=20
> Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
> --
> Marco Cavallini | KOAN sas | Bergamo - Italia
>  embedded and real-time software engineering
> Phone:+39-035-255.235 - Fax:+39-178-22.39.748
>       http://www.KoanSoftware.com
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



