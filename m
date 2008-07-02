Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1KE4Ni-0008GV-BU
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jul 2008 17:36:30 +0200
Received: from xora.org.uk ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,128bits,AES128-SHA)
	by xora.org.uk with esmtp; Wed, 02 Jul 2008 16:33:16 +0100
	id 000304B7.486B9FBC.0000501B
Date: Wed, 2 Jul 2008 16:33:16 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080702153316.GF4432@aquilonia.hyboria>
References: <200807021000.52998.geoffrey@pager.net>
Mime-Version: 1.0
In-Reply-To: <200807021000.52998.geoffrey@pager.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: SVN Fetcher Makes Invalid Assumptions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 02 Jul 2008 15:36:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 02, 2008 at 10:00:52AM -0500, Geoffrey Wossum wrote:
> Hi all,
> 
> I just ran into a problem using the SVN fetcher with a project that breaks the 
> fetchers assumptions about how an SVN repository is structured.  The project 
> in question is phonon-vlc-mplayer 
> (http://code.google.com/p/phonon-vlc-mplayer/), which has released no 
> tarballs of the source (although it has released compiled binaries, go 
> figure).
> 
> The SVN fetcher assumes that all SVN repositories can be checked out 
> with "proto://url/module module", in other words that the module name is at 
> then end of the URL.  However, phonon-vlc-mplayer requires 
> using "http://phonon-vlc-mplayer.googlecode.com/svn/trunk/ 
> phonon-vlc-mplayer", in other words the module name is NOT part of the URL.
> 
> As a workaround, I'm checking out the SVN repository manually, tarring it up, 
> and putting into files/ for this package.  However, it seems like there 
> should be an option added to the SVN fetcher that will disable this module 
> appending behavior for projects like this.
> 
> Comments?
> 
We already have loads of recipes with this.

just remove the trunk from the URL and say module=trunk.

Graeme



