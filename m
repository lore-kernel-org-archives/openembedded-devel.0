Received: from [216.215.6.39] (helo=ice.mudshark.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <jack@ice.mudshark.org>) id 1H0AfD-0007JJ-RR
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Dec 2006 06:52:20 +0100
Received: by ice.mudshark.org (Postfix, from userid 1000)
	id D2DB1134008; Thu, 28 Dec 2006 21:51:40 -0800 (PST)
Date: Thu, 28 Dec 2006 21:51:40 -0800
From: jack-oe@mudshark.org
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061229055140.GB18175@ice.mudshark.org>
References: <20061229001129.GA5501@hezmatt.org>
Mime-Version: 1.0
In-Reply-To: <20061229001129.GA5501@hezmatt.org>
User-Agent: Mutt/1.4.1i
Subject: Re: What's with the symlinks?
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
X-List-Received-Date: Fri, 29 Dec 2006 05:52:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 29, 2006 at 11:11:29AM +1100, Matthew Palmer wrote:

> Everywhere I go while assembling my OE build tree, I see admonishments not
> to use a path that has symlinks in it.  For such a major problem, the only
> real information on the actual problem is a fairly cryptic entry in the FAQ,
> about a failure to build libtool-native.
 
> Being an intensely curious kind of person, and not enjoying arbitrary
> limits, I'm very interested to know what the *real* reason behind being so
> strongly against the much-maligned symlink.  Can anyone enlighten me?

I ran into this. IIRC if "$PWD" != "`readlink -f $PWD`", then automake-native
fails to build. 

This is a feature of the automake build system. 

--Jack 

--
Jack (John) Cummings                           http://mudshark.org/
PGP fingerprint: 0774 D073 E386 B70B 6B16  2D2B 1DD8 F8B0 CCF0 FAEE


