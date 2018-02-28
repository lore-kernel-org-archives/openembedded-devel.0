Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 429D477E18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 17:23:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 09:23:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,406,1515484800"; d="scan'208";a="204436265"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 28 Feb 2018 09:23:30 -0800
To: "Burton, Ross" <ross.burton@intel.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <17c4a7f6-c188-1a8c-2371-74ec67ebfdac@linux.intel.com>
Date: Wed, 28 Feb 2018 19:17:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Wed, 28 Feb 2018 17:23:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/20/2018 12:45 PM, Burton, Ross wrote:
> Is now a good time to talk about splitting up meta-oe?  Some layers are
> actively developed and maintained (one example: meta-python), others are
> basically bitrotting and only get touched when something else causes them
> to break world builds (one example: meta-gnome).  I've long felt that
> meta-oe should be split up and the high quality layers managed in their own
> repositories so patches to them don't get held up by breakage in other
> sub-layers.
> 
> Another advantage of splitting out the high quality layers is that we'd
> like to look at running more community layers through the Yocto
> autobuilder, and granular layers make that easier to manage.
> 
> Comments?

I just read the whole discussion (been on holiday), and while it seems 
that splitting layers is seen as too heavy-handed, there is still 
something that I believe should be done: a policy for blacklisting and 
removing unmaintained recipes. Such a policy should be:

a) clearly defined;
b) consistently applied.

If that is in place, I, as an oe-core maintainer, would be a lot more 
willing to contribute to meta-oe, knowing that recipes I contribute to 
(for example by fixing issues caused by changes in oe-core) are, in 
fact, used and taken care of otherwise. However, me endlessly fixing 
well obsolete gnome2 stuff is just a fast track to not caring anymore.

So, which recipes are unmaintained?

1. Badly out of date compared to upstream development. Say, one year or 
more between version provided by meta-oe master, and latest version 
released by upstream.
2. Recipes which fail to build, and the situation hasn't been addressed, 
in, say, six months.

Once either of these is established, the recipe enters a grace period 
before it is removed. Any objection to such removal should come with a 
patch that addresses the reason for it.


Alex

