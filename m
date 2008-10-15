Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KqBJs-0006CM-30
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 20:42:04 +0200
Received: from 88-111-190-175.dynamic.dsl.as9105.com ([88.111.190.175]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KqBEq-0003sl-KX
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 19:36:53 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200810152018.41691.zecke@selfish.org>
References: <200810151022.38477.zecke@selfish.org>
	<1224060881.30790.15.camel@mill.internal.reciva.com>
	<200810152018.41691.zecke@selfish.org>
Date: Wed, 15 Oct 2008 19:36:47 +0100
Message-Id: <1224095807.4235.74.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [RFC] Enable --hash-style=both for all recent gcc4 targets
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
X-List-Received-Date: Wed, 15 Oct 2008 18:42:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-10-15 at 20:18 +0200, Holger Freyther wrote:
> Modern as in glibc 2.5? I think we could strip the .hash away. 

Right.  This was the glibc change that introduced gnu hash support:

2006-07-10  Ulrich Drepper  <drepper@redhat.com>

        * elf/dl-lookup.c (dl_new_hash): New functions.
        (_dl_lookup_symbol_x): Rename hash to old_hash and don't compute
        value here.  Compute new-style hash value.  Pass new hash value
        and reference to variable with the old value to do_lookup_x.
        (_dl_setup_hash): If DT_GNU_HASH is defined, use it and not
        old-style hash table.

I think it should even be fairly straightforward to backport that to
older glibcs if anybody wanted to do so.  As far as I know there is no
real reason for distros to require 2.4 or earlier though.

p.




