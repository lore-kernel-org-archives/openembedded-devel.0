Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N1cJo-0003kF-OI for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 10:49:51 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N1cIp-00044x-Lv
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 10:48:47 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 10:48:47 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 10:48:47 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 24 Oct 2009 10:48:22 +0200
Message-ID: <hbuf0m$esa$1@ger.gmane.org>
References: <200910230504.57681.holger+oe@freyther.de>	<hbru1e$m80$1@ger.gmane.org>
	<1256296026.9503.26.camel@hammer.suse.cz>	<200910231334.13581.holger+oe@freyther.de>
	<1256337084.9460.9.camel@utx.utx.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1256337084.9460.9.camel@utx.utx.cz>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Sat, 24 Oct 2009 08:49:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24-10-09 00:31, Stanislav Brabec wrote:
> Holger Hans Peter Freyther wrote:
>> On Friday 23 October 2009 13:07:06 Stanislav Brabec wrote:
>
>>> I think that the logic should be:
>>>
>>> libfoo.a exists and libfoo.so exists =>  put .a to -static.
>>>
>>> libfoo.a exists and libfoo.so does not exist =>  put .a to -dev.
>>>
>>> This logic will work as most users expect and will need no exception for
>>> glibc.
>>
>> This will add even more python code to package.bbclass and can not be realized
>> with a FILES_* change. I would prefer a stupid QA check for that as I don't
>> expect this to happen on many packages.
>
> That it will happen for all packages that don't provide shared library.
> These packages may end by broken -dev package with just the
> *.a =>  -static rule.

Actually it's /lib/*.a,/usr/lib/*.a -> static, which means...


> I am not sure, how many such packages exist in the tree, but here is a
> list of files﻿ in my work directory that would need special care:

... becomes a bit smaller:


> alsa-oss-1.0.17-r0: /usr/lib/libossredir.a
> binutils-2.18-r8.1: /usr/lib/libiberty.a
> bison-2.3-r0: /usr/lib/liby.a
> bridge-utils-1.4-r0: /usr/lib/libbridge.a

> flex-2.5.31-r4: /usr/lib/libfl.a

> gcc-4.3.3-r7.1: /usr/lib/libstdc++_pic.a
> gcc-4.3.3-r7.1: /usr/lib/libssp_nonshared.a

> gcc-4.3.3-r7.1: /usr/lib/libsupc++.a
> gdb-7.0-r0: /usr/lib/libbfd.a
> gdb-7.0-r0: /usr/lib/libopcodes.a
> gdb-7.0-r0: /usr/lib/libiberty.a
> glibc-2.9-r35.2: /usr/lib/libc_nonshared.a
> glibc-2.9-r35.2: /usr/lib/libmcheck.a
> glibc-2.9-r35.2: /usr/lib/libg.a
> glibc-2.9-r35.2: /usr/lib/libbsd-compat.a
> glibc-2.9-r35.2: /usr/lib/libieee.a
> glibc-2.9-r35.2: /usr/lib/libpthread_nonshared.a
> libassuan-0.6.9-r0: /usr/lib/libassuan.a
> libatomics-ops-1.2-r2: /usr/lib/libatomic_ops_gpl.a
> libatomics-ops-1.2-r2: /usr/lib/libatomic_ops.a
> libsdl-x11-1.2.11-r8: /usr/lib/libSDLmain.a
> mysql-4.1.22-r3: /usr/lib/libmysys.a
> mysql-4.1.22-r3: /usr/lib/libdbug.a
> mysql-4.1.22-r3: /usr/lib/libvio.a
> mysql-4.1.22-r3: /usr/lib/libheap.a
> mysql-4.1.22-r3: /usr/lib/libmerge.a
> mysql-4.1.22-r3: /usr/lib/libnisam.a
> mysql-4.1.22-r3: /usr/lib/libmysqld.a
> mysql-4.1.22-r3: /usr/lib/libmyisam.a
> mysql-4.1.22-r3: /usr/lib/libmyisammrg.a
> mysql-4.1.22-r3: /usr/lib/libmystrings.a
> orbit2-2.14.17-r0: /usr/lib/libname-server-2.a

> tcl-8.4.19-r2: /usr/lib/libtclstub8.4.a
> tk-8.4.19-r0: /usr/lib/libtkstub8.4.a

I would be happy to take special care of the above recipe in my fixup 
branch. Do we all agree that the above .a files need to go into -dev 
packages? If so I'll add something like FILES_${PN}-static = "" to the 
affected recipes


And these wouldn't need special handling:

 > firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libnss.a
 > firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libnssutil.a
 > firefox-3.5.2-r2: 
/usr/lib/firefox-devel-3.5.2/sdk/lib/libunicharutil_external_s.a
 > firefox-3.5.2-r2: 
/usr/lib/firefox-devel-3.5.2/sdk/lib/libembed_base_standalone.a
 > firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libsoftokn.a
 > firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libssl.a
 > firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libembed_base_s.a
 > firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libcrmf.a
 > firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libsmime.a
 > firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libxpcomglue_s.a
 > firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libmozreg_s.a
 > firefox-3.5.2-r2: /usr/lib/firefox-devel-3.5.2/sdk/lib/libxpcomglue.a
 > gcc-cross-4.3.3-r7.1: /OE/build/tmp/cross/armv5te/lib64/libiberty.a
 > gcc-cross-4.3.3-r7.1: 
/OE/build/tmp/cross/armv5te/arm-angstrom-linux-gnueabi/lib/libgfortran.a
 > gcc-cross-4.3.3-r7.1: 
/OE/build/tmp/cross/armv5te/arm-angstrom-linux-gnueabi/lib/libssp.a
 > gcc-cross-4.3.3-r7.1: 
/OE/build/tmp/cross/armv5te/arm-angstrom-linux-gnueabi/lib/libiberty.a
 > gcc-cross-4.3.3-r7.1: 
/OE/build/tmp/cross/armv5te/arm-angstrom-linux-gnueabi/lib/libstdc++_pic.a
 > gcc-cross-4.3.3-r7.1: 
/OE/build/tmp/cross/armv5te/arm-angstrom-linux-gnueabi/lib/libssp_nonshared.a
 > gcc-cross-4.3.3-r7.1: 
/OE/build/tmp/cross/armv5te/arm-angstrom-linux-gnueabi/lib/libsupc++.a
 > gcc-cross-4.3.3-r7.1: 
/OE/build/tmp/cross/armv5te/arm-angstrom-linux-gnueabi/lib/libstdc++.a
 > gcc-cross-4.3.3-r7.1: 
/OE/build/tmp/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/libgcc.a
 > gcc-cross-4.3.3-r7.1: 
/OE/build/tmp/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/libgcc_eh.a
 > gcc-cross-4.3.3-r7.1: 
/OE/build/tmp/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/libgfortranbegin.a
 > gcc-cross-4.3.3-r7.1: 
/OE/build/tmp/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/libgcov.a
 > perl-5.8.8-r28: /usr/lib/perl/5.8.8/auto/DynaLoader/DynaLoader.a
 > python-2.6.1-ml8.0: /usr/lib/python2.6/config/libpython2.6.a
 > tcl-native-8.4.19-r2: 
/OE/build/tmp/staging/x86_64-linux/usr/lib/libtclstub8.4.a
 > tk-native-8.4.19-r0: 
/OE/build/tmp/staging/x86_64-linux/usr/lib/libtkstub8.4.a
 > gcc-4.3.3-r7.1: /usr/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/libgcc.a
 > gcc-4.3.3-r7.1: /usr/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/libgcc_eh.a
 > gcc-4.3.3-r7.1: 
/usr/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/libgfortranbegin.a
 > gcc-4.3.3-r7.1: /usr/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/libgcov.a

regards,

Koen

> ﻿Found by this bash command:
> find */*/image -name '*.a' | fgrep -v .debug | while read ; do if ! test -f "${REPLY%.a}.so" ; then PKG=$REPLY ; PKG=${PKG#*/} ; PKG=${PKG%%/*} ; echo $PKG: ${REPLY#*/image} ; fi ; done
>
>
> ________________________________________________________________________
> Stanislav Brabec
> http://www.penguin.cz/~utx/zaurus
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




