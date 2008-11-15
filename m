Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1L1K3h-00038f-O7
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Nov 2008 13:15:25 +0100
Received: from 89-168-188-212.dynamic.dsl.as9105.com ([89.168.188.212]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1L1K1Z-0004FO-Fy
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Nov 2008 12:13:13 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200811150004.50508.zecke@selfish.org>
References: <200811150004.50508.zecke@selfish.org>
Date: Sat, 15 Nov 2008 12:13:12 +0000
Message-Id: <1226751192.23391.48.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [gstreamer] Enabling binary cache (instead of the xml one)
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
X-List-Received-Date: Sat, 15 Nov 2008 12:15:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-11-15 at 00:04 +0100, Holger Freyther wrote:
> Binary cache:
> 
> # Cached
> Total count: 119 plugins, 351 features
> real    0m 1.74s
> 
> XML Cache:
>
> # Cached
> Total count: 119 plugins, 351 features
> real    0m 1.87s

So, if I'm reading that right, the binary cache gives you a startup time
improvement (assuming a hot cache) of about 0.13 seconds.  It sounds
like there are probably bigger savings to be had by, as you suggest,
eliminating the stat() of all plugins and/or reducing the number of
unnecessarily installed plugins; it seems fairly unlikely that many
applications are really using all 119 of those.

That said though, "every little helps" and this certainly seems like it
would be a worthwhile improvement.  There's nothing particularly scary
about the use of mmap().

p.




