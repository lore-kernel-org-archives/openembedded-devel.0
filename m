Return-Path: <lchristina26@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 56EC672524
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 18:50:29 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id rd18so11973057iec.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 10:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=fz/JZtzuahMcs6QzPHY/pf3DR3MQVHbiDj4aDm5KsmY=;
	b=JgR8pGekywK78HWjNDO7/GR4gD8eBCvqA4Ga/svwqZBXG4yPT1kcDxW7+Agdn7Ug52
	6SPYlq/ftxtkNBmehaNNI9P2lITjEM1aMJ01tSwEr7c1/8Id82Xm9+p6tLua7TUsy5tU
	eoT/whFyPvHCTUInfk1/i2VvFsBnXWoYT2xaxIT2uSwT6sPZKgeIskQ7b2lYl6xN9CO1
	oY0jXb4pvDrQ+AcIf0Uzu6LNngDTsN9xibHIOblpKPYJOSgmfTbG+BHdySey93slG15q
	owXA67+efMZP6DR+cC3UH6C2zFMrxJW0KQ8PQMDRi3X1vDOvF7gjD9EJ6m4WcxHKdgk9
	L3jQ==
MIME-Version: 1.0
X-Received: by 10.107.165.75 with SMTP id o72mr49226628ioe.33.1419879030498;
	Mon, 29 Dec 2014 10:50:30 -0800 (PST)
Sender: lchristina26@gmail.com
Received: by 10.64.8.200 with HTTP; Mon, 29 Dec 2014 10:50:30 -0800 (PST)
In-Reply-To: <BLU437-SMTP103211CFEBAA0286655746D6560@phx.gbl>
References: <BLU437-SMTP103211CFEBAA0286655746D6560@phx.gbl>
Date: Mon, 29 Dec 2014 11:50:30 -0700
X-Google-Sender-Auth: aCqZ3OuV_Hry2cjCkB7iw4MtBvE
Message-ID: <CAL0pqZ3JaOtsf7O3949Covz+eML93WWyHG4YkNZY+NkXA60XYg@mail.gmail.com>
From: Leah <leah@wolfssl.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH v2] cyassl: add version 3.3.0, remove version 3.1.0
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
X-List-Received-Date: Mon, 29 Dec 2014 18:50:34 -0000
Content-Type: text/plain; charset=UTF-8

I was just wondering if this commit was recieved and/or approved?

Thanks,

Leah

On Mon, Dec 22, 2014 at 2:29 PM, lchristina26 <lchristina26@hotmail.com>
wrote:

> Signed-off-by: Leah <lchristina26@hotmail.com>
> ---
>  .../cyassl/{cyassl_3.1.0.bb => cyassl_3.3.0.bb}                    | 7
> ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-connectivity/cyassl/{cyassl_3.1.0.bb =>
> cyassl_3.3.0.bb} (74%)
>
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> similarity index 74%
> rename from meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> rename to meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> index e3edab6..b6f852d 100644
> --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> @@ -1,4 +1,4 @@
> -SUMMARY = "CyaSSL Embedded SSL Library"
> +SUMMARY = "CyaSSL Lightweight, Embedded SSL Library"
>  DESCRIPTION = "CyaSSL is a lightweight SSL library written in C and \
>                 optimized for embedded and RTOS environments. It can be \
>                 Up to 20 times smaller than OpenSSL while still supporting
> \
> @@ -11,7 +11,8 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  SRC_URI = "http://www.yassl.com/${BP}.zip"
>
> -SRC_URI[md5sum] = "72477eb50697e759d309c49cb1aef18a"
> -SRC_URI[sha256sum] =
> "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2adc16d2507b5d0b03e"
> +SRC_URI[md5sum] = "0303eb0f2f9065a1207d9104ab0eba7c"
> +SRC_URI[sha256sum] =
> "e51583ea1e4d64537553922d67a96360312811dffef58d4c05506aa98a296fe3"
>
>  inherit autotools
> +
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


-- 

Leah Thompson
www.wolfssl.com
leah@wolfssl.com
406-570-1389
Skype: lchristina26

