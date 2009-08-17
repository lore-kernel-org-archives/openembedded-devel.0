Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Md3BF-0004wt-LB
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 16:27:26 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id A43AE1B10C0A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 14:14:08 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2009 16:09:52 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1250515743-10823-1-git-send-email-msmith@cbnco.com>
In-Reply-To: <1250515743-10823-1-git-send-email-msmith@cbnco.com>
MIME-Version: 1.0
Message-Id: <200908171609.52572.holger+oe@freyther.de>
Subject: Re: [PATCH 1/3] nasm: fix COMPATIBLE_HOST to match any vendor
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
X-List-Received-Date: Mon, 17 Aug 2009 14:27:29 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 17 August 2009 15:29:01 Michael Smith wrote:
> On x86_64, it was looking for x86_64-linux, not x86_64-blah-linux;
> it broke the build for syslinux if a BUILD_VENDOR was set.
>
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
>  recipes/nasm/nasm_0.98.38.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/nasm/nasm_0.98.38.bb b/recipes/nasm/nasm_0.98.38.bb
> index 86e7f2b..abe47fe 100644
> --- a/recipes/nasm/nasm_0.98.38.bb
> +++ b/recipes/nasm/nasm_0.98.38.bb
> @@ -1,7 +1,8 @@
>  DESCRIPTION = "General-purpose x86 assembler"
>  SECTION = "devel"
>  LICENSE = "GPL"
> -COMPATIBLE_HOST = '(x86_64|i.86.*)-(linux|freebsd.*)'
> +COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
> +PR = "r1"

Signed-off-by: Holger Hans Peter Freyther <zecke@selfish.org>

No need to bump the PR here. Whoever is landing it, please remove.


