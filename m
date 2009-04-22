Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1Lwd4V-0001lA-Kq
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 16:05:07 +0200
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id 2FD3B547E4; Wed, 22 Apr 2009 16:00:34 +0200 (CEST)
Date: Wed, 22 Apr 2009 16:00:34 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090422140034.GA27393@fh-wedel.de>
MIME-Version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: default for IPKGBUILDCMD (ipkg-build not found)
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
X-List-Received-Date: Wed, 22 Apr 2009 14:05:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

 I just stumbled across this here. I try to build
linux-libc-headers using `bitbake -b /path/to/recipe.bb'. The
build fails with this message:

NOTE: package linux-libc-headers-2.6.18-r3: task do_package: completed
NOTE: Running task 10 of 18 (ID: 9, /var/src/OE/org.openembedded.dev/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb, do_populate_staging)
NOTE: package linux-libc-headers-2.6.18-r3: task do_populate_staging: started
NOTE: package linux-libc-headers-2.6.18-r3: task do_populate_staging: completed
NOTE: Running task 11 of 18 (ID: 17, /var/src/OE/org.openembedded.dev/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb, do_package_write_ipk)
NOTE: package linux-libc-headers-2.6.18-r3: task do_package_write_ipk: started
sh: ipkg-build: command not found
NOTE: Task failed: ipkg-build execution failed
NOTE: package linux-libc-headers-2.6.18-r3: task do_package_write_ipk: failed

Searching my tmp/ tree I find that there is no ipkg-build but
a stage-manager-ipkg-build instead. Grepping through the configuration
reveals that in conf/bitbake.conf `IPKGBUILDCMD' is set to "ipk-build".
This variable is used in `package_ipk.bbclass'.

I do not quite understand why I do not get this error when linux-libc-headers
is implicitly built due to dependencies, but nevertheless it seems that
either IPKBUILDCMD is deprecated but still used in `package_ipk.bbclass' though
it should not be, or the default in conf/bitbake.conf is not correct?

Cheers,

Martin

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
There's only one serious question. And that is: Who knows how to make love stay?
Answer me that and I will tell you whether or not to kill yourself. Answer me 
that and I will ease your mind about the beginning and the end of time. Answer 
me that and I will reveal to you the purpose of the moon.  -- Tom Robbins


