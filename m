Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LTxth-0000rp-3E
	for openembedded-devel@openembedded.org; Mon, 02 Feb 2009 13:27:30 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LTxlu-00031s-MK
	for openembedded-devel@openembedded.org; Mon, 02 Feb 2009 12:19:26 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 02 Feb 2009 12:19:26 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 02 Feb 2009 12:19:26 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 02 Feb 2009 13:19:17 +0100
Message-ID: <gm6oc5$o0k$1@ger.gmane.org>
References: <>
	<1233574850-4230-1-git-send-email-John.Willis@Distant-earth.com>	<1233574850-4230-2-git-send-email-John.Willis@Distant-earth.com>	<1233574850-4230-3-git-send-email-John.Willis@Distant-earth.com>
	<1233574850-4230-4-git-send-email-John.Willis@Distant-earth.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090123 Shredder/3.0b2pre
In-Reply-To: <1233574850-4230-4-git-send-email-John.Willis@Distant-earth.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] Add default xorg.conf for the Pandora.
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
X-List-Received-Date: Mon, 02 Feb 2009 12:27:34 -0000
X-List-Received-Date: Mon, 02 Feb 2009 12:27:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-02-09 12:40, David-John Willis wrote:
> Signed-off-by: David-John Willis<John.Willis@Distant-earth.com>
> ---
>   .../xserver-xorg-conf/omap3-pandora/xorg.conf      |   29 ++++++++++++++++++++
>   1 files changed, 29 insertions(+), 0 deletions(-)
>   create mode 100755 packages/xorg-xserver/xserver-xorg-conf/omap3-pandora/xorg.conf

Looks good, but you need to bump PR on the xserver-xorg-conf recipe as well.

regards,

Koen


>
> diff --git a/packages/xorg-xserver/xserver-xorg-conf/omap3-pandora/xorg.conf b/packages/xorg-xserver/xserver-xorg-conf/omap3-pandora/xorg.conf
> new file mode 100755
> index 0000000..983bb08
> --- /dev/null
> +++ b/packages/xorg-xserver/xserver-xorg-conf/omap3-pandora/xorg.conf
> @@ -0,0 +1,29 @@
> +Section "Module"
> +        Load    "extmod"
> +        Load    "dbe"
> +        Load    "glx"
> +        Load    "freetype"
> +        Load    "type1"
> +        Load    "record"
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




