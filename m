Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 10DF465C8A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 21:04:28 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id ot11so37824143pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 14:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=/4HuhUR9qJ1Z0wwnWmbV3uTPzl5Pv8mTlURMAopZDZQ=;
	b=G0q4ewxe9hZqyBOmcs4I8oJn9B4d85Cp62BQPVJtj1NofCYDs4HE0yUWBxz+56SJBH
	P1GL3CQuad8eMbt2Erq4lMhamTowCo0yNfoy4CXm3kUok4FTTrSkgCr92FbjH7LvPdEg
	Wo2nTPowezlZ9bGPKPN/v+V0Jvx/DGDGwpGZ9G12hdbzz7LCujCJAIiLsuqGr0dOlqZJ
	Tj8Fn1zeZFstV8TSOIQ5Ix0Qc2EgXfD+/HJrGCTuzOmzKVn3WhCPwXiVvfeN3HjF7dHP
	ryrxwqB7km/nR8xKiG6KJnJCo0cmMghXy1HCzSijLPaDqZRvyAURaTfwjrBWCYZPlAp1
	ZoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=/4HuhUR9qJ1Z0wwnWmbV3uTPzl5Pv8mTlURMAopZDZQ=;
	b=bVjVsNYQ8dz42ps0jITRBXX1Zw8+eLSwiSQPRaTkSsgUIXOqNSk0Ws+fAP9ym5wS2L
	9KDVa8NJou9nA9Xm5Jvk+uAhLGj7O1pNVIsOpv9c3TJ26IOvZSxZRgeOp0zPWxMOcrLx
	KqzDu4hkeWND4YJUIrLucXSvPNaEXQL41p2bCfICno4/KMrCmUHlzPpNAFjfgfQfHvhM
	CCSuxbL/defrD7O5VnWyjwLtX5oLpGTi+dRGSNYrxSJfLMx8ZoqGvnSkySZB3dxs9cBZ
	hngLxfyyESyU89gcoRFbsKG4eiRrFl/3QvVqu6qsWAiMfU/udD/fe+x5Lc6RaH0ouRGx
	BwPQ==
X-Gm-Message-State: AOPr4FUBSQ0cRhy+OTX80ivhVvg+4POIOJYQM6k6jEzKyK27PWy7Udr5P/JRO+mRBf8UMg==
X-Received: by 10.67.6.36 with SMTP id cr4mr15901640pad.146.1460581469048;
	Wed, 13 Apr 2016 14:04:29 -0700 (PDT)
Received: from [10.43.100.29] ([64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	r17sm32235690pfj.39.2016.04.13.14.04.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2016 14:04:27 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1460553790.9308.89.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <570EB459.2020000@gmail.com>
Date: Wed, 13 Apr 2016 14:04:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1460553790.9308.89.camel@linuxfoundation.org>
Subject: Re: [PATCH] cyrus-sasl: Drop unneeded group addition
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
X-List-Received-Date: Wed, 13 Apr 2016 21:04:33 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 04/13/2016 06:23 AM, Richard Purdie wrote:
> The mail group is provided by base-passwd so would always be present. Therefore
> drop the uneeded group addition from this recipe.
> 
> This works around the recent user cleanup code improvements which meant
> this started causing failures for people.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

thanks. I ran into this this morning.


> ---
>  meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> index 33468a1..5da3d96 100644
> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> @@ -72,7 +72,6 @@ do_install_append() {
>  }
>  
>  USERADD_PACKAGES = "${PN}-bin"
> -GROUPADD_PARAM_${PN}-bin = "--system mail"
>  USERADD_PARAM_${PN}-bin = "--system --home=/var/spool/mail -g mail cyrus"
>  
>  SYSTEMD_PACKAGES = "${PN}"
> 

