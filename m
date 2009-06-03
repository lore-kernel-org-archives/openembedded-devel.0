Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MBrzY-0001sV-3Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 17:03:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id AF4CC4CDF04
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2009 10:54:00 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21472-07 for <openembedded-devel@lists.openembedded.org>; 
	Wed,  3 Jun 2009 10:54:00 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 6E12D4CD298
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2009 10:54:00 -0400 (EDT)
Message-ID: <4A268E88.1030605@cbnco.com>
Date: Wed, 03 Jun 2009 10:54:00 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <Pine.LNX.4.64.0906022113520.27204@juice.ott.cti.com>	<1244022557.2611.14.camel@mill.internal.reciva.com>	<4A26841F.2080208@cbnco.com>
	<1244038988.2611.73.camel@mill.internal.reciva.com>
In-Reply-To: <1244038988.2611.73.camel@mill.internal.reciva.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: busybox & syslog init script
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
X-List-Received-Date: Wed, 03 Jun 2009 15:03:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Wed, 2009-06-03 at 10:09 -0400, Michael Smith wrote:
>> I'd prefer RRECOMMENDS to RDEPENDS, because if I don't have 
>> CONFIG_SYSLOGD=y, I can make busybox-syslog be empty so it won't get 
>> created and nothing will complain.

> RRECOMMENDS would work, but ipkg will issue an ugly diagnostic
> ("unsatisfied recommendation for...") if busybox-syslog is missing.  I'm
> not sure what other package managers will do here.

Yeah, me neither. I can say Busybox dpkg doesn't grok Recommends (or 
dependencies, as far as I know :)

apt-get (used in rootfs_deb) doesn't seem to print a warning when the 
recommended package is missing.

I'm reluctant to use RDEPENDS because for other, similar packages in the 
recipe (e.g. busybox-mdev), the dependency goes in the opposite 
direction: busybox-mdev depends on busybox.

> It might be better to stick with RDEPENDS and either (i) arrange for the
> dependency to be conditional on CONFIG_SYSLOGD having been enabled,
> which you could do with a bit of python in busybox.bb,

I was thinking about this and I'm not sure how to get the python bit to 
run after do_fetch (so defconfig is available in ${WORKDIR}). It's 
probably possible but it would take quite a bit of fiddling, and would 
only save an ipkg warning for the few of us who don't set 
CONFIG_SYSLOGD=y. Currently, all in-tree configs set CONFIG_SYSLOGD.

Mike


