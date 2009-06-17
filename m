Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MGpvS-0004GX-56
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 09:51:18 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MGplL-0001eI-Pw
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 08:40:51 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090617042909.GA21132@denix.org>
References: <20090617042909.GA21132@denix.org>
Date: Wed, 17 Jun 2009 08:40:50 +0100
Message-Id: <1245224450.29153.99.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: update-rc.d: don't add runtime dependency if not doing	online	package management; only add it to ${PN} in any case.
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
X-List-Received-Date: Wed, 17 Jun 2009 07:51:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-17 at 00:29 -0400, Denys Dmytriyenko wrote:
> The problem comes from the fact that either RDEPENDS_{PN}_append = "blah" or 
> RDEPENDS_{PN} += "blah" used in the class overwrite the value set in 
> inheriting recipe, instead of appending to it. The position of the inherit 
> command in the recipe relative to its own RDEPENDS does not matter. And I 
> don't think this issue only applies to RDEPENDS variable...

I've checked in a change to udev-141 that I think should fix this.
(Other versions didn't seem to be affected.)  Please give that a go and
see if it works for you now.

p.




