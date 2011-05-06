Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QIFW4-0003zE-Fd
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 09:32:00 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QIFP0-0002qc-51
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 09:24:42 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304653677-2982-1-git-send-email-raj.khem@gmail.com>
References: <1304653677-2982-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 06 May 2011 08:29:14 +0100
Message-ID: <1304666954.3162.3.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [meta-oe][PATCH] conf/layer.conf: Use .= for BBPATH and += for BBFILES
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
X-List-Received-Date: Fri, 06 May 2011 07:32:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-05 at 20:47 -0700, raj.khem@gmail.com wrote:
>  # We have a conf and classes directory, prepend to BBPATH to prefer our versions
> -BBPATH := "${LAYERDIR}:${BBPATH}"
> +BBPATH .= ":${LAYERDIR}"

This patch seems to cause the code to do the opposite of what the
comment says.  If changing it to be an append rather than a prepend is
deliberate, please adjust the comment to match.  (It would also be nice
to have some commentary in the commit message explaining why this is
being done, since it isn't obvious to me why append would be better.)

p.





