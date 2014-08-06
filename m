Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EA19660809
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 13:58:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Aug 2014 06:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,812,1400050800"; d="scan'208";a="572541544"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.26])
	by fmsmga001.fm.intel.com with ESMTP; 06 Aug 2014 06:58:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Moseley, Drew" <drew_moseley@mentor.com>
Date: Wed, 06 Aug 2014 14:58:18 +0100
Message-ID: <1769384.uxY9ZMhYVY@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.7-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <DDDF1E21-0028-492F-B858-9174A09DB1BA@mentor.com>
References: <1407331293-4055-1-git-send-email-drew_moseley@mentor.com>
	<53E22FBE.4060004@mlbassoc.com>
	<DDDF1E21-0028-492F-B858-9174A09DB1BA@mentor.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] evtest: Provide updated checksums
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
X-List-Received-Date: Wed, 06 Aug 2014 13:58:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Drew,

On Wednesday 06 August 2014 13:41:15 Moseley, Drew wrote:
> On Aug 6, 2014, at 9:38 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> > On 2014-08-06 07:21, Drew Moseley wrote:
> >> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
> >> ---
> >> 
> >>  meta-oe/recipes-support/evtest/evtest_1.25.bb | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/meta-oe/recipes-support/evtest/evtest_1.25.bb
> >> b/meta-oe/recipes-support/evtest/evtest_1.25.bb index 640cec0..ccaa0c6
> >> 100644
> >> --- a/meta-oe/recipes-support/evtest/evtest_1.25.bb
> >> +++ b/meta-oe/recipes-support/evtest/evtest_1.25.bb
> >> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =
> >> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe">> 
> >>  DEPENDS = "libxml2"
> >>  
> >>  SRC_URI =
> >>  "http://cgit.freedesktop.org/~whot/evtest/snapshot/evtest-${PV}.tar.bz2
> >>  ;name=archive">> 
> >> -SRC_URI[archive.md5sum] = "770d6af03affe976bdbe3ad1a922c973"
> >> -SRC_URI[archive.sha256sum] =
> >> "3d34123c68014dae6f7c19144ef79ea2915fa7a2f89ea35ca375a9cf9e191473"
> >> +SRC_URI[archive.md5sum] = "0ef3fe5e20fa2dee8994827d48482902"
> >> +SRC_URI[archive.sha256sum] =
> >> "6e93ef54f0aa7d263f5486ce4a14cac53cf50036bfd20cf045fef2b27ee6664b">> 
> >>  inherit autotools pkgconfig
> > 
> > Why did these change?  It's really BAD practice to have a new/different
> > version of a program with an old name (hence different checksums).
> 
> No clue.  I downloaded them today and those were the sums that were there.

As a general rule, we can't just change signatures without some understanding 
of why they are changing; otherwise we could miss some tampering with the 
contents, the detection of which is the entire purpose of having the 
checksums.

In this specific instance the reason it has changed is almost certainly the 
fact that the source is being fetched from a cgit snapshot. These are not 
guaranteed to remain the same, so pointing to them in SRC_URI isn't really a 
good idea. FYI Otavio has already sent patches to switch over to fetching 
directly from git instead to this list a couple of days ago.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

