Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QZPud-0004y7-AX
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jun 2011 18:04:19 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QZPrC-0003Js-1P
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jun 2011 18:00:47 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1308758231-32758-1-git-send-email-GNUtoo@no-log.org>
References: <1308758231-32758-1-git-send-email-GNUtoo@no-log.org>
Date: Wed, 22 Jun 2011 17:00:38 +0100
Message-ID: <1308758438.21613.101.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH v2] conf/bitbake: improve compression image handling and adapt linux-kexecboot.inc
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
X-List-Received-Date: Wed, 22 Jun 2011 16:04:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-22 at 17:57 +0200, Denis 'GNUtoo' Carikli wrote:
> @@ -150,6 +150,8 @@ QEMU_OPTIONS_armv7a   = "-cpu cortex-a8"
>  # default compression levels
>  XZ_COMPRESSION_LEVEL ?= "-e -9"
>  LZMA_COMPRESSION_LEVEL ?= "-e -9"
> +GZIP_COMPRESSION_LEVEL ?= "-9"
> +BZIP2_COMPRESSION_LEVEL ?= "-9"

I still dislike this for the same reasons as before.  The lzma bits are
fine.

p.




