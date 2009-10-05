Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MuoaB-0006I0-L8
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Oct 2009 16:30:38 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 67EA016DFDC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Oct 2009 16:29:49 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 2447C2A424F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Oct 2009 16:29:49 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 5 Oct 2009 16:31:10 +0200
Message-ID: <4ACA02DA.7040506@dresearch.de>
Date: Mon, 05 Oct 2009 16:29:46 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A965026.3020701@dresearch.de>	<b6ebd0a50908270818o57a5119q9a72ba7552bbd0e0@mail.gmail.com>
	<4A97E464.8060703@dresearch.de>
In-Reply-To: <4A97E464.8060703@dresearch.de>
X-OriginalArrivalTime: 05 Oct 2009 14:31:10.0187 (UTC)
	FILETIME=[7B8993B0:01CA45C8]
X-SA-Exim-Connect-IP: 87.193.137.78
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
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
X-List-Received-Date: Mon, 05 Oct 2009 14:30:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> Chris Larson wrote:
>> That sounds like a case of someone installing the libtool wrapper
>> script into the rootfs instead of the real binary.  The do_install may
>> be directly using 'install' to install it.  It should be changed to
>> use a normal make install, or call out ${S}/${HOST_SYS}-libtool
>> --mode=install install <rest of install command>.  NOTE: This is
>> conjecture, I haven't read the recipe, or tested, but it's similar to
>> an issue I hit last week.
> 
> Would be nice, if you can take a look at the recipe. I'm not that familiar with this libtool stuff.

Ping




