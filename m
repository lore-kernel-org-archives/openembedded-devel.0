Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QJS40-0006xQ-56
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 17:08:00 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QJRwH-0006gZ-HS
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 17:00:01 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304952485-8207-1-git-send-email-raj.khem@gmail.com>
References: <1304952485-8207-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 09 May 2011 16:05:16 +0100
Message-ID: <1304953516.8000.105.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCHv3 1/3] conf/layer.conf: Use .= for BBPATH and += for BBFILES
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
X-List-Received-Date: Mon, 09 May 2011 15:08:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-09 at 07:48 -0700, raj.khem@gmail.com wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> Provide additional commentary that should help a bit more

I'm still struggling slightly to understand why this patch is an
improvement.  As far as I can tell:

- the change from prepending to appending BBPATH will alter all the
priorities of the layers.  It isn't entirely obvious to me if (or why)
this is a good thing; and

- the change to the way that BBFILES is assigned doesn't make any
functional difference.  Is that just a cosmetic change?

Also:

> +# It really depends on order of the layers appearing in BBLAYERS
> +# variable in toplevel bblayers.conf file, where bitbake will search
> +# for .inc files and others where bitbake uses BBPATH since it will
> +# search the directories from first to last as specified in BBPATH
> +# Therefore if you want a given layer to be considered high priority
> +# for the .inc and .conf etc. then consider it adding at the beginning
> +# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
> +# the recipe contention so the order of directories in BBFILES does 
> +# not matter.

Maybe it's just my lack of familiarity with the code, but I find this
comment rather difficult to parse.  Even after reading it a few times
I'm not totally sure that I've grasped what the first sentence is
saying.

p.




