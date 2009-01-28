Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LS9Hc-0004DY-TV
	for openembedded-devel@openembedded.org; Wed, 28 Jan 2009 13:12:40 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LS9AF-0007q9-0L
	for openembedded-devel@openembedded.org; Wed, 28 Jan 2009 12:05:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 28 Jan 2009 12:05:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 28 Jan 2009 12:05:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 28 Jan 2009 13:00:57 +0100
Message-ID: <glphdq$8js$2@ger.gmane.org>
References: <1233141961.18907.3.camel@EPBYMINW0568>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090118 Shredder/3.0b2pre
In-Reply-To: <1233141961.18907.3.camel@EPBYMINW0568>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] Added base pnx833x stb225 board support.
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
X-List-Received-Date: Wed, 28 Jan 2009 12:12:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28-01-09 12:26, Ihar Hrachyshka wrote:
> This patch adds support for PNX833X STB225 board with some kernel
> patches: serial UART, Ethernet, and basic processor flavor
> functionality.
>
> Signed-off-by: Ihar Hrachyshka<ihar.hrachyshka@gmail.com>
> ---
>   conf/machine/stb225.conf                           |    8 +

>
> diff --git a/conf/machine/stb225.conf b/conf/machine/stb225.conf
> new file mode 100644
> index 0000000..97370e1
> --- /dev/null
> +++ b/conf/machine/stb225.conf
> @@ -0,0 +1,8 @@
> +# PNX8335 STB225 board
> +TARGET_ARCH = "mipsel"
> +TARGET_CC_ARCH="-march=mips32"
> +MACHINE_FEATURES = "kernel26"
> +IMAGE_FSTYPES="tar.gz"
> +PREFERRED_PROVIDER_virtual/kernel="linux"
> +KERNEL_IMAGETYPE="vmlinux"
> +KERNEL_OUTPUT="${KERNEL_IMAGETYPE}"

Could you make this look more like other recipes? E.g. using a tune file 
for the cpu part, use += for IMAGE_FSTYPES, have spaces around equeal 
signs, etc?
The kernel part looks ok, though.

regards,

Koen



