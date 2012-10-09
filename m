Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TLZA7-0008SG-Gi
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 14:43:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Oct 2012 05:30:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,560,1344236400"; d="scan'208";a="203392271"
Received: from unknown (HELO helios.localnet) ([10.252.122.38])
	by orsmga001.jf.intel.com with ESMTP; 09 Oct 2012 05:30:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 09 Oct 2012 13:30:38 +0100
Message-ID: <2982314.ddUisfMeTu@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-31-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <k51502$he4$1@ger.gmane.org>
References: <cover.1349608252.git.paul.eggleton@linux.intel.com>
	<438b1be4a4a437a034365729a873964b7e44d0e8.1349608252.git.paul.eggleton@linux.intel.com>
	<k51502$he4$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 1/3] apache2: fix configuration
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
X-List-Received-Date: Tue, 09 Oct 2012 12:43:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 October 2012 14:23:43 Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Op 07-10-12 13:13, Paul Eggleton schreef:
> > * Include conf files in /etc/apache2/modules.d and conf.d * Add -D PHP5
> > to options so that PHP is enabled if installed * Fix "reload" action in
> > initscript
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> This is more likely related to your previous patch, but:
> | /bin/sh:
> /OE/tentacle/build/tmp-angstrom_next-eglibc/work/armv7a-vfp-neon-angstrom-li
> nux-gnueabi/apr-1.4.6-r1/apr-1.4.6/arm-angstrom-linux-gnueabi-libtool: No
> such file or directory
> 
> | make[3]: *** [unixd.lo] Error 127
> | make[3]: Leaving directory
> 
> `/OE/tentacle/build/tmp-angstrom_next-eglibc/work/armv7a-vfp-neon-angstrom-l
> inux-gnueabi/apache2-2.4.2-r1/httpd-2.4.2/os/unix'
> | make[2]: *** [all-recursive] Error 1
> | make[2]: Leaving directory
> 
> `/OE/tentacle/build/tmp-angstrom_next-eglibc/work/armv7a-vfp-neon-angstrom-l
> inux-gnueabi/apache2-2.4.2-r1/httpd-2.4.2/os/unix'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> 
> `/OE/tentacle/build/tmp-angstrom_next-eglibc/work/armv7a-vfp-neon-angstrom-l
> inux-gnueabi/apache2-2.4.2-r1/httpd-2.4.2/os'
> | make: *** [all-recursive] Error 1
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see
> 
> /OE/tentacle/build/tmp-angstrom_next-eglibc/work/armv7a-vfp-neon-angstrom-li
> nux-gnueabi/apache2-2.4.2-r1/temp/log.do_compile.591 for further
> information)
> ERROR: Task 6
> (/OE/tentacle/sources/meta-openembedded/meta-webserver/recipes-httpd/apache2
> /apache2_2.4.2.bb, do_compile) failed with exit code '1'

I'm guessing you are using rm_work? Obviously it's not supposed to be 
referring to anything in the WORKDIR for another recipe, but it would at least 
explain why I did not see that failure here.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


