Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 550BE616F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:22:50 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id i6so67637pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3qP8S10o5kxkK2UT+3wxiVTGKL2nYapEfrCzHi0VvRY=;
	b=E2R39/+WbfBk8M9r0g1Sx/SlRyZOcXOWSsbItZW1xHM0LjloNqE8G31cSiHLE9FVYP
	BjLrGKR5ZSHmXDyVmolhMAAWUu+V3SC3qbsySlVoe8BP++ogdO+Bh/YiIhFHZK2Z7SpO
	2tcPJKOY0yCEaas8gb1kmSPeQZ/yKtKBY3w2RmBh2VFr7bgNSw1nYluN2PqfAQAFZIY5
	YbWEC8UpG21oiTf8bG3kHMQcqwNpSyQ5dxJHrExMGsukxBYNJXC31tvmDlGS50g75IFD
	CpzsBLRj3G1hBX20ziVrhEoxhZg73+dJLsHJqW/Wzx6BJdcV/agyn5TnzSq3USfwL6tf
	j0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3qP8S10o5kxkK2UT+3wxiVTGKL2nYapEfrCzHi0VvRY=;
	b=hGstRueNXi1+OK03Pjapj60pe2OzxQdyu5tMWP2PUObUoJk+UTBnsEB/XDj2vX95MM
	nwxBvP0mUIwCuceUAYlW05FJNAf7Hiy3fBhQcp1lcbcmo72lpDz/PWXPB5SL6L+bfxt0
	FIvR39t1gmaohPrn7yFiMwuESS/zzquNwLBWw/l/yhlhTrbuvPIa4tLtM+LYNJJxS8GL
	dtxxMSZq7Pklfc9zomLTw2jlJWszD92EwwI9tXjBQt1Z0V6oJpl+C7xn+Kxg7XArQ4Wb
	LTE10oOtp7viqZdhBNbB0sl1OLKBiIIQKoDk0V73ELONsf9hUcHmSXyOerUiOigBe37l
	8/Aw==
X-Gm-Message-State: APjAAAV9gVQnV1t8TDWdHg+4/GGeEg/HItrQ27Pi2oPO1a5cs24l9dME
	ETJ/MAtvXehXgudLQHzNh7c3W/m8hK8=
X-Google-Smtp-Source: APXvYqzDPOotXQtyfQS/fMmEyA7nfmBsCirIzVz68xr7je6orLnx+0hIVrT+VJgpdrsc+Ons6XWM7Q==
X-Received: by 2002:a62:ce48:: with SMTP id y69mr273993pfg.8.1582658570862;
	Tue, 25 Feb 2020 11:22:50 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0::396c? ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id
	g10sm18509666pfo.166.2020.02.25.11.22.50
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 25 Feb 2020 11:22:50 -0800 (PST)
To: Matt Ranostay <matt.ranostay@konsulko.com>,
	openembedded-devel@lists.openembedded.org
References: <20200225035949.30515-1-matt.ranostay@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
	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
Message-ID: <4428794a-fc1f-c178-d3d0-28bf2f3e5adf@gmail.com>
Date: Tue, 25 Feb 2020 11:23:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225035949.30515-1-matt.ranostay@konsulko.com>
Subject: Re: [[meta-oe][PATCH v2] ttf-noto-emoji: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Feb 2020 19:22:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/24/20 7:59 PM, Matt Ranostay wrote:
> Add both B/W and color emojis fonts from the noto-emoji project.
> 
> Important note for the color emojis to render the pixmap PACKAGECONFIG
> option needs to be set in freetype package.
> 

We have sstate failures due to fontconfig dep

http://jenkins.nas-admin.org/view/OE/job/oe_world_workspace-compare-signatures/956/console

this should be added to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS in conf/layers.conf

> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> ---
>  .../ttf-fonts/ttf-noto-emoji_20190815.bb      | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.bb
> 
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.bb
> new file mode 100644
> index 000000000..e74f7a7f6
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.bb
> @@ -0,0 +1,19 @@
> +require ttf.inc
> +
> +SUMMARY = "Google noto emoji font pack"
> +HOMEPAGE = "https://github.com/googlefonts/noto-emoji"
> +LICENSE = "OFL-1.1"
> +LIC_FILES_CHKSUM = "file://fonts/LICENSE;md5=55719faa0112708e946b820b24b14097"
> +
> +SRC_URI = "git://github.com/googlefonts/noto-emoji;protocol=https"
> +SRCREV = "833a43d03246a9325e748a2d783006454d76ff66"
> +
> +PACKAGES = "${PN}-color ${PN}-regular"
> +FONT_PACKAGES = "${PN}-color ${PN}-regular"
> +
> +S = "${WORKDIR}/git"
> +
> +FILES_${PN}-color = "${datadir}/fonts/truetype/NotoColorEmoji.ttf"
> +FILES_${PN}-regular = "${datadir}/fonts/truetype/NotoEmoji-Regular.ttf"
> +
> +do_compile[noexec] = "1"
> 

