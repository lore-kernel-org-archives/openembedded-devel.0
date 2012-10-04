Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TJp8r-0007r3-5d
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2012 19:23:21 +0200
Received: from mail146-tx2-R.bigfish.com (10.9.14.249) by
	TX2EHSOBE015.bigfish.com (10.9.40.35) with Microsoft SMTP Server id
	14.1.225.23; Thu, 4 Oct 2012 16:25:00 +0000
Received: from mail146-tx2 (localhost [127.0.0.1])	by
	mail146-tx2-R.bigfish.com (Postfix) with ESMTP id 4D70C200F5;
	Thu,  4 Oct 2012 16:25:00 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -9
X-BigFish: VS-9(zz98dI9371I1432I11f6N14ffIzz1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441hbe9i1155h)
Received: from mail146-tx2 (localhost.localdomain [127.0.0.1]) by mail146-tx2
	(MessageSwitch) id 1349367897985169_17065;
	Thu,  4 Oct 2012 16:24:57 +0000 (UTC)
Received: from TX2EHSMHS044.bigfish.com (unknown [10.9.14.241])	by
	mail146-tx2.bigfish.com (Postfix) with ESMTP id EB2844C006B;
	Thu,  4 Oct 2012 16:24:57 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS044.bigfish.com
	(10.9.99.144) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 4 Oct 2012 16:24:56 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.88]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0309.003; Thu, 4 Oct 2012 11:24:56 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] External toolchain - Helloworld works but help needed
Thread-Index: AQHNokzKR7miDvj06Uad6ysWd4i61A==
Date: Thu, 4 Oct 2012 16:24:55 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6D8F92@039-SN1MPN1-002.039d.mgd.msft.net>
References: <CA+qOGFeWVKCCaU3VtJ50C9wEEQN9=EgTAUKO3qxBsfabi8QCaQ@mail.gmail.com>
In-Reply-To: <CA+qOGFeWVKCCaU3VtJ50C9wEEQN9=EgTAUKO3qxBsfabi8QCaQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "guerri.ma@gmail.com" <guerri.ma@gmail.com>
Subject: Re: External toolchain - Helloworld works but help needed
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
X-List-Received-Date: Thu, 04 Oct 2012 17:23:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CD7C274809AE3F4BBDD462D036550701@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 4, 2012 at 9:16 AM, Marco Guerri <gmarco.dev@gmail.com> wrote:
> Hi everybody,
>
> I'm having some troubles trying to get a working filesystem for a custom
> board based on a Freescale iMX35 SOC.
> I'm trying to integrate an external working toolchain+glibc (freescale)
> with OpenEmbedded. My problem is
> that I do not have a complete understanding of the whole toolchain
> management process done by OE. I anticipate
> that I can compile a working helloworld image which runs correctly on the
> hardware only if it is statically
> linked aginst the libc. With dynamic linking it does not work (in the cas=
e
> of helloworld: Kernel panic no
> init found) I think the problem is that I cannot find a way to deploy the
> libc into the filesystem (if I mount the fs
> image on my host of course there's nothing except a dynamically linked
> helloworld binary...).
>
> My local.conf reports these TOOLCHAIN related options:
>
> TOOLCHAIN_VENDOR =3D "-none"
> TOOLCHAIN_TYPE =3D "external"
> TOOLCHAIN_BRAND =3D "mtoolch"
> TOOLCHAIN_PATH =3D "/opt/freescale/usr/local/gcc-4.1.2-glibc-2.5-nptl-3"
> TOOLCHAIN_SYSPATH =3D
> "/opt/freescale/usr/local/gcc-4.1.2-glibc-2.5-nptl-3/arm-none-linux-gnuea=
bi"
>
> As far as I've understood, the important recipe in this case should be
> external-toolchain-mtoolch.bb. In particular:
>
>     - do_stage() should copy all the important libraries (libc) in the
> staging area in order to be able to
>     link correctly during the build process.

What OE are you using? do_stage seems to be depreciated.

-M

>
>     - do_install() should copy all the important libraries in the install
> area so that they can be
>     packaged and deployed in the filesystem.
>
> I'm stuck at the second point. Right now I manually carry out the first
> point (that is, I copy
> the libc and all the libraries in the staging area). I'm sure that this
> process works because all the binaries
> are correctly linked against the libc (even the tiny helloworld program
> which works on the hardware).
> I've tried to write a do_install method but I think I'm misunderstaing
> something: the do_install
> method is basically the following
>
> do_install() {
>
>         install -d ${D}${libdir}
>         install -d ${D}${base_libdir}
>         install -d ${D}${includedir}
>
>         cp -a
> ${TOOLCHAIN_PATH}/arm-none-linux-gnueabi/arm-none-linux-gnueabi/sysroot/v=
fp/lib/*
> ${D}${base_libdir}
>         cp -a
> ${TOOLCHAIN_PATH}/arm-none-linux-gnueabi/arm-none-linux-gnueabi/sysroot/v=
fp/usr/lib/*
> ${D}${libdir}
>         cp -a
> ${TOOLCHAIN_PATH}/arm-none-linux-gnueabi/arm-none-linux-gnueabi/sysroot/u=
sr/include/*
> ${D}${includedir}
> }
>
> The result is that everything is copied into
> build/work/i686-armv6-sdk-none-linux-gnueabi/external-toolchain-mtoolch-1=
.0-r3
> and not in build/work/armv6-none-linux-gnueabi, where all the stuff that =
is
> later deployed in the filesystem is copied. So
> I do not have a clear understaing of what is going on and if I'm using
> external-toolchain-mtoolch.bb properly or not.
>
> Any suggestion is appreciated, I've ran out of ideas but I do not want to
> give up at this point.
> Thank you very much.=



