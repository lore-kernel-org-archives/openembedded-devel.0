Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NHv6l-0001Zh-FS for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 09:07:46 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NHv5B-0001Ox-0R
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 09:06:05 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Dec 2009 09:06:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Dec 2009 09:06:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 08 Dec 2009 09:05:40 +0100
Message-ID: <hfl1ck$sog$1@ger.gmane.org>
References: <1260221130-4958-1-git-send-email-sgh@sgh.dk>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <1260221130-4958-1-git-send-email-sgh@sgh.dk>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Unset DEFAULT_PREFERENCE for mesa-dri-7.2 and mesa-dri-7.4
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
X-List-Received-Date: Tue, 08 Dec 2009 08:07:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

What's the rationale behind this change? And why do you comment it when 
we have an scm that can track changes?

regards,

Koen

On 07-12-09 22:25, Søren Holm wrote:
> ---
>   recipes/mesa/mesa-dri_7.2.bb |    2 +-
>   recipes/mesa/mesa-dri_7.4.bb |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/mesa/mesa-dri_7.2.bb b/recipes/mesa/mesa-dri_7.2.bb
> index 9356843..3030395 100644
> --- a/recipes/mesa/mesa-dri_7.2.bb
> +++ b/recipes/mesa/mesa-dri_7.2.bb
> @@ -9,7 +9,7 @@ PE = "1"
>   PR = "${INC_PR}.0"
>
>   # most of our targets do not have DRI so will use mesa-xlib
> -DEFAULT_PREFERENCE = "-1"
> +#DEFAULT_PREFERENCE = "-1"
>
>   # ASUS EeePC 901 has DRI support so use mesa-dri by default
>   DEFAULT_PREFERENCE_eee901 = "1"
> diff --git a/recipes/mesa/mesa-dri_7.4.bb b/recipes/mesa/mesa-dri_7.4.bb
> index 9356843..3030395 100644
> --- a/recipes/mesa/mesa-dri_7.4.bb
> +++ b/recipes/mesa/mesa-dri_7.4.bb
> @@ -9,7 +9,7 @@ PE = "1"
>   PR = "${INC_PR}.0"
>
>   # most of our targets do not have DRI so will use mesa-xlib
> -DEFAULT_PREFERENCE = "-1"
> +#DEFAULT_PREFERENCE = "-1"
>
>   # ASUS EeePC 901 has DRI support so use mesa-dri by default
>   DEFAULT_PREFERENCE_eee901 = "1"




