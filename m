Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1K7iPr-00070H-96
	for openembedded-devel@openembedded.org; Sun, 15 Jun 2008 04:56:27 +0200
Received: from gw.mwester.net ([209.242.5.110] helo=[192.168.1.111])
	by mx01.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1K7iPQ-0000k9-DU
	for openembedded-devel@openembedded.org; Sat, 14 Jun 2008 21:56:00 -0500
Message-ID: <485484BC.5000509@dls.net>
Date: Sat, 14 Jun 2008 21:55:56 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.14) Gecko/20080421 Thunderbird/2.0.0.14 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1213098621.16999.94.camel@sulphur.klc>
	<1213146466.20679.16.camel@sulphur.klc>
In-Reply-To: <1213146466.20679.16.camel@sulphur.klc>
Subject: [RFC] Re: tar & ar native vs host (Fedora 9 issues)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 15 Jun 2008 02:56:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Barring objections, I'll submit the following patch to fix the bug
described below.  Further details on the patch are in the bug report.
Regards,
Mike (mwester)

--- ipkg-utils/arfile.py.orig   2008-06-11 21:07:01.000000000 -0500
+++ ipkg-utils/arfile.py        2008-06-14 19:56:04.000000000 -0500
@@ -86,6 +86,8 @@
                 return FileSection(self.f, self.f.tell(), size)

             # Skip data and loop
+            if size % 2:
+                size = size + 1
             data = self.f.seek(size, 1)
 #            print hex(f.tell())




Terry Kemp wrote:
> On Tue, 2008-06-10 at 23:50 +1200, Terry Kemp wrote:
>> Hello devs,
>>
>> I have been working on
>> http://bugs.openembedded.net/show_bug.cgi?id=4350
>> and I have attached my recipe mods to this for review should someone
>> care to look at them. 
>>
> 
> Just to confirm...
> 
> same deal with building latest mtn pull of dev...
> 
> [tmk@sulphur org.openembedded.dev]$ mtn status
> Current branch: org.openembedded.dev
> Changes against parent 30fc86774a3da064f530c39eeff1e97d6a7020a0
>   patched  packages/linux/gumstix-kernel_2.6.21.bb
>   patched  packages/linux/gumstix-linux.inc
>   patched  site/common-glibc
> 
> 
> [tmk@sulphur build]$
> cat /build/OE/gumstix-connex/build/tmp/angstrom/work/gumstix-connex-angstrom-linux-gnueabi/minimal-image-1.0-r0/temp/log.do_rootfs.13586
> + rm -rf /build/OE/gumstix-connex/build/tmp/angstrom/rootfs
> + mkdir -p /build/OE/gumstix-connex/build/tmp/angstrom/rootfs
> + '[' 0 '!=' 1 ']'
> + for devtable
> in /build/OE/org.openembedded.dev/files/device_table-minimal.txt
> + makedevs -r /build/OE/gumstix-connex/build/tmp/angstrom/rootfs
> -D /build/OE/org.openembedded.dev/files/device_table-minimal.txt
> + rootfs_ipk_do_rootfs
> + set -x
> + package_update_index_ipk
> + set -x
> + ipkgarchs='all any noarch arm armv4 armv4t armv5e armv5te
> gumstix-connex'
> + '[' '!' -z '' ']'
> +
> touch /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/Packages
> + ipkg-make-index
> -r /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/Packages
> -p /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/Packages
> -l /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/Packages.filelist -m /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk
> 
> + for arch in '$ipkgarchs'
> + '['
> -e /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/all/ ']'
> +
> touch /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/all/Packages
> + ipkg-make-index
> -r /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/all/Packages -p /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/all/Packages -l /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/all/Packages.filelist -m /build/OE/gumstix-connex/build/tmp/angstrom/deploy/glibc/ipk/all/
> Traceback (most recent call last):
>   File
> "/build/OE/gumstix-connex/build/tmp/angstrom/staging/i686-linux/usr/bin/ipkg-make-index", line 114, in <module>
>     pkg = ipkg.Package(filename)
>   File
> "/build/OE/gumstix-connex/build/tmp/angstrom/staging/i686-linux/usr/bin/ipkg.py", line 161, in __init__
>     tarStream = ar.open("control.tar.gz")
>   File
> "/build/OE/gumstix-connex/build/tmp/angstrom/staging/i686-linux/usr/bin/arfile.py", line 59, in open
>     f = self._scan(fname)
>   File
> "/build/OE/gumstix-connex/build/tmp/angstrom/staging/i686-linux/usr/bin/arfile.py", line 79, in _scan
>     size = int(descriptor[5])
> IndexError: list index out of range
> [tmk@sulphur build]$ 
> 
> 
> Same fix being tested now.
> 
> ﻿
> Terry
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


