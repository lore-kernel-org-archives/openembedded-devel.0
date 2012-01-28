Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rr9EI-00035X-C4
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Jan 2012 15:26:10 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jan 2012 06:18:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117496690"
Received: from unknown (HELO helios.localnet) ([10.252.122.171])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2012 06:18:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Date: Sat, 28 Jan 2012 14:18:15 +0000
Message-ID: <2691471.Q2jpB2kn8z@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-15-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <CACW_hTaJXTrAP4YTTA2CwXFe7sYeY3yEFi8JfNbhiEzZbMttqg@mail.gmail.com>
References: <CACW_hTaJXTrAP4YTTA2CwXFe7sYeY3yEFi8JfNbhiEzZbMttqg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: get OE git hash tag in executable
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
X-List-Received-Date: Sat, 28 Jan 2012 14:26:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 28 January 2012 13:42:32 Frans Meulenbroeks wrote:
> In order to allow backtracking of the sources for a binary build with OE, I
> would like to (automatically) add the hash of the top level commit (and
> maybe also the branch) of the oe git tree my recipe lives in).
> E.g. in main.c I would like to have a var say:
> const char * const buildfrom = "oe branch 2011.03-maintence hash
> 1234567890"; or something like that.
> 
> What would be the best way to get that info into my program?
> (my best guess at the moment is to use a macro and compile with
> -DOE_IDENT="....." or so and say  char *buildfrom = OE_IDENT; but not
> really sure what the best way is to fill OE_IDENT and pass it to the
> recipe.)

Interesting question! Putting the information in a define specified on the 
compiler command line would be one way; another way would be to have the 
recipe write to/append to/subsitute into a header file that you can #include in 
the source. You would also probably want to include ${DATE} in the recipe's PV 
or use some other mechanism to ensure it gets rebuilt every time you build an 
image.

I guess you are still using OE-Classic, but in OE-Core we now have a function 
in base.bbclass called get_layers_branch_rev that will return the git 
branch/revision information for all enabled layers. It was split out from the 
code in the same bbclass that displays this information when BitBake starts, 
so I guess you could just make a copy of it into your recipe for OE-Classic.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


