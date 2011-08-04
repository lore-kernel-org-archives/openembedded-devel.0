Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qouud-0003oH-Tl
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 12:12:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Aug 2011 03:07:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,315,1309762800"; d="scan'208";a="35048326"
Received: from unknown (HELO helios.localnet) ([10.255.18.66])
	by azsmga001.ch.intel.com with ESMTP; 04 Aug 2011 03:07:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 4 Aug 2011 11:07:57 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <4E3A6A8D.3010301@nedap.com>
In-Reply-To: <4E3A6A8D.3010301@nedap.com>
MIME-Version: 1.0
Message-Id: <201108041107.57156.paul.eggleton@linux.intel.com>
Subject: Re: exclude (r)depends
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
X-List-Received-Date: Thu, 04 Aug 2011 10:12:24 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 04 August 2011 10:46:53 Jaap de Jong wrote:
> I've build a simple recipe.
> Bitbake figures it depends on libsqlite0 and libsqlite3-0; which is
> correct by the way...
> For some reason I don't want the dependencies in the ipk file.
> Is there some flag for this?

There's no "flag" for this because just taking away the shlibdeps-generated 
RDEPEND will almost certainly break the application/library at runtime. There 
are a few correct ways to solve it:

1) If the part of the binary output that needs sqlite is a plugin or otherwise 
optional module, just put it into a separate package (e.g. using 
PACKAGES_prepend = "${PN}-sqlitemodule" then FILES_${PN}-sqlitemodule = 
"${libdir}/libsomethingsqlite.so.*". Then your main package (${PN}) should not 
depend on sqlite anymore, as long as it doesn't have a hard dependency on the 
sqlite-using module.

2) Disable the sqlite dependency during configure, or if that can't be done, 
patch the source to acheive the same effect.

3) Depending on how complex the program is, with extra effort you could patch 
the source to turn it into an optional runtime dependency by using dlopen(3) 
instead of linking to sqlite during the build.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


