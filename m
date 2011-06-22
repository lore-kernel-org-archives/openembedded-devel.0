Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QZK6k-0003x6-3w
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jun 2011 11:52:26 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QZK3K-000368-4P
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jun 2011 11:48:54 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1308733994-3571-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1308733994-3571-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Wed, 22 Jun 2011 10:48:52 +0100
Message-ID: <1308736132.21613.68.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] classes/native*.bbclass: fix error during parse with bitbake master
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
X-List-Received-Date: Wed, 22 Jun 2011 09:52:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-22 at 10:13 +0100, Paul Eggleton wrote:
>          depends = bb.data.getVar("DEPENDS_virtclass-native", d, True)
> -        deps = bb.utils.explode_deps(depends)
> +        if depends:
> +            deps = bb.utils.explode_deps(depends)
> +        else:
> +            deps = []

Can't you just make the first line be something like

depends = bb.data.getVar("DEPENDS_virtclass-native", d, True) or ""

?

p.




