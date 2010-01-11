Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NUIsA-0005Hq-7W
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 12:55:53 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NUIq6-0002hL-IP
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 11:53:42 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NUIq6-0003bQ-Bq
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 11:53:42 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263143195.3710.30.camel@utx.utx.cz>
References: <1263143195.3710.30.camel@utx.utx.cz>
Date: Mon, 11 Jan 2010 11:53:38 +0000
Message-ID: <1263210818.3675.296.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] introduce global control on shared/static libraries
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
X-List-Received-Date: Mon, 11 Jan 2010 11:55:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-01-10 at 18:06 +0100, Stanislav Brabec wrote:
> This patch adds support for global enabling and disabling of shared or
> static libraries in autoconf based packages.
> 
> All required fixes in packages that I was able to test are already in
> place with exception of apmd (I plan to commit it soon as well).

I'm not very keen on the names of these configuration variables or the
global exports of them.  I understand your desire to leverage the
existing support in autoconf for taking settings from the environment,
but I am not sure that it is wholesome to pollute the global environment
for all tasks, including non-autoconf-using ones, with this stuff.

I would suggest something more along the lines of a
BITBAKE_LIBRARY_STYLE variable (not exported to the environment), which
you can set to "shared", "static" or "both", and then some code in
autotools_do_configure() to translate this into the appropriate flags or
environment settings for configure.

p.




