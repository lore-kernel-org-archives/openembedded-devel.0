Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 99CC67FA38
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 00:36:36 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id v19so7442214qkv.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2019 16:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eX8hpW8tJL6mB84aCmdOmt/JFB1aK1u2GsDrldDPQHo=;
	b=WKAHstnFHnfdmFaZLGGq4eEBpMqOEZXmqsSocqb6HjXhOVeIfTtKZs3WEHsxZZqJf1
	HzYJST81oi3R6/1mduwrhrcC42/5yCtFOJ0tRCajnqzsXD+6HUiDQWNOCKyZnB8+eluI
	7HbTLGYEaM+MZ8GPeTp+oy7l1qJz9QPzOvBVihBIaHRohoiqCL/eZjLNJdrH0kpQnpWg
	yXHMJMoEQQQ6LtRF/j302ZQ/FOzVSU/ai/50OotmpgBjMOj5R/E+DQbKlY/ZmaUWUTnB
	KrTVuFmundDN3gfnYB+e7issG04DNWOOpOclq9toyzN/cC8Mgxj8xNuTuf5qiiw8ZOLr
	u0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eX8hpW8tJL6mB84aCmdOmt/JFB1aK1u2GsDrldDPQHo=;
	b=WqDWR/M1Yvr+pZtTAp4O05ZXjw9Da0Filhr9L4uQdyStGKzv8RN02fN+bFvdyGVLun
	VbrSmYFzYrCpaJ+NDgDXtbPJWPxxkyZwisNM0aRO6I6l8VBRzMqH0QJ/xsueGvMQxhWa
	1IMU+Uu8RRnyLJfjCR8Ves2rid5nWwSdbq61VxTyebMECw+L6Lz0ZLn5aQDo1iptwkxl
	wfDuEQLwOw+j/X9Wiy/X9+tblOVnW1fQqOH879qvfWWfs4pVsteQMQ6h/NtvcgxooMTg
	4RGoJT1W3d7kNsJJBhNIvnQvWTjLF/SuwiOYhN51S3ZYP19vCX46n+Rnde1mRbl10DTv
	UkuA==
X-Gm-Message-State: APjAAAWiFKrcNJpg/W/81t4u+J4gbY5kpGnt2ZMdMFSdXDhlou3+aRsc
	8n7v/2xTwGYdqpYzbV3jc/j+8fLKXf5LF1EikXkD4Lpo
X-Google-Smtp-Source: APXvYqzKhAnOhPNlYQxpxzN8ChjRdO4f2Yn202o5mGIcxAFDGcVLC2UDOub0bPV+vjoUtlFMrA6bIWOL37zO2EoKoCs=
X-Received: by 2002:a37:bf82:: with SMTP id
	p124mr19619060qkf.337.1575074197212; 
	Fri, 29 Nov 2019 16:36:37 -0800 (PST)
MIME-Version: 1.0
References: <1574932470-14682-1-git-send-email-wangmy@cn.fujitsu.com>
	<1574932470-14682-5-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1574932470-14682-5-git-send-email-wangmy@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Nov 2019 16:36:11 -0800
Message-ID: <CAMKF1so-mGHLhpebFOGC+4Qn7M9_99MrNq8uM7d6ieWmcA3k0w@mail.gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] python-cmd2: upgrade 0.9.19 -> 0.9.20
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
X-List-Received-Date: Sat, 30 Nov 2019 00:36:36 -0000
Content-Type: text/plain; charset="UTF-8"

please upgrade both py2 and py3 versions together

On Wed, Nov 27, 2019 at 6:30 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-cmd2.inc                   | 4 ++--
>  .../python/{python-cmd2_0.9.19.bb => python-cmd2_0.9.20.bb}           | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-cmd2_0.9.19.bb => python-cmd2_0.9.20.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-cmd2.inc b/meta-python/recipes-devtools/python/python-cmd2.inc
> index 3a6bf54..1a4249d 100644
> --- a/meta-python/recipes-devtools/python/python-cmd2.inc
> +++ b/meta-python/recipes-devtools/python/python-cmd2.inc
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://packages.python.org/cmd2/"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
>
> -SRC_URI[md5sum] = "20f3f76b2aaf36a17372717b469ca969"
> -SRC_URI[sha256sum] = "c81284083d993af18b8fef57d89d854d49d051d4c2c8a8e12d0281e369ac3682"
> +SRC_URI[md5sum] = "38e573f0b1d868f21068b726c285e52b"
> +SRC_URI[sha256sum] = "1ba349af127f9052363972adcbcfb921f9ca5e90f2bcbfba11b117500f11a845"
>
>  inherit pypi
>
> diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.9.19.bb b/meta-python/recipes-devtools/python/python-cmd2_0.9.20.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-cmd2_0.9.19.bb
> rename to meta-python/recipes-devtools/python/python-cmd2_0.9.20.bb
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

