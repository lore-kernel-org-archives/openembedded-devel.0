Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id A560F60119
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jul 2016 15:01:57 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id a66so196521039wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2016 08:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=1le2BHusG42xvT7ZZFLwSU6KIx2y4KqynYWj8Gc94vk=;
	b=OOGqdNtkw1ciq3NdKFvWclf9TNbOL+TfIwaarzqexFv2Gh+jIyG+V/0nFNnWEY5e2B
	Oaevoewtk6gQIPJ1dahz+lVVoPtT1oKpMtjQG1bgzFHJQRLgtqT4capcCVFrX+Y9Kzow
	s2CnmBLxNbAKiYxvNrN9Ydp9h3ACqVyeKZGVViRDc2BKxCTdk3yKkSzPiGDT40vDQ9G7
	MlScUgbHNzTuWWJX0VlsYUXLkoMV5MdiQnwlafpChiLcRfUdCJcB+lTpCwS0WjMXrqSw
	7UEnAQbSKh3qMt8gw2IvOvMtscHIpAPhpBgOZr9pahMvasI6tzo+AVr9Y6GeMtdJw52G
	hqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=1le2BHusG42xvT7ZZFLwSU6KIx2y4KqynYWj8Gc94vk=;
	b=EMnG+qiAUZ9q+6acKE0bKDzVyW9ZQ/R3JzHeFiD26n3hhFvkIlYLVC+82vSkxNx0ZM
	trqu/nBbOc8C1FXXGLfbdfoM7dhQt77E1wz5iAJ9FSCJO+NbAdirH6YtNaynQ9PPvO3l
	SWyZkdDU2ekOg0hgghPq/Et0qPtHfYgZCy5l0Cfsx3KjoV/zjzEQNVbRh7635KrOcYFj
	P/hPkWdkxlvIvkW0EgsbAmyxAR8Zx9w98JYQJ52HW5na4hYCFXCHsSsomL0KY/g+9NJC
	eZuxyCO5PGkvQjaWf3jhGJGAZCRGXNhHY/QCFUVXSlMKFjw9N4iHNGEwxvvZHPU+GRUM
	FC+A==
X-Gm-Message-State: ALyK8tLN+V9H7Gfi3AB0QweIg9htXFWcw06SpM4QLRuCMYgaKqiHvOjNeBELTilGLky3Gg==
X-Received: by 10.194.82.74 with SMTP id g10mr20667009wjy.11.1467817317849;
	Wed, 06 Jul 2016 08:01:57 -0700 (PDT)
Received: from [192.168.2.170] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.gmail.com with ESMTPSA id
	w184sm2930799wmd.11.2016.07.06.08.01.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jul 2016 08:01:57 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1467360339-10236-1-git-send-email-ed.bartosh@linux.intel.com>
From: "piotr.lewicki" <piotr.lewicki@elfin.de>
Message-ID: <577D1D64.8080604@elfin.de>
Date: Wed, 6 Jul 2016 17:01:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1467360339-10236-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [OE-core] problem with blacklisted packages
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
X-List-Received-Date: Wed, 06 Jul 2016 15:01:59 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
I'm having problem with some of the recipes which are blacklisted due to 
problems with compilation using GCC-6.

I wonder if there is a way to "whitelist" those packages without 
changing content of original recipe?

For now I have:

GCCVERSION = "5.%"

in my distro.conf so if a recipe is not building due to problems with 
gcc6 I simply edit the recipe and remove the line with PNBLACKLIST.

Is there a better way to deal with those problems?
Can this blacklisting depend on "GCCVERSION" ?

Example of problematic recipe : crda (from crda_3.18.bb)



Thanks,
Piotr Lewicki

