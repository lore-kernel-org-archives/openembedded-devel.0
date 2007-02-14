Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HH90Q-0007ui-BY
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Feb 2007 02:32:22 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 044F11AE829;
	Tue, 13 Feb 2007 20:32:20 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Tue, 13 Feb 2007 20:32:20 -0500
X-Sasl-enc: LYamvT0HUtFsul+msu0w9fZqaOay31NhWie6I6tlMTT3 1171416739
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id AC7741F7EE;
	Tue, 13 Feb 2007 20:32:17 -0500 (EST)
Message-ID: <45D266A3.4040102@whitby.id.au>
Date: Wed, 14 Feb 2007 12:02:19 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: Jamie Lenehan <lenehan@twibble.org>
References: <45D1574C.8090009@whitby.id.au> <20070214012158.GA906@twibble.org>
In-Reply-To: <20070214012158.GA906@twibble.org>
X-Enigmail-Version: 0.94.0.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: madwifi-ng patch rationalisation and version update
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
X-List-Received-Date: Wed, 14 Feb 2007 01:32:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Jamie Lenehan wrote:
> On Tue, Feb 13, 2007 at 04:44:36PM +1030, Rod Whitby wrote:
> [...]
>> We also intend updating madwifi-ng to a later snapshot (e.g.
>> r2100-20070210), cause the current version won't build against 2.6.20
>> due to changes in the INIT_WORK kernel macro.
> 
> I've been waiting for them to fix this for a while now so I can move
> forward to newer kernels - so I definitely want the newer verison.
> 
> I think it'd would be a good idea to remove all the older versions as
> well, apart from perhaps r1844 which corrosponds to the last actual
> madwifi release (0.9.2.1). This should help get us back to one set of
> patches as well since in version r1844 they changed the file that arm
> is patching, requiring different patches for r1844 and newer.
> 
> Actually looking at it now it appears as if someone patched the
> version in the files directory for a newer version so the older
> versions (prior to r1844) won't build anymore anyway (patching will
> fail). So the older versions of madwifi-ng and all the version
> specific subdirs can all go as well.

OK, I'll do this too.

So the only madwifi-ng versions remaining will be
madwifi-ng_r1844-20061208.bb and madwifi-ng_r2100-20070210.bb and they
will use common patches from the files directory.

I'll let someone else deal with madwifi-modules ...

-- Rod


