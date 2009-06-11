Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MEf74-0004OC-3F
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 09:54:18 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MEexa-0002zn-W5
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 08:44:31 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <87ljnzik4z.wl%peter@chubb.wattle.id.au>
References: <87ljnzik4z.wl%peter@chubb.wattle.id.au>
Date: Thu, 11 Jun 2009 08:44:29 +0100
Message-Id: <1244706269.4151.80.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] Micro image needs some help
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
X-List-Received-Date: Thu, 11 Jun 2009 07:54:18 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-06-11 at 12:23 +1000, Peter Chubb wrote:
> I've been attempting to use the micro-image on a BeagleBoard.  I have
> a couple of problems:
>  -- not all the kernel modules necessary are installed (in fact, none
>     are.)
>  -- Nothing mounts /sys or /proc so udev bombs out early.

/proc is meant to be mounted by /etc/rcS, and I guess it'd make sense to
have /sys mounted there as well.  I don't know why that script wouldn't
be managing to mount /proc for you, though: that's a bit weird.

p.




