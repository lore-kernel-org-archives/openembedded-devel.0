Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1632A6C3B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jan 2019 08:11:21 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 96so32776466wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2019 00:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=fr6iLSxKmTJAGEsrfbPlavUI05HitdUUBe7Q2j2ItX0=;
	b=r7KgjYcB9cNlA81GTc68lKqdZoR0TgfDmsyYgZ8NEKUBNoQ51EqnQ0+MwHPFsW6gFf
	yfVBw9suxR3DyDDyA5qvWdqci/wc9RLjaTCwx3tE37MQA1/ctYfS6cqvbfif9ClW4shm
	ZB1AeHh1Md0zphBmaHbW5AWcQm6uWEk6ZdSVnEAbMYfVMMXPKm6oZqy1zTZ9bZAo+0pT
	5dcvrlvNCl8/kpsiOueQ0f/suRGlkE3BMI/2CHf5WO2AT+FvuYWQC1h57ar41cNt2o5H
	1rRXu1tLY+jUtEtrZyN/L422Q85cY+D+wjD//ysPaO6jH/S9URQxyW3fE+Mip6N3wscH
	FDVQ==
X-Gm-Message-State: AJcUukechMEr/CflPOqbZa2MFqmWpvTHHvwrtHbEb4QtmjXaS3RLl3YN
	8cwgabgYi+HOi9w3hF9bUmYRlYgk
X-Google-Smtp-Source: ALg8bN6F9FywGe0gk0jj85cu9/C+9TYb6IVwiDmctd1dCU1jU2Ohe2ayl4EZRExMeWm0CPqTNkAC2Q==
X-Received: by 2002:a5d:6808:: with SMTP id w8mr38608073wru.270.1546503082515; 
	Thu, 03 Jan 2019 00:11:22 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	e16sm47184566wrn.72.2019.01.03.00.11.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 Jan 2019 00:11:21 -0800 (PST)
Message-ID: <b63ab4b29e53f7d85e77926a8ad4d1daafe441d9.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 03 Jan 2019 08:11:20 +0000
In-Reply-To: <1543488504-15595-2-git-send-email-fang.jia@windriver.com>
References: <1543488504-15595-1-git-send-email-fang.jia@windriver.com>
	<1543488504-15595-2-git-send-email-fang.jia@windriver.com>
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH 2/2] openjdk-common: Define JAVA_HOME by default
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
X-List-Received-Date: Thu, 03 Jan 2019 08:11:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-29 at 18:48 +0800, Fang Jia wrote:
> Use postinst script to set the JAVA_HOME by default.
> 
> Signed-off-by: Fang Jia <fang.jia@windriver.com>
> ---
>  recipes-core/openjdk/openjdk-common.inc | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-
> core/openjdk/openjdk-common.inc
> index 01a0a2a..aaf81f6 100644
> --- a/recipes-core/openjdk/openjdk-common.inc
> +++ b/recipes-core/openjdk/openjdk-common.inc

What about all the other Java providers that could be installed in the
system instead? The original did take care of that, whereas this only does
the right thing now if OpenJDK-8 is installed...

Cheers,
Andre'



