Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA6A6C135
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 15:25:28 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id a132so18345807qkb.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 08:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dNrcmEPIbUmPt+P58JFrUyp1NEaFmV+W+88/FJc5d7k=;
	b=CqUyffEQ892aj78t82cxHlSq6jW43P/jrOS6dhZ476YKjhsLDMJ3w+cWgxqgcgLoqt
	5/DlWrkBNkFOylqOy10xMEY9EGmR54VkBbD0XjHLsk4lMrW6ywGw5TMb005Tr4l14GD1
	XEgcHpKQqYA5ml+7CDbWJrgsYLygGibBFZAbuC+OPXm7D+wUENVxzBvwXc9r4twNI8+S
	3F1tP3wfgkEYHofdTS/CqGkmQol3NRtu5ID1XmFaS/vOznndeiv6ZRghI84YgXG5d6sO
	5o29VARmFNqv27XxcpN6TXHctd7U1jNW9ALCM1sgN1WrhQ6pRC9qIVgC7vnf07fCp7j3
	mnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dNrcmEPIbUmPt+P58JFrUyp1NEaFmV+W+88/FJc5d7k=;
	b=kZQnnlZkIQWg8qkObmDC2CoP0E5mRzZ/0wSYN69yQ4ypUYkdEXW6qzmIv3+/Vr5CpY
	yI31Vul2c0Kt0A+61X2FzmaMzzFTAQAdWtbkL28XHynXsSehPsWvkA7XwAeih83gL5l7
	vseal32zelg9+ZWe3Hclhu4V+YX00et53rnOZN5glaTSdbep/+rYvEnZbgnjKj3Wsf9B
	otbREtvZt9zhvOlSOOlcNQKj50nh0KBsRNaftuXGmO56ildu4bfU2A2r7OPMq94jlv6C
	Imwd2xIL/ByFPRPwgrTImExKPaGHiMwWSa1su2TcJnwC1WbXYNfycWHRKL3V2EWeu3Fd
	aX2w==
X-Gm-Message-State: APjAAAVnQTwzTUBuIliv8TjvT/W5UEY2Sq/tZ0Y4MVCmyjmcQokyfoY2
	oQLQHz0vlKYE4k8wISwonFJFaGds9CEbMRiDIyQ=
X-Google-Smtp-Source: APXvYqyPhdIrI1MqGhfJ4M18rI76WISmDJTP+IntgFTibTAfQGGNccoyjuwFqnLRZ7GtWvVhjc7q3jDhEU9+CUPnjqg=
X-Received: by 2002:ac8:26dc:: with SMTP id 28mr11993648qtp.88.1558970729197; 
	Mon, 27 May 2019 08:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190527095310.4890-1-nick83ola@gmail.com>
In-Reply-To: <20190527095310.4890-1-nick83ola@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 May 2019 08:25:02 -0700
Message-ID: <CAMKF1sob5rYA2vYTAcGEeBVX=pLHcZJg1RF3x4RDPYBjb0MP8g@mail.gmail.com>
To: Nicola Lunghi <nick83ola@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH 1/2] nginx: update to version 1.17.0
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
X-List-Received-Date: Mon, 27 May 2019 15:25:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 27, 2019 at 2:54 AM Nicola Lunghi <nick83ola@gmail.com> wrote:
>
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>  meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb | 6 ------
>  meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
>
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
> deleted file mode 100644
> index 5e6dc33e9..000000000
> --- a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require nginx.inc
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
> -
> -SRC_URI[md5sum] = "719b2e3d416f111fecc9db6625553658"
> -SRC_URI[sha256sum] = "8f22ea2f6c0e0a221b6ddc02b6428a3ff708e2ad55f9361102b1c9f4142bdf93"
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
> new file mode 100644
> index 000000000..8774a87ff
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
> @@ -0,0 +1,6 @@
> +require nginx.inc
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
> +


why is checksum different please mention it in commit msg

> +SRC_URI[md5sum] = "56767fd62302508295b31adc48b99a59"
> +SRC_URI[sha256sum] = "e21b5d06cd53e86afb94f0b3678e0abb0c0f011433471fa3d895cefa65ae0fab"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

