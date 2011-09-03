Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mikhailboiko85@gmail.com>) id 1QzqJV-0006S4-4P
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Sep 2011 15:31:13 +0200
Received: by qyk4 with SMTP id 4so1339380qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Sep 2011 06:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=frQbe1TydJZmpHICuFOAhrXkDlv8KPdWFjBL12MCAvM=;
	b=HbEpph9kyw1nI4vqtGct7CSYsbHjjckbjsVDu71CN8To5VZQGQ8KR2MnTgl44bYUUw
	fzDaFdaANqnPhOAZrqoPTpYgFAWkP8jxOmXbkXk18bu9f0Vr5e5bvbPLJ/37X8t5aU/m
	JmmxOA3GH0kX/IbFOJiyhn+Ayn5p/uCjz57Og=
MIME-Version: 1.0
Received: by 10.229.43.203 with SMTP id x11mr1613296qce.127.1315056374754;
	Sat, 03 Sep 2011 06:26:14 -0700 (PDT)
Received: by 10.229.110.6 with HTTP; Sat, 3 Sep 2011 06:26:14 -0700 (PDT)
Date: Sat, 3 Sep 2011 16:26:14 +0300
Message-ID: <CAOWBBJx3La704qDcSQ-2jEgv1eOnPJ4VMUoCLzwRNtgaBSh+kg@mail.gmail.com>
From: Mikhail Boiko <mikhailboiko85@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Using external cross-compiler
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
X-List-Received-Date: Sat, 03 Sep 2011 13:31:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I've got some issues with configuring OE to use external cross compiler
(CodeSourcery 2011.03).
II've added this lines to my local.conf file:
TARGET_VENDOR = "-none"
TOOLCHAIN_TYPE = "external"
TOOLCHAIN_BRAND = "csl"
TOOLCHAIN_PATH = "/home/mike/x-tools/cs_2011_03"
TOOLCHAIN_SYSPATH = "${TOOLCHAIN_PATH}/arm-none-linux-gnueabi"
PATH_prepend = "${TOOLCHAIN_PATH}/bin:"

With this config, task "do_configure:" for "libtool-cross" fails. Taking
look at do_configure log i notice that OE run following command for
configuring:

/home/mike/freescale/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/libtool-cross-2.2.6b-r28.1/libtool-2.2.6b/configure
--build=x86_64-linux
--host=arm-angstrom-linux-gnueabi
--target=arm-angstrom-linux-gnueabi
--prefix=/home/mike/freescale/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr
--exec_prefix=/home/mike/freescale/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr
--bindir=/home/mike/freescale/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/bin
--sbindir=/home/mike/freescale/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/sbin
--libexecdir=/home/mike/freescale/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/libexec
--datadir=/home/mike/freescale/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/share
--sysconfdir=/etc
--sharedstatedir=/com
--localstatedir=/var
--libdir=/home/mike/freescale/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/lib
--includedir=/home/mike/freescale/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/include
--oldincludedir=/home/mike/freescale/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/include
--infodir=/home/mike/freescale/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/share/info
--mandir=/home/mike/freescale/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/share/man
--enable-largefile
--disable-nls
--enable-ipv6

As you see, it try to use arm-angstrom-linux-gnueabi when I have
only arm-none-linux-gnueab avaliable.
Please, give some advices to solve this sissue.

Thanks

