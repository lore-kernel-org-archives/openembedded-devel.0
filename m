Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 150CB77AA9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 20:11:36 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1d2kKX-0007EP-Kn for openembedded-devel@lists.openembedded.org;
	Mon, 24 Apr 2017 22:11:29 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 24 Apr 2017 22:11:30 +0200
Message-ID: <odlm5b$k72$1@blaine.gmane.org>
References: <CAHUNapRLYpv4xS=tzsJrL4r5GCMWzKr3NVDwmwgffec8XDyXZQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
In-Reply-To: <CAHUNapRLYpv4xS=tzsJrL4r5GCMWzKr3NVDwmwgffec8XDyXZQ@mail.gmail.com>
Subject: Re: more info in layerindex Was: Full Python3 Installation
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
X-List-Received-Date: Mon, 24 Apr 2017 20:11:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Op 24-04-17 om 18:12 schreef Trevor Woerner:
> On Wed, Apr 12, 2017 at 2:53 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> Regarding the layer index, we don't actually index packages or anything on the
>> runtime side, since you would have to actually run a build to get full
>> information there, and it can easily change depending on configuration. It's
>> possible we may add that in future but we'd have to ensure everyone understood
>> those limitations that mean that the information might not directly match what
>> they see when they do a build locally.
> 
> 
> As for knowing what files will go where I can see that you could only
> really know that once a recipe is built (since the FILES_..._${PN}
> allows wildcards). But as for the list of packages created by a
> recipe, isn't that deterministic from looking at the (full) recipe
> information (including inherits etc)?

Not completely, anything with do_split_packages will not give a full list
(e.g. gst-plugin*.bb, kernels)

regards,

koen



