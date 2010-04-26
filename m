Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1O6SPa-00021q-Vb
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 19:48:07 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L1H00LXYVXOL5T7@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	26 Apr 2010 12:44:12 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DAF9014AF60; Mon,
	26 Apr 2010 13:44:11 -0400 (EDT)
Date: Mon, 26 Apr 2010 13:44:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100426174411.GA22763@denix.org>
References: <q2vade1bdc1004260340j4881a020t22a79b4e1279ade3@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <q2vade1bdc1004260340j4881a020t22a79b4e1279ade3@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: arago-devel@gforge.ti.com
Subject: Re: dm365 and OE
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
X-List-Received-Date: Mon, 26 Apr 2010 17:48:08 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 26, 2010 at 12:40:17PM +0200, Raffaele Recalcati wrote:
> I'm a little bit confused about the good direction for developing for dm365.
> Arago overlay seems nice, it works, but uses also arago-oe-dev, that is a

arago-oe-dev is a snapshot of OE's org.openembedded.dev and updated quite 
often - usually no more than few days behind. The time buffer is to ensure 
everything builds in Arago and nothing is broken (the recent example would 
be the base class broken for couple days in OE).

> git tree separated from OE (kept merged sometimes), and Code Sourcery
> toolchain.
> In OE instead I see many codecs inside recipes/ti directory, but I don't
> know their status.

Currently, recipes/ti directory is the same between Arago and OE, so it 
doesn't matter much which one you use.

> Anyone can point me to the right direction?
> 
> arago + cs

Unlike Koen, I suggest the first option - arago+cs :)

> OE + cs
> OE + its builtin toolchain

So, it's up to you what to use...

Arago is meant to be very close to Angstrom (we try to keep them in sync), 
but limited to TI platforms (Angstrom supports more). Arago is used as a 
stabilization vehicle for official TI products. While Angstrom is a purely 
community distro, Arago is bound by some legal limitations/requirements and 
can be thought of as a corporate/enterprise distro (OE has ENTERPRISE_DISTRO 
for things like this). All the applicable fixes and modifications in Arago are 
pushed back to OE/Angstrom, plus Arago itself is in the public git.

Koen is the maintainer for Angstrom, I'm the maintainer for Arago. Both of us 
are employed by TI and both of us are also OpenEmbedded developers.

Hope this makes it more clear for you.

-- 
Denys


