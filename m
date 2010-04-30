Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1O7uXg-0001cF-R3
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 20:02:26 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L1P004OIB9B2D90@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	30 Apr 2010 12:58:29 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 97F6B14AF60; Fri,
	30 Apr 2010 13:58:23 -0400 (EDT)
Date: Fri, 30 Apr 2010 13:58:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100430175823.GB5713@denix.org>
References: <q2x8db82dd41004300634g46c42cf7na4871677b8d92cb7@mail.gmail.com>
	<1272646386.21120.84.camel@trini-m4400>
MIME-version: 1.0
In-reply-to: <1272646386.21120.84.camel@trini-m4400>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Usage of meta recipe external-toolchain-csl
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
X-List-Received-Date: Fri, 30 Apr 2010 18:02:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 30, 2010 at 09:53:06AM -0700, Tom Rini wrote:
> On Fri, 2010-04-30 at 15:34 +0200, Jerry Jacobs wrote:
> > Dear all,
> > 
> > I'm very new to openembedded and already have a clear view how it is
> > structured. My embedded board mini2440 is already in git and want to create
> > my own distro.
> > The problem where I bump against is how to use the Codesourcery external
> > toolchain for my target. I know there is the file in recipes/meta/
> > external-toolchain-csl.bb
> > but it not clear how to use it.
> 
> There's 2 ways.  One way is, in local.conf:
> ### CSL public ARM does <arch>-none-<os>, so fill in the -none
> TARGET_VENDOR = "-none"
> ### Bring in external-toolchain-csl.bb
> TOOLCHAIN_BRAND = "csl"
> ### Where the CSL version is installed.
> TOOLCHAIN_PATH = "/full/path/to/arm-2009q3"
> ### Where inside the CSL install the target libraries exist.
> TOOLCHAIN_SYSPATH = "${TOOLCHAIN_PATH}/arm-none-linux-gnueabi"
> ### Add tools to the PATH automatically.
> PATH_prepend = "${TOOLCHAIN_PATH}/bin:"
> require conf/distro/include/toolchain-external.inc
> 
> The other way has a few less variables in local.conf but assumes PATH is
> already updated.  Denys will reply shortly with that, I imagine.

The only difference I have from Tom's setup is I expect the CSL toolchain 
being already in the PATH variable:

export PATH=/full/path/to/arm-2009q1/bin:$PATH

And then set the other several BitBake variables accordingly (in local.conf 
and toolchain-csl.conf):

TARGET_VENDOR = "-none"
# no need to include/require toolchain-external.inc, as TOOLCHAIN_TYPE does it
TOOLCHAIN_TYPE = "external"
TOOLCHAIN_BRAND = "csl"

[There I also set CPPFLAGS and LDFLAGS to point to CSL directly, but it's not 
required as necessary files are staged by the recipe these days.]

The "black magic" in the local.conf is basically a Python code to set 
TOOLCHAIN_PATH and TOOLCHAIN_SYSPATH based on the user's PATH:

TOOLCHAIN_PATH = "${@code-to-extract-csl-path-from-PATH}"
TOOLCHAIN_SYSPATH = ${TOOLCHAIN_PATH}/${TARGET_SYS}

So, with my setup, no modifications to local.conf are required, as long as CSL 
is in your PATH. With Tom's setup, users would need to add the CSL path to 
local.conf.

Hope this helps.

-- 
Denys


