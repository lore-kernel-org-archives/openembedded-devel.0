Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1M28NA-0002WK-0I
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 20:31:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 686844A1B07
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 May 2009 14:25:00 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13322-07 for <openembedded-devel@lists.openembedded.org>; 
	Thu,  7 May 2009 14:25:00 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 42CF33BC562
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 May 2009 14:25:00 -0400 (EDT)
Message-ID: <4A03277B.1090402@cbnco.com>
Date: Thu, 07 May 2009 14:24:59 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <0977f5062aba3031df4132b6571b5c88ff4866c8.1241639516.git.msmith@cbnco.com>	<84090287fafa5bca668308285fcfa06650df22cd.1241639516.git.msmith@cbnco.com>
	<20090506223838.GA15339@denix.org>
In-Reply-To: <20090506223838.GA15339@denix.org>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 2/2] grub: allow menu.lst to be overridden	using GRUB_CONFIG_PACKAGE.
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
X-List-Received-Date: Thu, 07 May 2009 18:31:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko wrote:
> On Wed, May 06, 2009 at 03:55:57PM -0400, Michael Smith wrote:
>> If GRUB_CONFIG_PACKAGE is set, don't ship menu.lst with grub.

> It was discussed many times here - no USE flags in OE.

> One way to solve it would be to always have menu.lst as a separate package and 
> then replace it with your own from the overlay.

Fair enough -- in this particular case it's quite easy to avoid the USE 
flag by adding a separate package for the config file. One less 
combinatorial to explode.

Since there are few users of the grub package, and menu.lst is a recent 
addition to the package anyway, I don't think anyone will mind.

Mike


