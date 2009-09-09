Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MlMs0-0000HN-B1
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 15:05:59 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MlMrb-0002HX-Ig
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 14:05:31 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MlMrb-0007Ub-CP
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 14:05:31 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1252329016-10848-4-git-send-email-ihar.hrachyshka@gmail.com>
References: <1252329016-10848-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1252329016-10848-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1252329016-10848-3-git-send-email-ihar.hrachyshka@gmail.com>
	<1252329016-10848-4-git-send-email-ihar.hrachyshka@gmail.com>
Date: Wed, 09 Sep 2009 14:05:27 +0100
Message-Id: <1252501527.27780.755.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Use NEED_UNZIP_FOR_UNPACK variable for some recipes.
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
X-List-Received-Date: Wed, 09 Sep 2009 13:05:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-09-07 at 16:10 +0300, Ihar Hrachyshka wrote:
> +NEED_UNZIP_FOR_UNPACK=1

Why is this better than just declaring an explicit dependency of
do_unpack on unzip-native?  It's not obvious to me that the extra level
of abstraction buys much in this situation.

p.




