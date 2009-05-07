Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1M2C7A-0006LY-Nq
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 00:30:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 408854A335A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 May 2009 18:24:44 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13307-08 for <openembedded-devel@lists.openembedded.org>; 
	Thu,  7 May 2009 18:24:44 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 1B4D3450CE5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 May 2009 18:24:44 -0400 (EDT)
Message-ID: <4A035FAB.4040405@cbnco.com>
Date: Thu, 07 May 2009 18:24:43 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A03277B.1090402@cbnco.com>	<1241720835-17998-1-git-send-email-msmith@cbnco.com>	<1241720835-17998-2-git-send-email-msmith@cbnco.com>	<c384c5ea0905071218v3978ea4cpe791a5283f05c2df@mail.gmail.com>	<be7a9f3d0905071226m78b94d44u50a4e63c927200f5@mail.gmail.com>	<4A033D54.2000709@cbnco.com>
	<c384c5ea0905071305s1b180deal8c5fd09b5d646308@mail.gmail.com>
In-Reply-To: <c384c5ea0905071305s1b180deal8c5fd09b5d646308@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 2/3] grub: use ${libdir}, not /usr/lib
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
X-List-Received-Date: Thu, 07 May 2009 22:30:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Leon Woestenberg wrote:

> Proposal: add a new package "grub-install" that contains
> "grub-install" and the {libdir} stuff.
> 
> The usual embedded target would void this package.

Sounds good to me. I'll send a patch later.

Otavio Salvador wrote:
 > Another thing, since we're revamping GRUB packaging, why not move to
 > grub2? It also has the benefit of providing multi-arch support and
 > being active.

Hi Otavio,

I'd prefer not to work with grub2 for now. From the website, it looks 
like it might still be a bit alpha. Grub 0.9x is also alpha, but at 
least I've already learned some of its secrets. :)

Mike


