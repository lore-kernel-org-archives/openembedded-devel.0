Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44])
	by mail.openembedded.org (Postfix) with ESMTP id F36547E726
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 01:27:44 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id n5so33262012ioc.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jul 2019 18:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=s9ay9OgD+8uo+9PRMuFqGwo5nlGByL05y+qkt8AWkko=;
	b=ArNBmnX286EjV7IaRfkIsdHqJgIIz6Xl6B32SraTCd2odbvvjDJUdaLTPitFQosniy
	iQO0+TeCpY/vjrU+uM0vuFyRcXe/rgMAWoCsgXwhf1Hd3eafhomtS0kBcmrvzqdOVnfg
	GzJri8pdiCQsMjrhU4qdz1rWudj36pM2NBC6mSdKJR51qRh8R00ar2UUthl0vZ+avWWW
	Huhy7L38oxHVdAwOOH0QjtsY2tmlFYFvhyj3YRIR2hApwBX8JlKnZqjoqzxBVfAWS3gO
	OOkgZeCZmPVB62BAcFC6URBWe5gExWr/bkyvoawiJlAgX8jO1GTgmWRRrNIVW/+sKl7x
	9nyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=s9ay9OgD+8uo+9PRMuFqGwo5nlGByL05y+qkt8AWkko=;
	b=KCmGBeKBrENr99IGiJgd48B5/qha38f/R25yG4slssCrwAvhjW/h3S4xa4h1Rz6Sjm
	IuUJzP9irLeWRONeaHQzlWc+iPD4f8PP50sfWCGmIQRQTdfuXvnDG5T0XKYKehLP/37m
	mhwuACZ8GMaU1m5Hcz++BxSa4rxTtOOJcUFtR3rhDgJH2a4m1VpLf8JlmrdwLZzendPJ
	4NZK095kQq6mJ/yt1wzo4jXLKd6jcSBuFNnlmXRsaQ1rQVhM1coJJeIEGQ85pE07mV35
	N0nIKJ2RDydowFluAbbqoy9jCVxwr783vZSNizCzdxHll2cdYr6iteAd7G9k8ZnT13Y/
	jVYA==
X-Gm-Message-State: APjAAAU6A3Uj5QNdBTU4h1jAuE1zVod/9Sth2SjMSGV2N1j7stTnTVs8
	dX+xE0f33Pe4rDvajBxjojpIao+9uD8i9axoer6fFv8J
X-Google-Smtp-Source: APXvYqwsFKKufSWF6THk6q9eAHrCvtBvQR7rYIi5TV3S6kn1CH7hzo2J4DuIMZFYvSrOmT7iQdZ38Q1AgwuejtWoIT0=
X-Received: by 2002:a02:230a:: with SMTP id u10mr5451803jau.117.1562030865929; 
	Mon, 01 Jul 2019 18:27:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:8a3d:0:0:0:0:0 with HTTP;
	Mon, 1 Jul 2019 18:27:45 -0700 (PDT)
From: JH <jupiter.hce@gmail.com>
Date: Tue, 2 Jul 2019 11:27:45 +1000
Message-ID: <CAA=hcWS+-bC8S+90VqbRMW2wpTz2Rfv7umxKSHovQXWD2K6imA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Allow choose of U-Boot config for machine
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
X-List-Received-Date: Tue, 02 Jul 2019 01:27:45 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I am running BitBake Build Tool Core version 1.40.0, originally I
built an image on imx6ullevk booting from SD card, I am building a new
image for a customized i.MX6ULL board booting from NAND. The following
link commented by Otavio Salvador for a patch to allow user to use
UBOOT_CONFIG=nand either in local.conf or command line. Given the
patch was many years old, I think that the current version is able to
support UBOOT_CONFIG=nand either in local.conf or command line, there
is no need to run the patch, is that correct?

http://lists.openembedded.org/pipermail/openembedded-core/2013-August/082284.html

Thank you.

Kind regards,

- JH

