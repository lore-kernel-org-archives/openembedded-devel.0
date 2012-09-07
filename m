Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1T9uea-0005jB-0K
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 11:15:08 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1T9uSa-0005fo-LE>; Fri, 07 Sep 2012 11:02:44 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1T9uSa-0004hw-II>; Fri, 07 Sep 2012 11:02:44 +0200
Received: from heinold by andorra.imp.fu-berlin.de with local (internal Exim
	4.72) id 1T9uSZ-0006gF-FP
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2012 11:02:43 +0200
Date: Fri, 7 Sep 2012 11:02:43 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120907090243.GA22658@mi.fu-berlin.de>
References: <50476BCC.1090801@communistcode.co.uk>
	<5049B4DF.7060806@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <5049B4DF.7060806@communistcode.co.uk>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: XBMC build for Raspberry Pi
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
X-List-Received-Date: Fri, 07 Sep 2012 09:15:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 07, 2012 at 09:48:31AM +0100, Jack Mitchell wrote:
> Some more on this is that it seems to be picking up the host paths,
> rather than OE's.
> 
> My config.log is here: http://pastebin.com/7Um2J1kv
> 
> as you can see the PYTHON variables are all wrong. I tried adding:
> 
> PYTHON = "${libdir}${PYTHON_DIR}"
> PYTHON_SITE_PACKAGE= "${PYTHON_SITEPACKAGES_DIR}"
> PYTHON_LDFLAGS = "-L${libdir} -l${PYTHON_DIR}"
> 
> To the recipe but it didn't help. Has anyone any experience in this?
> 
> Cheers,

Did you inherit the right python class?

Bye Henning


