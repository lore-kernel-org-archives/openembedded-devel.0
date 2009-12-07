Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NHggb-0004At-9E
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 17:43:48 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NHgf0-000599-KH
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 16:42:06 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NHgf0-0008QA-Cu
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 16:42:06 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B1D222A.90105@kernelconcepts.de>
References: <4B1D222A.90105@kernelconcepts.de>
Date: Mon, 07 Dec 2009 16:42:02 +0000
Message-Id: <1260204122.779.75.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] gtk+ and fonts
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
X-List-Received-Date: Mon, 07 Dec 2009 16:43:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-12-07 at 16:41 +0100, Florian Boor wrote:
> our current GTK+ packages recommend a single Truetype font (ttf-dejavu-sans).
> This might pull in a quite large font collection that might be different from
> what the user wants. For a Japanese image e.g. you might not want these at all
> or you might just want different fonts (like the Android ones).
> 
> I would be fine removing this RRECOMMENDS entry without any replacement. Another
> option would be to create a virtual provider for basic ttf fonts and define a
> matching run time dependency.

Just removing that RRECOMMENDS (or weakening it to RSUGGESTS) would run
the risk of breaking images that are currently depending on it.  I
suspect there are probably quite a few of those and this might not be a
good idea.

Creating some kind of virtual for gtk+ to depend on instead of a
particular concrete font does sound like the best way forwards with
this.  And, of course, individual DISTROs are welcome to eliminate that
RRECOMMENDS in the gtk+ packaging.

p.




