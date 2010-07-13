Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OYhuL-0002zw-Ai
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 18:00:39 +0200
Received: by gwj22 with SMTP id 22so3682107gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jul 2010 09:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Ke0xkKKhpHjFfLuoAhc0RVvpch+s3h+i1K1GjxoIdNk=;
	b=XS95K1htkaSzhZSrmnZEA8f0Vgt8JYpfNXLmFQDWPKAsLEl23Mg4dS8yRGeIw5lAQZ
	WQGZly2vMsPMpUveDO/IeIWImsffpGPrlDPvL98pyhX7cI1GAmtP1TKGeYopzVamXY2e
	444qoDn82W03JoO3CcvUNtUVJrsqxTkoB1YqU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qM9sxaB8+Ys9h+YGSNKvyqQKj5OgV1rgX4YkbFAYZn6Y44aU45XsIrvpBK+5qouyuY
	YEmjBwSXM4mSXf/71HjLuIaRzUJoJfzKBEIlacz5rYUiGFyMv6cH01N7O6owHRyL6/rb
	iW6d5eU7+ruT6L9vhPX9sHToShFRy98Q5UI4Y=
MIME-Version: 1.0
Received: by 10.229.229.202 with SMTP id jj10mr4867232qcb.131.1279036822672; 
	Tue, 13 Jul 2010 09:00:22 -0700 (PDT)
Received: by 10.229.220.205 with HTTP; Tue, 13 Jul 2010 09:00:22 -0700 (PDT)
In-Reply-To: <AANLkTilt38IIysypXu4t6DweZkrLBZJB5dSL2_m_cAF4@mail.gmail.com>
References: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
	<AANLkTilt38IIysypXu4t6DweZkrLBZJB5dSL2_m_cAF4@mail.gmail.com>
Date: Tue, 13 Jul 2010 11:00:22 -0500
Message-ID: <AANLkTikGJvct_Hz-XtE4YWS3ONL9xUyWadQZUqldbu_7@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/9] xilinx-virtex4: new file
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
X-List-Received-Date: Tue, 13 Jul 2010 16:00:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Frans,

Some comments in lines...

Regards

On Tue, Jul 13, 2010 at 1:01 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/7/12 Adrian Alonso <aalonso00@gmail.com>:
> > * New config machine, generic support for Xilinx
> >  Virtex4 platforms ml401, ml403, ml405, ml410
> > * Tested on ml405 target board, powerpc based ref
> >  design at http://github.com/aalonso/xilinx-ml405
> > * Target configuration handled in xilinx-bsp.bbclass
> >
> > Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> > ---
> >  conf/machine/xilinx-virtex4.conf |   40
> ++++++++++++++++++++++++++++++++++++++
> >  1 files changed, 40 insertions(+), 0 deletions(-)
> >  create mode 100644 conf/machine/xilinx-virtex4.conf
> >
> > diff --git a/conf/machine/xilinx-virtex4.conf
> b/conf/machine/xilinx-virtex4.conf
> > new file mode 100644
> > index 0000000..942b63f
> > --- /dev/null
> > +++ b/conf/machine/xilinx-virtex4.conf
> > @@ -0,0 +1,40 @@
> > +# Copyright (C) 2010, Adrian Alonso <aalonso00@gmail.com>
> > +# Released under the MIT license (see packages/COPYING)
> > +#@TYPE: Machine
> > +#@Name: Xilinx Virtex4 FPGA Development Platform
> > +#@DESCRIPTION: Machine configuration for Xilinx Virtex4 family
> > +# Supported targets
> > +# ML403, ML405, ML410
> > +
> > +# Default arch can be overrided in local.conf
> > +TARGET_ARCH ?= "powerpc"
>
> Do we expect to be this machine to be powerpc only or would there be
> any chance that someone puts linux on microblaze on it?
> If so is this going to be in this file?
> If we think microblaze linux on this board will happen and not in this
> file perhaps make explicit in the machine name that it is ppc only.
> If microblaze on this board is unlikely it is afaik ok as it is.
>

I intent that the config machine can support both powerpc and microblaze
arch
thats why TARGET_* assignments are weak so they can be override in
local.conf
so I can preserve machine features without the need to add another machine
conf
file for microblaze.

Umm I think that kernel config file is an obstacle to achieve this,
because it would
pull powerpc settings unless I implement a mechanism to pull the correct
kernel
config file depending on the target arch. So for the moment the best option
is to
make this machine file powerpc specific.

If you are interested  on OE microblaze support take a look at [1], is just
matter to
add gcc support of "-shared" option to complete OE microblaze integration.

[1] http://gitorious.org/oe-microblaze

>
> > +TARGET_CPU  ?= "405"
> > +TARGET_FPU  ?= "soft"
> > +TARGET_TUNE ?= "ppc405"
> > +#tune for the selected cpu
> > +require conf/machine/include/tune-${TARGET_TUNE}.inc
> > +
> > +#ASSUME_PROVIDED += "virtual/kernel"
>
> I'd say remove the line above. It is harmless as it is comment but
> could lead to confusion.
> (or if it is useful for people to have this perhaps have a line or two
> of comment)
>
> > +PREFERRED_PROVIDER_virtual/kernel = "linux-xilinx"
> > +PREFERRED_VERSION_u-boot_xilinx-virtex4 = "u-boot-xilinx"
> > +
> > +KERNEL_IMAGETYPE = "uImage"
> > +
> > +MACHINE_FEATURES = "kernel26 apm ext2 vfat ethernet"
> > +MACHINE_EXTRA_RECOMMENDS = "kernel-modules"
> > +
> > +UBOOT_ENTRYPOINT ?= "0x00000000"
> > +UBOOT_LOADADDRESS ?= "0x00000000"
> > +
> > +# Xilinx EDK override hardware  definitions for xilinx-bsp
> > +# Include in your local.conf
> > +# XILINX_BSP_PATH = "complete path for Xilinx XPS project"
> > +# XILINX_BOARD = "ml410"
> > +
> > +# Don't use tty1
> > +USE_VT = "0"
> > +SERIAL_CONSOLE = "9600 ttyS0"
> > +
> > +# Device nodes add xsa for (system ace)
> > +IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
> > +                       files/device_table_add-xsa.txt"
> > --
> > 1.7.1.1
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

