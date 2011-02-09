Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1Pn61e-0005JD-Su
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 10:07:50 +0100
Received: (qmail 22214 invoked from network); 9 Feb 2011 10:06:49 +0100
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 9 Feb 2011 10:06:49 +0100
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id dH7pERNZ4gKz
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Feb 2011 10:06:46 +0100 (CET)
Received: (Qmail 22187 invoked from network); 9 Feb 2011 10:06:46 +0100
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 9 Feb 2011 09:06:46 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.72 #1
	(Debian)) id 1Pn60c-00066J-7M
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 10:06:46 +0100
Date: Wed, 9 Feb 2011 10:06:46 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110209090646.GA21549@mi.fu-berlin.de>
References: <4D4BE849.9070704@dresearch.de> <4D5247CD.20700@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4D5247CD.20700@dresearch.de>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: =?UTF-8?B?UmU6IMOFbmdzdHLDtm0gdmVyc2lvbnM/?=
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
X-List-Received-Date: Wed, 09 Feb 2011 09:07:51 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Feb 09, 2011 at 08:52:45AM +0100, Steffen Sledz wrote:
> Am 04.02.2011 12:51, schrieb Steffen Sledz:
> > I'm a bit confused about the Angstrom versions.
> > 
> > Setting in local.conf is
> > 
> >   DISTRO = "angstrom-2008.1"
> > 
> > but bitbake reports
> > 
> >   Build Configuration:
> >   BB_VERSION        = "1.10.2"
> >   METADATA_BRANCH   = "testing-next"
> >   METADATA_REVISION = "3a7b93a"
> >   TARGET_ARCH       = "arm"
> >   TARGET_OS         = "linux-gnueabi"
> >   MACHINE           = "hipox"
> >   DISTRO            = "angstrom"
> >   DISTRO_VERSION    = "2010.7-test-20110204"
> >   TARGET_FPU        = "soft"
> > 
> > Is this intented?
> > 
> > BTW: Which is the suggested/released Ångström version? http://www.angstrom-distribution.org/ seems to be not very helpful here. e.g. the FAQ link results in an PAGE NOT FOUND. :(
> 
> Ping!

Hi,

I would do the following bitbake -e foo-target, gives me all variables. Than I would compare the PREFERRED_VERSION stuff
with the one from 2008.1 and 2010.x to see what was choosen. But I am sure it's 2008.1 and only the version
is somehow wrong.

Bye Henning


