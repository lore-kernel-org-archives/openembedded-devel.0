Received: from [195.160.190.3] (helo=111.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <c.aeschlimann@acn-group.ch>) id 1Lz9zB-0003wc-3Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Apr 2009 15:38:05 +0200
Received: from acn.212.98.42.40.adslpremium.ch (unknown [212.98.42.40])
	by 111.com (Postfix) with ESMTPA id 3BBBF37046
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2009 15:32:48 +0200 (CEST)
Received: from cruiser.hq.acn-group.ch ([172.16.145.92] helo=localhost)
	by van.hq.acn-group.ch with esmtp (Exim 3.36 #1 (Debian))
	id 1Lz9tx-00058Y-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2009 15:32:41 +0200
Received: from localhost ([127.0.0.1]) by localhost with esmtp (Exim 4.63)
	(envelope-from <c.aeschlimann@acn-group.ch>) id 1Lz9ww-0004GT-CX
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Apr 2009 15:35:46 +0200
Message-ID: <49F857B2.1070708@acn-group.ch>
Date: Wed, 29 Apr 2009 15:35:46 +0200
From: Christophe Aeschlimann <c.aeschlimann@acn-group.ch>
Organization: ACN S.A.
User-Agent: Icedove 1.5.0.14eol (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49F8468A.7060305@acn-group.ch>
	<1241009859.30742.168.camel@mill.internal.reciva.com>
In-Reply-To: <1241009859.30742.168.camel@mill.internal.reciva.com>
Subject: Re: do_rootfs : (offline root mode: not	running	openntpd.postinst)
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
X-List-Received-Date: Wed, 29 Apr 2009 13:38:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Wed, 2009-04-29 at 14:22 +0200, Christophe Aeschlimann wrote:
>> Of course I can modify the recipe so it will change my passwd file during 
>> install or add some initialization script to check that this user is created 
>> before ntpd runs but I'm more curious about why we skip all the postinst scripts.
> 
> The postinst scripts are primarily intended to execute on the target
> device (during "ipkg configure" or equivalent) and, in general, they
> won't run correctly on the build host.  So, when ipkg is running in
> offline root mode, it skips the postinsts and leaves the packages
> installed but not configured.
> 
> [...]
> 
> p.
> 
> 

Thank you for the quick and very detailed answer.

Regards,

Christophe



