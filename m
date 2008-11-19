Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1L2prB-0001HJ-0w
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Nov 2008 17:24:45 +0100
Received: from p5b036190.dip.t-dialin.net ([91.3.97.144]
	helo=dodger.lab.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1L2poj-0001wO-70 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2008 17:22:15 +0100
Received: from stefan by dodger.lab.datenfreihafen.org with local (Exim 4.69)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1L2pqZ-0001IH-RP for openembedded-devel@lists.openembedded.org;
	Wed, 19 Nov 2008 17:24:07 +0100
Date: Wed, 19 Nov 2008 17:24:07 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081119162407.GB4280@dodger.lab.datenfreihafen.org>
References: <200811191700.57645.sander@3v8.net>
MIME-Version: 1.0
In-Reply-To: <200811191700.57645.sander@3v8.net>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: [FSO] illume fails to start
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
X-List-Received-Date: Wed, 19 Nov 2008 16:24:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2008-11-19 at 17:00, Sander van Grieken wrote:
> 
> Yesterday, after building the latest org.openembedded.dev and upgrading my 
> GTA02, illume/e does not start anymore.
> 
> I get this: 
> 
> ESTART: 0.93536 [0.61815] - test file format support
> <<<< Enlightenment Error >>>>
> Enlightenment found Evas can't load PNG files. Check Evas has PNG
> loader support.
> 
> stracing releaved that it is looking for test.png (and jpg, and eet) in 
> /usr/share/enlightenment/data/images, but these files do not exist.
> 
> The relevant loader plugins are installed.
> 
> Also, the upgrade complained about same-file conflicts between illume and e-
> wm. The problem above manifests regardless of a -force-overwrite upgradei.

Known problem. Reported some days ago. It's an opkg bug. There is also a
workaround.

http://docs.openmoko.org/trac/ticket/2120

regards
Stefan Schmidt


