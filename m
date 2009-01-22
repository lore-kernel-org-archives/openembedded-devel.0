Received: from [80.68.93.111] (helo=cassiel.sirena.org.uk ident=Debian-exim)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>) id 1LPnSn-0003Rb-6k
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jan 2009 01:30:29 +0100
Received: from 82-41-28-43.cable.ubr04.sgyl.blueyonder.co.uk ([82.41.28.43]
	helo=nastrond.sirena.org.uk)
	by cassiel.sirena.org.uk with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <broonie@sirena.org.uk>)
	id 1LPnLs-0007VQ-E6 for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jan 2009 00:23:21 +0000
Received: from broonie by nastrond.sirena.org.uk with local (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>) id 1LPnLm-0002Eb-3d
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jan 2009 00:23:14 +0000
Date: Thu, 22 Jan 2009 00:23:14 +0000
From: Mark Brown <broonie@sirena.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090122002311.GA8343@sirena.org.uk>
References: <49777063.8060409@balister.org>
MIME-Version: 1.0
In-Reply-To: <49777063.8060409@balister.org>
X-Cookie: Swim at your own risk.
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.41.28.43
X-SA-Exim-Mail-From: broonie@sirena.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on
	cassiel.sirena.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	TVD_RCVD_IP autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on cassiel.sirena.org.uk)
Subject: Re: alsa-util-1.0.18
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
X-List-Received-Date: Thu, 22 Jan 2009 00:30:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 21, 2009 at 11:58:43AM -0700, Philip Balister wrote:
> The alsa-utils-1.0.18 recipe isn't building for some build machines. On  
> my Fedora based machines I can work around the problem by installing  
> xmlto, but on some other machines, after installing xmlto, some file  
> does not download.

> Koen set DEFAULT_PREFERENCE = "-1" until it builds.

> I tried EXTRA_OECONF="--disable-nls" but that didn't help.

Should be fixed by the patch in:

	http://bugs.openembedded.net/show_bug.cgi?id=4995

There's a non-optional build dep on xmlto which works fine if you have a
working xmlto install but isn't so helpful otherwise.


