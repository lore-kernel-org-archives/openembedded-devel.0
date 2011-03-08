Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1PwsQi-0005oJ-3T
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 09:38:08 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 35F0B1D360AB; Tue,  8 Mar 2011 09:36:33 +0100 (CET)
Date: Tue, 8 Mar 2011 09:36:33 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110308083632.GE18143@ibawizard.net>
References: <4D75D1A7.9040103@gmx.net> <4D75E0CF.1040209@gmx.net>
MIME-Version: 1.0
In-Reply-To: <4D75E0CF.1040209@gmx.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: libffi-native 3.0.9 fails to build on at least x86_64	[solved, problem on my side]
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
X-List-Received-Date: Tue, 08 Mar 2011 08:38:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Robert Schuster <thebohemian@gmx.net> [2011-03-08 08:54:55]:

> I moved the whole OE directory (bitbake, oe, configdir) to a new
> location and made it available through the same path using a symlink. As
> it looks OE does not like that at all.

In OE manual, in Getting started section there's information about
OEBASE/TOPDIR: "You must choose a location with _no symlinks above it_."

It's some problem with handling of symlinks in the path in Python or something
like that. 

-- ynezz


