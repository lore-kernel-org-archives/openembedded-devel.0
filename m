Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q1i9x-0001eK-LM
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 17:40:49 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q1i8E-0006xV-Pk
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 17:39:02 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201103211353.40761.pgsellmann@portner-elektronik.at>
References: <201103171154.23397.pgsellmann@portner-elektronik.at>
	<20110321093020.GB3798@jama.jama.net>
	<201103211236.39719.pgsellmann@portner-elektronik.at>
	<201103211353.40761.pgsellmann@portner-elektronik.at>
Date: Mon, 21 Mar 2011 16:39:06 +0000
Message-ID: <1300725546.2228.88.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH v2] base-files-3.0.14 configuration files
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
X-List-Received-Date: Mon, 21 Mar 2011 16:40:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-21 at 13:53 +0100, Peter Gsellmann wrote:
> Mark some files in ${sysconfdir} as configuration files so they are not blindly overwritten when upgrading
> Adjust conffiles variable to be usable as default in CONFFILES
> Images nylon,slugo inherit and amend default set of conffiles
> Image micro has very few configuration files

Note that these are DISTROs, not images.  Also, it's "slugos".

> +CONFFILES_${PN}_nylon = "${sysconfdir}/resolv.conf" + ${conffiles}

Does that actually work?  I'm not convinced that this notation will do
what you seem to be expecting.

p.




