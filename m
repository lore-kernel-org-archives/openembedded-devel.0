Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ks3OA-0001LC-Gj
	for openembedded-devel@openembedded.org; Tue, 21 Oct 2008 00:38:14 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ks3Nn-0000Kx-Rs
	for openembedded-devel@openembedded.org; Mon, 20 Oct 2008 22:37:52 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 20 Oct 2008 22:37:51 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Oct 2008 22:37:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Oct 2008 00:37:42 +0200
Message-ID: <gdj17m$9pg$1@ger.gmane.org>
References: <48FCDCCD.4040704@dls.net>
	<1224536247.4235.282.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081015 Shredder/3.0b1pre
In-Reply-To: <1224536247.4235.282.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: git-native?
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
X-List-Received-Date: Mon, 20 Oct 2008 22:38:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20-10-2008 22:57, Phil Blundell wrote:
> On Mon, 2008-10-20 at 14:32 -0500, Mike (mwester) wrote:
>> Er, just a thought... but now that we've switched to git, should OE just
>> globally ASSUME_PROVIDED for git-native?
>
> I'm not sure what that would really buy you.  It would be a pain for
> downstream OE users who might be getting the metadata through some other
> means (rather than checking it out directly from the OE git tree), and
> it doesn't really seem like it would bring any great benefit.
> Individual users can obviously set ASSUME_PROVIDED for git-native if
> they want and I guess they should continue to do that.

IIRC git-native was added for people without git (e.g. RHEL) or people 
only having old git versions (e.g. git 1.4) that the fetcher doesn't like.
So removing it would have no positive effect other than shortening 
initial build time with a few seconds.


regards,

Koen



