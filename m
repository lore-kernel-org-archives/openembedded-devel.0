Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MacTL-0007Gn-8K
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Aug 2009 23:32:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 89B925348E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2009 17:15:49 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20282-07 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 10 Aug 2009 17:15:49 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 5F3C053372F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2009 17:15:49 -0400 (EDT)
Message-ID: <4A808E05.8070302@cbnco.com>
Date: Mon, 10 Aug 2009 17:15:49 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1249923716-19141-1-git-send-email-msmith@cbnco.com>
	<20090810192932.GA8142@gmail.com>
In-Reply-To: <20090810192932.GA8142@gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] pciutils: fix generation of pci.ids.gz
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
X-List-Received-Date: Mon, 10 Aug 2009 21:32:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> Some older versions of hal could only use uncompressed version. So may be you
> could package both versions or leave a possiblity to package
> uncompressed version somehow.

Hi Khem,

I could put pci.ids into pciutils-ids-uncompressed, would that work? I 
don't see a reference to pciutils-ids in any recipe or image outside 
pciutils, so I'm guessing this is something a hal user would install 
manually after installation?

Thanks,
Mike


