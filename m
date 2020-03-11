Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0DC61B90
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 09:43:09 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v11so1652901wrm.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 02:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=l2XogZIYorvNv7WHAG/ftPz22ygqbZqVyDVaXvv4sFI=;
	b=Cu5SmLOPZ5jF74BmekUIA0K44ggEfHaBLEGd5pHjGT5/8RPPexwi9JFof4av0f6Oj+
	TEleV6XBSnsSn0o8yqRK0nCKuuxRg6KSIWj7NciGRwEngUCcx+VdG0jNUNn5hTrDesbL
	ILS3knl+Ydsoxm0pzlxqN73ikcCVQn3d6nJflfOsqLPBlVYsvV2JFajMNErdsNQTNeJH
	l6fPnhH54MGG8lSfBeRdtez4mPEfdR/B4WDtJxO5Ni3BpySH9WpQ+dTQLfvMJZ0JuFbq
	4e1e3rbWschFWHnTXDkcdKC08Yxoq6gkhXTwJrAO1vYIQiMbfxcvmVJOBT3i+2eZ1T6d
	YZ1Q==
X-Gm-Message-State: ANhLgQ1mC3CT2ZXQtCYLcseqeU02f43drghMIH1ELrNWNcbhpsinopAI
	6S5jkel1OLEhQ3TaVtS/t0go2pGq
X-Google-Smtp-Source: ADFU+vsAEDE4H02BnijvQmagp6zo5EqNgvwa3KmJIo3JwghnxXfsu7I9V/W67ntf5CxTJQlzXxv3xg==
X-Received: by 2002:a5d:628c:: with SMTP id k12mr3531841wru.237.1583919790393; 
	Wed, 11 Mar 2020 02:43:10 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	w22sm7849199wmk.34.2020.03.11.02.43.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 02:43:09 -0700 (PDT)
Message-ID: <e50174e3f36143c1dc43f41cedc6232c34035578.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Mar 2020 09:43:08 +0000
In-Reply-To: <20200311075513.9491-1-nick83ola@gmail.com>
References: <20200311075513.9491-1-nick83ola@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] smem: matplotlib is an optional depencency
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
X-List-Received-Date: Wed, 11 Mar 2020 09:43:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-03-11 at 07:55 +0000, Nicola Lunghi wrote:
> smem doesn't need matplotlib and numpy to run, is an optional dependency only
> needed to produce graphs.

Right, that's why it's an RRECOMMENDS. If you don't want it in the image, just do
BAD_RECOMMENDATIONS as per usual practice :-)

Cheers,
Andre'

> This is needed to avoid to include and build matplotlib and numpy by default
> 
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>  meta-oe/recipes-support/smem/smem_1.5.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/smem/smem_1.5.bb b/meta-oe/recipes-support/smem/smem_1.5.bb
> index 90db9c3f3..446325e93 100644
> --- a/meta-oe/recipes-support/smem/smem_1.5.bb
> +++ b/meta-oe/recipes-support/smem/smem_1.5.bb
> @@ -20,6 +20,9 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
>  
>  S = "${WORKDIR}/${BPN}-${HG_CHANGESET}"
>  
> +#PACKAGECONFIG ?= "graph"
> +PACKAGECONFIG[graph] = ",,,python3-matplotlib python3-numpy"
> +
>  do_compile() {
>          ${CC} ${CFLAGS} ${LDFLAGS} smemcap.c -o smemcap
>  }
> @@ -34,7 +37,6 @@ do_install() {
>  }
>  
>  RDEPENDS_${PN} = "python3-core python3-compression"
> -RRECOMMENDS_${PN} = "python3-matplotlib python3-numpy"
>  
>  PACKAGE_BEFORE_PN = "smemcap"
>  
> -- 
> 2.20.1
> 


