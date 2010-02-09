Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NeuLp-0005HC-3J
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 18:58:20 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 9 Feb 2010 18:55:41 +0100
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 9 Feb 2010 18:55:41 +0100
Received: from [192.168.1.116] ([79.21.48.56]) by FBCMCL01B08.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 9 Feb 2010 18:55:39 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 09 Feb 2010 18:55:31 +0100
Message-Id: <1265738131.3731.27.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 09 Feb 2010 17:55:39.0738 (UTC)
	FILETIME=[1738BBA0:01CAA9B1]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: gdb sdk
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
X-List-Received-Date: Tue, 09 Feb 2010 17:58:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,in the gdb series here's the sdk:

ldd .../oetmp/work/i686-armv6-novfp-sdk-oe-linux-gnueabi/gdb-cross-sdk-7.0-r0/image/
usr/local/shr/arm/bin/arm-oe-linux-gnueabi-gdb
	linux-gate.so.1 =>  (0xb80df000)
	libncurses.so.5
=> /home/embedded/oetmp_shr-merge_htcdream/staging/i686-linux/usr/lib/libncurses.so.5 (0xb8099000)
	libz.so.1
=> /home/embedded/oetmp_shr-merge_htcdream/staging/i686-linux/usr/lib/libz.so.1 (0xb8085000)
	libm.so.6 => /lib/libm.so.6 (0xb802c000)
	libpython2.6.so.1.0
=> /home/embedded/oetmp_shr-merge_htcdream/staging/i686-linux/usr/lib/libpython2.6.so.1.0 (0xb7eb8000)
	libexpat.so.0
=> /home/embedded/oetmp_shr-merge_htcdream/staging/i686-linux/usr/lib/libexpat.so.0 (0xb7e92000)
	libc.so.6 => /lib/libc.so.6 (0xb7d58000)
	/lib/ld-linux.so.2 (0xb80e0000)
	libpthread.so.0 => /lib/libpthread.so.0 (0xb7d40000)
	libdl.so.2 => /lib/libdl.so.2 (0xb7d3c000)
	libutil.so.1 => /lib/libutil.so.1 (0xb7d38000)

Note the libexpat...
I've libexpat.so.1 in all my systems.

Moreover bitbaking gdb-cross-sdk produced some ipk...and no tarball...

Denis.





