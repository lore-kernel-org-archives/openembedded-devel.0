Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QjJvo-0003qn-SP
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 01:42:29 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jul 2011 16:35:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,231,1309762800"; d="scan'208";a="29178481"
Received: from unknown (HELO [10.255.14.85]) ([10.255.14.85])
	by azsmga001.ch.intel.com with ESMTP; 19 Jul 2011 16:35:12 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jul 2011 16:35:05 -0700
In-Reply-To: <201107200038.55362.schnitzeltony@gmx.de>
References: <201107182310.56104.schnitzeltony@gmx.de>
	<201107182319.01358.schnitzeltony@gmx.de>
	<201107200038.55362.schnitzeltony@gmx.de>
X-Mailer: Evolution 3.0.2 (3.0.2-3.fc15) 
Message-ID: <1311118512.2115.15.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [OE-core][meta-oe] Problems on downloading sources (was [OE-core] Problems downloading xfwm4 4.8.1)
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
X-List-Received-Date: Tue, 19 Jul 2011 23:42:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-20 at 00:38 +0200, Andreas Mueller wrote:
> On Monday, July 18, 2011 11:19:01 PM Andreas Mueller wrote:
> > On Monday, July 18, 2011 11:10:55 PM you wrote:
> > > Ciao
> > > 
> > > currently I am porting my local oe recipes for xfce-4.8 to oe-core.
> > > Everything seems fine so far - except xfwm4. This one drives me totally
> > > insane: If you check the fetch log attched and copy the first url into a
> > > browser it starts downloading without problems but oe complains.
> > > 
> > > Could somebody please point me onto what is going wrong - if you need
> > > further information I'll send...
> > 
> > I found a hook on what is going wrong - forget my prevoius mail - sorry fo
> > the noise..
> Sorry but my 'hook' was some late night crap. 
> 
> I attached what I did up to now. It is meta-xfce which should live in meta-
> openembedded. I checked on fresh tmp and without downloaded sources. For (at 
> least) xfwm4 and xfce4-appfinder build fails when downloading sources. For xfce4-
> appfinder I get:
> 
> ERROR: Function 'Fetcher failure for URL: 
> 'http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-
> appfinder-4.8.0.tar.bz2'. Unable to fetch URL 
> http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-appfinder-4.8.0.tar.bz2 
> from any source.' failed
> ERROR: Logfile of failure stored in: /home/Superandy/tmp/oe-core-
> eglibc/work/armv7a-angstrom-linux-gnueabi/xfce4-appfinder-4.8.0-
> r0/temp/log.do_fetch.30009
> Log data follows:
> | NOTE: fetch http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-
> appfinder-4.8.0.tar.bz2
> | NOTE: fetch http://www.angstrom-distribution.org/unstable/sources/xfce4-
> appfinder-4.8.0.tar.bz2
> | ERROR: Function 'Fetcher failure for URL: 
> 'http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-
> appfinder-4.8.0.tar.bz2'. Unable to fetch URL 
> http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-appfinder-4.8.0.tar.bz2 
> from any source.' failed
> NOTE: package xfce4-appfinder-4.8.0-r0: task do_fetch: Failed
> 
> If I enter http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-
> appfinder-4.8.0.tar.bz2 in my browser or perform wget manually, the source file is 
> downloaded properly!!
> 
> Could somebody please spend some time with the attachment and tell me what's 
> going on here??

I'd guess it's Yocto #1256[1], namely that "fetcher reports a download
failure when only the SRC_URI checksums mismatched"

The idea is that the fetcher retries downloads a few times when the
checksums do not match, unfortunately at the default log level this just
looks like a fetch failure.

Can you run bitbake with -DD and see if you can see a checksum error? Or
just verify checksums by hand?

Cheers,
Joshua
1. http://bugzilla.pokylinux.org/show_bug.cgi?id=1256
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



