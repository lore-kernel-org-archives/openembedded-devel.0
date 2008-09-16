Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1KfeFm-00009q-44
	for openembedded-devel@openembedded.org; Tue, 16 Sep 2008 19:22:18 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20080916171913.HKLW6526.fed1rmmtao104.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 16 Sep 2008 13:19:13 -0400
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id FVKA1a00B1E665w04VKAj4; Tue, 16 Sep 2008 13:19:12 -0400
X-Authority-Analysis: v=1.0 c=1 a=rCeM5v77lmsA:10 a=OZgQiQfKk9MA:10
	a=U8I4oc9bvXUwBk0rpiYA:9 a=RRMbqPoUaWqXY1sfvvo0DNuRz9kA:4
	a=k-kO48AawpMA:10 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 16 Sep 2008 10:19:10 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080916171910.GL29676@smtp.west.cox.net>
References: <20080912160657.GE29676@smtp.west.cox.net>
	<20080914235938.GH29676@smtp.west.cox.net>
	<1221469471.24620.7.camel@mill.internal.reciva.com>
	<20080916002127.GK29676@smtp.west.cox.net>
	<1221580166.24620.59.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1221580166.24620.59.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Tue, 16 Sep 2008 17:22:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 16, 2008 at 04:49:26PM +0100, Phil Blundell wrote:
> On Mon, 2008-09-15 at 17:21 -0700, Tom Rini wrote:
> >  	for pkg in package_list:
> >  		rdepends = explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 1) or bb.data.getVar('RDEPENDS', d, 1) or "")
> > +
> > +		if main_is_empty:
> > +			for rdep in rdepends:
> > +				if rdep.find(main_pkg + " ") != -1:
> > +					rdepends.remove(rdep)
> >  		for l in dangling_links[pkg]:
> >  			found = False
> >  			bb.debug(1, "%s contains dangling link %s" % (pkg, l))
> 
> If you change that 1 to 0 in the first bb.data.getVar() call, the
> package names should be left in their unexpanded form and you can then
> safely match against a literal '${PN} (= ${PV})' as found in
> bitbake.conf.  That's still a bit yucky but probably better than what
> you have there.
> 
> Other than that, yeah, this looks fine to me.

OK, done.  Checked with zeroconf and we can get away with not expanding
rdepends in that case.

Signed-off-by: Tom Rini <trini@embeddedalley.com>

#
# old_revision [4ac14ced8bc6330634ea2b24a201a4f6a556ef24]
#
# patch "classes/package.bbclass"
#  from [6f3deeb912b24b09204110bd00e94e30f64d3936]
#    to [0255f64eac991d83a518c70b907131f1d30bfc58]
#
============================================================
--- classes/package.bbclass	6f3deeb912b24b09204110bd00e94e30f64d3936
+++ classes/package.bbclass	0255f64eac991d83a518c70b907131f1d30bfc58
@@ -351,6 +351,8 @@ python populate_packages () {
 	os.system('rm -rf %s' % pkgdest)
 
 	seen = []
+	main_is_empty = 1
+	main_pkg = bb.data.getVar('PN', d, 1)
 
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
 
@@ -439,7 +443,11 @@ python populate_packages () {
 					dangling_links[pkg].append(os.path.normpath(target))
 
 	for pkg in package_list:
-		rdepends = explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 1) or bb.data.getVar('RDEPENDS', d, 1) or "")
+		rdepends = explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 0) or bb.data.getVar('RDEPENDS', d, 0) or "")
+
+		remstr = "${PN} (= ${DEBPV})"
+		if main_is_empty and remstr in rdepends:
+			rdepends.remove(remstr)
 		for l in dangling_links[pkg]:
 			found = False
 			bb.debug(1, "%s contains dangling link %s" % (pkg, l))

-- 
Tom Rini


