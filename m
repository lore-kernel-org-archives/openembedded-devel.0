Received: from mx.mailsparr.se ([212.112.184.237])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <johan.hovold@lundinova.se>) id 1TjUYo-0002gA-8J
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 13:40:28 +0100
Received: from pi (unknown [92.33.14.100])
	by mx.mailsparr.se (Halon Mail Gateway) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 13:25:26 +0100 (CET)
Received: from johan by pi with local (Exim 4.80.1) (envelope-from <johan@pi>)
	id 1TjUKS-0005ba-4w for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 13:25:24 +0100
Date: Fri, 14 Dec 2012 13:25:24 +0100
From: Johan Hovold <johan.hovold@lundinova.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121214122524.GA32653@lundinova.se>
References: <1355482437-30298-1-git-send-email-johan.hovold@lundinova.se>
	<CA+chaQd45pxo_RPGWpaU-_XDZRbm7NLO=rYzfDwQvqboyVWNHg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQd45pxo_RPGWpaU-_XDZRbm7NLO=rYzfDwQvqboyVWNHg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: <johan.hovold@lundinova.se>
Subject: Re: [meta-oe][PATCH] udev-173: fix file checksums
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
X-List-Received-Date: Fri, 14 Dec 2012 12:40:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 14, 2012 at 12:21:06PM +0100, Martin Jansa wrote:
> On Fri, Dec 14, 2012 at 11:53 AM, Johan Hovold
> <johan.hovold@lundinova.se> wrote:
> > Commit 7895ab08270d9 ("udev-173: Fix SRC_URI to fetch bz2 archive")
> > changed to source file to bz2-compressed tarball but did not update the
> > checksums.
> >
> > Signed-off-by: Johan Hovold <johan.hovold@lundinova.se>
> 
> This change looks correct, but why are you using this older udev version?
> 
> see http://patchwork.openembedded.org/patch/39873/

We pinned udev to version 173 because of the meta-oe/udev dependency on
systemd (e.g. dropped sysvinit scripts):

	bf778b699d313 ("udev 174: add version 174, disabled by default
		       (see below)")

Look like we can use can switch to 182 now that oe-core's caught up.

Thanks,
Johan


