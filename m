Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id BB435601F9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2020 09:44:46 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id b23so18053652edx.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2020 02:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=lJ3FPDOMrOK0dxgNuOplINT/qdvJudhqMfCutejM7DU=;
	b=dFIPH6qJqoxXOxAALRIt/0uzlXhyM/LKkHk/tDKijFw+1udUt+SwBIqrjgyARlcw0Y
	0DbPiG3gfm1xxFnh5lbHJ4/5GK2jNqFJhO8m7do22SHt65pRD1Ih3Tr8+FctgK0Le0pw
	OjjsKWvDrzzLJHVbTx0eccZopFEr49bSw6aRkDBvCTUrwyOMTQ7yHvGx+BFurnJSVc6o
	cnV2xyP24WnvTmkJXWxpYFLI4ZFKWOS53oEdT9KTmOlAKn4/FhggjAz4npzkkOA+Zgj9
	kGenZhUaDAnAEQJBffS+71S4MGV27/1arC8oqAIoVqFAY+vk6h8uEWxb/f5pM8CbONS1
	KXpw==
X-Gm-Message-State: ANhLgQ0tJxIJEE9t08SMbQQI/JPpNGH64s9VurHMbJ4NJ9dlFS4fQgfu
	QsEKBKQ2eFZ7rqzyTerMIKs9IT/h
X-Google-Smtp-Source: ADFU+vt2z8Sxh5PkK+Oz4ic+sZosJOyb/ipi95KH4zSuqpvwK2gu+EcVWK0T9If6kqE56L3+lgNrNw==
X-Received: by 2002:a17:906:4b42:: with SMTP id
	j2mr18452570ejv.234.1584265487334; 
	Sun, 15 Mar 2020 02:44:47 -0700 (PDT)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id dt5sm309241ejb.31.2020.03.15.02.44.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 02:44:46 -0700 (PDT)
Message-ID: <d73a82b324129a2fd34caf64708d77199933dcde.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Mar 2020 09:44:45 +0000
In-Reply-To: <20200314195035.28224-1-git@andred.net>
References: <20200314195035.28224-1-git@andred.net>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] smem: remove numpy dependency on armv4 and armv5
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
X-List-Received-Date: Sun, 15 Mar 2020 09:44:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Please ignore this patch, it's not that simple...

On Sat, 2020-03-14 at 19:50 +0000, André Draszik wrote:
> numpy doesn't build on those.
> 
> Signed-off-by: André Draszik <git@andred.net>
> ---
>  meta-oe/recipes-support/smem/smem_1.5.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-oe/recipes-support/smem/smem_1.5.bb b/meta-oe/recipes-support/smem/smem_1.5.bb
> index 90db9c3f3..77179906e 100644
> --- a/meta-oe/recipes-support/smem/smem_1.5.bb
> +++ b/meta-oe/recipes-support/smem/smem_1.5.bb
> @@ -35,6 +35,9 @@ do_install() {
>  
>  RDEPENDS_${PN} = "python3-core python3-compression"
>  RRECOMMENDS_${PN} = "python3-matplotlib python3-numpy"
> +# numpy doesn't work on those.
> +RRECOMMENDS_${PN}_remove_armv4 = "python3-matplotlib python3-numpy"
> +RRECOMMENDS_${PN}_remove_armv5 = "python3-matplotlib python3-numpy"
>  
>  PACKAGE_BEFORE_PN = "smemcap"
>  


