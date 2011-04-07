Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q7sxB-0008K8-7l
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 19:25:09 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1Q7sv9-0003wo-CO; Thu, 07 Apr 2011 19:23:03 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1302182396-4171-3-git-send-email-otavio@ossystems.com.br>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-3-git-send-email-otavio@ossystems.com.br>
Date: Thu, 07 Apr 2011 18:23:01 +0100
Message-ID: <1302196981.14449.444.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 2/6] conf/bitbake: improve compression image handling
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
X-List-Received-Date: Thu, 07 Apr 2011 17:25:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-04-07 at 13:19 +0000, Otavio Salvador wrote:
>  XZ_COMPRESSION_LEVEL ?= "-e -9"
>  LZMA_COMPRESSION_LEVEL ?= "-e -9"
> +GZIP_COMPRESSION_LEVEL ?= "-9"
> +BZIP2_COMPRESSION_LEVEL ?= "-9"

It seems a bit sad to have to keep adding new vars to the global
configuration set (and hence parse them for every single recipe) every
time someone wants to tweak a new compression format.  Can we not just
have a single IMAGE_COMPRESSION_LEVEL that does for everything?

p.




