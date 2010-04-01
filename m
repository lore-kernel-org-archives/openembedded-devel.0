Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NxMRX-0001Wk-RQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 17:36:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o31FX98m022716;
	Thu, 1 Apr 2010 16:33:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22632-02; Thu,  1 Apr 2010 16:33:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o31FX2F8022710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Apr 2010 16:33:02 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 01 Apr 2010 16:33:01 +0100
Message-ID: <1270135981.4993.128.camel@rex>
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
Subject: Request for branch merge
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
X-List-Received-Date: Thu, 01 Apr 2010 15:36:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've been aware that Poky and OE have been diverging slightly and I'd
like to correct this. There are some patches that I've promised for a
while too such as the rename from do_populate_staging ->
do_populate_sysroot.

With some help from Joshua Lock, I have a branch I'd like to propose be
merged into OE.dev:

http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=rpurdie/work-in-progress

This branch:

* Renames do_populate_staging -> do_populate_sysroot as per previous 
  staging discussion emails and also the staging directory -> 
  sysroots. It should convert existing builds safely and insert a 
  compatibility symlink. This continues the process of improving our 
  "staging" concept into one focused around true sysroots.
* Adds some gettext class sanity checks. In Poky this error is fatal, 
  for OE this is just a note for now. The idea being if AM_GNU_GETTEXT 
  is in configure.ac and gettext in some form isn't in DEPENDS, 
  something is wrong.
* Added relocatable binary processing from Poky for -native binaries 
  using chrpath. This isn't enabled for -cross packages due to the 
  relative path length problems.
* Added packaged-staging fetching capabilities. This uses new mirror 
  handling abilities in bitbake master branch but should work with older
  bitbakes, just with less functionality.
* Started moving gcc dependency information into core gcc version 
  specific includes as part of the gcc cleanup.
* Converted gcc to use the new style staging
* Added EXTRA_OECONF_INITIAL and EXTRA_OECONF_INTERMEDIATE variables to 
  gcc as part of the gcc cleanup
* Converted binutils, modutils-cross, glibc and gdb to new style staging
* Cleaned up the gcc-cross do_install function a lot

Along with a small number of other tweaks spotted along the way.

I could post the patches individually and get Acked lines for each one
but I'm hoping to avoid that and get permission to merge the branch
directly. We have talked about most of these things in one form or
another.

Cheers,

Richard



