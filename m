Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 32EFA6F12D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 12:19:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Feb 2014 04:19:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,534,1389772800"; d="scan'208";a="480730641"
Received: from mcmahond-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.208])
	by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2014 04:19:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Feb 2014 12:19:07 +0000
Message-ID: <33174762.dysyrZqJd4@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.3-201.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <7A897146-8E97-4991-8003-2FFA5E6E866C@gmail.com>
References: <94BAA6DD-BBE2-46CE-8248-E8432BE9F242@blom.org>
	<530AE55F.9090108@oss.bmw-carit.de>
	<7A897146-8E97-4991-8003-2FFA5E6E866C@gmail.com>
MIME-Version: 1.0
Cc: Tobias Blom <tobias@blom.org>
Subject: Re: python-netifaces in oe?
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
X-List-Received-Date: Mon, 24 Feb 2014 12:19:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 23 February 2014 22:26:34 Khem Raj wrote:
> On Feb 23, 2014, at 10:23 PM, Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
> wrote:
> > We provide a recipe for python-netifaces in the meta-ros layer as well. In
> > fact, a quick search on the OpenEmbedded Layer Index [1] reveals that
> > meta-ros and meta-openstack both provide a recipe for python-netifaces.
> > With your use case and recipe, we would have now three recipes. So, I
> > suggest to unify all three recipes and come up with the best (complete)
> > recipe from these three versions and add them to the meta-oe layer. We
> > then can remove the duplicate recipes in the application layers.
>
> If these layers have dependency on meta-oe then please add the recipe there
> and remove from other places.

There has been some discussion about creating a meta-python layer (within the 
meta-openembedded repository) for these kinds of recipes. I think the time has 
come to actually do that, before we add any further python recipes to the 
general meta-oe layer. Could someone send a patch to create meta-python?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

