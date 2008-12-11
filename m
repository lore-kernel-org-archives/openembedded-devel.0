Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1LAlfN-0001ox-T3
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2008 14:33:22 +0100
Received: from p5b0369ce.dip.t-dialin.net ([91.3.105.206] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1LAlbN-0005Id-Fp by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2008 14:29:17 +0100
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1LAlbG-00020T-Tt
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2008 14:29:06 +0100
Date: Thu, 11 Dec 2008 14:29:06 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081211132906.GB9378@excalibur.local>
References: <20081210234910.GA16050@excalibur.local> <49405BD7.2010801@gmx.de>
	<20081211003347.GC16050@excalibur.local>
MIME-Version: 1.0
In-Reply-To: <20081211003347.GC16050@excalibur.local>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: [RFC] Ship dbus config and dbus service activation files
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
X-List-Received-Date: Thu, 11 Dec 2008 13:33:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2008-12-11 at 01:33, Stefan Schmidt wrote:
> 
> On Thu, 2008-12-11 at 01:16, Thomas Kunze wrote:
> > Stefan Schmidt schrieb:
> 
> >> The following patch i nstalls the files correctly for me. Never used FILES_${PN}
> >> before so I would like to get some review before.
> >>   
> > Maybe its better to create a package wpasupplicant-dbus. IMO we should  
> > try to split packages if we can and  the dbus
> > functionallity is clearly separable from wpasupplicant core functions.
> 
> I wouldn't mind. Where would you like to draw the line for such a split? Just
> the dbus specific files or a wpa-supplicant version without and one with dbus
> enabled?

As we have sorted out the dbus depends on libX11 now it would be interesting if
people still think that separate version for wpa-supplicant, one with dbus and
one without, are still something to aim for?

The two files my patch adds are for sure not the problem here. I think nobody
will scream if I commit them.

Personally I would not step to do sucha package split as I don't have a system
that does not run dbus. (Which makes me abviously totally biased anyway. :) )

I'm fine on the other hand to test such a patch on the aspect if it still works
the way for us as before.

regards
Stefan Schmidt


