Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3699C6041F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 10:28:38 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz11so3859791pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 03:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=nJV54oVjbPDRMfJsnA0GuJFXdCVEIJbs4gyTjDVFbbQ=;
	b=h2IB/IqlUjmKrPRagQvWsMzpF9ftB2hSB7dijEMX4HhQZVGwnucLEpdEdJq+RRj5gp
	U+bEY17mGgTv40SG9ZwJ27pxIPY5eNj6oO5GPr2i/O3mW3jTBiaWMi6HmiPm+qZFSxl5
	k3pl+dK12vO0gm4yOlgauaRgmZPpy14rV3P0K8IA9BiueHMbCnDHpPNL3oI534XmvyTz
	m7TeMrDyYi9TKcXIHJWY7+opo5R5uohvAU+HVwKsyDq6Ya/7Uqx9kaBxeYD/sAR6EuV/
	NHVJTKQAWGnk1fRkoNDvUgLAiOy/ZfPL6zxpiqy1p0yBtabWbVENsH/B0VLmdYuIGhSc
	9Ulw==
X-Received: by 10.68.162.1 with SMTP id xw1mr16353333pbb.199.1371551319508;
	Tue, 18 Jun 2013 03:28:39 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	pb5sm17671081pbc.29.2013.06.18.03.28.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Jun 2013 03:28:38 -0700 (PDT)
Message-ID: <51C03652.1040204@gmail.com>
Date: Tue, 18 Jun 2013 20:28:34 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1371541405-3651-1-git-send-email-net147@gmail.com>
In-Reply-To: <1371541405-3651-1-git-send-email-net147@gmail.com>
Subject: Re: [meta-oe][PATCH] cyrus-sasl: move plugin *.so symbolic links to cyrus-sasl package
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
X-List-Received-Date: Tue, 18 Jun 2013 10:28:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 18/06/2013 5:43 PM, Jonathan Liu wrote:
> From: Jonathan Liu <jon@zydex.com>
>
> The Cyrus SASL plugins are loaded without their version number so the
> plugin *.so symbolic links need to be placed in the cyrus-sasl package
> rather than the cyrus-sasl-dev package.
>
> Signed-off-by: Jonathan Liu <jon@zydex.com>
> ---
>   meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
Wrong email. Please use my patch from gmail.com.

Regards,
Jonathan

