Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OXAOG-0006kZ-Sw
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 12:01:05 +0200
Received: from gandalf.denix.org ([unknown] [71.251.56.71])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L5900CZO0CDS67T@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	08 Jul 2010 11:55:25 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EB10F14AF60; Thu,
	08 Jul 2010 12:55:24 -0400 (EDT)
Date: Thu, 08 Jul 2010 12:55:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100708165524.GB12383@denix.org>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819743@deimsg40.de.net.world>
	<4C2C8F31.2050107@freyther.de>
	<0B51A1E7C61D114DAE6FC10B0FD0ABA501819D67@deimsg40.de.net.world>
MIME-version: 1.0
In-reply-to: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819D67@deimsg40.de.net.world>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Creating a Own Tool chain, some referenced packages are	not included into the SDK archive
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
X-List-Received-Date: Fri, 09 Jul 2010 10:01:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jul 08, 2010 at 05:22:38PM +0200, Hauser, Wolfgang (external) wrote:
> Hello, I have found the problems of creating the toolchain 
> meta-toolchain-qte.bb (and my derived one) !
> 
> Second problem:
> meta-toolchain-qte.bb contains following line in do_populate_sdk_append():
> 
>   >script = "${SDK_OUTPUT}/${SDKPATH}/environment-setup"<
> 
> this have to be changed to:
> 
>   >script="${SDK_OUTPUT}/${SDKPATH}/environment-setup"<
> 
> because the code is used as shell commands and not as python code !
> 
> The issue above results in a call of "script" with arguments "=" and 
> "${SDK_OUTPUT}/${SDKPATH}/environment-setup".
> "script" opens a "bash -i" and wait for commands. Therefore the processing 
> blocks until this shell exits.

Worked here for long time and environment-setup gets populated with 
corresponding lines...

-- 
Denys


