Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GHy6w-0000xS-T1
	for openembedded-devel@openembedded.org; Tue, 29 Aug 2006 09:34:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k7T7WC3M020803
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Aug 2006 08:32:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20441-08 for <openembedded-devel@openembedded.org>;
	Tue, 29 Aug 2006 08:32:09 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k7T7W77c020796
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Aug 2006 08:32:07 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <E1GHnvw-0007xb-EL@linuxtogo.org>
References: <E1GHnvw-0007xb-EL@linuxtogo.org>
Date: Tue, 29 Aug 2006 08:32:06 +0100
Message-Id: <1156836726.5562.1.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev Machine config for the dht-walnut	(ppc) board
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Aug 2006 07:34:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2006-08-28 at 22:42 +0200, ifaistos commit wrote:
> +IPKG_ARCHS = "all powerpc ${MACHINE}"

Whilst this will work, I suspect you'd be better off using
IPKG_EXTRA_ARCHS and in actual fact, you don't have any extra ones so
you can just leave it unset and use the default.

Cheers,

Richard



