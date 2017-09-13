Return-Path: <brgl@bgdev.pl>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id E871678624
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 11:48:46 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id z73so41139656oia.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 04:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wGWzGwRa1qDRiQ6i2XpuUnRZNG14M/WzlVmk+TsSi+I=;
	b=I/xQtDct1siHt2u4ACiixHbSjRJ42ce5sqBNIc7KlPcwS1EeAv8Kd5b1zEggql8VcD
	rO3JzZ8kg2/xf06QEON2sbZuvxu9eP+ctYQiNub/L+Bjfi2rp1CXUDzFtXv0DXNNycVL
	eApEJGmHn53rvZVfmtWQ8No7bjbcm6IIKeO5JFy8MuwFb4iBAsNdeDHxLPTz3yW8X6Ei
	soocIcWf7W9UWytwJlQ06Yv+7GjBtOKV9+Cn9et0rVJ2eRMXvuLptXP7jhFDr2nkH9wr
	8cr5vj92Tb81SoU9jzJVMkIl6i5HEBhFVL3dqWg9+E1PRH7ZZUva5tcZV84bZEbY1Z+U
	83IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wGWzGwRa1qDRiQ6i2XpuUnRZNG14M/WzlVmk+TsSi+I=;
	b=IowuAMdCE8J2F5t3JXShRLnAzw+XhSGC+pAN3zs7FM/VL3WfEJ1w+9xLtKFkmw3cbK
	qnZX/j2wrXxipwlVqTSsPSMYuXAnokacC4QFwFZVBPJ4YusPhMBrMCLhIxGpJaUqTFvM
	OJwZIplm5sG0vfLQJBkcfQTJwGlh5jaKFofCQzfKCw46T2mHvv5TwXEKFp7MlltDUdRn
	kY9C1B8ubrLDtd/+7M+Trf87/3X8Jnfe42JywYZAYwN3eCZBCH56Gz7uvqUYChmSqIOZ
	gwcQl4SNZVV6DnOyx4eOU6KY1WNBxGpx7UlerEx4/y/ERmd7kcJITrvGvYldhMs5YkJD
	aYtw==
X-Gm-Message-State: AHPjjUhYeb1dOEZ1aZQYDo2wsapj+hoDmAWOLzG2WvqSpO7Rhjxo0fbh
	EbVdz7oeML38G3bG5rU9/n0ThkCDmhSC6tqY1mwkpg==
X-Google-Smtp-Source: AOwi7QCQioHuSUu+4trh5G5SUIReEqyy7mNr3ZoMcxQB1r7WrIexnVTPGP8kP16zZQW+AvVc6BO4u6urmVe9ewdY5r0=
X-Received: by 10.202.10.150 with SMTP id k22mr16970930oiy.84.1505303328110;
	Wed, 13 Sep 2017 04:48:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.10.46 with HTTP; Wed, 13 Sep 2017 04:48:47 -0700 (PDT)
X-Originating-IP: [83.150.126.21]
In-Reply-To: <CA+chaQeKGd0Q57a+4hax24Tmcv=XtWAzNazC47OBzdf4djX7fA@mail.gmail.com>
References: <20170913110447.18816-1-brgl@bgdev.pl>
	<CA+chaQeKGd0Q57a+4hax24Tmcv=XtWAzNazC47OBzdf4djX7fA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 Sep 2017 13:48:47 +0200
Message-ID: <CAMRc=Mdg8BwYvbuJ8rqzXH-5dBmBP0HBgerZCXS-ap7YP=VXGA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ceres-solver: add new recipe
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
X-List-Received-Date: Wed, 13 Sep 2017 11:48:47 -0000
Content-Type: text/plain; charset="UTF-8"

2017-09-13 13:39 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> Don't use github archives as they might get regenerated from time to time.
>

What do I calculate the checksums from when not using tarballs?

Best regards,
Bartosz Golaszewski

