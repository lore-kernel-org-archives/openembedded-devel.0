Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 6E7687F955
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 17:50:35 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id E1D50280482; Thu, 19 Sep 2019 10:54:24 -0700 (PDT)
Date: Thu, 19 Sep 2019 10:54:24 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190919175424.t2czi7gwvoeo4r6b@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Armin Kuster <akuster@mvista.com>
References: <20190919014547.7nchdno3cq3o2fs7@vctlabs.com>
	<CAMKF1sqts_odBkYixxMCHfgAr+-NxcfVYozGRPXX+j47gu4MKg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqts_odBkYixxMCHfgAr+-NxcfVYozGRPXX+j47gu4MKg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Armin Kuster <akuster@mvista.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] wireshark: remove restriction to ARM ISA
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
X-List-Received-Date: Thu, 19 Sep 2019 17:50:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 06:54:59PM -0700, Khem Raj wrote:
> On Wed, Sep 18, 2019 at 6:51 PM S. Lockwood-Childs <sjl@vctlabs.com> wrote:
> >
> > The restriction to ARM instruction set came in the original
> > wireshark recipe, which was 2 major versions ago (and also
> > a few toolchains ago). Wireshark 3.x seems to be building
> > fine allowing thumb instructions, at least on cortexa9t2hf.
> > ---
> >  meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> > index efcd5e4..6de188d 100644
> > --- a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> > +++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> > @@ -19,8 +19,6 @@ PE = "1"
> >
> >  inherit cmake pkgconfig python3native perlnative upstream-version-is-even
> >
> > -ARM_INSTRUCTION_SET = "arm"
> 
> it will be interesting to see if it is still the case with thumb1 on <= armv5t
> earlier we use to test qrmarm with thumb, maybe build with
> 
> MACHINE=qemuarmv5 and in recipe set
> 
> ARM_INSTRUCTION_SET = "thumb"
> 
> and see if it still builds.
> 
> If not them limit this setting to arch <= v6

Yes, it did still build with MACHINE=qemuarmv5 and

-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET = "thumb"

I don't even see any warnings in log.do_compile either

