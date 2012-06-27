Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sjt2U-0006Ig-6m
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jun 2012 16:16:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jun 2012 07:05:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="170650132"
Received: from unknown (HELO helios.localnet) ([10.252.120.185])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2012 07:05:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org, yocto@yoctoproject.org
Date: Wed, 27 Jun 2012 15:05:08 +0100
Message-ID: <20317992.tBZ1YY1I5v@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
MIME-Version: 1.0
Cc: joe.macdonald@windriver.com
Subject: LAMP layer
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
X-List-Received-Date: Wed, 27 Jun 2012 14:16:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

In conjunction with the folks at Wind River I'm currently in the process of 
putting together a layer to support the traditional LAMP stack, and wanted to 
solicit some opinions on how this might be structured/named/etc.

I think we have the "L" pretty much covered ;) and we have MySQL in meta-oe 
(I'm not convinced that's where it should stay, although perhaps it need not 
be tied to this layer either). So the layer would at the very least be adding 
Apache and PHP, with the possibility of web-related python and perl recipes 
being added at a later date.

Some of the other things I'm looking at adding more immediately:

* collectd
* mysql-connector-odbc
* phpMyAdmin
* unixODBC
* xdebug

The question of how this should all be structured is still not fully 
determined. I'm thinking this ought to be at least one additional layer (i.e. 
meta-lamp, or some other name), even in the face of the proposed meta-
networking, since the number of recipes in the LAMP layer is likely to grow 
over time and it's a specific set of functionality that people would explicitly 
select.

I now have updated apache and modphp recipes building and working reasonably 
well, although further testing will be needed. Initially I'm prepared to 
maintain these recipes, however if not immediately at some point in the near 
future it would be good to see a maintainer step forward with more specific 
knowledge of these particular pieces of software.

Thoughts?

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre


