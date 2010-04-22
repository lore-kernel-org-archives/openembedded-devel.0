Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1O4vN0-0004yC-1l
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 14:19:17 +0200
Received: from host86-167-66-27.range86-167.btcentralplus.com ([86.167.66.27]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1O4v0S-00025u-QY
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 12:55:44 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1O4v0S-0000rA-96
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 12:55:44 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100422134322.f79d1365.ospite@studenti.unina.it>
References: <20100422134322.f79d1365.ospite@studenti.unina.it>
Date: Thu, 22 Apr 2010 12:55:43 +0100
Message-ID: <1271937343.24079.176.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: About having a static /dev
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
X-List-Received-Date: Thu, 22 Apr 2010 12:19:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-04-22 at 13:43 +0200, Antonio Ospite wrote:
>  2. If I install any package which depends on udev then udev is brought
>     in and the static layout is gone at the next boot.

I think your best option is probably to make udev be a DISTRO_FEATURE
and not set it for your own distribution.

If you genuinely want udev to be selected (for your particular DISTRO)
on a per-MACHINE basis then you'll have to invent some way to nobble its
startup script so that it just doesn't do anything on machines where it
isn't wanted.

p.




