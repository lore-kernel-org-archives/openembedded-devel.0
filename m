Received: from smtp-4.concepts.nl ([213.197.30.111])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OKqnq-0005nt-RT
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 12:40:35 +0200
Received: from c3404277.ftth.concepts.nl ([195.64.66.119]
	helo=mx1.grimmerink.nl) by smtp-4.concepts.nl with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OKqjg-00068a-Do
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 12:36:16 +0200
Received: from [10.9.0.12] (unknown [10.9.0.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id 0CBB56A11A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Jun 2010 12:36:12 +0200 (CEST)
From: pieterg <pieterg@gmx.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 5 Jun 2010 12:36:07 +0200
User-Agent: KMail/1.9.9
References: <201006022351.38129.pieterg@gmx.com>
	<201006041044.42032.pieterg@gmx.com>
	<1275649408.23726.5.camel@mill.internal.reciva.com>
In-Reply-To: <1275649408.23726.5.camel@mill.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <201006051236.07938.pieterg@gmx.com>
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1OKqjg-00068a-Do
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: pieterg@gmx.com
X-SA-Exim-Connect-IP: 213.197.30.111
X-SA-Exim-Mail-From: pieterg@gmx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: AUTOREV and SRCPV
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
X-List-Received-Date: Sat, 05 Jun 2010 10:40:36 -0000
X-Groupsio-MsgNum: 19913
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_XiiCMuXg8CSjeq/"

--Boundary-00=_XiiCMuXg8CSjeq/
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 04 June 2010 13:03:28 Phil Blundell wrote:
> On Fri, 2010-06-04 at 10:44 +0200, pieterg wrote:
> > I'm starting to see your point. That would really allow a much nicer
> > AUTOREV implementation.
> > But in that case I'm not getting away with a simple workaround I'm
> > afraid...
>
> I think you're probably right that there is no trivial workaround, but I
> don't think it would be very hard to fix this "properly".  You can do it
> one recipe at a time; there's no need for a single big bang.

It turns out not to be that hard at all.
I've created a simple gitpkv.bbclass (see attachment), and I'm able to use 
it as follows, in the recipe:

inherit gitpkgv

PV = "1.0+git${SRCPV}"
PKGV = "1.0+git${GITPKGV}"

And in my distro's unstable-version.inc:

SRCREV_pn-packagename = "${AUTOREV}"

And in my distro's stable-version.inc:

SRCREV_pn-packagename = "5276f059461b6e9015e46a01b1cabfc42dfa600f"

Now I get a nice
1.0+git7348+5276f059461b6e9015e46a01b1cabfc42dfa600f
PKGV, which is the same in both stable/unstable situations, assuming 
the 'stable' rev is the latest rev.
And it is of course the same on all buildservers, and doesn't depend on 
what's in the cache.

And best of all, no more need for BB_LOCALCOUNT_OVERRIDE nor 
BB_GIT_CLONE_FOR_SRCREV, so no more lengthy bb parse sessions.

gitpkg.bbclass could be improved.
It currently does not support SRCREV_FORMAT, instead it assumes the first 
git url is to be used.
To make it obey SRCREV_FORMAT, I would have to duplicate more bitbake code.
Instead, it might be better if bb/lib/fetch/__init__.py would export helpers 
to find the correct src url, in the same way bb.fetch.get_srcrev does.
That would ensure gitpkgv.bbclass would always pick the correct repository.

But for now, I'm really happy with the result.

Rgds, Pieter

--Boundary-00=_XiiCMuXg8CSjeq/
Content-Type: text/plain;
  charset="us-ascii";
  name="gitpkgv.bbclass"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="gitpkgv.bbclass"

# gitpkgv.bbclass provides a GITPKGV variable which is a sortable version
# with the format NN+GITHASH, to be used in PKGV, where
#
# NN equals the total number of revs up to SRCREV
# GITHASH is SRCREV's (full) hash
#
# gitpkgv.bbclass assumes the git repository has been cloned, and contains
# SRCREV. So ${GITPKGV} should never be used in PV, only in PKGV.
# It can handle SRCREV = ${AUTOREV}, as well as SRCREV = "<some fixed git hash>"
#
# use example:
#
# inherit gitpkgv
#
# PV = "1.0+git${SRCPV}"
# PKGV = "1.0+git${GITPKGV}"

GITPKGV = "${@get_git_pkgv(d)}"

def get_git_pkgv(d):
	import os
	import bb

	urls = bb.data.getVar('SRC_URI', d, 1).split()

	for url in urls:
		(type, host, path, user, pswd, parm) = bb.decodeurl(bb.data.expand(url, d))
		if type in ['git']:

			gitsrcname = '%s%s' % (host, path.replace('/', '.'))
			repodir = os.path.join(bb.data.expand('${GITDIR}', d), gitsrcname)
			rev = bb.fetch.get_srcrev(d).split('+')[1]

			cwd = os.getcwd()
			os.chdir(repodir)
			output = bb.fetch.runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % rev, d, quiet=True)
			os.chdir(cwd)

			return "%s+%s" % (output.split()[0], rev)

	return "0+0"

--Boundary-00=_XiiCMuXg8CSjeq/--
