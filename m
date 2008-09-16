Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1KfOMo-0003AU-HO
	for openembedded-devel@openembedded.org; Tue, 16 Sep 2008 02:24:30 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20080916002128.XLMA6526.fed1rmmtao104.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 15 Sep 2008 20:21:28 -0400
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id FCMT1a00J1E665w04CMTmS; Mon, 15 Sep 2008 20:21:28 -0400
X-Authority-Analysis: v=1.0 c=1 a=rCeM5v77lmsA:10 a=OZgQiQfKk9MA:10
	a=qqS8SrHA1uRO92ktA68A:9 a=tdZIZOr_9YwrfOxHUHX0tzWR7KoA:4
	a=k-kO48AawpMA:10 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 15 Sep 2008 17:21:27 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080916002127.GK29676@smtp.west.cox.net>
References: <20080912160657.GE29676@smtp.west.cox.net>
	<20080914235938.GH29676@smtp.west.cox.net>
	<1221469471.24620.7.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1221469471.24620.7.camel@mill.internal.reciva.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [Bug 4549] A number of xorg dev packages are uninstallable
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
X-List-Received-Date: Tue, 16 Sep 2008 00:24:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 15, 2008 at 10:04:30AM +0100, Phil Blundell wrote:
> On Sun, 2008-09-14 at 16:59 -0700, Tom Rini wrote:
> > So, there's three ways to fix this:
> > - Fix these recipes to have RDEPENDS_${PN}-dev = ""
> > - Fix these recipes to build empty main packages.
> > - Fix package.bbclass to do the 1st option, automatically (not put the
> >   dependency in to start with).
> > 
> > How do we get going ahead with one of these?  I could take a stab at the
> > 3rd option, with some hints.
> 
> For #3, I would start by looking at populate_packages().  This is where
> the files get moved into the individual packages, and is the first point
> at which you get to find out whether any given package is going to be
> empty or not.  As luck would have it this method also contains some
> existing code to bash RDEPENDS around, which you should be able to
> extend and adapt for your own purposes.
[snip]

OK.  I'm not a big python guy, but the following has been tested with
both xproto (no main) and zeroconf (has a main) and the control file
looked correct in both cases.  I've also rebuilt glibc and poked a few
packages.

Signed-off-by: Tom Rini <trini@embeddedalley.com>

#
# old_revision [4ac14ced8bc6330634ea2b24a201a4f6a556ef24]
#
# patch "classes/package.bbclass"
#  from [6f3deeb912b24b09204110bd00e94e30f64d3936]
#    to [8919fc454501458d13509de4a3a62fad8c68ceac]
#
============================================================
--- classes/package.bbclass	6f3deeb912b24b09204110bd00e94e30f64d3936
+++ classes/package.bbclass	8919fc454501458d13509de4a3a62fad8c68ceac
@@ -351,6 +351,8 @@ python populate_packages () {
 	os.system('rm -rf %s' % pkgdest)
 
 	seen = []
+	main_is_empty = 1
+	main_pkg = bb.data.expand("${PN}" , d)
 
 	for pkg in package_list:
 		localdata = bb.data.createCopy(d)
@@ -395,6 +397,8 @@ python populate_packages () {
 			ret = bb.copyfile(file, fpath)
 			if ret is False or ret == 0:
 				raise bb.build.FuncFailed("File population failed")
+			if pkg == main_pkg and main_is_empty:
+				main_is_empty = 0
 		del localdata
 	os.chdir(workdir)
 
@@ -440,6 +444,11 @@ python populate_packages () {
 
 	for pkg in package_list:
 		rdepends = explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 1) or bb.data.getVar('RDEPENDS', d, 1) or "")
+
+		if main_is_empty:
+			for rdep in rdepends:
+				if rdep.find(main_pkg + " ") != -1:
+					rdepends.remove(rdep)
 		for l in dangling_links[pkg]:
 			found = False
 			bb.debug(1, "%s contains dangling link %s" % (pkg, l))

-- 
Tom Rini


