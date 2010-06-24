Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORoI3-000515-4p
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 17:27:56 +0200
Received: by pzk3 with SMTP id 3so265218pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 08:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=2116E+5kyFbw/HH2OaskZ4Iy7/cjOY6X30Ggq5a+QUw=;
	b=hm38kf7Y4Q1AWIg6NGW69sQ4LGyDf7LEKQ28tvjgv+/tPUtXAxnWW3RFUYtjlekRGq
	qT3wbYm8D7HfML2ZoutqQJ7esoGmSdwq2buXKViYXRiixEcyIX3UuftG54rMIV7SdkaZ
	apkYYhTjtfIdBimFuLAXYaS8v58+n0QkTbsos=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=xAZz/4zabm4bWm+MeGOFUVvcWWpC4STq1UfWx8pdVOnIwHa1MgzqjkWZeCQsTz5n3j
	cN8vcLIbzA71NHSjHXu12YaKaa6JIki2+BX/6MiMbVNpwuTBiQkGOdMrand7QMyzUNjN
	59X2L051VeCO5WFij5P2EZbr+HV/hHsn/Wav8=
Received: by 10.142.67.38 with SMTP id p38mr9227947wfa.167.1277392791554;
	Thu, 24 Jun 2010 08:19:51 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x34sm2946851wfi.16.2010.06.24.08.19.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Jun 2010 08:19:50 -0700 (PDT)
Date: Thu, 24 Jun 2010 08:21:01 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100624152101.GF28292@gmail.com>
References: <1277371081-15867-1-git-send-email-Martin.Jansa@gmail.com>
	<1277371081-15867-2-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1277371081-15867-2-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] pango: drop PACKAGES_DYNAMIC for virtclass-native to hide multiple providers errors
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
X-List-Received-Date: Thu, 24 Jun 2010 15:35:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/06/10 11:18), Martin Jansa wrote:
> * NOTE: multiple providers are available for runtime pango-module-basic-x (pango, pango-native)
>   NOTE: consider defining a PREFERRED_PROVIDER entry to match pango-module-basic-x
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/pango/pango.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/pango/pango.inc b/recipes/pango/pango.inc
> index 0a01814..ad66c7d 100644
> --- a/recipes/pango/pango.inc
> +++ b/recipes/pango/pango.inc
> @@ -14,6 +14,7 @@ DEPENDS_virtclass-native = "glib-2.0-native cairo-native"
>  BBCLASSEXTEND = "native"
>  
>  PACKAGES_DYNAMIC = "pango-module-*"
> +PACKAGES_DYNAMIC_virtclass-native = ""
>  
>  RRECOMMENDS_${PN} = "pango-module-basic-x pango-module-basic-fc" 
>  
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


