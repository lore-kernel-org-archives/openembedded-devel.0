Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 81F0F71A75
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 16:42:08 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id h4so5518100lfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 May 2017 09:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uJ5FBClDsdKYODzKHqQ5raJSMNPIm63B6eTF99dIbl0=;
	b=vVutBdeUGP709vbNplI6BeCRJamgdMLetdh9Adgl2gn4DXnGvPUFAxEIz1xKDMjCc1
	vJH2DNKwym4cRMrH+oKPF+GQ0dptq6aUDoqvLsvRnQbZGBonajw5tkNmprdrgvkBDbN1
	tO2nj23plxlBzBY+WMC4KwzAJGiMvl4qnFLVEuBbwvyOqeAYi7Q15WpfZuC/ujkf1wEg
	SYofMaWFWMzTEoMb0wAywUKL3jJAwvUt11S8fo1VNAx2O0mq0JuihRX2/ov7IHNJ0mXL
	f5NeNai3J5WPagI/qEHUJTlKRfTq+66ULXjq7rLJr8unVpXha6PoTtNL4HtrN1dzE+XS
	QHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uJ5FBClDsdKYODzKHqQ5raJSMNPIm63B6eTF99dIbl0=;
	b=T8SPW8OQ+uvrEVug24TrFJdnnwZTsJuu6D76EBoyMz7WhiUxTD9CiEwxR0zl1K6rq/
	Q1WxcOYFKvF72R3rYJI1J41WMTADUDWu3nJZ81cyEZFPHMHYUz55mrN016cNG0Asz9av
	r2OUMwGKXLGBCnLJHNeLK+Px4k6icLOUaqMmi9iBSigg+W7ibF3ycVVnWY0Bm/45sq+9
	s5WqOXxIzPdWvALRbnaiZFpX045YGTG+2Jy3c878cbSVIsC/9VUj1AYh9KPNJkBZPR7w
	k44XMBeb0TjfFJu/zgiAODdL5b8J/rUkeomxIRdrmUES3uaTgdd9wrXF0WvdoW3Luodk
	0WpQ==
X-Gm-Message-State: AODbwcAwQs+zrn7qoO2mRuAy3m+a/LMnYf1SBi7pjCVFn8d3gVOiR+ve
	cCssb64IwFDf2P7cIOojqiLoWcm0/A==
X-Received: by 10.80.149.209 with SMTP id x17mr758941eda.175.1494348129069;
	Tue, 09 May 2017 09:42:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.213.154 with HTTP; Tue, 9 May 2017 09:42:08 -0700 (PDT)
In-Reply-To: <1493820995-9072-1-git-send-email-ntlm-jofr@foss.dk>
References: <1493820995-9072-1-git-send-email-ntlm-jofr@foss.dk>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 9 May 2017 18:42:08 +0200
Message-ID: <CA+chaQeGY1eiDDBkyjOW_bkC+4yh6r9SaxFk2+nCyM=4itzXVw@mail.gmail.com>
To: Johann Fridriksson <jofr@foss.dk>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-networkmanager: Recipe for python-networkmanager
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
X-List-Received-Date: Tue, 09 May 2017 16:42:09 -0000
Content-Type: text/plain; charset=UTF-8

missing your Signed-off-by line.

On Wed, May 3, 2017 at 4:16 PM, Johann Fridriksson <jofr@foss.dk> wrote:

> Created a new recipe for python-networkmanager 2.0.1. Depends on
> python-dbus, python-six and networkmanager.
> ---
>  .../python-networkmanager/python-networkmanager_2.0.1.bb    | 13
> +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-python/recipes-connectivity/python-
> networkmanager/python-networkmanager_2.0.1.bb
>
> diff --git a/meta-python/recipes-connectivity/python-networkmanager/
> python-networkmanager_2.0.1.bb b/meta-python/recipes-connectivity/python-
> networkmanager/python-networkmanager_2.0.1.bb
> new file mode 100644
> index 0000000..4e41aa5
> --- /dev/null
> +++ b/meta-python/recipes-connectivity/python-networkmanager/python-
> networkmanager_2.0.1.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "Easy communication with NetworkManager from Python"
> +HOMEPAGE = "https://github.com/seveas/python-networkmanager"
> +LICENSE = "Zlib"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=8d8bac174bf8422b151200e6cc78ebe4"
> +
> +SRC_URI[md5sum] = "5fc644a65463031295c6b7dd51a0f1bd"
> +SRC_URI[sha256sum] = "bc36507506ad29bfdac941b0987ebd
> 1cc9633c9a9291d7378e229e4515a0a517"
> +
> +PYPI_PACKAGE = "python-networkmanager"
> +inherit pypi setuptools
> +
> +RDEPENDS_${PN} = "networkmanager python-dbus python-six"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

