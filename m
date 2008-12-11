Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1LAm4e-0002qI-R2
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2008 14:59:29 +0100
Received: from p5b0369ce.dip.t-dialin.net ([91.3.105.206] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1LAm0f-00060w-As by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2008 14:55:24 +0100
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1LAm0Y-000247-Ji
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2008 14:55:14 +0100
Date: Thu, 11 Dec 2008 14:55:14 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081211135514.GE9378@excalibur.local>
References: <20081210234910.GA16050@excalibur.local> <49405BD7.2010801@gmx.de>
	<ghqjue$4fe$1@ger.gmane.org>
	<d1b08f940812110137g3369f156rfff59659b48b788f@mail.gmail.com>
	<20081211132221.GA9378@excalibur.local>
	<1229002720.7018.0.camel@aquilonia>
MIME-Version: 1.0
In-Reply-To: <1229002720.7018.0.camel@aquilonia>
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
X-List-Received-Date: Thu, 11 Dec 2008 13:59:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2008-12-11 at 13:38, Graeme Gregory wrote:
> On Thu, 2008-12-11 at 14:22 +0100, Stefan Schmidt wrote:
> > 
> > On Thu, 2008-12-11 at 10:37, Andrea Adami wrote:
> > > About connman, last time I built it I noticed it depends on
> > > 'resolvconf' which depends on 'bash'.
> > > 
> > > Is it right?
> > 
> > I don't remember if it was resolvconf or if it was dhclient, but one of it
> > pulled in bash. This may indeed be worth trying out the alternative Koen pointed
> > out.
> > 
> dhclient certainly used to use a script full of bashisms called when the
> IP address is discovered. I had fun patching that one for NetworkManager

Interesting. Your fixes are in OE.dev already?

I also got a pointer that maybe udhcp be worth looking into. Would need me to
look into a plugin for it. Still this has to wait until I got the basic
functions up and running.

regards
Stefan Schmidt


