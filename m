Return-Path: <sjl@dent.vctlabs.com>
Received: from dent.vctlabs.com (dent.vctlabs.com [68.183.110.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2EEC0770C5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2015 04:25:31 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 0B482C0650; Thu,  1 Oct 2015 21:49:48 -0700 (PDT)
Date: Thu, 1 Oct 2015 21:49:48 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151002044948.GG23865@dent.vctlabs.com>
References: <20150718003812.GA18468@dent.vctlabs.com>
	<20151001150645.GC2403@jama>
MIME-Version: 1.0
In-Reply-To: <20151001150645.GC2403@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-filesystems][PATCH 1/2] libimobiledevice: remove runtime configure check
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Oct 2015 04:25:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2015 at 05:06:45PM +0200, Martin Jansa wrote:
> On Fri, Jul 17, 2015 at 05:38:12PM -0700, S. Lockwood-Childs wrote:
> > configure.ac had a runtime check for large file support that got run
> > on 64-bit architectures, and all runtime checks must go away to be
> > cross-compile safe.
> > 
> > Luckily that runtime check was extraneous, so just remove it;
> > standard AC_SYS_LARGEFILE macro should be sufficient for figuring out
> > proper settings to get large file support.
> > 
> > Also un-blacklist libimobiledevice, since this problem was the
> > reason for the blacklist.
> 
> There is another issue, probably triggered by switch to gcc-5, are you
> willing to fix it?
> 
> | /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libimobiledevice/1.1.4-r0/libimobiledevice-1.1.4/src/afc.c:258: error: undefined reference to 'debug_buffer'
> | /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libimobiledevice/1.1.4-r0/libimobiledevice-1.1.4/src/afc.c:273: error: undefined reference to 'debug_buffer'
> | /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libimobiledevice/1.1.4-r0/libimobiledevice-1.1.4/src/afc.c:247: error: undefined reference to 'debug_buffer'
> | /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libimobiledevice/1.1.4-r0/libimobiledevice-1.1.4/src/afc.c:258: error: undefined reference to 'debug_buffer'
> | collect2: error: ld returned 1 exit status
> | make[2]: *** [libimobiledevice.la] Error 1
> | make[2]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libimobiledevice/1.1.4-r0/build/src'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libimobiledevice/1.1.4-r0/build'
> | make: *** [all] Error 2
> 
> otherwise I'll blacklist it again in few days (it was reported in couple world builds already).

Yes, I can take a look this weekend. Thanks for the heads up.

