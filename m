Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E990A77CCF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 18:54:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2017 11:54:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,191,1488873600"; d="scan'208";a="73177630"
Received: from tranm-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.125])
	by orsmga002.jf.intel.com with ESMTP; 12 Apr 2017 11:54:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Fabjan Sukalia <fsukalia@gmail.com>
Date: Thu, 13 Apr 2017 06:53:58 +1200
Message-ID: <1565185.4O9zXxqrye@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CAPq_R_fVw0y6n5ujzygz1HJLXtmq3jH8fsyo=fk3UWAu69u4zw@mail.gmail.com>
References: <CAPq_R_ewQocz6eqxt+iEwd=G8g38W89JzQcnHCWRVqsURwv1jQ@mail.gmail.com>
	<264f288c-7173-c1ff-c1d7-3007b03fb2c7@linux.intel.com>
	<CAPq_R_fVw0y6n5ujzygz1HJLXtmq3jH8fsyo=fk3UWAu69u4zw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Full Python3 Installation
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
X-List-Received-Date: Wed, 12 Apr 2017 18:54:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Fabjan,

FYI python3-modules is a package provided by the main python3 recipe (actually 
more of a meta-package that depends on all of the module packages).

Regarding the layer index, we don't actually index packages or anything on the 
runtime side, since you would have to actually run a build to get full 
information there, and it can easily change depending on configuration. It's 
possible we may add that in future but we'd have to ensure everyone understood 
those limitations that mean that the information might not directly match what 
they see when they do a build locally.

Cheers,
Paul

On Thursday, 13 April 2017 6:07:29 AM NZST Fabjan Sukalia wrote:
> Thanks, I will try this out. How does it come that this recipe isn't listed
> on https://layers.openembedded.org/ and that there seems to be no matching
> receipe file?
> 
> Best regards,
> Fabjan Sukalia
> 
> 2017-04-12 19:21 GMT+02:00 Alexander Kanavin <
> 
> alexander.kanavin@linux.intel.com>:
> > On 04/12/2017 08:19 PM, Fabjan Sukalia wrote:
> >> How do I get a "full" python installation that is comparable with desktop
> >> systems? Thanks in advance.
> > 
> > I think you need python3-modules (however try to avoid writing recipes
> > that rdepend on that, and list things that are specifically needed).
> > 
> > Alex
> > 
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 

Paul Eggleton
Intel Open Source Technology Centre

