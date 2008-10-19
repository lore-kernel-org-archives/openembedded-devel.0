Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1KrgME-0001yV-1X
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Oct 2008 00:02:44 +0200
Received: from andromeda.vanille.de (e180135172.adsl.alicedsl.de
	[85.180.135.172])
	by drlauer-research.com (Postfix) with ESMTP id 53FAB584712
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2008 00:15:42 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Oct 2008 00:02:25 +0200
User-Agent: KMail/1.9.10
References: <gdfm8d$apg$1@ger.gmane.org>
	<200810191847.04533.mickey@vanille-media.de>
	<1224438415.4235.266.camel@lenovo.internal.reciva.com>
In-Reply-To: <1224438415.4235.266.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200810200002.25673.mickey@vanille-media.de>
Subject: Re: busybox recipe isappearances
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
X-List-Received-Date: Sun, 19 Oct 2008 22:02:47 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Sunday 19 October 2008 19:46:55 schrieb Phil Blundell:
> On Sun, 2008-10-19 at 18:47 +0200, Michael 'Mickey' Lauer wrote:
> > Ack. Been bitten my that more than once. We should either leave the
> > versions and just add newer ones or change the preferred-providers to
> > match (if sure it's a minor update of a stable version).
> >
> > (This time it was an error on my side though.)
>
> It's long been my view that we should just add newer ones and leave the
> old ones alone.  There's really no reason to delete old recipes and,
> even if you check for PREFERRED_VERSIONs in the git tree, there is no
> real way to know who else might be relying on the version you are about
> to delete.

That's true, however I always feel the urge of cleaning up when I see dozens 
or recipes for the same software [besides the amount of increased parsing 
efforts if we really were to keep everything). I'd rather have the rough 
guideline of keeping major (trusted) releases. At the end of the day, 
everything is in the archives.

> Making an explicit distinction between minor and major updates as far as
> PREFERRED_VERSION goes is quite an interesting idea though.  I can
> certainly imagine that I might, for example, want to pin libglib to
> 2.14.x but be prepared to accept minor version updates within that
> series.  I don't think there's currently any syntax to allow that but it
> would be a neat enhancement.

Agreed, that would be helpful.

-- 
:M:


