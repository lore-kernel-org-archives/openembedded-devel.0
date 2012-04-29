Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOcxY-0000R4-5p
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 00:51:16 +0200
Received: by lagw12 with SMTP id w12so1507744lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 15:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=SyKVjVDwdWpSOyGPUs6L4Y04BQ/8hfVuvUigoyyVSyw=;
	b=RNADsA2acqPvf+1tnJOgeKs+sWT7WRRzYT7WGO627jz1aAH7N3cpDXp04SyBuSVVbg
	NMSX6rlqOWhSdalnrmd7IDMBBaNc2ozgHXZLNDoeu3Sb/vFsg60VgWigZ33HPGlvXirN
	BEzxEYIl3DBtBklByzoCtq0jyxCXO9uHI5+9lYu+5CcLp1nlKXn2MxKg9BPBFRgSU/lV
	8+w6UE7Jq8zHaRpr8VbRZMPMbamB2aAcxl415oFjErRrUj9UzGoDfAECX+4QGXbud0ln
	/OqHU7JA9CXt2XtNUXocmihZhKTdarzlohkl3T4qaQZFdtdmYBbEZVB/UTW+aqca+aMh
	HiMg==
Received: by 10.112.103.8 with SMTP id fs8mr9390263lbb.29.1335739295041; Sun,
	29 Apr 2012 15:41:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sun, 29 Apr 2012 15:41:04 -0700 (PDT)
In-Reply-To: <169F7DFB-B916-4EA8-BC37-C451F76E466A@gmail.com>
References: <92932941-A66D-45AF-8CDC-8F56D66C4E02@gmail.com>
	<CAMKF1soQ+eShsN+r5ZPA60vSEmEKZmKCM-WTt0mhghVUAteOUg@mail.gmail.com>
	<169F7DFB-B916-4EA8-BC37-C451F76E466A@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Apr 2012 15:41:04 -0700
Message-ID: <CAMKF1sqdoJsqdyG-gG-Tzif4kZ-wMB3jbunC5n7ru5H1CALy1Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gcc-4.4.1 assembler error: offset out of range
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
X-List-Received-Date: Sun, 29 Apr 2012 22:51:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 29, 2012 at 3:34 PM, Elvis Dowson <elvis.dowson@gmail.com> wrot=
e:
> | arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfp=
u=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/too=
l/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c =C2=A0-fexpensive-=
optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC =
=C2=A0 -W -Wall -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-p=
rototypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-variadic=
-macros -Wno-overlength-strings -Wold-style-definition -Wc++-compat =C2=A0 =
-DHAVE_CONFIG_H -I. -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnu=
eabi/gcc-4.5-r41.1+svnr170880/gcc-4_5-branch/gcc -I/tool/overo-oe/tmp/work/=
armv7a-angstrom-linux-gnueabi/gcc-4.5-r41.1+svnr170880/gcc-4_5-branch/gcc/.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r41.1+svnr=
170880/gcc-4_5-branch/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angst=
rom-linux-gnueabi/gcc-4.5-r41.1+svnr170880/gcc-4_5-branch/gcc/../libcpp/inc=
lude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r41.1+=
svnr170880/gcc-4_5-branch/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/arm=
v7a-angstrom-linux-gnueabi/gcc-4.5-r41.1+svnr170880/gcc-4_5-branch/gcc/../l=
ibdecnumber/dpd -I../libdecnumber =C2=A0 -I/usr/include/libelf =C2=A0 /tool=
/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r41.1+svnr170880/g=
cc-4_5-branch/gcc/calls.c -o calls.o


Go into the builddir of gcc and then execute the above command add -S
to the options and now calls.o should be an asm file. Post that file
somewhere

what version of binutils are you using


