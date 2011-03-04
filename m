Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PvIe7-0002Fp-DG for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 01:13:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p240BweE024156;
	Fri, 4 Mar 2011 00:11:58 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24038-03; Fri,  4 Mar 2011 00:11:54 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p240BqSg024150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 4 Mar 2011 00:11:52 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Rini <tom_rini@mentor.com>
In-Reply-To: <4D6FA7CC.9020407@mentor.com>
References: <20110224164519.GA12581@jama.jama.net>
	<1298647636-13022-1-git-send-email-Martin.Jansa@gmail.com>
	<20110303072744.GB419@jama.jama.net>  <4D6FA7CC.9020407@mentor.com>
Date: Fri, 04 Mar 2011 00:11:46 +0000
Message-ID: <1299197506.17567.241.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: define shared PERSISTENT_DIR and point it outside TMPDIR
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
X-List-Received-Date: Fri, 04 Mar 2011 00:13:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-03 at 07:38 -0700, Tom Rini wrote:
> On 03/03/2011 12:27 AM, Martin Jansa wrote:
> > On Fri, Feb 25, 2011 at 04:27:16PM +0100, Martin Jansa wrote:
> >> * import from poky 6a11cf7dfe930461a6660e3b783b546fa2634900
> >> * we had CACHE var pointing to machine specific dir since 2006
> >>    caf077679022f37ce55d758101f130e4e93bd7b5
> >> * current bitbake is looking for cache dir like this:
> >>    cachedir = (bb.data.getVar("PERSISTENT_DIR", d, True) or
> >>                bb.data.getVar("CACHE", d, True))
> >>    which without PERSISTENT_DIR defined picks machine-specific CACHE dir
> >>    so LOCALCOUNT numbers in SRCPV keeps rolling with every MACHINE switch
> >>    in same builddir :/
> >
> > ping?
> >
> 
> I'd like Richards comments here.

The intent was always to have CACHE be machine specific and
PERSISTENT_DIR not be machine specific. This means all builds share the
idea of revision numbers yet the main cache is machine specific so you
don't hit reparses when switching machines unnecessarily.

So yes, I think the change is valid, I hadn't realised OE didn't have
that change and I'm happy to ack it...

Cheers,

Richard


> >>
> >> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> >> ---
> >>   classes/sanity.bbclass |   12 ++++++++++++
> >>   conf/bitbake.conf      |    2 ++
> >>   conf/sanity.conf       |    1 +
> >>   3 files changed, 15 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
> >> index 1e6b170..ffe3a49 100644
> >> --- a/classes/sanity.bbclass
> >> +++ b/classes/sanity.bbclass
> >> @@ -189,6 +189,18 @@ def check_sanity(e):
> >>   	if messages != "":
> >>   		raise_sanity_error(messages)
> >>
> >> +	#
> >> +	# Check there isn't old persistent cache
> >> +	#
> >> +	cache = data.getVar('CACHE', e.data, True)
> >> +	persistent_dir = data.getVar('PERSISTENT_DIR', e.data, True)
> >> +	persistent_cache_filename = data.getVar('SANITY_PERSIST_DATA_FILE', e.data, True)
> >> +	if os.path.exists(cache + '/' + persistent_cache_filename):
> >> +		messages = messages + "Error, persistent cache file '%s' exists in old location '%s', please migrate it to new location '%s' and merge them together if you have one for each MACHINE.\n" % (persistent_cache_filename, cache, persistent_dir)
> >> +
> >> +	if messages != "":
> >> +		raise_sanity_error(messages)
> >> +
> >>   python check_sanity_eventhandler() {
> >>       if isinstance(e, bb.event.BuildStarted):
> >>           check_sanity(e)
> >> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> >> index 88ad2ba..0c11cdb 100644
> >> --- a/conf/bitbake.conf
> >> +++ b/conf/bitbake.conf
> >> @@ -294,6 +294,8 @@ FILESDIR = "${@bb.which(d.getVar('FILESPATH', 1), '.')}"
> >>
> >>   TMPDIR = "${TOPDIR}/tmp"
> >>   CACHE = "${TMPDIR}/cache${@['', '/' + str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}"
> >> +# The persistent cache should be shared by all builds
> >> +PERSISTENT_DIR = "${TOPDIR}/conf/persistent"
> >>   CO_DIR = "${DL_DIR}"
> >>   CVSDIR = "${CO_DIR}/cvs"
> >>   SVNDIR = "${CO_DIR}/svn"
> >> diff --git a/conf/sanity.conf b/conf/sanity.conf
> >> index e9902f6..c1ac332 100644
> >> --- a/conf/sanity.conf
> >> +++ b/conf/sanity.conf
> >> @@ -7,5 +7,6 @@ BB_MIN_VERSION = "1.10.2"
> >>
> >>   SANITY_ABIFILE = "${TMPDIR}/abi_version"
> >>   SANITY_PRFILE = "${TMPDIR}/distro_pr"
> >> +SANITY_PERSIST_DATA_FILE = "bb_persist_data.sqlite3"
> >>
> >>   INHERIT += "sanity"
> >> --
> >> 1.7.4.1
> >>
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 




