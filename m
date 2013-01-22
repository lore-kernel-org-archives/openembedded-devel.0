Received: from mail-la0-f43.google.com ([209.85.215.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1TxmmF-0004W2-3A
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 23:57:11 +0100
Received: by mail-la0-f43.google.com with SMTP id ek20so2931lab.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 14:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=LgGX91EDw4Z3ClHFp9O01V+MYUidemgWPozklJ3V1l4=;
	b=rWmLUsh2btKSmXClBK02N06n2DfJvpJM8cwSBVWH8pDEB4gAZF1DtVfmTv4VoE8e4b
	U4jfSi3j3gi0DiC1Y+otjZ2Ifox8NONAGDcjiNMcxlnZfEOZaJF+FcIqxzSXLFGoXksN
	piA+Ohq/1qJcILN9qgKAQT2ESRMT4zaLbThTt1hx/Hze/UbC8Qy4dpqQ2LrX0pmWh2WA
	g+hG/Ubn3YP3P9sfzxCgUjGRQEeAVSgFESjV4A39f5sui2XN50vh1f/F7UKl/8qC7J5J
	Pj1KpwAfIzrbCDz8USpHyx/u0mKG9Be8m7CUjJeDYTQV5+Ilyvf0JqKrFuHbNO8G3fl0
	mO6Q==
MIME-Version: 1.0
X-Received: by 10.152.133.52 with SMTP id oz20mr4322328lab.30.1358894500318;
	Tue, 22 Jan 2013 14:41:40 -0800 (PST)
Sender: cliff.brake@gmail.com
Received: by 10.114.80.4 with HTTP; Tue, 22 Jan 2013 14:41:40 -0800 (PST)
In-Reply-To: <1358894348-10416-1-git-send-email-cliff.brake@gmail.com>
References: <1358894348-10416-1-git-send-email-cliff.brake@gmail.com>
Date: Tue, 22 Jan 2013 17:41:40 -0500
X-Google-Sender-Auth: dQ0zQ0evfTk-CmKekHNPRo9p6A4
Message-ID: <CAOd_LFy_n_euw+cniV7CuA+4E2wo0Kc5vCG6CH3XxT_AvBBCgw@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] beagleboard.conf: add additional sound modules
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
X-List-Received-Date: Tue, 22 Jan 2013 22:57:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Please ignore, got sent to the wrong list.

Thanks,
Cliff

On Tue, Jan 22, 2013 at 5:39 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> From: Cliff Brake <cbrake@bec-systems.com>
>
> require for audio to function
>
> Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
> ---
>  conf/machine/beagleboard.conf | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
> index b3604a5..8f84c6c 100644
> --- a/conf/machine/beagleboard.conf
> +++ b/conf/machine/beagleboard.conf
> @@ -48,4 +48,5 @@ UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
>  MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
>
>  # For a modularized kernel we want to drag in networking, sound, rtc etc."
> -MACHINE_EXTRA_RRECOMMENDS = "kernel-module-smsc95xx kernel-module-snd-soc-twl4030 kernel-module-rtc-twl"
> +MACHINE_EXTRA_RRECOMMENDS = "kernel-module-smsc95xx kernel-module-snd-soc-twl4030 kernel-module-rtc-twl \
> +  kernel-module-snd-soc-omap kernel-module-snd-soc-omap-mcbsp kernel-module-snd-soc-omap3beagle"
> --
> 1.8.1.1
>


