Received: from [77.233.226.4] (helo=public.doredevelopment.dk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@dev.doredevelopment.dk>) id 1Q0ESK-0007he-Fz
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 15:45:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by public.doredevelopment.dk (Postfix) with ESMTP id 9D1271B51
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 15:43:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at dev.doredevelopment.dk
Received: from public.doredevelopment.dk ([127.0.0.1])
	by localhost (public.doredevelopment.dk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id l8GZAdsWxS5h
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 15:43:48 +0100 (CET)
Received: from [192.168.18.101] (unknown [192.168.18.101])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by public.doredevelopment.dk (Postfix) with ESMTPS id 6C246B8B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 15:43:48 +0100 (CET)
From: Esben Haabendal <eha@dev.doredevelopment.dk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300360696.2132.14681.camel@phil-desktop>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>
	<1300360696.2132.14681.camel@phil-desktop>
Organization: DoreDevelopment ApS
Date: Thu, 17 Mar 2011 15:43:48 +0100
Message-ID: <1300373028.2468.8.camel@eha>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Eliminating dependency race-conditions (was Re: [PATCH] net-snmp: disable libnl use)
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
X-List-Received-Date: Thu, 17 Mar 2011 14:45:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-17 at 11:18 +0000, Phil Blundell wrote:
> 
> > I am still very much interested in discussing how to move this
> > technology from OE-lite to OE, but as it impacts all recipe metadata
> > (build dependencies has to be redefined), OE community at a large
> really
> > needs to value the benefits of solving this problem.
> 
> The benefits of solving the problem are clearly very great, but I
> don't think OE itself is really in a position to embrace a "big bang"
> kind of change which would require redefining all the build
> dependencies.  I think we need to find a technological solution which
> will work with our current DEPENDS scheme. 

I know that this seems to be the general consensus in OE, but I do not
agree with it.  Sometimes architectural work requires working out the
details on a branch, and then when it is mostly done, do the "big bang"
which will then not really be that "big" anymore, as most of the issues
have been resolved.

Is OE really in a position to permantly settle for something suboptimal
in such a central area?

/Esben



