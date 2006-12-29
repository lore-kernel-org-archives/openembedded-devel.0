Received: from [70.85.129.92] (helo=sasquatch.hezmatt.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mpalmer@hezmatt.org>) id 1H0B22-0007Ws-9y
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Dec 2006 07:15:54 +0100
Received: from [10.6.66.6] (helo=hezmatt.org)
	by sasquatch.hezmatt.org with esmtp (Exim 3.35 #1 (Debian))
	id 1H0B1N-0006C5-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Dec 2006 17:15:14 +1100
Received: by hezmatt.org (Postfix, from userid 1000)
	id 1124F4AF20; Fri, 29 Dec 2006 17:15:10 +1100 (EST)
Date: Fri, 29 Dec 2006 17:15:09 +1100
From: Matthew Palmer <mpalmer@hezmatt.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061229061509.GA12055@hezmatt.org>
References: <20061229001129.GA5501@hezmatt.org>
	<20061229055140.GB18175@ice.mudshark.org>
MIME-Version: 1.0
In-Reply-To: <20061229055140.GB18175@ice.mudshark.org>
User-Agent: Mutt/1.5.11
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
X-List-Received-Date: Fri, 29 Dec 2006 06:15:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 28, 2006 at 09:51:40PM -0800, jack-oe@mudshark.org wrote:
> On Fri, Dec 29, 2006 at 11:11:29AM +1100, Matthew Palmer wrote:
> 
> > Everywhere I go while assembling my OE build tree, I see admonishments not
> > to use a path that has symlinks in it.  For such a major problem, the only
> > real information on the actual problem is a fairly cryptic entry in the FAQ,
> > about a failure to build libtool-native.
>  
> > Being an intensely curious kind of person, and not enjoying arbitrary
> > limits, I'm very interested to know what the *real* reason behind being so
> > strongly against the much-maligned symlink.  Can anyone enlighten me?
> 
> I ran into this. IIRC if "$PWD" != "`readlink -f $PWD`", then automake-native
> fails to build. 
> 
> This is a feature of the automake build system. 

Interesting "feature".  I'd use a slightly different word for it, though.

- Matt


