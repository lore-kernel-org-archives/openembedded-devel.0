Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1M7o3P-0008Lg-3W
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 May 2009 12:02:11 +0200
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id 76F36547E4; Sat, 23 May 2009 11:54:24 +0200 (CEST)
Date: Sat, 23 May 2009 11:54:24 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090523095424.GE29795@fh-wedel.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20090523083237.GA28055@fh-wedel.de>
	<1243071056.4226.98.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1243071056.4226.98.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: glibc-dbg used by anyone?
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
X-List-Received-Date: Sat, 23 May 2009 10:02:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 23, 2009, Phil Blundell wrote:

> Glibc is configured --disable-debug by default because enabling the
> debug build requires an additional compilation pass (and hence increases
> the total build time by about 50%).  Practically speaking, most users

That explains a lot.

> Removing support for glibc-dbg altogether seems like it would be a bit
> of a retrograde step since this would make it harder for those folks who
> do want to debug the library to do so.  If the presence of the empty
> binaries is vexing you then the right thing to do is probably to teach
> package.bbclass to inhibit the generation of the debug package if there
> isn't actually any debug data present.

Well, I would not mind. The problem comes with insane.bbclass
causing the build to fail because there is a glibc-dbg package
defined in glibc-package.bbclass but it contains only empty
files.

We'd thus need to make the inclusion of glibc-dbg in ${PACKAGES}
depend on whether we want debug code or not. As a very simplstic
solution we might just add a variable that can be set or unset
in the recipe (or even a distro's config file) which controls
both, the configure options and the inclusion of glibc-dbg in
${PACKAGES}?

Cheers,

Martin

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
This parrot is no more.


