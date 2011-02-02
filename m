Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PkRoW-0004C9-MR
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Feb 2011 02:47:20 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PkRnc-0006OG-VE from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 17:46:25 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 1 Feb 2011 17:46:24 -0800
Received: from [172.30.80.88] ([172.30.80.88]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 1 Feb 2011 18:46:23 -0700
Message-ID: <4D48B76D.9030203@mentor.com>
Date: Tue, 01 Feb 2011 18:46:21 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinFOdeD61uqPNsQn_A+kmFCMXeFhtMT45sxxhhP@mail.gmail.com>
In-Reply-To: <AANLkTinFOdeD61uqPNsQn_A+kmFCMXeFhtMT45sxxhhP@mail.gmail.com>
X-OriginalArrivalTime: 02 Feb 2011 01:46:23.0819 (UTC)
	FILETIME=[FF7A39B0:01CBC27A]
Subject: Re: Policy on (committing) large (1MB) machine specific patches?
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
X-List-Received-Date: Wed, 02 Feb 2011 01:47:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/01/2011 04:15 PM, Leon Woestenberg wrote:
> Hello,
>
> I would like to submit another machine to OE, but I need to bring in
> vendor patches (which do not apply cleanly) modified by me, so they
> have no Internet presence.
> The patches measure in 1MB of plain source text.
>
> Is it policy to commit this? Where is the limit?
>
>
> I see we have lots of large patches:
>
> cd openembedded.git/recipes/linux/
> ls -Sshr `find . -type f -regex .*patch$`
>
> ...many of them appearing multiple times in the checkout:
>
> ls -Shr `find . -type f -regex .*patch$` | xargs -L1 md5sum
>
> eating disk space on the build machine.

I am of the opinion that these things should be heavily compressed and 
appropriate comments used in the recipe like:
# Vendor Foo's release $identifier patchset updated to apply cleanly to
# 2.6.blah.

With any further bugfixes/etc done as regular and separate patches.

-- 
Tom Rini
Mentor Graphics Corporation


