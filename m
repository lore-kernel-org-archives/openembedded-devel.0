Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 943C277043
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Feb 2016 08:30:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2016 00:30:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,384,1449561600"; d="scan'208";a="645682385"
Received: from clau5-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.178.43])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2016 00:30:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Philip Balister <philip@balister.org>
Date: Tue, 02 Feb 2016 21:30:41 +1300
Message-ID: <1477343.t29DtXHyYE@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.3-303.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <56B063C5.8070202@balister.org>
References: <1453998177-24110-1-git-send-email-philip@balister.org>
	<5510016.r0vissdbSN@peggleto-mobl.ger.corp.intel.com>
	<56B063C5.8070202@balister.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python-vcversioner: Fix bad DESCRIPTION and HOMEPAGE entries.
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
X-List-Received-Date: Tue, 02 Feb 2016 08:30:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 02 Feb 2016 09:07:33 Philip Balister wrote:
> On 01/28/2016 06:34 PM, Paul Eggleton wrote:
> > On Thu, 28 Jan 2016 11:22:57 Philip Balister wrote:
> >> Copy/paste is the root of all evil.
> >> 
> >> Signed-off-by: Philip Balister <philip@balister.org>
> >> ---
> >> 
> >>  meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb | 4
> >>  ++--
> >> 
> >> 1 file changed, 2 insertions(+), 2 deletions(-)
> >> 
> >> diff --git
> >> a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> >> b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> >> index
> >> 152034b..6c96875 100644
> >> --- a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> >> +++ b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> >> @@ -1,5 +1,5 @@
> >> -DESCRIPTION = "Twisted Web Sockets"
> >> -HOMEPAGE = "https://github.com/MostAwesomeDude/txWS"
> >> +DESCRIPTION = "Python vcversioner"
> >> +HOMEPAGE = "https://github.com/habnabit/vcversioner"
> > 
> > Sorry to pick on this, I know you're fixing a completely wrong
> > description,
> > but:
> > 
> > * Short descriptions should go in SUMMARY
> > * This is a pretty useless short description, it doesn't do anything
> > beyond
> > what the recipe name does.
> 
> Can you remind us what fields the layer index is using? I noticed the
> issue using the layer index to look somehting up.

It displays both in the detail page. Because of how inconsistent the metadata 
can sometimes be, unlike the build system for the list pages it falls back to 
DESCRIPTION for a short description if SUMMARY isn't set, just so it has 
something to display.

It's worth noting that should people want to do a bulk fixup of their layer(s) 
the layer index does have a "Tools -> Bulk Change" function that you can 
access after logging in. This will run you through a search, followed by the 
ability to edit fields including SUMMARY and DESCRIPTION, and will then 
generate a patch that you can download, apply and send.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

