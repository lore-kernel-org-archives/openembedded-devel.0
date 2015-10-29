Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 763F4755F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 09:04:09 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t9T948to032736; Thu, 29 Oct 2015 04:04:08 -0500
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015102904040803-1015260 ;
	Thu, 29 Oct 2015 04:04:08 -0500 
Date: Thu, 29 Oct 2015 11:04:02 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Zhiquan Li <zhiquan.li@windriver.com>, martin.jansa@gmail.com,
	raj.khem@gmail.com
Message-ID: <20151029110402.76ae98c8@adi-pc-linux>
In-Reply-To: <56317960.6030108@windriver.com>
References: <1445594855-39110-1-git-send-email-zhiquan.li@windriver.com>
	<1445594855-39110-2-git-send-email-zhiquan.li@windriver.com>
	<20151026124914.2854e87e@adi-pc-linux>
	<689881552969744788D482C9A8FAED214EBAA9@ALA-MBB.corp.ad.wrs.com>
	<20151027124927.448d2c15@adi-pc-linux>
	<56317960.6030108@windriver.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/29/2015 04:04:08 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/29/2015 04:04:08 AM,
	Serialize complete at 10/29/2015 04:04:08 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-10-29_07:, , signatures=0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/1] snort: fix m4 causes out of memory during configure [ LIN8-299 ]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Oct 2015 09:04:10 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Oct 2015 09:41:52 +0800
Zhiquan Li <zhiquan.li@windriver.com> wrote:

> 
> 
> On 2015.10.27 18:49, Ioan-Adrian Ratiu wrote:
> > On Tue, 27 Oct 2015 09:54:07 +0000
> > "Li, Zhiquan" <Zhiquan.Li@windriver.com> wrote:
> >
> >> I need to evaluate the possibility to upgrade the snort recipe to
> >> >2.9.7, because upgrade to > 2.9.7, some patches will not work
> >> >anymore and the daq recipe also need to be upgraded to 2.0.4 at
> >> >least. The side-effect is uncertainty.
> >>
> > What exactly do you mean by "patches will not work anymore"?.
> > Do you mean thy do not apply on >2.9.7? AFAIK two of those
> > patches are not needed in 2.9.7.6 (fixed upstream), the others
> > just need refreshing.
> I've tried to upgrade snort from 2.9.6.0 to 2.9.7.5, as its
> dependency I also upgrade daq recipe from 2.0.2 to 2.0.6, and
> accordingly update the patches:
> * add 2 new patches for snort to solve the cross compile issues.
> * discard a snort patch since it is not needed.
> * refresh the patch for daq new version.
> Please see the attachment for the changes.
> 
> Unfortunately , it was failed when packaging debug files, the rpm 
> debugedit complain: canonicalization unexpectedly shrank by one
> character. At a glance it is a bug of debugedit, please see: 
> http://sourceforge.net/p/snort/mailman/message/34130268/
> Redhat hasn't resolved this bug: 
> https://bugzilla.redhat.com/show_bug.cgi?id=304121
> 
> So, the options are:
> * Fix rpm debugedit bug and update it to OE
> * Take the workaround that skip the snort debug package
> * Backport the fix from snort upstream
> 

IMO anything rpm-based is fundamentally broken and not worth fixing
because of these kind of long-standing bugs. You spend tons of time
fixing one, then just hit another that was also ignored for +8 years.

I don't think we should skip the debug package entirely because ipks
and debs should be fine. If it is possible to skip only rpm-debug pkgs
then this would be the best way to go IMO.

Not upgrading the package and backporting fixes only to avoid this rpm
bug should be the last option.

@Martin and @Khem, do you have any suggestions?

Than you,
Adrian

> >   ________________________________________
> >> From: Ioan-Adrian Ratiu [adrian.ratiu@ni.com]
> >> Sent: Monday, October 26, 2015 6:49 PM
> >> To: Li, Zhiquan
> >> Cc: openembedded-devel@lists.openembedded.org
> >> Subject: Re: [oe] [PATCH 1/1] snort: fix m4 causes out of memory
> >> during configure [ LIN8-299 ]
> >>
> >> On Fri, 23 Oct 2015 18:07:35 +0800
> >> Zhiquan Li <zhiquan.li@windriver.com> wrote:
> >>
> >>> Issue: LIN8-299
> >>>
> >>> There is an incorrect m4_define() in configure.in which will
> >>> result in an infinite recursion, and it doesn't make sense, since
> >>> snort 2.9.7 it has been commented out. We follow this solution to
> >>> fix it.
> >>>
> >>> Upstream-Status: Backport
> >>>
> >>> (LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel on 20151023
> >>>
> >>> Signed-off-by: Zhiquan Li <zhiquan.li@windriver.com>
> >>> ---
> >>>   .../snort/snort/m4-oom-during-configure.patch       | 21
> >>> +++++++++++++++++++++ .../recipes-connectivity/snort/snort_2.9.6.0.bb
> >>> | 16 +++------------- 2 files changed, 24 insertions(+), 13
> >>> deletions(-) create mode 100644
> >>> meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch
> >>>
> >>> diff --git
> >>> a/meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch
> >>> b/meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch
> >>> new file mode 100644 index 0000000..2250611 --- /dev/null
> >>> +++
> >>> b/meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch
> >>> @@ -0,0 +1,21 @@ +Upstream-Status: Backport
> >>> +
> >>> +There is an incorrect m4_define() in configure.in which will
> >>> result in an +infinite recursion, and it doesn't make sense,
> >>> since snort 2.9.7 it has been +commented out. We follow this
> >>> solution to fix it. +
> >> Doesn't it make more sense to upgrade the snort recipe to >2.9.7
> >> than backporting this fix?
> >>
> >>> +Signed-off-by: Zhiquan Li <zhiquan.li@windriver.com>
> >>> +
> >>> +--- a/configure.in   2015-10-22 13:58:50.743367251 +0800
> >>> ++++ b/configure.in   2015-10-22 13:59:13.855366117 +0800
> >>> +@@ -1100,8 +1100,8 @@
> >>> + # Define PKG_CHECK_MODULES if it doesnt already exist.
> >>> + #file_ This prevents './configure' from erroring on machines
> >>> that dont have
> >>> + # 'pkgconfig' installed.
> >>> +-m4_ifdef([PKG_CHECK_MODULES],[], [m4_define([PKG_CHECK_MODULES],
> >>> +-     [echo "PKG_CHECK_MODULES not defined"])])
> >>> ++#m4_ifdef([PKG_CHECK_MODULES],[],
> >>> [m4_define([PKG_CHECK_MODULES], ++#     [echo "PKG_CHECK_MODULES
> >>> not defined"])]) +
> >>> + if test "x$enable_rzb_saac" = "xyes"; then
> >>> +     AC_CHECK_PROG(PKG_CONFIG,pkg-config,yes)
> >>> diff --git
> >>> a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
> >>> b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
> >>> index 66653c6..65dc524 100644 ---
> >>> a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb +++
> >>> b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb @@
> >>> -6,19 +6,6 @@ LIC_FILES_CHKSUM =
> >>> "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
> >>>
> >>>   DEPENDS = "libpcap libpcre daq libdnet util-linux"
> >>>
> >>> -# Blacklist:
> >>> -#
> >>> -# http://errors.yoctoproject.org/Errors/Details/8936/
> >>> -#
> >>> -# snort failure is again very nasty, because it's m4 which eats
> >>> all -# available memory and swap before it's killed by OOM killer.
> >>> -#
> >>> -# Luckily it always picked m4
> >>> -#
> >>> -# [Wed Feb 18 19:00:51 2015] Out of memory: Kill process 28522
> >>> (m4) score 961 or sacrifice child -# [Wed Feb 18 19:10:51 2015]
> >>> Out of memory: Kill process 45228 (m4) score 958 or sacrifice
> >>> child -# ... -PNBLACKLIST[snort] ?= "BROKEN: autotools processing
> >>> causes OOM condition on configure"
> >>>
> >>>   SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
> >>>               file://snort.init \
> >>> @@ -26,6 +13,7 @@ SRC_URI = "
> >>> ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
> >>> file://disable-dap-address-space-id.patch \
> >>> file://0001-libpcap-search-sysroot-for-headers.patch \
> >>> file://not-hardcoded-libdir.patch \
> >>> +            file://m4-oom-during-configure.patch \
> >>>   "
> >>>
> >>>   SRC_URI[tarball.md5sum] = "18111f6de3989ca89add36077a7c2659"
> >>> @@ -45,6 +33,8 @@ EXTRA_OECONF = " \
> >>>        --disable-static-daq \
> >>>        --with-dnet-includes=${STAGING_INCDIR} \
> >>>        --with-dnet-libraries=${STAGING_LIBDIR} \
> >>> +     --with-libpcre-includes=${STAGING_INCDIR} \
> >>> +     --with-libpcre-libraries=${STAGING_INCDIR} \
> >>>        "
> >>>
> >>>   # if you want to disable it, you need to patch configure.in
> >>> first
> >
> 


