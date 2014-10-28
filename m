Return-Path: <ben.shelton@ni.com>
X-Greylist: delayed 2864 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Oct 2014 23:01:38 UTC
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9160160557
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 23:01:38 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s9SMDslE028681 for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 17:13:54 -0500
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014102817135419-370203 ;
	Tue, 28 Oct 2014 17:13:54 -0500 
Date: Tue, 28 Oct 2014 17:13:53 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141028221353.GA5514@bshelton-desktop>
References: <20140721220428.5C2262049@opal.openembedded.org>
	<20141028170017.GE2430@jama>
MIME-Version: 1.0
In-Reply-To: <20141028170017.GE2430@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 10/28/2014 05:13:54 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 10/28/2014 05:13:54 PM,
	Serialize complete at 10/28/2014 05:13:54 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.28,
	0.0.0000
	definitions=2014-10-28_08:2014-10-28, 2014-10-28,
	1970-01-01 signatures=0
Subject: Re: [oe-commits] Richard Tollerton : openvpn: update and enable iproute2 support
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
X-List-Received-Date: Tue, 28 Oct 2014 23:01:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 10/28, Martin Jansa wrote:
> On Mon, Jul 21, 2014 at 10:04:28PM +0000, git@git.openembedded.org wrote:
> > Module: meta-openembedded.git
> > Branch: master
> > Commit: f647f319fcf1ca4844039a83fbc38acbd4ac762e
> > URL:    http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=f647f319fcf1ca4844039a83fbc38acbd4ac762e
> > 
> > Author: Richard Tollerton <rich.tollerton@ni.com>
> > Date:   Fri Jul 18 16:14:36 2014 -0500
> > 
> > openvpn: update and enable iproute2 support
> > 
> > - Added .bb for version 2.3.4.
> > - The download URL was broken; it's changed to reflect where the website
> >   points to.
> > - Force use of iproute2, which is generally recommended when running
> >   OpenVPN as an unprivileged user. Ref:
> >   http://community.openvpn.net/openvpn/wiki/UnprivilegedUser
> > - Explicitly add libpam to DEPENDS if pam is enabled, and disable the
> >   auth-pam plugin if pam is not enabled.
> > - Pass the path to the 'ip' utility to the configure script to keep it
> >   from trying to find it on the host.
> 
> This part doesn't seem to work, on my host machine without ip utility
> installed (minimalistic Gentoo chroot just for OE builds) openvpn build
> is now failing with:
> 
> | checking git checkout... no
> | configure: error: ip utility is required but missing
> | Configure failed. The contents of all config.log files follows to aid debugging
> 
> | ERROR: oe_runconf failed
> | WARNING: /OE/build/shr-core/tmp-glibc/work/core2-64-oe-linux/openvpn/2.3.4-r0/temp/run.do_configure.10450:1 exit 1 from
> |   exit 1
> | ERROR: Function failed: do_configure (log file is located at /OE/build/shr-core/tmp-glibc/work/core2-64-oe-linux/openvpn/2.3.4-r0/temp/log.do_configure.10450)
> ERROR: Task 5 (/OE/build/shr-core/meta-openembedded/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb, do_configure) failed with exit code '1'

I reproduced the issue locally, and I'm taking a look.

Ben



