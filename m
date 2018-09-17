Return-Path: <andre.draszik@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id C5D8879485
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 14:20:14 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id o15-v6so15393797qtk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 07:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gJIQoVig4xN36T+2cusWW6F8X3Abc82eAf53IenqDZ4=;
	b=hSE4AV66pIXYZQyX8NE2iMcYJS0EJNNaIHKeFonzgFYj7Hk8JXGdQe62SLudMz8F8A
	+jqHl38V0y/+YrJIiiPaWuEs+63lSqRLAsF3xV07UsaNierva4DRFxhwiwzphS17O2AK
	+W7ZURzboi/nqGeI0RDUdGiLY0YqQZl0OHJbm8vfCFk9Ucu80q4ptJN1yIOwkOPM1C1Z
	NN8iYskicBGev0INpn+vA8EbTzOjTukP195tEm55zB3UD+azww4ACgozU2ur4XnN+LEU
	KNoWr4pb8eyvTUIO4ZkdhvzTa7e/v6AS6Zqj5ppxUH1YCELRXh0olpItQJ2/fUCJ8yTV
	XMXw==
X-Gm-Message-State: APzg51D0A7ghBZz9kStlbokPUoB04p08Bf+DirN70A8gvpZ2saASzm4C
	VlhCQA0UtpCLtF7f2Qg/FgfCxyHo
X-Google-Smtp-Source: ANB0VdapoudwqhFcQm+qj1Z/4V1LYCr3HNsyalFRhB6XTq9v3Cek+DHuUNVrzW4DSjRSptEP1vaIUg==
X-Received: by 2002:ac8:3479:: with SMTP id
	v54-v6mr17713619qtb.231.1537194014867; 
	Mon, 17 Sep 2018 07:20:14 -0700 (PDT)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	y27-v6sm10383990qtj.58.2018.09.17.07.20.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Sep 2018 07:20:14 -0700 (PDT)
Message-ID: <abf6bb3ad6d546998bed6ac677d97304806921b9.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2018 15:20:12 +0100
In-Reply-To: <1536341102-83842-1-git-send-email-yevgenyp@pointgrab.com>
References: <1536341102-83842-1-git-send-email-yevgenyp@pointgrab.com>
User-Agent: Evolution 3.30.0-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH] cacao: class-native: RPROVIDE virtual/java-native
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
X-List-Received-Date: Mon, 17 Sep 2018 14:20:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-09-07 at 20:25 +0300, Yevgeny Popovych wrote:
> This will allow other native recipes RDEPEND on virtual/java-native.

I don't understand, can you please explain why a target package would ever
want to runtime depend on a native package?

How did you test this?

Also, the virtual/ namespace is usually used in PROVIDES, not in RPROVIDES.


Cheers,
Andre'

> 
> Change-Id: I85fcd012d09441867fa5f359463cbe8fff702fbe
> Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
> ---
>  recipes-core/cacao/cacao_1.6.1.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-
> core/cacao/cacao_1.6.1.bb
> index 1074ff5..ead0e2f 100644
> --- a/recipes-core/cacao/cacao_1.6.1.bb
> +++ b/recipes-core/cacao/cacao_1.6.1.bb
> @@ -6,6 +6,7 @@ SECTION  = "interpreters"
>  
>  DEPENDS_class-native = "zlib-native libtool-native ecj-initial-native
> fastjar-native classpath-initial-native classpath-native bdwgc-native
> virtual/java-initial-native"
>  PROVIDES_class-native = "virtual/java-native"
> +RPROVIDES_${PN}_class-native = "virtual/java-native"
>  
>  DEPENDS = "zlib libtool classpath virtual/javac-native bdwgc"
>  RPROVIDES_${PN} = "java2-runtime"
> -- 
> 2.7.4
> 


