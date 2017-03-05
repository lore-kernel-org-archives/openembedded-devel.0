Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 284F172F2D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Mar 2017 21:38:25 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 05 Mar 2017 13:38:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,250,1484035200"; d="scan'208";a="72488671"
Received: from ngocnhum-mobl11.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.134.221])
	by fmsmga005.fm.intel.com with ESMTP; 05 Mar 2017 13:38:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	Adrian Calianu <Adrian.Calianu@enea.com>
Date: Mon, 06 Mar 2017 10:38:22 +1300
Message-ID: <2138222.o9StKizBTg@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <20170303092839.GA3276@jama>
References: <1488471230-46540-1-git-send-email-adrian.calianu@enea.com>
	<A1661D2DDD942248A02617DE63569A01AC279256@SESTOEX04.enea.se>
	<20170303092839.GA3276@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] krb5: allow to generate empty package
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
X-List-Received-Date: Sun, 05 Mar 2017 21:38:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 3 March 2017 10:28:39 PM NZDT Martin Jansa wrote:
> On Fri, Mar 03, 2017 at 09:24:24AM +0000, Adrian Calianu wrote:
> > From: Martin Jansa [mailto:martin.jansa@gmail.com]
> > Sent: Thursday, March 02, 2017 6:53 PM
> > To: Adrian Calianu <Adrian.Calianu@enea.com>
> > Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
> > Subject: Re: [oe] [meta-oe][PATCH] krb5: allow to generate empty package
> > 
> > > Since other packages may depend on krb5(${PN}).
> > 
> > Then fix these other packages.
> > [Adrian Calianu]           If you want to install krb5-dev, krb5-dbg
> > packages, they are dependent on krb5 but it does not exists!
>
> Good, so you know which packages to fix.
> 
> Installing empty packages to rootfs never helped anyone except HW
> manufactures because we're wasting disk space and processing on useless
> empty packages.

On the other hand, we do have lots of empty packages that exist only to bring 
in other packages (e.g. packagegroups).

Specifically in this type of scenario, I do agree that just setting 
ALLOW_EMPTY_${PN} isn't enough - that does give you an empty package that 
serves no function; worse, it's claiming that krb5 is installed when it really 
isn't. There are two workable alternatives:

1) Change PACKAGES so that the recipe doesn't claim that it provides a ${PN} 
package when we know it's not going to, so that if you do have a dependency on 
it you get an error earlier in the build instead of right at the end during 
do_rootfs. At the same time you'd want to change RDEPENDS_${PN}-dev such that 
it doesn't depend on the now definitely nonexistent ${PN} package.

2) Have an empty ${PN} package that has RDEPENDS / RRECOMMENDS set to bring in 
a sensible subset of the recipe's packages for runtime usage so that you don't 
have to having to look at each recipe to determine whether or not it has a 
main package. This seems to me to be the least awkward alternative for users, 
but of course, it assumes that there is such a sensible subset. The openssh 
recipe is an example of this.

FWIW, we have talked about changing the default in OE-Core for the dependency 
of ${PN}-dev on ${PN} in order to make this less of a problem (bug 8222 [1] 
relates to this). Honestly though I'd prefer people take option 2 above where 
possible and then we at least save a few question threads on the mailing list 
from new users.

Cheers,
Paul

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=8222

-- 

Paul Eggleton
Intel Open Source Technology Centre

