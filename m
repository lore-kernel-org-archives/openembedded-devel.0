Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QmKMn-0007LG-Jg
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 08:46:45 +0200
Received: by fxg11 with SMTP id 11so1054969fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2011 23:42:30 -0700 (PDT)
Received: by 10.204.9.197 with SMTP id m5mr225943bkm.38.1311835350360;
	Wed, 27 Jul 2011 23:42:30 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id d5sm168445bkt.13.2011.07.27.23.42.28
	(version=SSLv3 cipher=OTHER); Wed, 27 Jul 2011 23:42:29 -0700 (PDT)
Message-ID: <4E3104D3.7050702@dresearch-fe.de>
Date: Thu, 28 Jul 2011 08:42:27 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.2
Subject: [2011.03-maintenance] Problem building gcc
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
X-List-Received-Date: Thu, 28 Jul 2011 06:46:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I've problems building gcc from the 2011.03-maintenance branch. The do_install step fails with

| + mv '/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r24.1/image/usr/lib/libstdc++.so.*-gdb.py*' /home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r24.1/image/usr/share/gdb/auto-load/usr/lib
| mv: cannot stat `/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r24.1/image/usr/lib/libstdc++.so.*-gdb.py*': No such file or directory
NOTE: package gcc-4.3.3-r24.1: task do_install: Failed
ERROR: Function 'do_install' failed (see /home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r24.1/temp/log.do_install.14408 for further information)
ERROR: Task 2 (/home/sledz/work/angstrom-setup-scripts/sources/openembedded/recipes/gcc/gcc_4.3.3.bb, do_install) failed with exit code '1'
ERROR: '/home/sledz/work/angstrom-setup-scripts/sources/openembedded/recipes/gcc/gcc_4.3.3.bb' failed

A way to reproduce the problem is using the current Ångström oebb.sh script:

  MACHINE=beagleboard ./oebb.sh bitbake gcc

My build host is running a 64-bit openSUSE 11.4.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


