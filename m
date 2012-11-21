Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TbEg3-0001sw-W5
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 19:05:36 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Nov 2012 09:51:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,293,1352102400"; d="scan'208";a="222736341"
Received: from unknown (HELO helios.localnet) ([10.252.122.187])
	by orsmga001.jf.intel.com with ESMTP; 21 Nov 2012 09:51:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Nov 2012 17:51:10 +0000
Message-ID: <2060735.4IBGo344JD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.2.0-33-generic-pae; KDE/4.9.3; i686; ; )
In-Reply-To: <20121121173754.GN12637@jama.jama.net>
References: <cover.1353518890.git.paul.eggleton@linux.intel.com>
	<1eef087d214b6c6ff27b60dff5511acfc2a3925e.1353518890.git.paul.eggleton@linux.intel.com>
	<20121121173754.GN12637@jama.jama.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 2/2] ntp: make servers configurable and default to none configured
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
X-List-Received-Date: Wed, 21 Nov 2012 18:05:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 21 November 2012 18:37:54 Martin Jansa wrote:
> On Wed, Nov 21, 2012 at 05:29:30PM +0000, Paul Eggleton wrote:
> > People can't blindly use pool.ntp.org, especially if they are building
> > for a product or something that could be used in a product, so at least
> > try to get people to do the right thing and not use pool.ntp.org by
> > default.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  meta-networking/recipes-support/ntp/ntp.inc |   12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-networking/recipes-support/ntp/ntp.inc
> > b/meta-networking/recipes-support/ntp/ntp.inc index d20bc2e..b54608a
> > 100644
> > --- a/meta-networking/recipes-support/ntp/ntp.inc
> > +++ b/meta-networking/recipes-support/ntp/ntp.inc
> > @@ -33,12 +33,22 @@ PACKAGECONFIG[openssl] =
> > "--with-openssl-libdir=${STAGING_LIBDIR} \> 
> >                            --without-openssl --without-crypto, \
> >                            openssl"
> > 
> > +# This should be set in the distro configuration
> > +NTP_SERVERS ??= ""
> > +
> > +python __anonymous() {
> > +    if not d.getVar("NTP_SERVERS", True):
> > +        raise bb.parse.SkipPackage("Please set NTP_SERVERS in order to
> > build ntp - see http://www.openembedded.org/wiki/NTP for details") +}
> 
> Cannot we move this logic to target?
> 
> I mean ntpdate can be usefull for end-user even without this cron job.
> 
> We can add something like
> /etc/default/ntp
> NTP_SERVERS=""
> 
> And change cron job as well as that systemd .service file we talked
> about before to show
> "Please set correct NPT_SERVERS in /etc/default/ntp"
> instead of failing (in systemd .service file case) or not being able to
> build ntpdate package unless you have distro with own ntp pool.
> 
> On other hand distro with own ntp pool can provide own value in
> /etc/default/ntp with .bbappend, so their users won't ever see this on
> target.

Sure, this is an alternative approach. It will work for everything except 
ntp.conf, although for that we can just clear out that value in the file and 
get the distro to set their own custom version if they're going to use ntpd.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


