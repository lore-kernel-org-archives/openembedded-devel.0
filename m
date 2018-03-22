Return-Path: <andre.draszik@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 388E3788E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 09:13:52 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id q11so8162854qtl.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 02:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dUSc9IEGuqHN3tatnuesegm1ktEVs5t0DT9LVtYrP1k=;
	b=YbY/jcseyRAItad6TxFzEi8Gk8S8Hnyj3ogAnymiNOup+PsOcAu8aOtWIml2ZlTxR5
	keDIKTd2R8O0M3KjkQxuqy9P4z1Biwfc+oc7pJ2cAg2lCr+kpMOgRAvOg6FVU/AIVEca
	k6bZDsEO8OiOv2YgCTKwihau3xPmgAHx2u3+MPJDf+kdnlX+CYNZdHFnME4jdDzzJVet
	HNRqAr57gV9p8DCbNjYJgjBjqK5Y7lIdiojtrl3I9enKkusZ3dLTxntGy2T7Ls97i0o+
	glj1bnx0RlkzMg5P9WsRuB9PrdoW4jkIDeJKFD3ZGG1/7PfJ8R1Ps0xIw7702bUby1+T
	mGZA==
X-Gm-Message-State: AElRT7FV3/WHFp2tI0T2hXM12sWHw1qIM6vR06awIYOYFDlkyVBQvECl
	NdTZ3ybgMWYgRTcWg5l/SQIiYa63
X-Google-Smtp-Source: AG47ELtNC732ywKGyqKwmuAu+KvQ5xVaSfNZ82ESOLGWXiCOym9tP8GkrcZ7N9wWL8GkyHEkf0mevA==
X-Received: by 10.200.49.8 with SMTP id g8mr33844792qtb.279.1521710034164;
	Thu, 22 Mar 2018 02:13:54 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z63sm4916080qkc.60.2018.03.22.02.13.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Mar 2018 02:13:53 -0700 (PDT)
Message-ID: <1521710031.4459.5.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2018 09:13:51 +0000
In-Reply-To: <20180322091152.3145-1-git@andred.net>
References: <20180322091152.3145-1-git@andred.net>
X-Mailer: Evolution 3.26.5-1 
Mime-Version: 1.0
Subject: Re: [meta-python][PATCH v2 1/3] python-aws-iot-device-sdk-python: fix runtime dependencies
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
X-List-Received-Date: Thu, 22 Mar 2018 09:13:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-03-22 at 09:11 +0000, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> They were completely wrong...
> List of imports obtained via:
>    rgrep -w import \
>    | awk -F : '{ $1="" ; gsub(/^[ \t]+|[ \t]+$/, ""); print; }' \
>    | grep -v AWSIoTPythonSDK \
>    | sort -u
> and packages providing the relevant modules extracted using
> oe-pkgdata-util find-path.

This is a very tedious approach actually... What is the usual recommended
way to make sure dependencies are correctly reflected in RDEPENDS?

Cheers,
Andre'


