Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2FE3D61019
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 14:53:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Sep 2013 07:53:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,898,1371106800"; d="scan'208";a="401204520"
Received: from unknown (HELO helios.localnet) ([10.252.123.177])
	by fmsmga002.fm.intel.com with ESMTP; 13 Sep 2013 07:53:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jack Mitchell <ml@communistcode.co.uk>,
	Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 13 Sep 2013 15:53:02 +0100
Message-ID: <8899931.gqGXRCnTRZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-29-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <52331FE8.7040401@communistcode.co.uk>
References: <1379078574-23993-1-git-send-email-ml@communistcode.co.uk>
	<l0v6r0$a1c$1@ger.gmane.org> <52331FE8.7040401@communistcode.co.uk>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv2] libsoc: new recipe
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
X-List-Received-Date: Fri, 13 Sep 2013 14:53:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 13 September 2013 15:23:36 Jack Mitchell wrote:
> On 13/09/13 15:18, Koen Kooi wrote:
> > Op 13-09-13 15:22, Jack Mitchell schreef:
> >> From: Jack Mitchell <jack@embed.me.uk>
> >> 
> >> Signed-off-by: Jack Mitchell <jack@embed.me.uk> ---
> >> 
> >> Change from v1: added signed-off-by
> >> 
> >> meta-oe/recipes-support/libsoc/libsoc_0.3.bb | 18 ++++++++++++++++++ 1
> >> file changed, 18 insertions(+) create mode 100644
> >> meta-oe/recipes-support/libsoc/libsoc_0.3.bb
> >> 
> >> diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.3.bb
> >> b/meta-oe/recipes-support/libsoc/libsoc_0.3.bb new file mode 100644 index
> >> 0000000..e91e152 --- /dev/null +++
> >> b/meta-oe/recipes-support/libsoc/libsoc_0.3.bb @@ -0,0 +1,18 @@ +SUMMARY
> >> = "libsoc is a C library for interfacing with common SoC peripherals
> >> through generic kernel interfaces" +HOMEPAGE =
> >> "https://github.com/jackmitch/libsoc" + +LICENSE = "LGPLv2.1"
> >> +LIC_FILES_CHKSUM =
> >> "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5" + +inherit
> >> autotools + +DEPENDS = "libgcc"
> > 
> > Isn't that automatically implied with gcc-cross?
> 
> I wasn't sure, so I thought I would stick it in and see if anyone piped
> up, I'll remove it in v3.
> 
> Also on that note I noticed that Apache2 also DEPENDS on libgcc, is that
> also wrong?

I don't know anything about this particular recipe, but IIRC, apache complains 
if libgcc is not installed at runtime, and at least when I added that to the 
recipe it was not being installed otherwise.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

