Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlRVp-0003m6-0n
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jul 2011 22:12:25 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlRRm-00011B-V3
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jul 2011 22:08:15 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <aca10ad4ca204fe1dbc0276dbffed2b2@smithers>
References: <aca10ad4ca204fe1dbc0276dbffed2b2@smithers>
Date: Mon, 25 Jul 2011 21:08:08 +0100
Message-ID: <1311624488.3098.14.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: i18n problems with eglibc
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
X-List-Received-Date: Mon, 25 Jul 2011 20:12:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 11:26 -0500, Robert Brick wrote:
> root@cpc3xx:/bin [1]# ls /nonexistent
> ls: no se puede acceder a /nonexistent: No such file or directory
> root@cpc3xx:/bin [2]#
> 
> I was expecting to see:
> ls: no se puede acceder a /non: No existe el fichero o el directorio
> 
> The first part of the output has the es translation, but not the 
> second
> part.
> 
> Anyone have any idea why? Thanks in advance.

It sounds as though the message catalogs for glibc itself aren't getting
installed for some reason.  The first step would be to check whether
that's really the case, and then I guess the second step would be to
debug rootfs_ipk to find out why not.

p.




