Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NxMyZ-0000CP-Jq
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 18:10:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o31G7HU0023098;
	Thu, 1 Apr 2010 17:07:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22602-09; Thu,  1 Apr 2010 17:07:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o31G79RP023092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Apr 2010 17:07:09 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1270136609.6277.98.camel@trini-m4400>
References: <1270135981.4993.128.camel@rex>
	<1270136509.6277.97.camel@trini-m4400>
	<1270136609.6277.98.camel@trini-m4400>
Date: Thu, 01 Apr 2010 17:07:07 +0100
Message-ID: <1270138027.4993.139.camel@rex>
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
Cc: "Lock, Joshua" <joshua.lock@intel.com>
Subject: Re: Request for branch merge
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
X-List-Received-Date: Thu, 01 Apr 2010 16:10:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-04-01 at 08:43 -0700, Tom Rini wrote:
> On Thu, 2010-04-01 at 08:41 -0700, Tom Rini wrote:
> > On Thu, 2010-04-01 at 16:33 +0100, Richard Purdie wrote:
> > 
> > > * Added relocatable binary processing from Poky for -native binaries 
> > >   using chrpath. This isn't enabled for -cross packages due to the 
> > >   relative path length problems.
> > 
> > Is there a reason to not use $ORIGIN here instead?  The patch Chris
> > Larson posted ages ago does get this right (the hard part is
> > gcc/gdb/binutils due to the multi configure running).  And any path
> > length issues you hit with -cross you should be able to hit with
> > -native, no?
> 
> For reference it's just doing:
> export RELATIVERPATH = "${@base_path_relative(d.getVar('bindir', 1),
> d.getVar('STAGING_LIBDIR_NATIVE', 1))}"
> export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
>                         -Wl,-rpath,\\\$\$ORIGIN/${RELATIVERPATH} -Wl,-O1
> \
>                         -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1 \
>                         "
> 
> In bitbake.conf (extra variable for dealing with the hard packages
> later).

I really much prefer the post processing approach as it "just works" and
doesn't need exceptions for hard packages, nor does it have horrible
quoting.

Cheers,

Richard




