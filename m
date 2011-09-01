Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bugraaydogar@gmail.com>) id 1Qz1H3-0006B4-1a
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 09:01:17 +0200
Received: by gxk3 with SMTP id 3so1095648gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 23:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=I9aZgkjRI38ELI+kies3kZMfL/+S+tVphPGKX2XTpnk=;
	b=oUJJgIktCmy3R/5iGpYxAJo57zpev5UcbowYrRSeRBkWus9O6PZg7NAy9qsSXFYfm6
	ztV0fOaqtCDHYp79Qnw56CP5w6Uh/+CmnJAPyBPShLiiGYhfWN8O/lVkUzMwX43m/pK3
	9DxhmrMNLxtmHRS3SQzzIWrDOgpjOb8pIKs6g=
MIME-Version: 1.0
Received: by 10.42.142.70 with SMTP id r6mr1157093icu.123.1314860179726; Wed,
	31 Aug 2011 23:56:19 -0700 (PDT)
Received: by 10.42.176.197 with HTTP; Wed, 31 Aug 2011 23:56:19 -0700 (PDT)
Date: Thu, 1 Sep 2011 09:56:19 +0300
Message-ID: <CAA1NafFmfiBzDCU2EOmECyaedVFsoH-4L+DHsq4cQ26jvnZ_qQ@mail.gmail.com>
From: =?ISO-8859-9?Q?Bu=F0ra_Aydo=F0ar?= <bugraaydogar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: How to customize Angstrom using OE?
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
X-List-Received-Date: Thu, 01 Sep 2011 07:01:17 -0000
Content-Type: text/plain; charset=ISO-8859-9
Content-Transfer-Encoding: quoted-printable

Hi,

I'm not a OE expert.I want to have deep understanding of OE's conf files.My
board is craneboard and i did standart distro and machine
configuration.(D=FDstro=3Dangstrom-2010.x,Machine=3Dam3517-crane)

I have two question for you.

1=3D>

I want to edit Angstrom and customize it for me.(Sth like own rootfs but
editing Angstrom for example i dont want qt thins in my rootfs ).When i dig
x11-gpe-image.bb, i couldnt find what they consist of.I thought i can be
angstrom-2010.x-preferred-versions but im not sure.As a result i want to
have a rootfs which doesn't consist qt libraries, how can i do it using OE
and Angstrom?

2=3D>

When i dig angstrom-2010.x.conf, i couldnt find any configuration  settings
about which linux kernel it will compile.It just tell
MACHINE_KERNEL_VERSION  2.6 and at bottom of angstrom-2010.x.conf  i saw

PREFERRED_PROVIDER_virtual/kernel_beagleboard =3D "linux-omap"
PREFERRED_VERSION_linux-omap_beagleboard =3D "2.6.39"
when i go linux-omap directory which is in recipes/linux, linux-omap  doesn=
t
contain craneboard.I made a search in /recipes/linux for craneboard,i found
it at /recipes/linux/linux-omap-psp-2.6.32, and images  which i created
realy use 2.6.32 linux kernel.But it writes nowhere in config files.Where i=
s
it? How oe goes there and takes that config file?
Confused....


Thanks
--=20
Bu=F0ra AYDO=D0AR
Kocaeli University
Electronic&Telecommunication Engineering
E-Mail:bugra.aydogar1.08@kocaeli.edu.tr
Phone: +905327306640

