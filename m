Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1KVk0W-0003Uk-AU
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Aug 2008 11:29:36 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 7F6776280B9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2008 11:28:44 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g8frq1$5ei$3@ger.gmane.org>
References: <20080817162932.8ECBF18808B@amethyst.openembedded.net>
	<g8frq1$5ei$3@ger.gmane.org>
Date: Wed, 20 Aug 2008 11:28:31 +0200
Message-Id: <1219224511.19203.82.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: : php-native: Updated to version 5.2.6
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
X-List-Received-Date: Wed, 20 Aug 2008 09:29:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Rolf Leggewie wrote:
> OE GIT Trial wrote:
> > Author:  <svolpe@openembedded.org>
> 
> > php-native: Updated to version 5.2.6
> > *Replaced the old version 5.2.5 with 5.2.6
> 
> Hi,
> 
> did this actually work for you?  For me, compilation of mysql-native 
> fails as well as do_patch for php_5.2.6.

mysql-native fails to build in a chroot environment without /proc
mounted.

build of mysql fails for me as well:
/OE/build-dev/tmp/staging/x86_64-linux/usr/bin/gen_lex_hash > lex_hash.h
/OE/build-dev/tmp/staging/x86_64-linux/usr/bin/gen_lex_hash: error: `/OE/build-dev/tmp/staging/x86_64-linux/usr/bin/.libs/gen_lex_hash' does not exist
This script is just a wrapper for gen_lex_hash.
See the libtool documentation for more information.
make[2]: *** [lex_hash.h] Error 1

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



