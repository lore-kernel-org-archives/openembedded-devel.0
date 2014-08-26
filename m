Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id AC67370EE6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Aug 2014 16:38:04 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id et14so23449888pad.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Aug 2014 09:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y+7vQwftV9cpUrNAnfMQLBRrhQ95DeiJI/6klIu+2iw=;
	b=ygbw1jVyxGtiRhU6eI4U32psqbxbbMQ2WLynp22NfedDp2oPfpohdGzxZ0QGoG1NpP
	ZkPmSeS1WlTT/ABiiYL/gk0z8wp2kaIJbUE9DHz7RcImW7KEPi3kRu45MY9aaZ9TZhr8
	a6t+U00MAELx5mWH0olp5r5Dmp6I9goBazNOZkSggZXwRhsqTklmKQp+RudOuHLtt9No
	4vKLwELV8Cyg386bKJgIPCx7ZCd3IjT8IUKUmuuW8OSyGkxRyIgl5Ra1Wgy0oquUzIhK
	CC+lT3pNO4blWxP56/m5aACO8ATcdJYQnzmLi8Rn//807T6JgMlBmFLh8B8CsjPMc2Ge
	O+bg==
X-Received: by 10.68.203.198 with SMTP id ks6mr20983271pbc.140.1409071085410; 
	Tue, 26 Aug 2014 09:38:05 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id yh3sm3700997pbb.38.2014.08.26.09.38.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Aug 2014 09:38:04 -0700 (PDT)
Date: Tue, 26 Aug 2014 09:41:49 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140826164149.GC18989@haswell>
References: <CAAQYJAsPwYZSmpxbKJAX5wHexHK-EOEjsjrxLT_PT-MV6Y338w@mail.gmail.com>
	<CAAQYJAuuvOz4mXJ7V3pbaSBpfABTc_gjuGTgW4BxQ0n2DtPZGA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAuuvOz4mXJ7V3pbaSBpfABTc_gjuGTgW4BxQ0n2DtPZGA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: klibc: armv4 bx strikes again
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Aug 2014 16:38:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-26 11:36:34, Andrea Adami wrote:
> On Mon, Aug 25, 2014 at 10:08 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> > I've recently discovered that the static klibc binaries produced for
> > armv4 contain Illegal instructions.
> >
> > Eglibc armv4 binaries are ok.
> >
> > I verified it happens to kexec-tools-klibc and kexecboot-klibc:
> >
> > andrea@mizar:/oe/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi$
> > ./arm-oe-linux-gnueabi-objdump -S ./kexecboot-armv4 | grep bx
> >    110dc:       012fff1e        bxeq    lr
> >    11154:       e12fff1e        bx      lr
> >    11160:       e12fff1e        bx      lr
> >    11170:       e12fff1e        bx      lr
> >    1119c:       e12fff1e        bx      lr
> >    11234:       e12fff1e        bx      lr
> >    11240:       e12fff1e        bx      lr
> >    11250:       e12fff1e        bx      lr
> >    11268:       e12fff1e        bx      lr
> >    11298:       e12fff1e        bx      lr
> >    112b4:       e12fff1e        bx      lr
> >    112f0:       e12fff1e        bx      lr
> >    115f4:       e12fff1e        bx      lr
> > andrea@mizar:/oe/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi$
> >
> > The binaries end-up compiled with following flags:
> >
> > arm-oe-linux-gnueabi-klcc -march=armv4 -mthumb-interwork -Wall    -o
> > kexecboot util.o cfgparser.o devicescan.o evdevs.o fb.o gui.o menu.o
> > xpm.o rgb.o tui.o kexecboot.o fstype/fstype.o machine/zaurus.o

what is content of arm-oe-linux-gnueabi-klcc ? is it also used at link
step ? the option 

> >
> > This is rather unexpected because klibc carries one specific patch to fix that:
> >
> > http://cgit.openembedded.org/meta-openembedded/tree/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/armv4-fix-v4bx.patch
> >
> > and in fact looking at the produced klibc.config I see indeed LDFLAGS=
> > --fix-v4bx and that goes in  *arm-oe-linux-gnueabi-klcc.
> >
> > There have been big toolchain changes recently so I suspect something
> > got broken in oe-core.
> > Then there is a patch touching armv4/thumb but it doesn't look
> > suspicious at first:
> >
> > http://cgit.openembedded.org/openembedded-core/commit/meta/conf/machine/include?id=1250d3e009363d20f15bbfaced622c5912a7fb93
> >

for tests
can you use FIX_V4BX_ARMV4 in
meta-initramfs/recipes-devtools/klibc/klibc.inc 
and see if it helps

