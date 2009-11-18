Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NAhkw-0003fO-Og
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 11:27:25 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NAhjb-0000nY-0M
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 10:25:59 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NAhjZ-0003aR-UN
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 10:25:58 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258409935-6345-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
References: <c384c5ea0911100825s66f64234s8d1c27b66221faca@mail.gmail.com>
	<1258409935-6345-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
Date: Wed, 18 Nov 2009 10:25:54 +0000
Message-Id: <1258539954.26517.91.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Reorganized kernel class to run 'menuconfig' after 'configure'.
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
X-List-Received-Date: Wed, 18 Nov 2009 10:27:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-16 at 23:18 +0100, Przemyslaw Wesolek wrote:
> Previously, 'menuconfig' task was being run just after 'patch' one. In
> result, the most common path for unexperienced users:
> 
> bitbake virtual/kernel -c menuconfig
> bitbake virtual/kernel -c build
> 
> didn't work, because the result of 'menuconfig' was later overwritten by
> 'configure' on the chain of 'build'.
> 
> With this patch, 'configure' is requirement for 'menuconfig',
> so any manual changes to the kernel config is done just before
> actual build and no overwrite occurs.

Thanks for the patch.  That seems like a reasonable change and I think
it's been proposed before without anybody speaking up in favour of the
old behaviour.  I checked this in.

p.




