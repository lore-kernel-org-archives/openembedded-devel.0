Received: from [85.37.17.114] (helo=smtp-out114.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1M4FHJ-0006SL-HZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 16:17:49 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out114.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 13 May 2009 16:10:44 +0200
Received: from FBCMCL01B01.fbc.local ([192.168.69.82]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Wed, 13 May 2009 16:10:44 +0200
Received: from [192.168.1.107] ([79.54.10.109]) by FBCMCL01B01.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 13 May 2009 16:10:44 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <87bppxe07v.wl%peter@chubb.wattle.id.au>
References: <87bppxe07v.wl%peter@chubb.wattle.id.au>
Date: Wed, 13 May 2009 16:12:37 +0200
Message-Id: <1242223957.9015.6.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 13 May 2009 14:10:44.0383 (UTC)
	FILETIME=[9B00FAF0:01C9D3D4]
Subject: Re: Building older glibc
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
X-List-Received-Date: Wed, 13 May 2009 14:17:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-05-13 at 21:00 +1000, Peter Chubb wrote:
> Is there a trick to building an older glibc than the head?  I'm
> building for x86, and I need a libc.a that'll run against a 2.6.10
> kernel --- so I've tried
> 	bitbake glibc-2.3.2
> (and 2.3.5)
> And I see :
> ...
> | configure: loading site script /usr/src/oe-sel4/openembedded/site/common
> | configure: loading site script /usr/src/oe-sel4/openembedded/site/common
> | configure: error: add-on directory "nptl" does not exist
> | FATAL: oe_runconf failed
> NOTE: Task failed: /usr/src/oe-sel4/tmp/work/i686-oe-linux/glibc-2.3.2-r20/temp/log.do_configure.17493
> NOTE: package glibc-2.3.2-r20: task do_configure: failed
> ERROR: TaskFailed event exception, aborting
> 
> --
> Dr Peter Chubb  http://www.gelato.unsw.edu.au  peterc AT gelato.unsw.edu.au
> http://www.ertos.nicta.com.au           ERTOS within National ICT Australia
I had the same requirements:
I have a 2.4 kernel that doesn't have:
*nptl
*eabi
so I tried to patch a recent glibc and at the end I end up choosing
uclibc...
The drawback is that it seriously affect my binary compatibility with
glibc(that is to say I can't run the proprietary software that came with
the device...but I want to get rid of that software anyway...so...)
I didn't try or look into eglibc and I'm interested in knowing if it
require nptl
 
Denis.



