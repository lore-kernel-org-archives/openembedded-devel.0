Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LTxuB-0001Ka-Hu
	for openembedded-devel@openembedded.org; Mon, 02 Feb 2009 13:28:05 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LTxmU-00033Q-Nb
	for openembedded-devel@openembedded.org; Mon, 02 Feb 2009 12:20:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 02 Feb 2009 12:20:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 02 Feb 2009 12:20:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 02 Feb 2009 13:19:52 +0100
Message-ID: <gm6od8$o0k$2@ger.gmane.org>
References: <>
	<1233574850-4230-1-git-send-email-John.Willis@Distant-earth.com>	<1233574850-4230-2-git-send-email-John.Willis@Distant-earth.com>
	<1233574850-4230-3-git-send-email-John.Willis@Distant-earth.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090123 Shredder/3.0b2pre
In-Reply-To: <1233574850-4230-3-git-send-email-John.Willis@Distant-earth.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] Add fb.modes default file for the Pandora.
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
X-List-Received-Date: Mon, 02 Feb 2009 12:28:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-02-09 12:40, David-John Willis wrote:
> Signed-off-by: David-John Willis<John.Willis@Distant-earth.com>
> ---
>   packages/fbset/fbset-modes/omap3-pandora/fb.modes |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)
>   create mode 100755 packages/fbset/fbset-modes/omap3-pandora/fb.modes

Looks good, but you need to bump PR on the fbset-modes recipe as well.

regards,

Koen


>
> diff --git a/packages/fbset/fbset-modes/omap3-pandora/fb.modes b/packages/fbset/fbset-modes/omap3-pandora/fb.modes
> new file mode 100755
> index 0000000..0c87401
> --- /dev/null
> +++ b/packages/fbset/fbset-modes/omap3-pandora/fb.modes
> @@ -0,0 +1,6 @@
> +mode "800x480-65"
> +    # D: 36.001 MHz, H: 34.124 kHz, V: 64.998 Hz
> +    geometry 800 480 800 480 16
> +    timings 27777 40 214 10 34 1 1
> +    rgba 5/11,6/5,5/0,0/0
> +endmode




