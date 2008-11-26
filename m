Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1L5PHo-0003HK-Ah
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Nov 2008 19:38:52 +0100
Received: from 79-71-239-31.dynamic.dsl.as9105.com ([79.71.239.31]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1L5PEt-0004tV-VP
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Nov 2008 18:35:52 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081126182400.GA27631@denix.org>
References: <ggjnpc$qhg$1@ger.gmane.org>
	<200811261755.53197.mickey@vanille-media.de>
	<1227721214.19934.33.camel@mill.internal.reciva.com>
	<ggk26f$30a$1@ger.gmane.org>
	<48239d390811261012w26eb9a9fva6c7eacf4aff0a50@mail.gmail.com>
	<20081126182400.GA27631@denix.org>
Date: Wed, 26 Nov 2008 18:35:50 +0000
Message-Id: <1227724550.23391.235.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: preferred-provider at the image level a.k.a why is	all	this fso stuff in my non-fso image
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
X-List-Received-Date: Wed, 26 Nov 2008 18:38:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-11-26 at 13:24 -0500, Denys Dmytriyenko wrote:
> On Wed, Nov 26, 2008 at 09:12:34PM +0300, Sergey Lapin wrote:
> > I just need to mention we have same kind of problems with mplayer vs
> > mplayer-maemo recipe,
> > when you try to put e.g. mencoder into IMAGE_INSTALL, mplayer-maemo
> > recipe is used instead of mplayer one.
> > Also, which is weird, I was able to reproduce this lots of times on
> > one my setup even with build from scratch,
> > and was unable to do so with my another setup.
> 
> Sorry for my naive question, but why can't it be specified with
> 
> PREFERRED_PROVIDER_mplayer = "mplayer"

That only sets the build-time preference.  It won't have any effect on
what happens at opkg run time if both binary packages are available.

p.




