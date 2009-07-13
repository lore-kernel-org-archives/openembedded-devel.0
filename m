Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MQCsI-0007dv-Pw
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jul 2009 06:10:46 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KMP00JV0CBE6FU1@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	12 Jul 2009 22:57:20 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5A84114AF5F; Sun,
	12 Jul 2009 23:57:13 -0400 (EDT)
Date: Sun, 12 Jul 2009 23:57:13 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090713035713.GA21203@denix.org>
References: <200907121334.38852.raj.khem@gmail.com>
MIME-version: 1.0
In-reply-to: <200907121334.38852.raj.khem@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: e2fsprogs-libs build failure analysis
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
X-List-Received-Date: Mon, 13 Jul 2009 04:10:47 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Jul 12, 2009 at 01:34:34PM -0700, Khem Raj wrote:
> Hi
> 
> Like many others I was also getting this problem reported on this mailing list in past 
> 
> http://article.gmane.org/gmane.comp.handhelds.openembedded/24445/match=e2fsprogs+libs
> 
> I looked a bit into this and the problem is that PN gets overwritten when 
> do_package_write_ipk -> read_subpackage_metadata 

Khem,

Have you seen this thread several months ago with the same analysis:
http://thread.gmane.org/gmane.comp.handhelds.openembedded/22376/focus=22556

As I said before, pkgdata/runtime handling needs fixing - if multiple recipes 
(or even target vs. native/sdk of the same package, like it was with curl) 
provide the identically named .so library (libblkid in this case) during the 
build, there may be a conflict in the pkgdata/runtime files.

What are the pkgdata files are used for ultimately? Do they need to contain 
PN/PV/PR? That was introduced by the commit mentioned in the thread above... 
Should it be reverted?

Lets ask Richard - he made this change in Poky, maybe he has a better fix for 
it... :)

-- 
Denys

> this loop below reads the subpkgdata also reads PV PN and PR which are then overwritten
> by bb.data.setVar(key, sdata[key], d)
> 
>        for pkg in bb.data.getVar('PACKAGES', d, 1).split():
>                 sdata = read_subpkgdata(pkg, d)
>                 for key in sdata.keys():
>                         bb.data.setVar(key, sdata[key], d)
> 
> 
> when this loop exits the last subpackage it read is build/eglibc/omap5912osk/pkgdata/armv5te-angstrom-linux-gnueabi/runtime/libblkid
> 
> which says that PN is util-linux-ng
> and this value of PN is updated last into the bb.data for e2fsprogs-libs
> so when do_package_ipk () is called it wants to get WORKDIR
> 
> workdir = bb.data.getVar('WORKDIR', d, 1)
> 
> but WORKDIR consits of PN PV and PR so it calculates it wrongly
> 
> So I think problem is caused because of emitting PV, PN and PR into pkgdata files
> which is then read and updated into bb.data
> 
> I added a workaround in base.bbclass
> 
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index bc50c67..5eefdb7 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -1090,7 +1090,9 @@ def read_pkgdata(pn, d):
>  python read_subpackage_metadata () {
>         import bb
>         data = read_pkgdata(bb.data.getVar('PN', d, 1), d)
> -
> +       pn = bb.data.getVar('PN', d, 1)
> +       pv = bb.data.getVar('PV', d, 1)
> +       pr = bb.data.getVar('PR', d, 1)
>         for key in data.keys():
>                 bb.data.setVar(key, data[key], d)
> 
> @@ -1098,6 +1100,9 @@ python read_subpackage_metadata () {
>                 sdata = read_subpkgdata(pkg, d)
>                 for key in sdata.keys():
>                         bb.data.setVar(key, sdata[key], d)
> +       bb.data.setVar('PN', pn, d)
> +       bb.data.setVar('PV', pv, d)
> +       bb.data.setVar('PR', pr, d)
>  }
> 
> 
> and it works now but I feel this is not the right fix. 
> 
> util-linux-ng.inc has
> 
> PACKAGES_DYNAMIC = "libblkid*"
> 
> and e2fsprogs-libs.inc has
> 
> do_stage () {
>         for i in libcom_err libss libuuid libblkid; do
>                 oe_libinstall -a -C lib $i ${STAGING_LIBDIR}
> .....
> }
> 
> probably this also needs some thought.
> 
> Thanks
> 
> -Khem
> 
> 



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



