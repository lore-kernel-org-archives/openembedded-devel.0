Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NxOvN-0007XT-1d
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 20:15:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o31IC8Xr024665
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Apr 2010 19:12:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24606-02 for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Apr 2010 19:12:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o31IC2mO024659
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Apr 2010 19:12:02 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1270140902.6277.123.camel@trini-m4400>
References: <E1NxJrs-0006SS-LZ@melo.openembedded.org>
	<1270137923.6277.101.camel@trini-m4400> <1270139665.4993.152.camel@rex>
	<1270140902.6277.123.camel@trini-m4400>
Date: Thu, 01 Apr 2010 19:12:00 +0100
Message-ID: <1270145520.4993.157.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Joshua Lock : packaged-staging: post-process non-binary files to fix paths packages
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
X-List-Received-Date: Thu, 01 Apr 2010 18:15:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-04-01 at 09:55 -0700, Tom Rini wrote:
> On Thu, 2010-04-01 at 17:34 +0100, Richard Purdie wrote:
> > > There's a lot more than just .la files that get these paths wrong.  If
> > > you use the scan_cmd you set on native/etc for everything you can fix
> > > them all up.
> > 
> > It scans everything for -native packages and just .la files for target
> > packages. I'd argue that for target packages we're better off fixing the
> > problems at source since the real target packages are probably also
> > bust?
> 
> Ah, hmm.  It's possibly just the .la files on the target (which some of
> us would like to see die and I can't argue against), I hadn't really
> bothered to differentiate (and I don't think it's a noticeable time
> diff).  Less logic also brings it closer to working for relocation of
> everything.

But at the cost our target packages are most likely buggy. We accept
the .la files are a problem and there is a solution (libtool sysroot
support) but we're not there yet.

I'd like to see the other problems addressed, not brushed under the
carpet so to speak.

You can trivially make this work on all files in your
local.conf/distro.conf anyway. I'd not like to see that the default.

Cheers,

Richard




