Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MH0ju-0004hJ-TT
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 21:24:07 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MH0Zn-0002Ap-Pl
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 20:13:40 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0906171207j416bd6a3ke98d39ec75f9d1a@mail.gmail.com>
References: <1245258640-1623-1-git-send-email-clarson@mvista.com>
	<c384c5ea0906171207j416bd6a3ke98d39ec75f9d1a@mail.gmail.com>
Date: Wed, 17 Jun 2009 20:13:38 +0100
Message-Id: <1245266018.29153.123.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] image.bbclass: remove tmp/rootfs after image	creation unless you set a variable
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
X-List-Received-Date: Wed, 17 Jun 2009 19:24:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-17 at 21:07 +0200, Leon Woestenberg wrote:
> Hello,
> If users see:
> 
> IMAGE_KEEPROOTFS = "1"
> 
> in most cases they'll do:
> 
> IMAGE_KEEPROOTFS = "0"
> 
> instead of
> 
> #IMAGE_KEEPROOTFS = "1"
> 
> 
> Do we have more of these?? It never occured to me before.

Yeah, I made exactly this mistake with OE_STRICT_CHECKSUMS last week.
Luckily, Mickey was on hand to put me straight, otherwise it would have
been a frustrating experience.

p.



