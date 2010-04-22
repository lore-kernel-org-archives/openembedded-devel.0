Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1O4wPx-0006oO-KK
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 15:26:37 +0200
Received: from host86-167-66-27.range86-167.btcentralplus.com ([86.167.66.27]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1O4wMV-0002zi-CU
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 14:22:35 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1O4wMU-0001bt-Sv
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 14:22:34 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100422144638.7c78d45c.ospite@studenti.unina.it>
References: <20100422134322.f79d1365.ospite@studenti.unina.it>
	<1271937343.24079.176.camel@mill.internal.reciva.com>
	<20100422144638.7c78d45c.ospite@studenti.unina.it>
Date: Thu, 22 Apr 2010 14:22:34 +0100
Message-ID: <1271942554.24079.195.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Thu, 22 Apr 2010 13:26:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-04-22 at 14:46 +0200, Antonio Ospite wrote:
> A per-MACHINE way would be better IMHO, I am thinking about
> adding a check on something like /dev/.staticdev (suggested in [1]) to
> both udev init script and to the 'device' script from initscripts, and
> make the image class add the /dev/.staticdev file when
> IMAGE_DEV_MANAGER == "" (or maybe == "static" or "none"?)
> 
> Does this sound reasonable?

Yes, that sounds reasonable enough.  Or you could check for /dev being
mounted on tmpfs rather than persistent storage; you'd probably need
some check along those lines anyway to catch the devtmpfs case.

It would still be nice to have udev be a DISTRO_FEATURE as well, since
it'd suck a bit to have all that stuff installed in flash if it's never
going to be used.  But your proposal sounds basically fine to me.

p.



