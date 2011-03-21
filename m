Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q1dim-0001lb-KZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 12:56:28 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q1dh4-0006tZ-0e
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 12:54:42 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201103211236.39719.pgsellmann@portner-elektronik.at>
References: <201103171154.23397.pgsellmann@portner-elektronik.at>
	<201103181837.04944.pgsellmann@portner-elektronik.at>
	<20110321093020.GB3798@jama.jama.net>
	<201103211236.39719.pgsellmann@portner-elektronik.at>
Date: Mon, 21 Mar 2011 11:54:42 +0000
Message-ID: <1300708482.2228.67.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 3/3] base-files-3.0.14 configuration files
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
X-List-Received-Date: Mon, 21 Mar 2011 11:56:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-21 at 12:36 +0100, Peter Gsellmann wrote:
> setting ONLINE_PACKAGE_MANAGEMENT = "none" precludes the use of CONFFILES_* in all recipes??

It doesn't preclude it, but it does render CONFFILES fairly useless.

It looks like the CONFFILES_micro = "" in this particular recipe was
added by me in 2b4ab236.  I guess I probably did this to avoid having
nonexistent files show up in CONFFILES (since micro doesn't ship stuff
like motd at all).  I don't recall whether I did this just for neatness
or whether OE was actually issuing a diagnostic for that situation.

I guess it might make some sense to just set CONFFILES_micro = ""
globally in micro.conf rather than doing it in individual recipes.

> As i can see, ONLINE_PACKAGE_MANAGEMENT is misused for micro image.

What do you mean?

p.




