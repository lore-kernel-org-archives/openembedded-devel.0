Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D8E77748C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 09:29:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a67-v6so57244wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 02:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PoZu2vi+Q8ml3+C58lfz717jM3wCSQyVISmdbfcXPSw=;
	b=J7JCshR2YoO9R4/vUTJS7FPTQXUO2QqELIVEoWJlavkpNNScc0rqMs3OTF4miDWznY
	FPzCFxgLMvkXI8amNj1C6/dR4zuydPGuuG4QZjnEqqM0A3lc/nvSfeVUjHtHtEvqlLM+
	/AcNa+fvl7Jc++PVWJLbYDBzE+TQz+uw5mF1weLQGnriGfO4hvg/DqiYt9O7ZqaPNCmP
	+S7x6ke/OVMRt7hvqKhA4WZJHCYlCs2SpmlXZhrGNEEiZIIL61s/fFvWHpTx/kkBZqKk
	hrw/DaA5FbcwYqdxegvB1cxWJYvGNgm5veXEO1q/+BM6ZhW8znyYSbfP+ioRPLgmhtct
	nAaA==
X-Gm-Message-State: ALKqPwffRIpUObQDgBp9VSnVk/Ksd8zD4vbN+4x6HHPSbHt7JUPMLnwC
	+Walo24zYJz4/UXKn1sttxzq1PYB
X-Google-Smtp-Source: AB8JxZpqF0oYg/eR7m2kPYVyhL1i+EjHQFnfQ3npADwYL7muOyPu69/+1sJwbXErLxMe6/toI98Xjw==
X-Received: by 2002:a50:a7c3:: with SMTP id
	i61-v6mr150129edc.152.1526462950014; 
	Wed, 16 May 2018 02:29:10 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	t19-v6sm1123762edh.31.2018.05.16.02.29.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 02:29:09 -0700 (PDT)
Message-ID: <1526462948.32156.11.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 May 2018 10:29:08 +0100
In-Reply-To: <20180503094308.7549-1-mac@mcrowe.com>
References: <20180503094308.7549-1-mac@mcrowe.com>
X-Mailer: Evolution 3.26.5-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH] jdepend: Update download hashes
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
X-List-Received-Date: Wed, 16 May 2018 09:29:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

While I realise that you sent a v2 and v3, as another interesting point I
still (today / right now) get files with the hashes as they are in the
recipe before you touched the recipe (when downloading manually using wget).

Cheers,
Andre'


On Thu, 2018-05-03 at 10:43 +0100, Mike Crowe wrote:
> When Bitbake downloads jdepend-2.9.1.zip itself and I download
> https://github.com/clarkware/jdepend/blob/master/dist/jdepend-2.9.1.zip ,
> the calculated hashes don't match the ones included in the recipe.
> 
> The hashes were last changed in commit
> dd5c43fca8289b8795a9214aee616775e1493109 on 1st March, but GitHub claims
> that the file being downloaded was published on 20th January, so I can't
> explain why they are wrong.
> 
> Nevertheless, let's update the recipe to use hashes that match the current
> download.
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> Cc: André Draszik <andre.draszik@jci.com>
> ---
>  recipes-core/jdepend/jdepend_2.9.1.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-core/jdepend/jdepend_2.9.1.bb b/recipes-
> core/jdepend/jdepend_2.9.1.bb
> index 5f09a8b..a924f1d 100644
> --- a/recipes-core/jdepend/jdepend_2.9.1.bb
> +++ b/recipes-core/jdepend/jdepend_2.9.1.bb
> @@ -18,7 +18,7 @@ do_compile() {
>    fastjar cf ${JARFILENAME} -C build .
>  }
>  
> -SRC_URI[md5sum] = "9b91efe1d770e023893f89f4dde8434e"
> -SRC_URI[sha256sum] =
> "536b5082d64e4f4dddd514ce30178f36c7a31b34d969275f278f72e522e7f7c9"
> +SRC_URI[md5sum] = "0cbaf43493cd30838bee261f69e76fe9"
> +SRC_URI[sha256sum] =
> "b9f34236aaea5ddc070caa29794d2f5ae79bc12e199bec6ebba6c29093a17a9e"
>  
>  BBCLASSEXTEND = "native"
> -- 
> 2.11.0
> 
> 

