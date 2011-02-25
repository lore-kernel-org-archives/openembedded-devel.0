Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PszCC-0003Fa-5c
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 16:03:04 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PszAs-0007Od-A2 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 07:01:42 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 25 Feb 2011 07:01:42 -0800
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Fri, 25 Feb 2011 07:01:41 -0800
Message-ID: <4D67C447.9050906@mentor.com>
Date: Fri, 25 Feb 2011 08:01:27 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D66E88B.6040506@mentor.com>
In-Reply-To: <4D66E88B.6040506@mentor.com>
X-OriginalArrivalTime: 25 Feb 2011 15:01:42.0134 (UTC)
	FILETIME=[E94F8160:01CBD4FC]
Subject: Re: Release-2011.03: Let the testing continue again!
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
X-List-Received-Date: Fri, 25 Feb 2011 15:03:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2011 04:23 PM, Tom Rini wrote:
> Hey all,
>
> I've updated the testing-release-2011.03 branch exist now and we're
> ready for more testing. As a reminder, please update the table on
> http://wiki.openembedded.org/index.php?title=Release-2011.03 with your
> results and the githash you're on.
>
> This go-around should be much less bumpy as we've both fixed a number of
> RPATH issues and made the error non-fatal. I've also pushed a small
> number of fixes for issues I hit in my builder but once again need to
> add one more thing locally to confirm or rule out an occasional bug (the
> config.sub failure I reported earlier in testing out the cross.bbclass
> patch for RPATH stuff).
>
> If all goes well, I plan to make a temporary branch Tuesday, add in (and
> then revert from master at Khem's request)
> http://patches.openembedded.org/patch/256/ since it is needed for
> SHR/shr-image to work. Get one last go-round and then call it a release.
>
> Thanks again all!

Given the libnl2 breakage I plan to update the branch again today around 
2pm (-0700) to again current to make sure folks running things over the 
weekend don't hit that problem.

-- 
Tom Rini
Mentor Graphics Corporation


