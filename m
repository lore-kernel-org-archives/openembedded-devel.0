Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlS26-0004Ov-DD
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jul 2011 22:45:46 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlRy4-00012T-AX
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jul 2011 22:41:36 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c1ad379acab6c0bbe50c200c46bd7951@smithers>
References: <aca10ad4ca204fe1dbc0276dbffed2b2@smithers>
	<1311624488.3098.14.camel@lenovo.internal.reciva.com>
	<c1ad379acab6c0bbe50c200c46bd7951@smithers>
Date: Mon, 25 Jul 2011 21:41:30 +0100
Message-ID: <1311626490.3098.22.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Mon, 25 Jul 2011 20:45:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 15:34 -0500, Robert Brick wrote:
> I should have mentioned it in my initial mail.  I believe that the
> glibc message catalog is installed correctly.
> 
> root@cpc3xx:/bin# ls -l /usr/share/locale/es/LC_MESSAGES/
> total 232
> -rw-r--r-- 1 root root 110655 jul 23 13:57 coreutils.mo
> -rw-r--r-- 1 root root 120808 jul 21 01:15 libc.mo
> root@cpc3xx:/bin#
> 
> Is there any other file other than .../es/LC_MESSAGES/libc.mo that make
> up the message catalog?

Oh, very strange then.  That does look correct; as far as I know libc.mo
is the only file you should need to get localised output from glibc.

What does the output from "strace -f ls /nonexistent" look like?

p.




