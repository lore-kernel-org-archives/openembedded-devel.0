Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Mprcc-0004E6-CH
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Sep 2009 00:44:41 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KQC00L9PF5B2W22@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	21 Sep 2009 17:43:59 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B5A7B14AF5F; Mon,
	21 Sep 2009 18:43:58 -0400 (EDT)
Date: Mon, 21 Sep 2009 18:43:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090921224358.GG3599@denix.org>
References: <1253563660.4551.12.camel@conroy-linux>
MIME-version: 1.0
In-reply-to: <1253563660.4551.12.camel@conroy-linux>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Bitbake filterProviders does not respect sorted	priorities
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Sep 2009 22:44:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Sep 21, 2009 at 04:07:40PM -0400, Chris Conroy wrote:
> Cross-posting to the OE list since I haven't heard anything from the
> bitbake list after posting this last week. The providers code ignores
> package priorities and as a result unexpected packages can get chosen
> when using overlays with different priority settings.

Nice. I usually enforce specific preferred providers when there are 
uncertainties, but it would be great to have it work properly even when
I forget to do that... :)

> Original message posted to bitbake mailing list:
> 
> I am using bitbake 1.8.13 within OE, and I ran into a problem today
> where the wrong package was being selected.
> 
> Digging into the problem, I found that the code that sorts packages does
> not respect the priority order.
> 
> By iterating over sortpkg_pn.keys() instead of pkg_pn.keys(), it
> produces the expected order based on the priorities I have set. Patch
> below:
> 
> diff --git a/lib/bb/providers.py b/lib/bb/providers.py
> index 8970fb3..6c1cf78 100644
> --- a/lib/bb/providers.py
> +++ b/lib/bb/providers.py
> @@ -191,7 +191,7 @@ def _filterProviders(providers, item, cfgData,
> dataCache):
>              eligible.append(preferred_versions[pn][1])
> 
>      # Now add latest verisons
> -    for pn in pkg_pn.keys():
> +    for pn in sortpkg_pn.keys():
>          if pn in preferred_versions and preferred_versions[pn][1]:
>              continue
>          preferred_versions[pn] = findLatestProvider(pn, cfgData,
> dataCache, sortpkg_pn[pn][0])
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


