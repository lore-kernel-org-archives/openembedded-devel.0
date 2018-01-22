Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 77A0378624
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 16:05:45 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id n17so7407120pgf.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 08:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=jB42dbaXFollQNDYbBQvedyGs/EakfEChULZCP1QkJ4=;
	b=nyRjPFmoWz1NF5o1QtRxyPwNXjEwdRIFAOPb3MXEVJroheracTiezUm+lDJ1Se/1ax
	GQhYgxIxjObfDIrNgSWKJh4nam4Jo9+9JYrSKdONKMNQ6XZeZM9oNyy6hRNzcUVLw4iC
	UkHZnKjUyAKb6T8W8I3jmJtFR2U7NKKk+H2X5ZOsgr51N9pxIH8T072F9+MfkN1bWVWU
	2I6Fxjt8ppZ91jyMYyO6w9w7i/XVjCEnbuOVZHOAVvNfVLF0oXvXLPtz2HSlRzxS/zVl
	yVlJxslcNMMBjbFnzldZKMFW56yTnjUQ6ZJwpv2D83v5MBwc9VyN10nu2njw1VAQxsom
	ctVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=jB42dbaXFollQNDYbBQvedyGs/EakfEChULZCP1QkJ4=;
	b=jQJShyXuLKKPXpnuxpvpFQa1vnE888nNaGQdffCEurOMDgeRVZ8TgtL8mkQtssVliE
	6Oh7MRL1QRhF0ZmYSBwi9stN+YakjkQJXL3GnJAfYWXg8dx+EOnZk9x1+s6Pf2bo6toC
	iNbMByU7hkzKkoHzuH+K0kpa7ch0ms1hUPB90xp2Nr3OSf7Mng+FEd0377Qog9Yq5UfH
	B/HeLzSKkpvReAOxeqVCyZ7+yq0lv63ereh21OT6/nT8KabyEsY+Df84ZhyaA3EtgLRv
	F6vB2PREDGrH71HlZlkUQIL/Au62gZmLVjvYoLd9d/d+O80hHB5rkX4uURy/ATQQ21lv
	mdIw==
X-Gm-Message-State: AKwxytckHkLIIUzUnuM1Gg8ifg8tsqemB0AJhaiVx3DiA7Pop9ULXnzq
	k5BecPY9rj9EgEn4wz6qzpAAGw==
X-Google-Smtp-Source: AH8x227ELxnGuV0IQlgzj/n3LGRVYpa5UgwPYvkl/uBiIgdJoRk/U0/Qr2zLx9BKdt8GAv1/++dkMw==
X-Received: by 10.101.68.199 with SMTP id g7mr7465849pgs.21.1516637146530;
	Mon, 22 Jan 2018 08:05:46 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:c85d:e2c0:793e:901c?
	([2601:202:4000:1184:c85d:e2c0:793e:901c])
	by smtp.gmail.com with ESMTPSA id
	q16sm1570400pfg.124.2018.01.22.08.05.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 08:05:45 -0800 (PST)
To: Pascal Bach <pascal.bach@siemens.com>,
	openembedded-devel@lists.openembedded.org
References: <20180117144230.6819-1-pascal.bach@siemens.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <1d1b437e-fa66-ea0f-6af2-c04933376a2c@gmail.com>
Date: Mon, 22 Jan 2018 08:05:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20180117144230.6819-1-pascal.bach@siemens.com>
Subject: Re: [meta-oe][PATCH] poco: update to 1.8.1
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
X-List-Received-Date: Mon, 22 Jan 2018 16:05:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 01/17/2018 06:42 AM, Pascal Bach wrote:
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>

Failed to build. Please see

http://errors.yoctoproject.org/Errors/Build/51576/
> ---
>  meta-oe/recipes-support/poco/{poco_1.8.0.1.bb => poco_1.8.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/poco/{poco_1.8.0.1.bb => poco_1.8.1.bb} (98%)
>
> diff --git a/meta-oe/recipes-support/poco/poco_1.8.0.1.bb b/meta-oe/recipes-support/poco/poco_1.8.1.bb
> similarity index 98%
> rename from meta-oe/recipes-support/poco/poco_1.8.0.1.bb
> rename to meta-oe/recipes-support/poco/poco_1.8.1.bb
> index 160b4d391..e44ff4470 100644
> --- a/meta-oe/recipes-support/poco/poco_1.8.0.1.bb
> +++ b/meta-oe/recipes-support/poco/poco_1.8.1.bb
> @@ -12,7 +12,7 @@ inherit cmake ptest
>  
>  BBCLASSEXTEND = "native"
>  
> -SRCREV = "af527ab21fca5ab2659285408aec9920ed7c7b17"
> +SRCREV = "2eca6c1813632fb779e07f1e1968afefa81e1dd0"
>  SRC_URI = " \
>      git://github.com/pocoproject/poco.git \
>      file://run-ptest \


