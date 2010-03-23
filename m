Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Nu8Vu-00060U-83
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 19:07:43 +0100
Received: (qmail 17886 invoked by uid 1003); 23 Mar 2010 18:04:28 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Mar 2010 18:04:28 -0000
Message-ID: <4BA902AA.6070906@balister.org>
Date: Tue, 23 Mar 2010 14:04:26 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1269366500-19336-1-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1269366500-19336-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] xserver-xorg-conf: really add BUG 2.0
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
X-List-Received-Date: Tue, 23 Mar 2010 18:07:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

On 03/23/2010 01:48 PM, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz<marcin@buglabs.net>
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> ---
>   .../xorg-xserver/xserver-xorg-conf/bug20/xorg.conf |   29 ++++++++++++++++++++
>   recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
>   2 files changed, 30 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
>
> diff --git a/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
> new file mode 100644
> index 0000000..0b976fe
> --- /dev/null
> +++ b/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
> @@ -0,0 +1,29 @@
> +Section "Module"
> +        Load    "extmod"
> +        Load    "dbe"
> +        Load    "glx"
> +        Load    "freetype"
> +#       Load    "type1"
> +#       Load    "record"
> +        Load    "dri"
> +EndSection
> +
> +Section "Monitor"
> +        Identifier      "Builtin Default Monitor"
> +EndSection
> +
> +Section "Device"
> +        Identifier      "Builtin Default fbdev Device 0"
> +        Driver  "omapfb"
> +EndSection
> +
> +Section "Screen"
> +        Identifier      "Builtin Default fbdev Screen 0"
> +        Device  "Builtin Default fbdev Device 0"
> +        Monitor "Builtin Default Monitor"
> +EndSection
> +
> +Section "ServerLayout"
> +        Identifier      "Builtin Default Layout"
> +        Screen  "Builtin Default fbdev Screen 0"
> +EndSection
> diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
> index b7655b8..2cc6360 100644
> --- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
> +++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
> @@ -1,5 +1,5 @@
>   DESCRIPTION = "Machine specific xorg.conf files"
> -PR = "r21"
> +PR = "r24"
>
>   SRC_URI = "file://xorg.conf"
>


