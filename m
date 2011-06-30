Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QcCRR-00042M-J5
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jun 2011 10:17:41 +0200
Received: by pzk36 with SMTP id 36so1783599pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2011 01:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Jl1m51H44+Sq01RfGLP3nTgCu6OXY0dU2RuIVRoTJBY=;
	b=kuai4AytjuvDy04ECBI7/bFU7J5lS0zOfmnpGIrtmhkmEsEBwWaV4xicoIk8DUsCwL
	fLcxQVx6l/EKXlxlMlUMM54615PwPyYUEOuagXb717/vg+IEfHubSEfKd+0TrVNdRZyt
	OQPKCzqA7cQKU43ZtHlrBNy3k0aRKxnjZC7r0=
Received: by 10.142.131.1 with SMTP id e1mr804506wfd.292.1309421595596;
	Thu, 30 Jun 2011 01:13:15 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id e13sm1325509wfd.13.2011.06.30.01.13.14
	(version=SSLv3 cipher=OTHER); Thu, 30 Jun 2011 01:13:15 -0700 (PDT)
Message-ID: <4E0C3019.3070601@gmail.com>
Date: Thu, 30 Jun 2011 01:13:13 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E0C00ED.40407@gmail.com>
In-Reply-To: <4E0C00ED.40407@gmail.com>
Subject: Re: [PATCH] linux-omap-psp-2.6.32 kernel: Fixed User-button GPIO to correct value for -xM
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
X-List-Received-Date: Thu, 30 Jun 2011 08:17:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/29/2011 09:51 PM, Joel A Fernandes wrote:
> Signed-off-by: Joel A Fernandes<agnel.joel@gmail.com>
> ---
>   ...agle-cleaned-up-board-revision-conditions.patch |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/linux/linux-omap-psp-2.6.32/beagleboard-xmc/0008-omap3-beagle-cleaned-up-board-revision-conditions.patch b/recipes/linux/linux-omap-psp-2.6.32/beagleboard-xmc/0008-omap3-beagle-cleaned-up-board-revision-conditions.patch
> index 513a101..fb91cb6 100644
> --- a/recipes/linux/linux-omap-psp-2.6.32/beagleboard-xmc/0008-omap3-beagle-cleaned-up-board-revision-conditions.patch
> +++ b/recipes/linux/linux-omap-psp-2.6.32/beagleboard-xmc/0008-omap3-beagle-cleaned-up-board-revision-conditions.patch
> @@ -143,8 +143,8 @@ index 4bde54b..664a9c6 100644
>    	omap3_beagle_i2c_init();
>
>   -	if (cpu_is_omap3630()) {
> -+	if ((omap3_beagle_get_rev() != OMAP3BEAGLE_BOARD_XMAB)&&
> -+		(omap3_beagle_get_rev() != OMAP3BEAGLE_BOARD_XMC)) {
> ++	if ((omap3_beagle_get_rev() == OMAP3BEAGLE_BOARD_XMAB) ||
> ++		(omap3_beagle_get_rev() == OMAP3BEAGLE_BOARD_XMC)) {
>    		gpio_buttons[0].gpio = 4;
>    	}
>

while the patch seems good it does not follow the submission guidelines.


