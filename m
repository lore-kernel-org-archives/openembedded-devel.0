Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Ok1sW-0002Om-PO
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 23:33:30 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Ok1s4-0002Bn-Uk from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 14:33:00 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 13 Aug 2010 14:33:00 -0700
Received: from [172.30.80.96] ([172.30.80.96]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 13 Aug 2010 15:32:59 -0600
Message-ID: <4C65BA04.9020908@mentor.com>
Date: Fri, 13 Aug 2010 14:32:52 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=haC49V6XnCQpBCY8ickT24PL1F0sKYoh8h6=J@mail.gmail.com>
In-Reply-To: <AANLkTi=haC49V6XnCQpBCY8ickT24PL1F0sKYoh8h6=J@mail.gmail.com>
X-OriginalArrivalTime: 13 Aug 2010 21:32:59.0848 (UTC)
	FILETIME=[1A275C80:01CB3B2F]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: iputils fails to build due to missing sgmlspl
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
X-List-Received-Date: Fri, 13 Aug 2010 21:33:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

AJ ONeal wrote:
> This is with a fresh install of oe and bitbake (as per the gumstix docs)
> 
> |
> /mnt/data/Code/overo-oe/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> warning: libc.so, needed by
> /mnt/data/Code/overo-oe/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/lib/libgcc_s.so,
> not found (try using -rpath or -rpath-link)
> | make -C doc man
> | make[1]: Entering directory
> `/mnt/data/Code/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/iputils-20071127-r1/iputils_20071127.orig/doc'
> | /bin/sh: sgmlspl: command not found
> | make[1]: *** [arping.8] Error 127
> | make[1]: Leaving directory
> `/mnt/data/Code/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/iputils-20071127-r1/iputils_20071127.orig/doc'
> | make: *** [man] Error 2
> | FATAL: oe_runmake failed
> 
> 
> The problem is not solved by
> bitbake -c clean iputils; bitbake sgmlspl; bitbake iputils

You would need to do bitbake sgmlspl-native ; bitbake iputils, to get 
sgmlspl that runs on the host.  sgmlspl-native will bring in perl-native 
  and some other stuff, FYI.

-- 
Tom Rini
Mentor Graphics Corporation


