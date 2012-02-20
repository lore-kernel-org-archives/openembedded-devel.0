Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RzSEK-00065p-31
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 13:20:32 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Feb 2012 04:12:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127376205"
Received: from unknown (HELO helios.localnet) ([10.252.123.17])
	by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2012 04:12:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Budde <robert@projekt131.de>
Date: Mon, 20 Feb 2012 12:12:11 +0000
Message-ID: <3915047.7HeCOYZS0V@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <002c01ccefbf$99ccf580$cd66e080$@projekt131.de>
References: <002c01ccefbf$99ccf580$cd66e080$@projekt131.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Deploy binaries not compiled for target / PACKAGE_STRIP = "no" does not work?
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
X-List-Received-Date: Mon, 20 Feb 2012 12:20:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 February 2012 12:05:48 Robert Budde wrote:
> I am trying to write a recipe for packaging "webmin". 

Ah, well the good news is I did this already :) :

http://git.yoctoproject.org/cgit/cgit.cgi/meta-baryon/tree/recipes-
extended/webmin/

There might be some tweaking required as we turned off a few things and applied 
some minor customisations, but it builds and works.

> The web-interface for
> system administration is written entirely in PERL, therefore it "just" has
> to be copied to the right directory (and some conf-files have to be
> generated). Right now the recipe should download the right archive and copy
> the files to the right directory. As the archive contains precompiled
> binaries the "strip"-operations in do_package() fail!? I tried to get rid of
> it by 'PACKAGE_STRIP = "no"', but that does not work.

To turn off stripping you would do INHIBIT_PACKAGE_STRIP ="1", however for 
something like this where there is nothing architecture-specific you would do 
"inherit allarch" which does this for you among other things. However, the 
precompiled binaries the errors refer to are actually not needed and the 
recipes I link to above just delete them before packaging.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


