Return-Path: <alexandru.but@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9F89977071
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 09:24:05 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u119O5mq025029 for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Feb 2016 03:24:05 -0600
Received: from zdravan.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020103240514-496905 ;
	Mon, 1 Feb 2016 03:24:05 -0600 
Date: Mon, 1 Feb 2016 11:24:03 +0200
From: Alexandru But <alexandru.but@ni.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160201092403.GA4183@zdravan.emea.corp.natinst.com>
References: <1453200318-25633-1-git-send-email-alexandru.but@ni.com>
	<20160129180157.GA15053@jama>
MIME-Version: 1.0
In-Reply-To: <20160129180157.GA15053@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/01/2016 03:24:05 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/01/2016 03:24:05 AM,
	Serialize complete at 02/01/2016 03:24:05 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-01_04:, , signatures=0
Subject: Re: [meta-oe][PATCH] efivar: fix zero initializer compiler error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Feb 2016 09:24:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 29, 2016 at 07:01:57PM +0100, Martin Jansa wrote:
> On Tue, Jan 19, 2016 at 12:45:18PM +0200, Alexandru But wrote:
> > Patch based on commit a3606c0:
> > Sometimes the compiler doesn't like { 0,} as an initializer
> 
> Probably not caused by this change, but efivar now fails to build in
> world build for qemuarm:
> 
> | linux.c: In function 'eb_nvme_ns_id':
> | linux.c:48:27: error: 'NVME_IOCTL_ID' undeclared (first use in this function)
> |   uint64_t ret = ioctl(fd, NVME_IOCTL_ID, NULL);
> |                            ^
> | linux.c:48:27: note: each undeclared identifier is reported only once for each function it appears in
> | make[1]: *** [linux.o] Error 1
> | make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/efivar/0.21-r0/git/src'
> | make: *** [src] Error 2
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/efivar/0.21-r0/temp/log.do_compile.8376)
> NOTE: recipe efivar-0.21-r0: task do_compile: Failed
> ERROR: Task 5672 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/efivar/efivar_0.21.bb, do_compile) failed with exit code '1'
> 

Yes, I saw the error, and indeed is not related to this change. The problem is
that NVMe uapi header was renamed from nvme.h to nvme_ioctl.h. Here is the
change:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=9d99a8dda154f38307d43d9c9aa504bd3703d596

The Kconfig update unfortunately hasn't been change in the same time. It was
commited to the kernel only recently and will most likely be present in 4.5.
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=a9cf8284b45110a4d98aea180a89c857e53bf850

In the standard/base repository that yocto uses, only the first of the above
changes have been pulled. The old header has a new name, so the desired macro
is no longer there. The problem could be solved from the utility point of view
with a patch that gentoo tree already has:
https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-libs/efivar/files/0.21-nvme_ioctl.h.patch

The problem is that even with this change the new header will not be found since
the second change is not yet in the yocto repo. I cherry-picked and created all
the changes above, but efivar still does not find the new header.
Problem is that the headers from sysroot are built by linux-libc-headers and
this recipe uses the static 4.4 linux release archive from kernel.org. If all
the above are pulled in and linux-libc-headers are using sources with both
changes, than efivar build will pass.

From my point of view the possible solutions for this problem are:
- Push the efivar patch and blacklist the recipe until linux-libc-headers points
  to 4.5
- Revert the rename change in the yocto kernel repo and apply the efivar patch
  after 4.5 token
- Apply the efivar patch, and a patch for linux-libc-headers
- Escalate the problem to the kernel comunity to backport the Kconfig change to
  4.4

I am not sure which is the right approach since they all have downsides.

Regards,
Alex But

> > 
> > Signed-off-by: Alexandru But <alexandru.but@ni.com>
> > ---
> >  ...he-compiler-doesn-t-like-0-as-an-initiali.patch | 42 ++++++++++++++++++++++
> >  meta-oe/recipes-extended/efivar/efivar_0.21.bb     |  3 +-
> >  2 files changed, 44 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
> > 
> > diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch b/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
> > new file mode 100644
> > index 0000000..68cabd6
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
> > @@ -0,0 +1,42 @@
> > +From a3606c02fd271d32e364fcc540e34ba1899309f6 Mon Sep 17 00:00:00 2001
> > +From: Peter Jones <pjones@redhat.com>
> > +Date: Tue, 14 Jul 2015 09:33:54 -0400
> > +Subject: [PATCH] Sometimes the compiler doesn't like { 0, } as an
> > + initializer...
> > +
> > +Because it really wants to be { {0, },} or something, and sometimes the
> > +compiler, knowing full well what we're trying to do, likes to complain
> > +about the rigor applied to our technique in doing it.
> > +
> > +memset() the struct ifreq to 0 instead so I don't need to figure out its
> > +internal structure just to zero it out.
> > +
> > +Resolves #28
> > +
> > +Signed-off-by: Peter Jones <pjones@redhat.com>
> > +---
> > + src/linux.c | 3 ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/src/linux.c b/src/linux.c
> > +index 57f71f3..817b8e6 100644
> > +--- a/src/linux.c
> > ++++ b/src/linux.c
> > +@@ -847,12 +847,13 @@ ssize_t
> > + __attribute__((__visibility__ ("hidden")))
> > + make_mac_path(uint8_t *buf, ssize_t size, const char * const ifname)
> > + {
> > +-	struct ifreq ifr = { 0, };
> > ++	struct ifreq ifr;
> > + 	struct ethtool_drvinfo drvinfo = { 0, };
> > + 	int fd, rc;
> > + 	ssize_t ret = -1, sz, off=0;
> > + 	char busname[PATH_MAX+1] = "";
> > + 
> > ++	memset(&ifr, 0, sizeof (ifr));
> > + 	strncpy(ifr.ifr_name, ifname, IF_NAMESIZE);
> > + 	drvinfo.cmd = ETHTOOL_GDRVINFO;
> > + 	ifr.ifr_data = (caddr_t)&drvinfo;
> > +-- 
> > +2.6.1
> > +
> > diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> > index b5ef90a..1684a10 100644
> > --- a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> > +++ b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> > @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
> >  DEPENDS_class-target = "popt efivar-native"
> >  
> >  SRCREV = "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
> > -SRC_URI = "git://github.com/rhinstaller/efivar.git"
> > +SRC_URI = "git://github.com/rhinstaller/efivar.git \
> > +           file://0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch"
> >  SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch"
> >  SRC_URI_append_class-native = " file://efivar-drop-options-not-supported-by-lower-version-gcc.patch"
> >  
> > -- 
> > 2.6.1
> > 
> > -- 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


