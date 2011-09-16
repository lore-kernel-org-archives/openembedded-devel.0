Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R4aUG-0006yQ-Pz
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 17:37:56 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1R4aPF-0000Zr-Pn; Fri, 16 Sep 2011 17:32:45 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 16:32:44 +0100
In-Reply-To: <4E736B6C.9060906@dresearch-fe.de>
References: <4E70C8BA.9030901@dresearch-fe.de>
	<4E736B6C.9060906@dresearch-fe.de>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1316187165.3510.37.camel@phil-desktop>
Mime-Version: 1.0
Cc: Michael Lauer <mickey@vanille-media.de>
Subject: Re: guidelines for upstart in oe?
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
X-List-Received-Date: Fri, 16 Sep 2011 15:37:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-16 at 17:29 +0200, Steffen Sledz wrote:
> On 14.09.2011 17:31, Steffen Sledz wrote:
> > If i remember right there are some first experiments with using upstart as an sysvinit replacement in some oe based distros.
> > 
> > Do some guidelines or suggestions exist to make an application recipes upstart ready?
> > 
> > Nowadays a recipe for a common service contains INITSCRIPT_NAME & Co and installs an init script for sysvinit.
> > 
> > How should such a recipe be modified to be able to install the application in a native upstart image (without sysvinit compatible runlevels)?
> 
> Let me put it in concrete terms.
> 
> Is it possible to write a bb recipe in a way like this?
> 
> ---------------------->snip<-------------------------
> ...
> IF IMAGE USES UPSTART AS INIT THEN
> 

Fundamentally no, since there is no way to know at the time the recipe
is evaluated what images it will go into.

It would be possible to ship both sets of scripts and then have a
postprocessing step to remove the ones that you don't need.  Or you
could make upstart vs sysvinit be a DISTRO_FEATURE.  Or, in at least
some cases, we could probably stop shipping the scripts as discrete
files altogether and replace them with some symbolic representation from
which the necessary scripts could be constructed dynamically at install
time.

p.




