Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 21FA965CA8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 13:55:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2014 06:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,849,1400050800"; d="scan'208";a="557425016"
Received: from atdias-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.159])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2014 06:55:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 12 Aug 2014 14:55:32 +0100
Message-ID: <2509223.ytjg6V1x30@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.8-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <20140812115132.GK14848@jama>
References: <1407826864-32606-1-git-send-email-rongqing.li@windriver.com>
	<20140812115132.GK14848@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] ifenslave: add recipes
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
X-List-Received-Date: Tue, 12 Aug 2014 13:55:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 12 August 2014 13:51:32 Martin Jansa wrote:
> On Tue, Aug 12, 2014 at 03:01:04PM +0800, rongqing.li@windriver.com wrote:
> > From: Roy Li <rongqing.li@windriver.com>
> > 
> > Signed-off-by: Roy Li <rongqing.li@windriver.com>
> > ---
> > 
> >  .../recipes-support/ifenslave/ifenslave_1.1.0.bb    |   19
> >  +++++++++++++++++++ 1 file changed, 19 insertions(+)
> >  create mode 100644
> >  meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb> 
> > diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
> > b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb new file
> > mode 100644
> > index 0000000..d6252a9
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY = "Configure network interfaces for parallel routing"
> 
> ^ dropped in master-next
> 
> > +DESCRIPTION = "Configure network interfaces for parallel routing"

I guess you meant DESCRIPTION (which is the same as SUMMARY) was dropped.

> > +HOMEPAGE =
> > "http://www.linuxfoundation.org/collaborate/workgroups/networking/bonding
> > " +SECTION = "network"
> > +LICENSE = "GPLv2"
> > +
> > +SRC_URI =
> > "http://ftp.debian.org/debian/pool/main/i/${BPN}-2.6/${BPN}-2.6_${PV}.ori
> > g.tar.gz" +
> > +do_compile() {
> > +    ${CC} ifenslave.c -o ifenslave
> > +}
> > +do_install() {
> > +    install -d "${D}${sbindir}"
> > +    install -m 755 "${S}/ifenslave" "${D}${sbindir}/"
> > +}
> > +
> 
> ^ moved next to LICENSE in master-next
> 
> > +LIC_FILES_CHKSUM =
> > "file://ifenslave.c;beginline=8;endline=12;md5=a9f0bd2324cdc1b36d1f44f0e6
> > 43a62a" +SRC_URI[md5sum] = "56126cd1013cefe0ce6f81613e677bdd"

Ditto here, LIC_FILES_CHKSUM was moved, right?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

