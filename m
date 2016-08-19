Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 58B1D77058
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 10:09:20 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i5so2806157wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 03:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EALRuJBZSnJmlrSICLYs5R0L4sfYu90D3L7sce9cbko=;
	b=O2sz4OFXXaCg14Pq2LiqeIGDPGOaNzM3m3UMUdvHrtRUesuCG+94OXh+okoeiAGz+X
	pIfulYXskn/U6X1RaXckLz9Lh9xrXU0leVgx3hFnZhj/LytFTRBz17Z2ZeZUpViabyOP
	Uc4SlyP5z2Wo3KEAvGLIew4cIIes015bpd+lLSc1pYDSWNo9YjLGpLfNbd84Kqe3gClP
	h484f47//lYYbIKiV5e5SjtENPVXjqf3h6rL5XZ7+UfyqGG9g4RnvQ1bNJ5sallxHncd
	EgW8mbiCWDe7G+syFiSTqOFnQxzK6yny0kOewGuM7161HssJAqO1GJp2Wt9SuF/0VH5z
	PdfA==
X-Gm-Message-State: AEkoouuiU28JAfMRuj+D5yEXVOdRb/h8AyUovxxyBO9ROkWW2bpSOOWSXB7feH27aT8AvQ==
X-Received: by 10.194.171.131 with SMTP id au3mr5721086wjc.125.1471601360725; 
	Fri, 19 Aug 2016 03:09:20 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	jq5sm6368000wjc.20.2016.08.19.03.09.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 19 Aug 2016 03:09:19 -0700 (PDT)
Message-ID: <1471601356.24738.2.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Aug 2016 11:09:16 +0100
In-Reply-To: <0159b82ac947ad69460adcec9d79ee83b76d2a7b.1471600808.git.yi.zhao@windriver.com>
References: <cover.1471600808.git.yi.zhao@windriver.com>
	<0159b82ac947ad69460adcec9d79ee83b76d2a7b.1471600808.git.yi.zhao@windriver.com>
X-Mailer: Evolution 3.20.4-1+b1 
Mime-Version: 1.0
Subject: Re: [meta-networking][PATCH 1/3] ifenslave: fix QA warning for GNU_HASH
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
X-List-Received-Date: Fri, 19 Aug 2016 10:09:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fr, 2016-08-19 at 18:04 +0800, Yi Zhao wrote:
> Set LDFLAGS explicitly for do_compile
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
> b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
> index acc0864..385bc80 100644
> --- a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
> +++ b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
> @@ -10,7 +10,7 @@ SRC_URI[md5sum] = "56126cd1013cefe0ce6f81613e677bdd"
>  SRC_URI[sha256sum] =
> "7917bf34de80a2492eb225adf9168c83a4854ac8a008ed0fd5b3fd147ccd3041"
>  
>  do_compile() {
> -    ${CC} ifenslave.c -o ifenslave
> +    ${CC} ${LDFLAGS} ifenslave.c -o ifenslave

While you're fixing the gcc invocation here, wouldn't it make sense to add
CFLAGS as well? (Maybe in a separate patch).


Cheers,
Andre'


