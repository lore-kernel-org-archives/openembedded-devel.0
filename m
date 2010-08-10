Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OiuUa-0007xc-Vj
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 21:28:16 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L6Y001W4BDBD3G1@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	10 Aug 2010 14:27:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D7AAA14AF64; Tue,
	10 Aug 2010 15:27:10 -0400 (EDT)
Date: Tue, 10 Aug 2010 15:27:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100810192710.GE7189@denix.org>
References: <4C607E6C.2030104@mlbassoc.com>
	<AANLkTi=zp9r7hoym3kFEx9hpCgoQ8iOBVNZ6FhN7F4q6@mail.gmail.com>
	<4C6130EC.9030602@mlbassoc.com> <4C614AB7.2050709@mlbassoc.com>
MIME-version: 1.0
In-reply-to: <4C614AB7.2050709@mlbassoc.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: [Angstrom-devel] Can't build gstreamer-ti
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
X-List-Received-Date: Tue, 10 Aug 2010 19:28:17 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Aug 10, 2010 at 06:48:55AM -0600, Gary Thomas wrote:
> On 08/10/2010 04:58 AM, Gary Thomas wrote:
>> But I've downloaded those tools and was able to build this recipe just
>> a few weeks ago. I think something in the staged packaging has broken it.
>
> I worked past this problem by installing a symlink by hand to my DVSDK 
> installed tools.
>
> Next problem :-(
>
> | Engine.c:(.text+0x19d4): undefined reference to `__aeabi_uidiv'
>
> How were these packages built to be put on the Angstrom package feed?
> Am I doing something wrong?

As Henning already said, Codec Engine only builds and works with binutils 2.18 
(which IS Angstrom's default, btw) on TI OMAP3/DaVinci processors.

-- 
Denys


