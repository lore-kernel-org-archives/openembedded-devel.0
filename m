Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <freyther@gmx.net>) id 1HTjA6-0002v9-UE
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2007 19:34:22 +0100
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=[192.168.1.23]) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <freyther@gmx.net>) id 1HTjA6-00049U-Dy
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2007 19:34:22 +0100
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <1174408657.5852.22.camel@localhost.localdomain>
References: <74d0deb30701310740p73af77a7j25a8b4597345903a@mail.gmail.com>
	<1174346093.5824.89.camel@localhost.localdomain>
	<45FF29BF.1040008@whitby.id.au>
	<74BCF2CF-3650-4464-9E51-CA853E3DCDFA@gmx.net>
	<45FF3942.5040900@whitby.id.au>
	<1174408657.5852.22.camel@localhost.localdomain>
Message-Id: <477DE51E-16DC-44A6-A354-B837064585DC@gmx.net>
From: Holger Freyther <freyther@gmx.net>
Date: Tue, 20 Mar 2007 19:34:13 +0100
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
Subject: Re: [PATCH] Epoch support for bitbake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Mar 2007 18:34:23 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 20.03.2007 um 17:37 schrieb Richard Purdie:

> I'm hoping omoko will update to use bitbake 1.8.x. If they don't, we
> might consider backporting the epoch code to 1.6.x. Lets see how  
> things
> work out...

Upgrade path:
	Make the metadata compile with bitbake-1.8 or verify that it compiles
	Compile everything with the old bitbake and save the image+ipk's
	Recompile everything (exact same source) with the new bitbake-1.8

	Run ipkg-diff from contrib/qa and see what changed. Evaluate changes  
and inform us and go with bitbake-1.8

z.


