Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OiZ9v-0003Tj-TF
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 22:41:24 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L6W005VNK3YBV03@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	09 Aug 2010 15:40:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 49BDF14AF64; Mon,
	09 Aug 2010 16:40:46 -0400 (EDT)
Date: Mon, 09 Aug 2010 16:40:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100809204046.GD7189@denix.org>
References: <FDA0423D-F572-4F4D-9330-24890469FD70@keylevel.com>
MIME-version: 1.0
In-reply-to: <FDA0423D-F572-4F4D-9330-24890469FD70@keylevel.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How do I build and SDK?
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
X-List-Received-Date: Mon, 09 Aug 2010 20:41:24 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Aug 09, 2010 at 09:12:11PM +0100, Chris Tapp wrote:
> I've had a look at the OE manual to try and understand what's needed to 
> build an SDK, but I'm still not sure what I need to do.
>
> I can 'bitbake my-image', giving me a system that boots ok on my target.
>
> What I want to do now is produce an SDK that allows binaries to be built 
> under an x86 hosted linux distro (e.g. ubuntu).
>
> I'm not sure why there is a host and target to configure - I was expecting 
> just to configure something for the platform that will run the SDK - I was 
> thinking that the current OE local.conf should give the information needed 
> to do this.
>
> Is there an easy way to take a system configured to build 'my-image' and 
> produce an SDK from that? I'm running OE under Ubuntu, if that makes things 
> easier.
>
> Failing that, are there any examples I can look at that would give me a 
> more information that what's in the documentation?

Chris,

Please look at "bitbake meta-toolchain" - that produces an SDK. For 
customizing it, see the different examples under meta-toolchain-*.bb

-- 
Denys


