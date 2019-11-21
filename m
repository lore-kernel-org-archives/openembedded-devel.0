Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4ADA77F931
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 06:51:16 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t1so2968024wrv.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 22:51:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=dXNEBsA3If8qtuUkQsEBtzrspz3UcTnmE6S3Xyzax3M=;
	b=si/pQGj/zrBRr4HfUCGAQR+9mzEZYqWcL/fV8vJSfI+KfYW0RzJ0S08g5exteRbF85
	0aXe3/gN4+2Bypw3y+TXMtF1AS0y27X5Qy78WhRrDCE1Fb1nGgagVtGbUHkMPEHMC6aq
	XrK/CQQba1K2NlilbZNWTwkf7/AaO5La/Pei9sVvY61QZXV9zE4n3pt5GYrMZnO/U+wV
	OoB1f84yTjId5YcRhxzxuvojSsI985e51T0kCMhSIsEG1X7kO8G+FTdi8FRoE1/dPe7e
	PPli2z7JUN7zlinju9xcEJiYMPQQTfuWsjfe2SypbUUYE0bpKjdCbSHeOavZ1bsv0aVT
	/ssg==
X-Gm-Message-State: APjAAAU+atr0RUDgPnkSiuaPDszOE/3lyc5uJaSRQvIh02YBg2oiiS2V
	qn3un2Qn1DQz1/z+ZM5+snre8Ucq
X-Google-Smtp-Source: APXvYqxW9Hy+vDWstljv0WNkPPtmxYwFdcq54UEcLKyf3XPOFAIrZ8KQC2yjRGsqATHcHyLngTqycA==
X-Received: by 2002:a5d:490c:: with SMTP id x12mr9004927wrq.301.1574319076694; 
	Wed, 20 Nov 2019 22:51:16 -0800 (PST)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id
	k125sm1986743wmf.2.2019.11.20.22.51.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 22:51:16 -0800 (PST)
Message-ID: <94f0644e0fcbcfbaf226d4d25cf28e64170e5c86.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Nov 2019 06:51:15 +0000
In-Reply-To: <20191121023440.36149-1-Qi.Chen@windriver.com>
References: <20191121023440.36149-1-Qi.Chen@windriver.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [meta-python][PATCH] python-jsonschemea: add missing dependency
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
X-List-Received-Date: Thu, 21 Nov 2019 06:51:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

there's a typo in the subject line

jsonschemea -> jsonschema

A.

On Thu, 2019-11-21 at 10:34 +0800, Chen Qi wrote:
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-python/recipes-devtools/python/python-jsonschema.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-
> jsonschema.inc
> index 1841b5893..5599cc6f4 100644
> --- a/meta-python/recipes-devtools/python/python-jsonschema.inc
> +++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
> @@ -23,6 +23,7 @@ RDEPENDS_${PN} += " \
>      ${PYTHON_PN}-strict-rfc3339 \
>      ${PYTHON_PN}-unittest \
>      ${PYTHON_PN}-setuptools-scm \
> +    ${PYTHON_PN}-zipp \
>  "
>  
>  BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.17.1
> 


