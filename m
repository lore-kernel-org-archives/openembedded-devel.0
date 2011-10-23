Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RI0Yh-0002XP-Gv for openembedded-devel@lists.openembedded.org;
	Sun, 23 Oct 2011 18:05:59 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RI0Sz-0004Fq-6h for openembedded-devel@lists.openembedded.org;
	Sun, 23 Oct 2011 18:00:05 +0200
Received: from radon.crossleys.biz ([217.155.184.173])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Oct 2011 18:00:05 +0200
Received: from junk by radon.crossleys.biz with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Oct 2011 18:00:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: MartinC <junk@crossleys.biz>
Date: Sun, 23 Oct 2011 07:11:05 +0000 (UTC)
Message-ID: <loom.20111023T085014-511@post.gmane.org>
References: <4D3DE56B.7020803@freyther.de> <4D3DF7CF.7010308@freyther.de>
	<4D3DFE34.3090706@freyther.de>
	<loom.20111021T210119-168@post.gmane.org>
	<loom.20111022T231054-510@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 217.155.184.173 (Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20100101 Firefox/7.0.1)
Subject: Re: build errors in openssl-native
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
X-List-Received-Date: Sun, 23 Oct 2011 16:05:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Pierluigi Passaro <pierluigi.passaro <at> phoenixsoftware.it> writes:

> 
> Hi Wilder,
> try dropping libdeps-first.patch in openssl-native recipe.
> It does not allow openssl-native build on ubuntu 11.10.
> 
> Regards
> Pierlugi
> 


This worked.

I had the same issue (while doing a 'bitbake helloworld-image' for beagleboard
angstrom under Ubuntu 11.10 'oneiric'), with bitbake 1.12.0 and openembedded
2011.03 (from git).

I edited $OEBASE/oe/openembedded/recipes/openssl/openssl-native_1.0.0d.bb and
removed the reference to libdeps-first.patch in the SRC_URI section.

Many thanks for the help - getting started with OE/bitbake can be a bit
intimidating for the uninitiated!

Krgds, M





