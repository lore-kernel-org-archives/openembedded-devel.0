Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SVV40-00067h-7K
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 23:50:20 +0200
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M48006HGMUFH4U1@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	18 May 2012 16:39:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 64C86201AE; Fri,
	18 May 2012 17:39:50 -0400 (EDT)
Date: Fri, 18 May 2012 17:39:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120518213950.GA4208@denix.org>
References: <CADZ6=avSzGXb3h1BunDQqqojA7tv-gO2VRicC6nt9KzAuNOcUg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CADZ6=avSzGXb3h1BunDQqqojA7tv-gO2VRicC6nt9KzAuNOcUg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Introducing the HidaV layer
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
X-List-Received-Date: Fri, 18 May 2012 21:50:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, May 18, 2012 at 10:09:42AM +0200, Thilo Fromm wrote:
> Hello *.*,
> 
> There's a new layer in town. HidaV will provide a common platform
> layer, development support, and firmware for our yet-to-come ti8148
> based systems. The layer poses a symbiosis of a "board support" and a
> "distribution" layer. HidaV integrates meta-ti, meta-openembedded,
> meta-angstrom, and openembedded-core to a well-tailored distribution.
> Although HidaV therefore heavily focuses on our own devices/boards we
> hope to provide useful bug fixes and recipes for other projects/layers
> as well.
> 
> The code is here: <https://github.com/DFE/HidaV>
> Some initial documentation: <https://github.com/DFE/HidaV/wiki>
> 
> Finally, I would like to add HidaV to the openembedded layer index[1].
> Is there some formality involved in this, or do I just create a wiki
> account and then edit it in?

Just couple questions - wouldn't it be better to send fixes to the underlying 
layers that you integrate, instead of holding them in your own integration 
layer? And if it's for your unique ti8148-based board, then it's fine, it may 
warrant a separate BSP layer for that. But why did you chose to pre-integrate 
other layers into yours? Although you seem to be using sub-modules, but it's 
still pre-integration, a-la Yocto/Poky releases...

Ah, and BTW, I think your layer ordering and priorities[1] are slightly wrong, 
as usually BSP layers reside lower than Software layers (i.e. meta-oe), but 
Distro layers (i.e. angstrom) should probably be on top...

-- 
Denys


