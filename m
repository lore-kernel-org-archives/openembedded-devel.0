Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id C6FE97070B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 02:38:02 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id lj1so555310pab.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 19:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Ovl94SlHzi8zli+wJCwSn9vce9hN2HY3I9eEMsmtcNw=;
	b=K/K122CYVs5+ztS/y0+mbqk2ohFs8aioOBxu5anbx+4ruFWLzlTlR/1M/JdqdmxEsb
	vskXDoNZAkw1njNVh4jRBzMahEz9NJkX0k+RhTwbZ1BEgUpAUtsBM240eOpJgK7cMLFY
	VCtCx4kIaULmIQpmMwYDeleS1cjYmjxNpduR7BKKtyQ0ol8n4rmzLqmMNvFPTX1YCxJy
	louasXrAfnmYWivMStNa8d8zK0ILkYB60CpT8kocJ9ueg0J+mn9ed1F91Dc3AGEpBbDD
	whEivki7gn73VsJEQzrI9of9Mp2mxzfY2yItVT3cKuDG+OlQtoI5EAsOvmrkYi/jiU3y
	MylQ==
X-Received: by 10.70.5.33 with SMTP id p1mr1419900pdp.134.1409193483256;
	Wed, 27 Aug 2014 19:38:03 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:9477:310d:a6a1:d73f?
	([2601:c:9380:601:9477:310d:a6a1:d73f])
	by mx.google.com with ESMTPSA id we5sm7389548pab.28.2014.08.27.19.38.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Aug 2014 19:38:02 -0700 (PDT)
Message-ID: <53FE9607.3000203@gmail.com>
Date: Wed, 27 Aug 2014 19:37:59 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1408909187-29642-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1408909187-29642-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] php: Fix native build due mistakenly linking against host's iconv
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
X-List-Received-Date: Thu, 28 Aug 2014 02:38:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


Acked-by: Armin Kuster <akuster808@gmail.com>

On 08/24/2014 12:39 PM, Otavio Salvador wrote:
> The configure script has mistakenly choose to enable iconv support,
> due host to provide it, adding '/usr/lib' to the linking flags and
> failing as:
>
> ,----[ Linking error while testing 'fork' support ]
> | conftest.c:268: warning: conflicting types for built-in function 'fork'
> | .../build/tmp/sysroots/x86_64-linux/usr/lib/libxml2.so:
> |     undefined reference to `gzopen64@ZLIB_1.2.3.3'
> | collect2: ld returned 1 exit status
> `----
>
> This patch disables iconv support for native builds fixing the error.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   meta-oe/recipes-devtools/php/php.inc |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> index 030c090..6bdae78 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -35,6 +35,7 @@ EXTRA_OECONF = "--enable-mbstring \
>   "
>   EXTRA_OECONF_virtclass-native = " \
>                   --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
> +                --without-iconv \
>                   ${COMMON_EXTRA_OECONF} \
>   "
>
>

