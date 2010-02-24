Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NkPJ8-00057r-OI
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 23:02:15 +0100
Received: from 88-110-39-162.dynamic.dsl.as9105.com ([88.110.39.162]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NkPGS-0007DH-Kr
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 21:59:28 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <6ec4247d1002241348i6dd2db32ifb3f9482287d91bd@mail.gmail.com>
References: <1267044772-10182-1-git-send-email-denis@denix.org>
	<1267045217.5437.326.camel@lenovo.internal.reciva.com>
	<6ec4247d1002241348i6dd2db32ifb3f9482287d91bd@mail.gmail.com>
Date: Wed, 24 Feb 2010 21:59:26 +0000
Message-ID: <1267048766.5437.330.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=SPF_SOFTFAIL autolearn=no
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rootfs_ipk.bbclass: fix BAD_RECOMMENDATIONS
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
X-List-Received-Date: Wed, 24 Feb 2010 22:02:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-02-25 at 08:18 +1030, Graham Gower wrote:
> This is an unintended side effect of other changes, however I'm not
> sure that I consider it inappropriate behaviour. That status does
> apply to a particular package version, does it not?

No, the SW_xx flags should apply to any version and architecture rather
than being nailed down to a specific tuple.  Otherwise, these flags
would be subverted as soon as a new version appears in the feed.

p.




