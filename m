Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OdeeE-0000CM-O9
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 09:32:23 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Odedx-0003A9-M4
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 08:32:05 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1280213315-5513-9-git-send-email-raj.khem@gmail.com>
References: <1280213315-5513-1-git-send-email-raj.khem@gmail.com>
	<1280213315-5513-9-git-send-email-raj.khem@gmail.com>
Date: Tue, 27 Jul 2010 08:32:18 +0100
Message-ID: <1280215938.4708.3.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 8/8] recipes: Replace ${PN} override with pn-${PN} for PACKAGE_ARCH
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
X-List-Received-Date: Tue, 27 Jul 2010 07:32:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-07-26 at 23:48 -0700, Khem Raj wrote:
> --- a/recipes/freesmartphone/frameworkd_git.bb
> +++ b/recipes/freesmartphone/frameworkd_git.bb
> @@ -78,7 +78,7 @@ RRECOMMENDS_${PN} += "\
>  "
>  
>  PACKAGES =+ "${PN}-config"
> -PACKAGE_ARCH_${PN}-config = "${MACHINE_ARCH}"
> +PACKAGE_ARCH_pn-${PN}-config = "${MACHINE_ARCH}"

Surely this can't be what you mean?  That latter override is never going
to do anything useful (or at least, anything that couldn't be achieved
by assigning PACKAGE_ARCH directly).

p.




