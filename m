Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id ABF11728F4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Dec 2014 11:09:24 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so4069056wid.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Dec 2014 03:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=iSRDPz8EIlTKR1dzd8c48myend2SRiEdNBwiGJVa5XU=;
	b=w9e/vKR0Avy0Isuyukuf/Mw9QP4PRMI8Vbz4ZCtlyvsaWjnVd3fiReTn+c+8e9BoTE
	UxPI4iFFRpnh42+zoE2k56VlbOT/yrjOlwb5sTYyYxvRoubef98KnGBlc3mTrFlrc20g
	d54gSBN2RRlOwP7d0tDyhnh1T6nCIridUk+1Lb6x+uTxGcHhlGH4VWLbjZ5pTOmPl9XN
	0VylS4bLQefrilVCQ6WZqhVKdOPzZSMPVjTDj/EalGn8U4hm71/1CpyLKFaPc3AlSNS8
	yBltJXbUbdsz0Z5XxbSAnB8zSzpmPcKcOoi9lZiaJK0O94kEjBlF7PwZY9xA/OHVGU2T
	nlCA==
MIME-Version: 1.0
X-Received: by 10.180.88.165 with SMTP id bh5mr13873921wib.77.1419073764356;
	Sat, 20 Dec 2014 03:09:24 -0800 (PST)
Received: by 10.194.40.234 with HTTP; Sat, 20 Dec 2014 03:09:24 -0800 (PST)
In-Reply-To: <BLU436-SMTP11763FCC6123D403C929D0CD66B0@phx.gbl>
References: <BLU436-SMTP11763FCC6123D403C929D0CD66B0@phx.gbl>
Date: Sat, 20 Dec 2014 12:09:24 +0100
Message-ID: <CA+chaQeGWW189sga78wTsZg-_1kZzna2=+G79j6u0eT8SP6FfA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] cyassl: add new recipe
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
X-List-Received-Date: Sat, 20 Dec 2014 11:09:27 -0000
Content-Type: text/plain; charset=UTF-8

> add cyassl-3.3.0 as new recipe. cyassl-3.1.0 can be removed.

This isn't what the patch is doing, you're only adding ", version 3.3.0" to
SUMMARY variable and it doesn't even belong there (version is already in
PV).

On Sat, Dec 20, 2014 at 12:57 AM, lchristina26 <lchristina26@hotmail.com>
wrote:

> add cyassl-3.3.0 as new recipe. cyassl-3.1.0 can be removed.
>
> Signed-off-by: leah <lchristina26@hotmail.com>
> ---
>  meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> index b6f852d..715cf1f 100644
> --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> @@ -1,4 +1,4 @@
> -SUMMARY = "CyaSSL Lightweight, Embedded SSL Library"
> +SUMMARY = "CyaSSL Lightweight, Embedded SSL Library, version 3.3.0"
>  DESCRIPTION = "CyaSSL is a lightweight SSL library written in C and \
>                 optimized for embedded and RTOS environments. It can be \
>                 Up to 20 times smaller than OpenSSL while still supporting
> \
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

