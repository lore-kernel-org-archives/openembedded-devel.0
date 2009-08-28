Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Mh2OB-0005uC-5V
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Aug 2009 16:25:15 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 447F816E23B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2009 16:07:05 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 0180D2A4259
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2009 16:07:04 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 28 Aug 2009 16:07:04 +0200
Message-ID: <4A97E464.8060703@dresearch.de>
Date: Fri, 28 Aug 2009 16:06:28 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A965026.3020701@dresearch.de>
	<b6ebd0a50908270818o57a5119q9a72ba7552bbd0e0@mail.gmail.com>
In-Reply-To: <b6ebd0a50908270818o57a5119q9a72ba7552bbd0e0@mail.gmail.com>
X-OriginalArrivalTime: 28 Aug 2009 14:07:04.0328 (UTC)
	FILETIME=[D20A8080:01CA27E8]
Subject: Re: nfs-utils-1.1.2 problem
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
X-List-Received-Date: Fri, 28 Aug 2009 14:25:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Chris Larson wrote:
> That sounds like a case of someone installing the libtool wrapper
> script into the rootfs instead of the real binary.  The do_install may
> be directly using 'install' to install it.  It should be changed to
> use a normal make install, or call out ${S}/${HOST_SYS}-libtool
> --mode=install install <rest of install command>.  NOTE: This is
> conjecture, I haven't read the recipe, or tested, but it's similar to
> an issue I hit last week.

Would be nice, if you can take a look at the recipe. I'm not that familiar with this libtool stuff.

Steffen




