Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id E9A1F77386
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 08:23:12 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tAG8NBQa010451; Mon, 16 Nov 2015 02:23:11 -0600
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015111602231167-10552 ;
	Mon, 16 Nov 2015 02:23:11 -0600 
Date: Mon, 16 Nov 2015 10:23:07 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Zhiquan Li <zhiquan.li@windriver.com>
Message-ID: <20151116102307.7e2ea1f0@adi-pc-linux>
In-Reply-To: <564941D3.3000105@windriver.com>
References: <1445594855-39110-1-git-send-email-zhiquan.li@windriver.com>
	<1445594855-39110-2-git-send-email-zhiquan.li@windriver.com>
	<20151026124914.2854e87e@adi-pc-linux>
	<689881552969744788D482C9A8FAED214EBAA9@ALA-MBB.corp.ad.wrs.com>
	<20151027124927.448d2c15@adi-pc-linux>
	<56317960.6030108@windriver.com>
	<20151029110402.76ae98c8@adi-pc-linux> <20151029111152.GA2564@jama>
	<564941D3.3000105@windriver.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 11/16/2015 02:23:11 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 11/16/2015 02:23:11 AM,
	Serialize complete at 11/16/2015 02:23:11 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-11-16_05:, , signatures=0
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
X-List-Received-Date: Mon, 16 Nov 2015 08:23:13 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Nov 2015 10:39:15 +0800
Zhiquan Li <zhiquan.li@windriver.com> wrote:

> 
> 
> On 2015.10.29 19:11, Martin Jansa wrote:
> > On Thu, Oct 29, 2015 at 11:04:02AM +0200, Ioan-Adrian Ratiu wrote:
> >> On Thu, 29 Oct 2015 09:41:52 +0800
> >> Zhiquan Li <zhiquan.li@windriver.com> wrote:
> >>
> >>>
> >>> On 2015.10.27 18:49, Ioan-Adrian Ratiu wrote:
> >>>> On Tue, 27 Oct 2015 09:54:07 +0000
> >>>> "Li, Zhiquan" <Zhiquan.Li@windriver.com> wrote:
> >>>>
> >>>>> I need to evaluate the possibility to upgrade the snort recipe to
> >>>>>> 2.9.7, because upgrade to > 2.9.7, some patches will not work
> >>>>>> anymore and the daq recipe also need to be upgraded to 2.0.4 at
> >>>>>> least. The side-effect is uncertainty.
> >>>> What exactly do you mean by "patches will not work anymore"?.
> >>>> Do you mean thy do not apply on >2.9.7? AFAIK two of those
> >>>> patches are not needed in 2.9.7.6 (fixed upstream), the others
> >>>> just need refreshing.
> >>> I've tried to upgrade snort from 2.9.6.0 to 2.9.7.5, as its
> >>> dependency I also upgrade daq recipe from 2.0.2 to 2.0.6, and
> >>> accordingly update the patches:
> >>> * add 2 new patches for snort to solve the cross compile issues.
> >>> * discard a snort patch since it is not needed.
> >>> * refresh the patch for daq new version.
> >>> Please see the attachment for the changes.
> >>>
> >>> Unfortunately , it was failed when packaging debug files, the rpm
> >>> debugedit complain: canonicalization unexpectedly shrank by one
> >>> character. At a glance it is a bug of debugedit, please see:
> >>> http://sourceforge.net/p/snort/mailman/message/34130268/
> >>> Redhat hasn't resolved this bug:
> >>> https://bugzilla.redhat.com/show_bug.cgi?id=304121
> >>>
> >>> So, the options are:
> >>> * Fix rpm debugedit bug and update it to OE
> >>> * Take the workaround that skip the snort debug package
> >>> * Backport the fix from snort upstream
> >>>
> >> IMO anything rpm-based is fundamentally broken and not worth fixing
> >> because of these kind of long-standing bugs. You spend tons of time
> >> fixing one, then just hit another that was also ignored for +8 years.
> >>
> >> I don't think we should skip the debug package entirely because ipks
> >> and debs should be fine. If it is possible to skip only rpm-debug pkgs
> >> then this would be the best way to go IMO.
> >>
> >> Not upgrading the package and backporting fixes only to avoid this rpm
> >> bug should be the last option.
> >>
> >> @Martin and @Khem, do you have any suggestions?
> > I've already merged this change to master-next and I plan to merge it to
> > master and jethro soon (when jenkins builds are finished).
> >
> > It's good incremental step (fixes the root cause why it was
> > blacklisted), upgrade to newer version is also good, but can be separate
> > and only for master branch (as jethro is almost closed now).
> >
> > "canonicalization unexpectedly shrank by one character" is something we
> > have to fix from time to time, but it's always doable in the component
> > source (usually double slash in one of the paths), so it's not 8+ years
> > kind of issue.
> >
> > Regards,
> Many thanks, Martin!
> 
> I saw your fix for "canonicalization unexpectedly shrank by one 
> character" issue:
> http://lists.openembedded.org/pipermail/openembedded-core/2013-October/084960.html
> 
> Some redundant '/' were sneakingly inserted into snort binary and lead 
> to the rpm debugedit error finally.
> I've submitted a new patch so that snort can be upgraded to 2.9.7+:
> http://lists.openembedded.org/pipermail/openembedded-devel/2015-November/104661.html
> 

Very nice! Thank you for doing the upgrade.

