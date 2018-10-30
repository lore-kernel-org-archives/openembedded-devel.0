Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9735479C29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 11:31:48 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id 79-v6so6999527iou.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 04:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9mqIY0idpilcsDuT/+860NwfI+wG4t8wha5V+nZYGKQ=;
	b=L86dIayBjm1CDt+j08gRsx9XolP7emIfG2F/QGz4KVrqGAUPGFiz95Vzg/ZHPgKq5e
	eBe14swAd+RdRDUSA3FleYvKAvZvMOO8y0bEAPG7JwxJZSBitnyszBTSZie+h/MRAMJt
	xqyoABbjNdqIuV+ldNLmsCnw32vaT7ZruV5frjLahH1KlJLyDri+2Bi/AQq/Pr/nhiTm
	2jT29R6PfueEojLCQSUo+FqHoA0UFiGfl+CKTl5x/ctlA+6xEcUsC4a0lNf56fWzybFI
	vWpclNumEB3sFQFVWsU/LVWY0Dp8RVq4oIWDk1YaADAwIqBVvIu8YEZdr4aku8WkRijV
	PC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9mqIY0idpilcsDuT/+860NwfI+wG4t8wha5V+nZYGKQ=;
	b=qTzJQPCvpn2jEa6rNsKC2yAlC5VhsO9YJNLreL9GM7dwEdt+Itpvv99tnWiAyxCZpr
	ZHT0M4TFmdv9k92K2RvHJddBmkw72s8amVLCDw0c5iKZhd11IvULh49xkqSWFUXJPos2
	8hwSwyqih+UCJ2JgZYesIFY9Bi6Un5K30DkS44Q85eeQQT29eBlGSydHM9Rv3/J8RMDI
	9c+e+CAXTw4R/1yLgvC9KWPqcHNPd/ySd06fhLRKyjAKz0/pOgjTkcYXWwnCECcIAqwV
	Miz9urUy+fTAHv0h+kzl1QuQ2MnA6yXKUO35osjzCIuuom7CNQ5z6R5xr7iMAhxKPwIi
	0kuA==
X-Gm-Message-State: AGRZ1gJrqrhBz+KGb4sV7gn7YwMCfEqOVymBimcLoANU4S4Sp7N+QkxL
	hLlbgVjTwL+wOfh6TuJwdf5mcPRDCWKPjRmQ4nZ1FA==
X-Google-Smtp-Source: AJdET5f7nVwr6f0OxWxJKW7NHtHv95QVrCZyPW22Xjy9TFVHnBu/OfbltwarGXwAKEReHa7PSMkQI8WOkb+GvEuVYqU=
X-Received: by 2002:a6b:b9d5:: with SMTP id
	j204-v6mr10457958iof.20.1540899109718; 
	Tue, 30 Oct 2018 04:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<d84e5b262a493ae9fe761ee9e22fec8f6d2dc59c.1540830650.git.brendank310@gmail.com>
In-Reply-To: <d84e5b262a493ae9fe761ee9e22fec8f6d2dc59c.1540830650.git.brendank310@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 11:31:38 +0000
Message-ID: <CAJTo0LbO1Ved_p3B-2ksTmGbgpx28EaXBPEZ1BQrFNP5kXxgoQ@mail.gmail.com>
To: brendank310@gmail.com
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 15/16] gnome-shell-extensions: add recipe for gnome-shell-extensions
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
X-List-Received-Date: Tue, 30 Oct 2018 11:31:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Oct 2018 at 16:43, brendank310 <brendank310@gmail.com> wrote:
> +SRC_URI = " \
> +           git://gitlab.gnome.org/GNOME/gnome-shell-extensions.git;protocol=http;branch=master;tag=3.30.1 \
> +          "

Use tarball.

> +RDEPENDS_gnome-shell = " \
> +                         gnome-shell \
> +                        "

This is why you use ${PN} ;)

Ross

