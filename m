Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id AD25078E3C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 07:44:08 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id z143-v6so12915110ywa.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 00:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ApnNmCRO93TML/0spK25Y9+Yo8kvWtm0u4B6ACZUDLA=;
	b=CGUBbNYlslUlC1+nUA2mP2nWKxJbYAZwm1/7vUDB2NGs9EU/KT4MQiHcASip/P1QL5
	X25/mOtx3lwIccLm0BP1r/zgSw4nZo4yylwibEOS2Z2flflP1pDXXLSG476ikC4pzNL9
	tBvqIgsorKgYmcTU8D8uAjUmoBiqQuWzFn7KLkyd8jvfQGpxCEBJpejlgtzBA/oqPOqV
	bld+cIkKKAP3S1DirdaelaKIr20FCaTHSfKNBKWcbyjO0PLh/5iSw94lpOIlpxaW5tcE
	pEcfmMGR7fHw97Y3pyXRSGkoPSNf1goyyoDr357nsEGou1w5LASzLsGhQpjKySLLPF7p
	QBjw==
X-Gm-Message-State: AOUpUlHSE9jpnCacZTW/Fhr+K0wEldABgGI/bXKyJkqKp/ouCkFEx4Kl
	mW9UVltr/AcruCmQoJl09QJvE6+o
X-Google-Smtp-Source: AA+uWPzKyd10hlPdBeweDi6jK76+S9QnHf4vJry9v0HHbK1ENmTx7o4ytuejAmAjrgppXkJbjIOeug==
X-Received: by 2002:a25:76c4:: with SMTP id
	r187-v6mr8510187ybc.470.1534146249502; 
	Mon, 13 Aug 2018 00:44:09 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	134-v6sm8334341ywq.66.2018.08.13.00.44.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Aug 2018 00:44:08 -0700 (PDT)
Message-ID: <9981ffaaeb6e2a2dc7af5585574bcffdd96dfd2e.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 08:44:06 +0100
In-Reply-To: <20180809002644.18549-1-git@andred.net>
References: <20180809002644.18549-1-git@andred.net>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [meta-java][master-next][PATCH 1/4] gitignore: ignore new python byte-code files
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
X-List-Received-Date: Mon, 13 Aug 2018 07:44:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Please ignore this series, I'll send a mew one.

A.

On Thu, 2018-08-09 at 01:26 +0100, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> Since we run oeqa tests, we get python byte-code in
> the source tree here.
> 
> Ignore them to clean-up the git status
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>
> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.gitignore b/.gitignore
> index 51a512c..8e5c599 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,4 +1,5 @@
>  *.bak
>  *.orig
> +*.pyc
>  *.rej
>  *.swp

