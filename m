Received: from [206.46.252.44] (helo=vms044pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1L5P6f-00035Q-Ag
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Nov 2008 19:27:21 +0100
Received: from gandalf.denix.org ([71.255.226.167])
	by vms044.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0KAY007YODS026N0@vms044.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	26 Nov 2008 12:24:01 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7FFAE6B83B5; Wed,
	26 Nov 2008 13:24:00 -0500 (EST)
Date: Wed, 26 Nov 2008 13:24:00 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <48239d390811261012w26eb9a9fva6c7eacf4aff0a50@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081126182400.GA27631@denix.org>
MIME-version: 1.0
References: <ggjnpc$qhg$1@ger.gmane.org>
	<200811261755.53197.mickey@vanille-media.de>
	<1227721214.19934.33.camel@mill.internal.reciva.com>
	<ggk26f$30a$1@ger.gmane.org>
	<48239d390811261012w26eb9a9fva6c7eacf4aff0a50@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: preferred-provider at the image level a.k.a why is all	this fso stuff in my non-fso image
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
X-List-Received-Date: Wed, 26 Nov 2008 18:27:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Nov 26, 2008 at 09:12:34PM +0300, Sergey Lapin wrote:
> I just need to mention we have same kind of problems with mplayer vs
> mplayer-maemo recipe,
> when you try to put e.g. mencoder into IMAGE_INSTALL, mplayer-maemo
> recipe is used instead of mplayer one.
> Also, which is weird, I was able to reproduce this lots of times on
> one my setup even with build from scratch,
> and was unable to do so with my another setup.

Sorry for my naive question, but why can't it be specified with

PREFERRED_PROVIDER_mplayer = "mplayer"

-- 
Denys


