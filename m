Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 173EC6E7CA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 15:15:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Jan 2014 07:15:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,668,1384329600"; d="scan'208";a="439862262"
Received: from paulonei-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.210])
	by orsmga001.jf.intel.com with ESMTP; 16 Jan 2014 07:15:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Date: Thu, 16 Jan 2014 15:15:04 +0000
Message-ID: <1857113.0unWlYmFcc@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.7-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <52D7ED40.3080505@windriver.com>
References: <cover.1389609476.git.paul.eggleton@linux.intel.com>
	<52D7ED40.3080505@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 0/3] Apache / PHP upgrades
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
X-List-Received-Date: Thu, 16 Jan 2014 15:15:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Randy,

On Thursday 16 January 2014 09:31:28 Randy MacLeod wrote:
> You asked me about dropping this patch and I've done a bit of digging.
> 
> My conclusion is that the  patch is not integrated into 2.4.7 and
> it would be "nice to have" since we've supported it so far.
> It seems that apache2-2.6.x will include the patch.
> 
> The intended use is primarily to support SPDY as described here:
>     https://technotes.googlecode.com/git/nextprotoneg.html
> and I skimmed though this:
> 
> http://googledevelopers.blogspot.ca/2012/04/add-spdy-support-to-your-apache-> server.html
> 
> 
> As for generating a new patch, the STATUS file in 2.4.7 says:
> ...
>     * mod_ssl: Add support for Next Protocol Negotiation.
>       Trunk patch:
>         http://svn.apache.org/viewvc?view=revision&revision=1332643
>       2.4.x patch:
>         Trunk patch works.
>       +1: ben
>       sf says: Needs r1345599, too.
>            And wrowe's comment about the 2.2 patch is also valid for 2.4:
>            http://svn.apache.org/viewvc?view=revision&revision=1354823
> 
> 
> Does that help? Do you want someone @WR to work on the patch, the
> mod_spdy module and testing? A few more comments and links given
> below.
> 
> ../Randy
> 
> ---
> 
> This patch has:
>     Upstream-Status: Backport
> and I do see the _reworked_ feature and our patch upstream
> in the git-svn repo:
>     https://github.com/apache/httpd.git
> specifically, the re-worked commit here:
> 
> https://github.com/apache/httpd/commit/afa9bc99edf96a8ff3a81786cc4ef52a9f3cf
> 310
> 
> and a commit with identical content to our patch here:
> 
> https://github.com/apache/httpd/commit/79d4d4d3ce586bf526178ed6d05e1b0dca705
> 1c4
> 
> but they are both on the trunk branch (aka 2.5) so
> they are not include in 2.4.7.
> 
> The original defect is:
>     https://issues.apache.org/bugzilla/show_bug.cgi?id=52210
> 
>     OpenSSL 1.0.1 added support for TLS Next Protocol Negotiation (NPN)
>     [1], a feature which allows client and server to negotiate what
>     protocol should be used over the secure connection.  I propose
>     adding hooks into mod_ssl to allow other modules to access
>     this feature.


Thanks for looking deeper into this. I'm not quite sure what they mean by 
"Trunk patch works" but I just retrieved the trunk patch and tried to apply it 
but there are conflicts; I also tried a cherry-pick on that git repository but 
that didn't work either. 

I suspect that it would be good to have someone else who knows more about this 
feature create and test a new patch, so if you have someone who could do that 
that would be great.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

