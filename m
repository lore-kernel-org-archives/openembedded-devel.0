Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0F3F1726C9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 15:51:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2014 07:51:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,594,1413270000"; d="scan'208";a="649191709"
Received: from bclarke-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.30.58])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2014 07:51:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: akuster808 <akuster808@gmail.com>, Hongxu Jia <hongxu.jia@windriver.com>
Date: Wed, 17 Dec 2014 15:51:31 +0000
Message-ID: <13516865.KoVWM0xALT@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.6-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <5490A9D4.8040806@gmail.com>
References: <1418662550-13436-1-git-send-email-akuster808@gmail.com>
	<548F8C66.5080005@windriver.com> <5490A9D4.8040806@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl][PATCH 1/4] lib-perl: move package from meta-security to meta-perl
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
X-List-Received-Date: Wed, 17 Dec 2014 15:51:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 16 December 2014 13:53:24 akuster808 wrote:
> On 12/15/2014 05:35 PM, Hongxu Jia wrote:
> > On 12/16/2014 12:55 AM, Armin Kuster wrote:
> >> please consider this common package for meta-perl.
> >> 
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >> ---
> >> 
> >>   meta-perl/recipes-perl/libperl/lib-perl_0.63.bb | 28
> >> 
> >> +++++++++++++++++++++++++
> >> 
> >>   1 file changed, 28 insertions(+)
> >>   create mode 100644 meta-perl/recipes-perl/libperl/lib-perl_0.63.bb
> > 
> > We have a another lib-perl in oe-core
> > (meta/recipes-devtools/perl/perl_5.20.0.bb),
> > Are they the same?
> 
> I am not sure.
> 
> lib-perl is a small simple module which simplifies the manipulation of
> @INC at compile time.
> 
> I don't know if perl_5.20 includes this.
> 
> If not, how about rename the recipe?
> 
> It looks like on cpan.org it is refereed to a just 'lib'.
> 
> I can rename it to that.

At least in the current scheme we name perl recipes using the debian style 
naming i.e. lib*-perl. Unless we're planning to change the naming scheme for 
all recipes, perl recipes ought to continue to follow the scheme.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

