Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 401D56E8E5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 03:53:39 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id g10so6940825pdj.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 19:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=woJ/5jASGpKoBiFr5+fpjPQJyQOi5xgnNJBAmmnnh5g=;
	b=en3OKHMyKrZR8j6G8Mplj2SFVyoDaGV2/YrV/lgeqxYkVVDz7aAbWnCKa0Vp71Aa4Z
	chRcbVTjGh6ErLA2VI8pQICnS+LmD9z/NzZevXLjQdInY31uPoDjd+ZPZNzF3caAjyoo
	z+U9g84+juiprZuVTyYeo9r5ZU1DtmxpUeUb9DvIijCZTesYPIKBJ24TTW44ZKRpE6hU
	L73cdrj5Z1YQgwqM3ErSxg/VLgPJm/NsZvJNe8M/W1jSC59R81am7l2E78ome7wyfeM5
	YPxhpXFt8HlOohgzkmDOCbaeWHNYSOGOtVTKZaTPfEwpy198/05TCKn2Wiwx98XLGfpb
	lmwA==
X-Received: by 10.66.136.71 with SMTP id py7mr30271743pab.2.1392090819995;
	Mon, 10 Feb 2014 19:53:39 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	os1sm125832114pac.20.2014.02.10.19.53.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Feb 2014 19:53:39 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1384174975-5042-1-git-send-email-linus.walleij@linaro.org>
Date: Mon, 10 Feb 2014 19:53:37 -0800
Message-Id: <204AF634-A305-4BA7-AFAC-629AD28AC3F1@gmail.com>
References: <1384174975-5042-1-git-send-email-linus.walleij@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1827)
Subject: Re: [meta-handheld] [PATCH 2/3] h3600: update defconfig
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Feb 2014 03:53:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Linus

On Nov 11, 2013, at 5:02 AM, Linus Walleij <linus.walleij@linaro.org> =
wrote:

> Enable some vital kernel options such as DEVTMPFS and
> EABI.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> .../linux/linux-yocto-3.10/h3600/defconfig         | 23 =
++++++++++++++++++++--
> 1 file changed, 21 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/linux-yocto-3.10/h3600/defconfig =
b/recipes-kernel/linux/linux-yocto-3.10/h3600/defconfig
> index 2b4adc5f89d9..612502a801fb 100644
> --- a/recipes-kernel/linux/linux-yocto-3.10/h3600/defconfig
> +++ b/recipes-kernel/linux/linux-yocto-3.10/h3600/defconfig
> @@ -1,6 +1,5 @@
> CONFIG_SYSVIPC=3Dy
> CONFIG_NO_HZ_IDLE=3Dy
> -CONFIG_HIGH_RES_TIMERS=3Dy

Did you intend to disable highres timers ?


