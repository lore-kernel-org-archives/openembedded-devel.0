Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9D3605BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 23:19:28 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id b85so12223567pfj.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 16:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o3gUmc/DZo25mU17wn4QyR4MDyZWO3SGT0xMQRQgmrs=;
	b=TbJpDRUVGtaVTfifwlOQcxtCwH4GwIowEyX1AzYYTK1Arn1kbgQTdcjKeVRodeCIsY
	Hel8xcMrX6Y02mEljiYgC6RZ//eSD2sdr02JF+WEt06NYDAfzQQBE9I7TMqdb9vjZhxl
	jRoutSTzLcG8plxvwdy0w/k3zjKlW2M5p5bgKknB3/5gJGcy6xcffvkuHmKHbJWfWDq0
	QzCpakAludxR61erCl7BTYkfVlIC2EwtNOnvdY2IRSZg8gbjn/UdHI6JjfSdpo6Yi9FJ
	qutC3O2/CjR8emLUk1YME+hLk4pN8BlaIc1prdz+HNgX5MjW6jq5fDNIQUgsa8v9eJwE
	nSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o3gUmc/DZo25mU17wn4QyR4MDyZWO3SGT0xMQRQgmrs=;
	b=NVxZR3SsyoWphx7hH69/ytP/m11P4E05HsQh98mDltL4WOkZFdR4iGkn+gbtShRPqY
	Wah6yup6CHGSrymGvel0O83JSouuVq4C8UwsrGoQ0iWDd18V9UW3jp758Q4iVskK4r+a
	/6Ve++BWkgvCdAQOfrcN9opgC2ramVVwjexSomUw3hnIF735sjmaRCRA+Jm6RGzUB6vi
	QJ2vvLWP1V+5soivNYoSWi+nbaUBEyZx8p5is5aqV6TBq4KyCDUwiY/svJKDxqUrnxp9
	IS+Ul5kkaZEEzh8VxxvAk+1b8OJQx+23GlsY+8MkBfDUvc+JwmMnZrgcRV9UPbVQBjF/
	U+zg==
X-Gm-Message-State: AMCzsaVGrs64CK2p2eQ4Vi14DWpRVTd10sceS/2IUCh95+BCJN5HnD5z
	nU3tekIvZV85DiezFg5u3fi3QDcGLwxcAQ45wJo=
X-Google-Smtp-Source: ABhQp+SNOYTCk/rdu7B41rbEn28IGcowxxZtkr2g80mEb8XnnC12Mgped94UDAJ/K/URvMHj7aJaBU4dBg/yGjN3V6I=
X-Received: by 10.84.128.97 with SMTP id 88mr3872pla.161.1509405569552; Mon,
	30 Oct 2017 16:19:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Mon, 30 Oct 2017 16:18:59 -0700 (PDT)
In-Reply-To: <20171030173213.16752-1-fabio.berton@ossystems.com.br>
References: <20171030173213.16752-1-fabio.berton@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Oct 2017 16:18:59 -0700
Message-ID: <CAMKF1spzjAV6Qd6MDa7M5a=-rse+2nOZoHWoaAp=3ORhQHPrzA@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] arptables: Fix do_install task
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
X-List-Received-Date: Mon, 30 Oct 2017 23:19:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 30, 2017 at 10:32 AM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> We need to set DESTDIR variable and run eo_runmake install to install all
                                                                        ^^
typo

> arptables files. Without this the only file installed in package is
> systemd unit.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  meta-networking/recipes-support/arptables/arptables_git.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
> index 274a55d91..55903e450 100644
> --- a/meta-networking/recipes-support/arptables/arptables_git.bb
> +++ b/meta-networking/recipes-support/arptables/arptables_git.bb
> @@ -21,9 +21,10 @@ SYSTEMD_SERVICE_${PN} = "arptables.service"
>
>  inherit systemd
>
> -EXTRA_OEMAKE = "'BINDIR=${sbindir}' 'MANDIR=${mandir}'"
> +EXTRA_OEMAKE += "'DESTDIR=${D}' 'BINDIR=${sbindir}' 'MANDIR=${mandir}'"
>

if its needed just during install then we could pass it directly in
oe_runmake in do_install below

> -do_install_append() {
> +do_install() {
> +    oe_runmake install
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
>          install -d ${D}${systemd_unitdir}/system
>          install -m 644 ${WORKDIR}/arptables.service ${D}${systemd_unitdir}/system
> --
> 2.14.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

