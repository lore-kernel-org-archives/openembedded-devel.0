Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OwM9j-0000Kd-VK
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 23:38:14 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OwM8u-0005VP-Jr from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 14:37:20 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 16 Sep 2010 14:37:20 -0700
Received: from [172.30.80.181] ([172.30.80.181]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 16 Sep 2010 15:37:19 -0600
Message-ID: <4C928DF9.2050405@mentor.com>
Date: Thu, 16 Sep 2010 14:36:57 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimXc3kLFR1m1uXM6OXZQn3idnbiDcEHPU0wpwEC@mail.gmail.com>	<AANLkTikd-_vDny=kJKeS+NVWeYyfxiE_yXdUE+t1ac48@mail.gmail.com>	<AANLkTi=s9gHBx_uPgiPGhu9b7D10JGytQaxyd-SZ+sfQ@mail.gmail.com>	<AANLkTinWXK-HZHOLv2b2ApdPQ+LW22bvwsOO5TGOc1kx@mail.gmail.com>	<AANLkTim9n1JsDc+bmYN5g20kBtobi5Ti-60Joq1U_rQZ@mail.gmail.com>	<AANLkTi=r1NxVPeRVSSP24YXJSRDxUBwvLQo4PH6_iRxj@mail.gmail.com>	<AANLkTimkhhnmDTWH3=Vx5hVN=Hpy5WXpnUX-E5QfRobb@mail.gmail.com>	<4C8E9653.2020601@balister.org>
	<AANLkTiko_vEXjjW+SUrvb=V+R-Vu0p3AvN7hcdD+Ghjg@mail.gmail.com>
In-Reply-To: <AANLkTiko_vEXjjW+SUrvb=V+R-Vu0p3AvN7hcdD+Ghjg@mail.gmail.com>
X-OriginalArrivalTime: 16 Sep 2010 21:37:19.0230 (UTC)
	FILETIME=[56CD69E0:01CB55E7]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: script to remove orphaned files
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
X-List-Received-Date: Thu, 16 Sep 2010 21:38:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:

> The patches I just pushed are tested using bitbake -c patch for all
> recipes as far as possible).
> (in the recipes I pushed I could not test alsa-scenario_git.bb as it
> didn't fetch for me and alsa-driver_0.9.6-hh4c.bb as it was for h3600
> and h3900 only),

Not to stop the work here, but is there a reason you couldn't do 
MACHINE=h3600 bitbake -c patch -b 
openembedded/recipes/alsa/alsa-driver_0.9.6-hh4c.bb ?  Yes, the initial 
parsing sucks but I think it's important for things like this to go out 
and find the case where a given recipe is supposed to work and make sure 
it still works.  "It didn't fetch" is a legitimate stopper (and I think 
candidate for moving to nonworking) of testing something.

-- 
Tom Rini
Mentor Graphics Corporation


