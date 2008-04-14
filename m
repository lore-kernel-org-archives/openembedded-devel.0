Received: from [216.145.245.198] (helo=mx02.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1JlRtg-00044x-IC
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Apr 2008 18:51:12 +0200
Received: from gw.mwester.net ([209.242.5.110] helo=[192.168.1.111])
	by mx02.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JlRtb-0003eL-IG
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Apr 2008 11:51:08 -0500
Message-ID: <48038AFE.2030904@dls.net>
Date: Mon, 14 Apr 2008 11:49:02 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1JlNXj-0008DF-Mt@daffy.sipo.nl>
In-Reply-To: <E1JlNXj-0008DF-Mt@daffy.sipo.nl>
Subject: Re: union fs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Apr 2008 16:51:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

RvP wrote:
> Hi,
> 
> Support for unionfs-modules with recent kernels is broken in oe, see
> http://bugs.openembedded.org/show_bug.cgi?id=1189.
> 
> Are there plans to fix this?

The unionfs modules are part of the 2.6 kernel now.  Do you really need 
them?

Unslung is the only distro AFAIK that is still based on a 2.4 kernel; 
and unionfs is not very useful (the obvious use, which is to use ntfs-3g 
to replace the buggy Linksys proprietary ntfs driver is not write-safe, 
and thus isn't useful).

I would suspect that we can simply drop the modules build from unionfs. 
  (But perhaps leave the recipe present in case someone else wants very 
much to try to get ntfs-3g working on unslung.)

Mike (mwester)


