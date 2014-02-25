Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id A24B06BF88
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 11:44:25 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id q107so717413qgd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 03:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=dZrIJH65mCOUv3IoNt6EFAPXLvF8VfXC7kWg5rLvk9A=;
	b=JOCqgnLnf8gk0QEw2NUtySpPHQ3Xa1MzDntFY25miN3ymdu0+XxR0zzHem1l4urNZ7
	Rt23SoN/BBvN2DY4/ZX4nFV7oSHJ01qcICm9zHO4pMCqegblrHhrIpfPC4OGvhfyUI1Z
	EMF+UPab3RpqPcXvByo+J5z5Q0xozerp2l5dDG0IPLcvGEppGRWFi7SDGoov1U5oH4a+
	0XiHMfifh8vHq82woLm8sedm5iViEiQgK/586d92pRDH9d+rE82vvnyX7CIy4nVu/co0
	pI2ZHency2p8sqmRmv9TondWNMEn3npPyY15il/KQRDlOPvuGNstyPSgEPxBYXrcyM67
	FIfQ==
X-Received: by 10.224.151.147 with SMTP id c19mr36774525qaw.86.1393328666047; 
	Tue, 25 Feb 2014 03:44:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 25 Feb 2014 03:44:05 -0800 (PST)
In-Reply-To: <1393310437-18094-1-git-send-email-ticotimo@gmail.com>
References: <1393310437-18094-1-git-send-email-ticotimo@gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 25 Feb 2014 08:44:05 -0300
Message-ID: <CAMCfZKHDXE+fswg1oFuBqaxHgdAJSuO7-OVX8y_nLwNc7A_Y0Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-multimedia][PATCH] xbmc: disable rxsx (euphoria)
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
X-List-Received-Date: Tue, 25 Feb 2014 11:44:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Tim,
On Tue, Feb 25, 2014 at 3:40 AM, Tim Orling <ticotimo@gmail.com> wrote:

> From: Tim Orling <TicoTimo@gmail.com>
>
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bbb/meta-multimedia/recipes-mediacentre/xbmc/
> xbmc_git.bb
> index f438a2d..b72a0d5 100644
> --- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> +++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> @@ -35,6 +35,7 @@ PACKAGECONFIG[opengl] = "--enable-gl,--enable-gles,glew"
>  PACKAGECONFIG[openglesv2] = "--enable-gles,--enable-gl,"
>
>  EXTRA_OECONF = " \
> +    --disable-rxsx \
>      --disable-rpath \
>      --enable-libusb \
>      --enable-airplay \
>


Is this a workaround for this issue?
https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg33876.html

Did you tried to fix the euphoria compile error?

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

