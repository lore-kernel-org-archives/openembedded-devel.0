Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B8F5265E1A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Nov 2014 03:26:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43702391"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2014 11:23:27 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAK3QP5e007805
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Nov 2014 11:26:25 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Thu, 20 Nov 2014 11:26:45 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: lvm2 compile error
Thread-Index: AdAEbN96Q+W9lsi2S96Zrwlpiu5PbQAAx3AwAABU/oA=
Date: Thu, 20 Nov 2014 03:26:45 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E87C674D@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <A8FC939F80655644A89BB21CCD3741E87C670D@G08CNEXMBPEKD02.g08.fujitsu.local>
	<30DC4EDFD798C94083F3E083754532CCCB4BC1@G08CNEXMBPEKD02.g08.fujitsu.local>
In-Reply-To: <30DC4EDFD798C94083F3E083754532CCCB4BC1@G08CNEXMBPEKD02.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.35]
MIME-Version: 1.0
Subject: Re: lvm2 compile error
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
X-List-Received-Date: Thu, 20 Nov 2014 03:27:05 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi, Bian

Thank you very much.
It is work after I get rid of "-pie -fpie".

Best regards,
Li xin

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Bian, Naimeng
> Sent: Thursday, November 20, 2014 11:17 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] lvm2 compile error
>=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> > Of Li, Xin
> > Sent: Thursday, November 20, 2014 11:02 AM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] lvm2 compile error
> >
> > Hi,
> >
> > I bitbake lvm2 from meta-oe, but it has the following errors.
> > How can I fix it?
> >
> > Thanks in advance.
> >
> > Best regards,
> > Li xin
> >
> > ------------------------------------------
> > Build Configuration:
> > BB_VERSION        =3D "1.24.0"
> > BUILD_SYS         =3D "x86_64-linux"
> > NATIVELSBSTRING   =3D "CentOS-6.5"
> > TARGET_SYS        =3D "x86_64-fct-linux"
> > =1B$B!D!D=1B(B
> > | x86_64-fct-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
> > -mfpmath=3Dsse -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> > -Wl,-z,relro,-z,now
> > --sysroot=3D/yocto/work001/fnst/lixin/work/yocto-ubinux/build_x86-64/tm=
p
> > /sysroots/ubinux-qemux86-64 -shared -Wl,-soname,libdevmapper.so.1.02 \
> > |                -O2 -pipe -g -feliminate-unused-debug-types
> > -fstack-protector-all -pie -fpie -D_FORTIFY_SOURCE=3D2 -O2 -pipe -g
> > -feliminate-unused-debug-types -fstack-protector-all -pie -fpie
> > -D_FORTIFY_SOURCE=3D2 -fPIC  -O2 -O2 -pipe -g
> > -feliminate-unused-debug-types -fstack-protector-all -pie -fpie
> > -D_FORTIFY_SOURCE=3D2 -fPIC  -O2 -Wl,--version-script,.export.sym
> > -L../libdm -L../lib -L../daemons/dmeventd datastruct/bitset.o
> > datastruct/hash.o datastruct/list.o libdm-common.o libdm-file.o
> > libdm-deptree.o libdm-string.o libdm-report.o libdm-config.o
> > mm/dbg_malloc.o mm/pool.o regex/matcher.o regex/parse_rx.o regex/ttree.=
o
> > ioctl/libdm-iface.o -lrt   -ludev  -o ioctl/libdevmapper.so.1.02
>=20
> I think it's wrong to build shared library with "-shared" and "-pie -fpie=
" together.
> I guess it will work after get rid of "-pie -fpie".
>=20
> Regards
>  Bian
>=20
> > |
> > /yocto/work001/fnst/lixin/work/yocto-ubinux/build_x86-64/tmp/sysroots/
> > ubinux-qemux86-64/usr/lib/../lib/Scrt1.o: In function `_start':
> > |
> > /yocto/work001/fnst/lixin/work/yocto-ubinux/build_x86-64/tmp/work/core
> > 2-64-fct-linux/glibc/2.20-r0/git/csu/../sysdeps/x86_64/start.S:108:
> > undefined reference to `main'
> > | collect2: error: ld returned 1 exit status
> > | make[1]: *** [ioctl/libdevmapper.so.1.02] Error 1
> > ----------------------------------------
> >
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

