Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QmLyg-0001D5-MJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 10:29:58 +0200
Received: by fxg11 with SMTP id 11so1137140fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2011 01:25:43 -0700 (PDT)
Received: by 10.204.2.154 with SMTP id 26mr220475bkj.300.1311841543338;
	Thu, 28 Jul 2011 01:25:43 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id i14sm192194bkd.39.2011.07.28.01.25.41
	(version=SSLv3 cipher=OTHER); Thu, 28 Jul 2011 01:25:42 -0700 (PDT)
Message-ID: <4E311D05.1000906@dresearch-fe.de>
Date: Thu, 28 Jul 2011 10:25:41 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E3104D3.7050702@dresearch-fe.de> <j0r3md$jq5$1@dough.gmane.org>
In-Reply-To: <j0r3md$jq5$1@dough.gmane.org>
X-Enigmail-Version: 1.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [2011.03-maintenance] Problem building gcc
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
X-List-Received-Date: Thu, 28 Jul 2011 08:29:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.07.2011 09:38, Koen Kooi wrote:
> Op 28-07-11 08:42, Steffen Sledz schreef:
>> I've problems building gcc from the 2011.03-maintenance branch. The do_install step fails with
> 
>> | + mv '/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r24.1/image/usr/lib/libstdc++.so.*-gdb.py*' /home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r24.1/image/usr/share/gdb/auto-load/usr/lib | mv: cannot stat `/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r24.1/image/usr/lib/libstdc++.so.*-gdb.py*': No such file or directory NOTE: package gcc-4.3.3-r24.1: task do_install: Failed ERROR: Function 'do_install' failed (see /home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r24.1/temp/log.do_install.14408 for further information) ERROR: Task 2 (/home/sledz/work/angstrom-setup-scripts/sources/openembedded/recipes/gcc/gcc_4.3.3.bb, do_install) failed with exit code '1' ERROR:
>> '/home/sledz/work/angstrom-setup-scripts/sources/openembedded/recipes/gcc/gcc_4.3.3.bb' failed
> 
>> A way to reproduce the problem is using the current Ångström oebb.sh script:
> 
>> MACHINE=beagleboard ./oebb.sh bitbake gcc
> 
>> My build host is running a 64-bit openSUSE 11.4.
> 
> 
> Can you try:
> 
> diff --git a/recipes/gcc/gcc-package-target.inc b/recipes/gcc/gcc-package-target.inc index 33567da..7d3f4ae 100644 --- a/recipes/gcc/gcc-package-target.inc +++ b/recipes/gcc/gcc-package-target.inc @@ -171,5 +171,5 @@ GROUP ( libgcc_s.so.1 libgcc.a )" > ${D}${libdir}/libgcc_s.so rm -rf ${D}${includedir}/c++/${BINV}/${TARGET_SYS}/bits/*.gch # move the gdb python helpers to gdb auto-load directory install -d ${D}${datadir}/gdb/auto-load/${libdir} -       mv ${D}${libdir}/libstdc++.so.*-gdb.py* ${D}${datadir}/gdb/auto-load${libdir} +       mv ${D}${libdir}/libstdc++.so.*-gdb.py* ${D}${datadir}/gdb/auto-load${libdir} || true }

Yepp. This works.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


