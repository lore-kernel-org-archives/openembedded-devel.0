Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SbcbL-0001XO-Ck
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jun 2012 21:06:17 +0200
Received: by wibhm14 with SMTP id hm14so2787372wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2012 11:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:mime-version:content-type:subject:date:in-reply-to:to
	:references:message-id:x-mailer;
	bh=LWvu9PCJ1uEXaN7nC8D2Q3/8Go6mZVQjGvw2M9jXLdc=;
	b=bTGJYWWl3xdp9vp2n3VpCYEB9cXC3YcancIqjO8Gk8ZDOhpGTZP1RikxJ2NE+QYTA5
	uVM7UGYVCOed1iyjMajXlA5enesNEN98nLyg2bHL4Xfv/2BopSo77m0DS8FwHqBsXF7m
	TjPt7q48Cm6MisVC6Ork68KkQzdZz1ExKBfZDVbr5eA9pqPHa9Jr+RyIC2kysdl91d2N
	UFcPrsYiViwTcWbyE+wWLMokqmeFBu6fwOQ7Y5aQJc5UksCh6oRaeiXjLUAvlL7NRDXj
	36E6oxWJMYHKw55mzrEoLKHbfUuy43UwDNNWQwsEjaD+geTq72Y5xm8DrfNd5dSugRbE
	WUbA==
Received: by 10.216.213.28 with SMTP id z28mr11841543weo.50.1338836127061;
	Mon, 04 Jun 2012 11:55:27 -0700 (PDT)
Received: from [192.168.1.36] (1.Red-83-60-183.dynamicIP.rima-tde.net.
	[83.60.183.1])
	by mx.google.com with ESMTPS id ei4sm34887377wid.5.2012.06.04.11.55.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 11:55:25 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1278)
Date: Mon, 4 Jun 2012 20:55:23 +0200
In-Reply-To: <CAMKF1spRxzbVgiSev063fjBnPfurPAs45crPXq6kogZP8QuQYQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <D40848EB-C66A-47B6-B3C0-CF743A8E032A@gmail.com>
	<CAMKF1srC1uxpT1+Z_LqRUagFhxStZb30ZU10wrRtAReSSR7_zg@mail.gmail.com>
	<77A5818E-F77E-4215-939B-882BC738EB65@gmail.com>
	<CAMKF1spRxzbVgiSev063fjBnPfurPAs45crPXq6kogZP8QuQYQ@mail.gmail.com>
Message-Id: <9496B4CA-EB17-4618-8711-09ED61FF6A3D@gmail.com>
X-Mailer: Apple Mail (2.1278)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Understanding what qemuppc emulates and getting it to emulate a ppc440 CPU
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
X-List-Received-Date: Mon, 04 Jun 2012 19:06:35 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Jun 4, 2012, at 8:37 PM, Khem Raj wrote:
>=20
> OK try it out then you just need to select right machine (-M xxx) and
> params if any. If upstream support for this platform is sound
> then you are good to go.
>=20
> look under scripts/runqemu* scripts and add this variant you need.

Do you know if qemu can accept other type of images for the kernel
and rootfilesystem?

At the moment, my yocto core-image-minimal and=20
core-image-sato builds the following files, if I first
build with machine ?=3D "virtex5", and then subsequently
with machine ?=3D "qemuppc"

core-image-minimal-virtex5-20120603201342.rootfs.tar.gz
core-image-minimal-virtex5-20120604073552.rootfs.tar.gz
core-image-minimal-virtex5.tar.gz
core-image-sato-qemuppc-20120604085337.rootfs.ext3
core-image-sato-qemuppc-20120604085337.rootfs.tar.bz2
core-image-sato-qemuppc.ext3
core-image-sato-qemuppc.tar.bz2
core-image-sato-virtex5-20120603205954.rootfs.tar.gz
core-image-sato-virtex5-20120604074303.rootfs.tar.gz
core-image-sato-virtex5.tar.gz
modules-3.0.0-14.1-build3-r16-virtex5.tgz
modules-3.2.11-yocto-standard-r1-qemuppc.tgz
README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
u-boot-virtex5.bin
u-boot-virtex5-v2012.04.01-r16.bin
uImage
=
uImage-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r16-virtex5-=
20120604073552.bin
=
uImage-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r16-virtex5-=
20120604073552.dtb
uImage-virtex5.bin
uImage-virtex5.dtb
vmlinux
=
vmlinux-3.2.11+git1+49f931bc294d5b6be60502bbd448cff5aa766235_1+cf3e188cf2a=
18c48a0e6f9ca54c36e6ac39512ec-r1-qemuppc-20120604085337.bin
vmlinux-qemuppc.bin

Is it possible to use uImage-virtex5.bin for the kernel image and =
core-image-minimal-virtex5.tar.gz as the kernel image and =
rootfilesystem, instead of vmlinux-qemuppc.bin and =
core-image-sato-qemuppc.ext3 ?

Best regards,

Elvis Dowson



