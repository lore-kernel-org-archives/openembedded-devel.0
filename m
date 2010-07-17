Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Oa5RX-0002uP-Jo
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 13:20:33 +0200
Received: by fxm12 with SMTP id 12so1520046fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jul 2010 04:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=EMngMNz7hpTq81hT76HAqblX2zeB7AtCblpaEE+5UU4=;
	b=uDNyzjfU6UC2C430yymc+Aw+q3gNzVatJ9UYH8LTmbOAdeBZ4pxccM6a0JwQPzLkTA
	uLE1CxzMoki0aDSXQl1Hva6h+NhstcbF80Ii3Y3nO8eNyvN0OLDsm3/6jAA+CwGdNvYi
	hq6QnNidxv0/PdQ/FmDGmeBBWKRZChQQZZsL8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=uhRV2WzGD6GhbYvXPEDlWvKycVvZpZnbd/2VbDXYBrW9Sl+kI3BHkU8ZA40yLMhryo
	TS1nFaMc/FhdVxC6HdygHYUInbB0vz1iPCop4NGSifCG+UB6xdXvGifmauN8uuxqM1zg
	KeZUF/YCBcJX4zIHenyIyt7NxYCt84eijHKiU=
Received: by 10.223.116.197 with SMTP id n5mr1589865faq.53.1279365625149;
	Sat, 17 Jul 2010 04:20:25 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id e20sm570732fak.23.2010.07.17.04.20.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 17 Jul 2010 04:20:23 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Oa5RL-0006L4-ME; Sat, 17 Jul 2010 13:20:19 +0200
Date: Sat, 17 Jul 2010 13:20:19 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100717112019.GL23169@mx.loc>
References: <1279133054.4939.16.camel@mattotaupa>
	<20100714194822.GB9771@rhein.zuhause.netz>
	<1279216348.3741.24.camel@mattotaupa>
	<20100715194805.GA8103@rhein.zuhause.netz>
	<AANLkTimQo47xqCaKDLeRV0kclSF7KAloIDgp8Wfd6HUz@mail.gmail.com>
	<20100715201635.GA11403@rhein.zuhause.netz>
	<1279356998.14848.18.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1279356998.14848.18.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: angstrom-2008.1, uclibc-git: oe_runmake failed: Error: unknown pseudo-op: `.cfi_sections' (was: oe_runmake failed: error: '__a1' undeclared (first use in this function))
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
X-List-Received-Date: Sat, 17 Jul 2010 11:20:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 17, 2010 at 10:56:38AM +0200, Paul Menzel wrote:
>Am Donnerstag, den 15.07.2010, 22:16 +0200 schrieb Henning Heinold:
>
>> its pushed now.
>
>Henning and Khem, thank you for your fast and great help!
>
>I hit the next problem with `uclibc-git.bb`. This time it fails with the
>distribution angstrom-2008.1 (-ggdb3 removed) but works with the
>distribution minimal-uclibc.
>
>        arm-angstrom-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex=
-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -c libpthread/nptl/sysdeps/unix/sysv/=
linux/open.S -o libpthread/nptl/sysdeps/unix/sysv/linux/open.o -include ./i=
nclude/libc-symbols.h -Wall -Wstrict-prototypes -fno-strict-aliasing -Wnest=
ed-externs -Wshadow -Wmissing-noreturn -Wmissing-format-attribute -Wformat=
=3D2 -Wmissing-prototypes -Wmissing-declarations -Wold-style-declaration -W=
old-style-definition -Wnonnull -Wundef -funsigned-char -fno-builtin -fno-as=
m -mlittle-endian -mtune=3Darm9tdmi -march=3Darmv4t -fno-stack-protector -n=
ostdinc -I./include -I./include -I. -I./libc/sysdeps/linux -I./libc/sysdeps=
/linux/arm -fexpensive-optimizations -fomit-frame-pointer -frename-register=
s -O2 -ggdb3 -Os -funit-at-a-time -fmerge-all-constants -fno-tree-loop-opti=
mize -fno-tree-dominator-opts -fno-strength-reduce -fstrict-aliasing -DHAVE=
_FORCED_UNWIND -I./libpthread/nptl -I./libpthread/nptl -I./libpthread/nptl/=
sysdeps/unix/sysv/linux/arm/ -I./libpthread/nptl/sysdeps/unix/sy
>sv/linux/arm -I./libpthread/nptl/sysdeps/arm -I./libpthread/nptl/sysdeps/a=
rm -I./libpthread/nptl/sysdeps/unix/sysv/linux -I./libpthread/nptl/sysdeps/=
unix/sysv/linux -I./libpthread/nptl/sysdeps/generic -I./libpthread/nptl/sys=
deps/pthread -I./libpthread/nptl/sysdeps/pthread/bits -I./ldso/ldso/arm -I.=
/ldso/include -I./libc/sysdeps/linux/common -I/tmp/angstrom-dev/sysroots/ar=
mv7a-angstrom-linux-uclibceabi/usr/include/ -isystem /tmp/angstrom-dev/cros=
s/armv7a/lib/gcc/arm-angstrom-linux-uclibceabi/4.3.3/include-fixed -isystem=
 /tmp/angstrom-dev/cross/armv7a/lib/gcc/arm-angstrom-linux-uclibceabi/4.3.3=
/include -DNDEBUG -D__USE_STDIO_FUTEXES__ -MT libpthread/nptl/sysdeps/unix/=
sysv/linux/open.o -MD -MP -MF libpthread/nptl/sysdeps/unix/sysv/linux/.open=
=2Eo.dep -D__ASSEMBLER__ -Wa,--noexecstack -D_LIBC_REENTRANT
>        libpthread/nptl/sysdeps/unix/sysv/linux/open.S: Assembler messages:
>        libpthread/nptl/sysdeps/unix/sysv/linux/open.S:8: Error: unknown p=
seudo-op: `.cfi_sections'

binutils too old?
qemuarm builds fine with 2.20.1, which version of binutils are you
trying to use?
See uclibc.org/FAQ#upstream_versions
We support the last two official upstream versions of binutils/gcc, so
that'd be binutils >=3D 2.20.latest and gcc-4.5.latest (i usually use both
HEADs plus eventual fixups/tweaks myself).
angstrom-2008.1.conf mentions 2.18 which is definitely way too old for
uClibc master by now, fyi.

>        libpthread/nptl/sysdeps/unix/sysv/linux/close.S: Assembler message=
s:
>        libpthread/nptl/sysdeps/unix/sysv/linux/close.S:9: Error: unknown =
pseudo-op: `.cfi_sections'
>        make: *** [libpthread/nptl/sysdeps/unix/sysv/linux/open.o] Error 1
>        make: *** Waiting for unfinished jobs....
>        make: *** [libpthread/nptl/sysdeps/unix/sysv/linux/close.o] Error 1
>        libpthread/nptl/sysdeps/unix/sysv/linux/jmp-unwind.c:29: warning: =
no previous prototype for '_longjmp_unwind'
>        FATAL: oe_runmake failed
>
>The full log is attached compressed. Uncompressed it was 1.7 MB big.
>
>
>Thanks,
>
>Paul





>_______________________________________________
>Openembedded-devel mailing list
>Openembedded-devel@lists.openembedded.org
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



