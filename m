Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QRLsD-0002Ad-Ck
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 12:08:29 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1QRLpC-0000hv-Af; Tue, 31 May 2011 12:05:22 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1306767263-29895-3-git-send-email-otavio@ossystems.com.br>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
	<1306767263-29895-3-git-send-email-otavio@ossystems.com.br>
Date: Tue, 31 May 2011 11:05:21 +0100
Message-ID: <1306836321.2525.478.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 02/17] conf/bitbake: improve compression image handling
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
X-List-Received-Date: Tue, 31 May 2011 10:08:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-30 at 14:54 +0000, Otavio Salvador wrote:
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 17a494d..5b0f639 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -150,6 +150,8 @@ QEMU_OPTIONS_armv7a   = "-cpu cortex-a8"
>  # default compression levels
>  XZ_COMPRESSION_LEVEL ?= "-e -9"
>  LZMA_COMPRESSION_LEVEL ?= "-e -9"
> +GZIP_COMPRESSION_LEVEL ?= "-9"
> +BZIP2_COMPRESSION_LEVEL ?= "-9"

We had some discussion of this patch last time you posted it, and I
thought the outcome was that you were going to put these bits someplace
other than bitbake.conf.  Am I remembering that wrong?

p.




