Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1NlPjH-00089k-4Z
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Feb 2010 17:41:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 541162CA11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2010 16:34:18 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PxSZh7oVOK+j
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2010 16:34:14 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTPSA id 01DCC2C81E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2010 16:34:13 +0000 (UTC)
Message-ID: <4B894A8D.3020307@gmail.com>
Date: Sat, 27 Feb 2010 17:38:37 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
In-Reply-To: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=SPF_NEUTRAL autolearn=no
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] recipes/images/${distro}
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
X-List-Received-Date: Sat, 27 Feb 2010 16:41:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks ha scritto, Il 27/02/2010 16:25:
> Dear all,
> 
> I  think some restructuring is needed wrt distro's and images
> I did some counting and we currently have 32 distro's (ls
> conf/distro/*.conf | wc
> There are a few semi-dups (micro, minimal and oplinux have regular and
> uclibc versions, angstrom has angstrom-2008.1-legacy.conf  and
> angstrom-2008.1.conf, slugos has slugos, slugos-native and ucslugc)
> 
> also we have 94 images (ls recipes/images/*.bb | wc)
> For some of these it is quite obvious for which distro's they are.
> Mostly because they are prefixed with the distro name (e.g.nylon,
> slugos, openmoko)
> but for several others it is less clear. grep -i -l angstromg
> recipes/images/*.bb | wc gives 30 but not all of them are angstrom
> specific.
> E.g. nas-server-image.bb mentions angstrom in the comment but is
> distro agnostic.
> 
> Also sometimes the names are confusing. We have a minimal distro but
> minimal-image.bb is not an image for the minimal distro, but is an
> angstrom image.
> 
> My proposal is to create distro specific subdirs and move all images
> from a distro to that specific subdir
> That makes it more insightful what belongs to what.
> 

+1 from me

/marco


