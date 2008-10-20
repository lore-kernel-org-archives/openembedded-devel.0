Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KrpUT-0000AX-CX
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Oct 2008 09:47:50 +0200
Received: from 88-111-190-175.dynamic.dsl.as9105.com ([88.111.190.175]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KrpU0-00080E-49
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Oct 2008 08:47:24 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200810200002.25673.mickey@vanille-media.de>
References: <gdfm8d$apg$1@ger.gmane.org>
	<200810191847.04533.mickey@vanille-media.de>
	<1224438415.4235.266.camel@lenovo.internal.reciva.com>
	<200810200002.25673.mickey@vanille-media.de>
Date: Mon, 20 Oct 2008 08:47:08 +0100
Message-Id: <1224488828.4235.278.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
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
X-List-Received-Date: Mon, 20 Oct 2008 07:47:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-10-20 at 00:02 +0200, Michael 'Mickey' Lauer wrote:
> Am Sunday 19 October 2008 19:46:55 schrieb Phil Blundell:
> > It's long been my view that we should just add newer ones and leave the
> > old ones alone.  There's really no reason to delete old recipes and,
> > even if you check for PREFERRED_VERSIONs in the git tree, there is no
> > real way to know who else might be relying on the version you are about
> > to delete.
> 
> That's true, however I always feel the urge of cleaning up when I see dozens 
> or recipes for the same software [besides the amount of increased parsing 
> efforts if we really were to keep everything). I'd rather have the rough 
> guideline of keeping major (trusted) releases. At the end of the day, 
> everything is in the archives.

If parsing time were to become a big issue then one could imagine ways
to solve that in bitbake.  For example, one could arrange for a command
like "bitbake --disregard-old-versions" to parse all the files once,
identify those versions which are older than the PREFERRED ones (whether
set explicitly or automatically), and blacklist these old versions so
that they are never parsed again.  The effect would be a bit like having
an automatically-maintained BBMASK though of course the implementation
would probably be slightly different.

As for old versions being in the archives, that's true, but it seems
like one could easily get into a kind of ping-pong thing where you
delete an old version, I pull it out of the archives again, someone else
now notices this "old cruft" and deletes it again, and so on.  I can
imagine that being frustrating for all parties.

p.




