Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OXsdD-0002kL-CQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 11:15:42 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OXsYS-000264-SU
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 10:10:33 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1278834530-16235-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <AANLkTin-XFFlkOFj5TAdpyx9pnvKofaPFzjI09Uv6E9M@mail.gmail.com>
	<1278834530-16235-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Sun, 11 Jul 2010 10:10:34 +0100
Message-ID: <1278839434.15825.46.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] base.bbclass: introduce COMPATIBLE_TARGET_SYS and COMPATIBLE_TARGET_ARCH
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
X-List-Received-Date: Sun, 11 Jul 2010 09:15:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 2010-07-11 at 09:48 +0200, Frans Meulenbroeks wrote:
> This patch introduces COMPATIBLE_TARGET_SYS and COMPATIBLE_TARGET_ARCH
> They are similar to COMPATIBLE_MACHINE but where COMPATIBLE_MACHINE
> is used to specify that a certain recipe is for a certain machine
> COMPATIBLE_TARGET_SYS can be used to specify that a certain recipe
> is for a certain target system (e.g. mips-oe-linux),
> COMPATIBLE_TARGET_ARCH can be used that a certain recipe is for a certain
> architecture (e.g. mips)

Why do you need both?  Surely COMPATIBLE_TARGET_ARCH can be implemented
by testing against COMPATIBLE_TARGET_SYS with a suitable wildcard.

> as restrictions may apply for both native and cross recipes, the patch
> is in base.bbclass, not cross.bbclass.

TARGET_SYS only has real meaning for cross recipes.  For standard host
recipes, the variable to check would be HOST_SYS (via COMPATIBLE_HOST).
I'm not sure that putting cross-specific stuff in base.bbclass is a
wholesome plan.

p.




