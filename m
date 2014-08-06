Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id DF6A670620
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 14:45:37 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id bj1so3533242pad.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 07:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=kSkubagcdDLKlt8XEZoV1mAqmztOtfFORnqHt8d5GYg=;
	b=FhOHtGmFssi+R3wT2OUDKPrJoa2MF4XLuMMA9yPXCr0Em89E5WoKZFSe2OtIN3/Jl+
	oR8Iuw2ZdDuEPLeROFLBJ5xI1FR4rabvpEGf3h7Y/IW86fFPI/oDPZAHwFIOZNqcnofC
	eCuWLwrpdk+RN69umJGEYuWwwHed49YaDrVliXQ6wSbrVo/a2pRmPHkAco4IJG3lneAF
	iTThjKii5bJTLFukoG1886FUVR00vuUy5hKRskjTiMI157rr5gSKvIqIerTQeRAh1+DS
	MefP03+IijaCVv+Hwg8DZfLLnXwf3Dqhw8G5TCwxK99noj5xHRVwSgn34K8Gz7xV8z4r
	EC9w==
X-Gm-Message-State: ALoCoQnhHjNbBpNzEIQpXqALfkAMw2O8U/jFvZHz7GERIJPRWqUBCEgF2hYQyiNQIz2xiBJGNUe3
X-Received: by 10.68.106.194 with SMTP id gw2mr11712891pbb.85.1407336339420;
	Wed, 06 Aug 2014 07:45:39 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:51fd:c9cf:3e1a:35e1?
	([2601:c:9380:601:51fd:c9cf:3e1a:35e1])
	by mx.google.com with ESMTPSA id x15sm1508625pbt.52.2014.08.06.07.45.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 07:45:38 -0700 (PDT)
Message-ID: <53E23F91.8000301@mvista.com>
Date: Wed, 06 Aug 2014 07:45:37 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Joe MacDonald <joe_macdonald@mentor.com>, 
	openembedded-devel@lists.openembedded.org
References: <1407336153-2226-1-git-send-email-joe_macdonald@mentor.com>
In-Reply-To: <1407336153-2226-1-git-send-email-joe_macdonald@mentor.com>
Subject: Re: [meta-networking][PATCH] wireshark: update README instructions
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
X-List-Received-Date: Wed, 06 Aug 2014 14:45:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



Acked-by: Armin Kuster <akuster@mvista.com>

thanks Joe.


On 08/06/2014 07:42 AM, Joe MacDonald wrote:
> Minor tweaks to the README to make the email suggestion follow the format
> used in other meta-openembedded README files and adding clarification on
> building wireshark in a GUI environment.
>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>   meta-networking/recipes-support/wireshark/README | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-support/wireshark/README b/meta-networking/recipes-support/wireshark/README
> index 0e0c526..63b5b72 100644
> --- a/meta-networking/recipes-support/wireshark/README
> +++ b/meta-networking/recipes-support/wireshark/README
> @@ -19,6 +19,10 @@ IMAGE_INSTALL_append = " wireshark"
>   Adding the wireshark to your graphical build
>   ========================================
>   via local.conf
> +IMAGE_INSTALL_append = " wireshark"
> +
> +and one of:
> +
>   EXTRA_IMAGE_FEATURES += "x11-base"
>
>   or use the "core-image-x11"
> @@ -29,8 +33,12 @@ Maintenance
>
>   Send patches, comments or questions to openembedded-devel@lists.openembedded.org
>
> -When sending single patches, please using something like:
> -'git send-email -1 --to  openembedded-devel@lists.openembedded.org --cc akuster@mvista.com --subject-prefix=meta-security][PATCH'
> +When sending single patches, please use something like:
> +
> +   git send-email -1 -M \
> +       --to openembedded-devel@lists.openembedded.org \
> +       --cc akuster@mvista.com \
> +       --subject-prefix=meta-networking][PATCH
>
>   Maintainer:    Armin Kuster <akuster@mvista.com>
>
>

