Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BB48C7844B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 08:51:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 00:51:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,407,1515484800"; d="scan'208";a="204670116"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 01 Mar 2018 00:51:58 -0800
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<17c4a7f6-c188-1a8c-2371-74ec67ebfdac@linux.intel.com>
	<CALbNGRQ06WiqYyvXzfPuS+QYjU-304os4_Vk=sD+DCnfQ1RoXw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5f01818c-0c62-f38c-de26-f4f047b19b7f@linux.intel.com>
Date: Thu, 1 Mar 2018 10:46:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRQ06WiqYyvXzfPuS+QYjU-304os4_Vk=sD+DCnfQ1RoXw@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 01 Mar 2018 08:51:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02/28/2018 11:33 PM, Andreas Müller wrote:
> Isn't there somebody outside willing/capable/having enough time to
> move to gnome 3? This would be the best way to end the gnome2 bit-rott
> discussion and we'd have a desktop which is commonly used and
> addresses touch input. I tried that many years ago but the blocker at
> that time was gobject-introspection. These times are over for long. I
> wanted to start this during christmas-holiday but then my
> music-machine turned into more efforts than expected... For those
> still wanting what's left over from gnome2 currently (for me gedit - I
> don't like gedit3 search..) there is at least the mate-project an
> alternative.

Looks like no one is interested enough in gnome 3 to actually package 
it. It is not a small undertaking. I'd say you need a company with a 
product to sell, and in that space, Qt has won.

If you find time to look into it, please do, but I'd say gnome2 stuff 
just needs to disappear, regardless of whether it is replaced by modern 
gnome.

> For example: What if something changes upstream that makes it very
> difficult or impossible for us to follow? Have no recent example for
> that but I think if gobject-introspection would have worked for us
> years ago, gnome2 would not be an issue anymore. You mention below
> that in this case a patch has to be sent out. A comment in the recipe
> would be good enough?

Yes, absolutely. In fact there is an established practice in oe-core for 
this: RECIPE_NO_UPDATE_REASON, which also makes auto-upgrade-helper skip 
the recipe. Latest case where it was used is librsvg, which is being 
rewritten in Rust. So if upstream adds unworkable dependencies or 
serious architectural issues, it's totally fine to freeze the recipe 
using that variable, with a clear reason. But do note that the reason 
cannot be "the upgrade will break some dependent layer/recipe, or some 
specific product".


>> 2. Recipes which fail to build, and the situation hasn't been addressed, in,
>> say, six months.
> Yes: recipes not building are useless. Martin has done blacklisting in
> the late phase of his maintainer-ship. The only question I have here:
> Does not build mean for all archs or for just .. how many?

All I guess? It is not reasonable to remove a recipe because it is 
failing in specific cases, but works generally. In oe-core there is a 
stricter criteria: if a patch causes even one autobuilder arch to fail, 
it is rejected.

Alex

