Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rk.raggit@gmail.com>) id 1NXvdq-0003uT-BV
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 12:56:05 +0100
Received: by pwi4 with SMTP id 4so3807544pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 03:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=tCZZ+Dy/7RSJ3QRCYHS6bbAaxbb2+DN/pCEr9FLWj3M=;
	b=Ft9dw5WYpPUSavewO0T02PFU7kI7gbUM4Mdq8JJVTXyHrMSmaUxkMQhEDjFj6TilX6
	V2Ow4gPeZB/RUaEK2yKW4lSi4/kQ4XMHD1J6zjHhznlLOPlZ/aAepADmkCVyYk+jaVnl
	FN7Blnl7J1hGVbpwWLVFeUZUJydK2/DHbchDY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tReMzwzIRkJDIFaWd4nX8Ontoq5Aundu2XJ5bvx2dgXVcPfEyASjmKx5Vp+zQJUw5L
	nLKaDDiZaazwr/YrDGQREshD90z6TnIStHbJSD8sdrbt+IoloI/zHccyrD7l0mM1/ExK
	BdW/78TYdViblhTx6l1FEHyqv8RuV2343r9TY=
MIME-Version: 1.0
Received: by 10.141.22.20 with SMTP id z20mr987785rvi.23.1264074824633; Thu, 
	21 Jan 2010 03:53:44 -0800 (PST)
In-Reply-To: <19c1b8a91001201656g6fd1751bvc2a478b2d4c9ef8c@mail.gmail.com>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
	<19c1b8a90912092118o54903eb4v4044e2c1191617c8@mail.gmail.com>
	<ec1f3d400912100300l42da9902wee299ca7bd27e6bb@mail.gmail.com>
	<19c1b8a90912100944g4b405319v6e121ebf03449f0b@mail.gmail.com>
	<ec1f3d400912110347x365c0873i9d03b58d02cbf735@mail.gmail.com>
	<19c1b8a90912110925k5e8063b7wdc160af7eb29fb2a@mail.gmail.com>
	<ec1f3d401001050143o2cdfb989x119ea3dd6352f4ed@mail.gmail.com>
	<19c1b8a91001050954m5f002c66s7a282c1382a2dcea@mail.gmail.com>
	<ec1f3d401001200350g9fb8480h1ed53a8ee4a90e0@mail.gmail.com>
	<19c1b8a91001201656g6fd1751bvc2a478b2d4c9ef8c@mail.gmail.com>
Date: Thu, 21 Jan 2010 17:23:44 +0530
Message-ID: <ec1f3d401001210353j1802eb6am9d931438e3db1302@mail.gmail.com>
From: RK Raggit <rk.raggit@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: rk.raggit@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: cortex-a9 build failure at glibc
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
X-List-Received-Date: Thu, 21 Jan 2010 11:56:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> you can boot into static dash and then debug the dynamic loading problem.
> or you could build kernel with debug support and enable debug user_debug=
=3D-1
> on kernel commandline if there are any crashes it should print them.
>
> i enabled user_debug and see this on console -

VFS: Mounted root (ext2 filesystem).
Freeing init memory: 92K
|=FCxsh (1): undefined instruction: pc=3D4000673c
Code: 1a000002 e594e060 e35e0000 1a0001d0 (ed5b0b23)
I see the same error when init=3Dlinuxrc and when init=3D/bin/sh. It looks =
like
some shared library linked to busybox might be causing the problem. I need
to debug further.

--RK

