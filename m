Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4E01965CD0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 08:28:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 27 Apr 2015 01:28:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,655,1422950400"; d="scan'208";a="562269983"
Received: from dmoore26-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.219])
	by orsmga003.jf.intel.com with ESMTP; 27 Apr 2015 01:28:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Anders Darander <anders@chargestorm.se>
Date: Mon, 27 Apr 2015 09:28:43 +0100
Message-ID: <2199106.4TMPZeLVjV@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <20150427045319.GA6712@ad.chargestorm.se>
References: <1429890232-20762-1-git-send-email-cristian.iorga@intel.com>
	<20150427045319.GA6712@ad.chargestorm.se>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-systemd][PATCH V3 1/2] bluez4_4.101.bbappend: update according to bluez4
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
X-List-Received-Date: Mon, 27 Apr 2015 08:28:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Anders,

On Monday 27 April 2015 06:53:19 Anders Darander wrote:
> * Cristian Iorga <cristian.iorga@intel.com> [150424 17:45]:
> > bluez4 recipe has been updated with proper systemd
> > support, so update meta-systemd append accordingly.
> > Also update to the right directory structure.
> > 
> > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> > ---
> > 
> >  .../recipes-connectivity/bluez/bluez4_4.101.bbappend                 | 5
> >  ----- 1 file changed, 5 deletions(-)
> >  rename meta-systemd/{oe-core =>
> >  meta-oe}/recipes-connectivity/bluez/bluez4_4.101.bbappend (51%)
> Like Martin asked on you V2, why do you keep this as a bbappend, instead
> of adding this directly to the recipe?
> 
> If you look at meta-systemd today, you'll see that there's only a minor
> number of recipes from oe-core, that's being appended. All the other
> recipes that previously where appended to from meta-systemd, has got
> their systemd support directly in their own recipes.

It depends on what you mean by systemd "support". What's left over in most of 
the meta-systemd bbappends is RPROVIDES/RREPLACES/RCONFLICTS on the package 
names which we haven't used for a couple of years by now; surely at some point 
we should let those die with meta-systemd?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

