Received: from mail.kernelconcepts.de ([212.60.202.196])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1NHh3D-0000bI-Ja
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 18:07:10 +0100
Received: from [192.168.2.131] by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1NHhCR-0000n9-0G
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 18:16:39 +0100
Message-ID: <4B1D35DD.3050202@kernelconcepts.de>
Date: Mon, 07 Dec 2009 18:05:33 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B1D222A.90105@kernelconcepts.de>
	<1260204122.779.75.camel@mill.internal.reciva.com>
In-Reply-To: <1260204122.779.75.camel@mill.internal.reciva.com>
X-Enigmail-Version: 0.95.7
X-SA-Exim-Connect-IP: 212.60.202.196
X-SA-Exim-Mail-From: florian.boor@kernelconcepts.de
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
X-List-Received-Date: Mon, 07 Dec 2009 17:07:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi,

Phil Blundell schrieb:
> Just removing that RRECOMMENDS (or weakening it to RSUGGESTS) would run
> the risk of breaking images that are currently depending on it.  I
> suspect there are probably quite a few of those and this might not be a
> good idea.

yes right, I see this is problematic. In fact Angström solves on its own already
and other distributions should do the same.

> Creating some kind of virtual for gtk+ to depend on instead of a
> particular concrete font does sound like the best way forwards with
> this.  And, of course, individual DISTROs are welcome to eliminate that
> RRECOMMENDS in the gtk+ packaging.

Eliminating it on my own is what I do currently but I somehow refuse to accept
this as a good solution. I do not see why some misfeature we introduced a long
time ago should not be fixed - even if if can cause some things to break.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en


