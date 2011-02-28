Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Pu6Lh-0004M7-8o
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 17:53:29 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1Pu6KM-0006QV-A0; Mon, 28 Feb 2011 17:52:06 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1298899606-9139-2-git-send-email-otavio@ossystems.com.br>
References: <1298899606-9139-1-git-send-email-otavio@ossystems.com.br>
	<1298899606-9139-2-git-send-email-otavio@ossystems.com.br>
Date: Mon, 28 Feb 2011 16:57:19 +0000
Message-ID: <1298912239.23547.10.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 2/2] conf/bitbake.conf: add DISTRO_ARCH and MACHINE_DISTRO_ARCH
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
X-List-Received-Date: Mon, 28 Feb 2011 16:53:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-02-28 at 13:26 +0000, Otavio Salvador wrote:
> -PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE}"
> +DISTRO_ARCH = "${TARGET_ARCH}-${DISTRO}"
> +MACHINE_DISTRO_ARCH = "${MACHINE_ARCH}-${DISTRO}"
> +PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${DISTRO_ARCH} ${MACHINE_DISTRO_ARCH} ${MACHINE}"

This seems a bit weird.  Any given package feed (or TMPDIR) is, more or
less by definition, going to correspond to a single DISTRO so I can't
see any situation in which these extra archs would be useful.  What's
the use-case for this?

p.




