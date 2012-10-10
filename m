Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TLs1e-0007wI-53
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Oct 2012 10:52:22 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id D706ED22BC; Wed, 10 Oct 2012 10:39:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 2502AD22BA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2012 10:38:48 +0200 (CEST)
Message-ID: <50753412.80107@linaro.org>
Date: Wed, 10 Oct 2012 10:38:42 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20121003 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1349554710-6693-1-git-send-email-otavio@ossystems.com.br>
	<1349554710-6693-5-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1349554710-6693-5-git-send-email-otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 5/5] libav: Change the PACKAGES_DYNAMIC expression to be more restrict
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2012 08:52:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 06.10.2012 22:18, Otavio Salvador pisze:
> Using 'lib*' we end having problem with every other package that
> generate libraries dynamically thus we changed it to match the library
> prefixes.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-multimedia/libav/libav.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
> index aa170c5..4a1716f 100644
> --- a/meta-oe/recipes-multimedia/libav/libav.inc
> +++ b/meta-oe/recipes-multimedia/libav/libav.inc
> @@ -119,4 +119,4 @@ python populate_packages_prepend() {
>                        allow_links=True)
>  }
>  
> -PACKAGES_DYNAMIC = "lib*"
> +PACKAGES_DYNAMIC = "lib(av(codec|device|filter|format|util)|postproc)*"

Can it get merged? Or should we keep copy of libav in external layers?




