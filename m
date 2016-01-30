Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id CE06777242
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2016 14:13:47 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id 65so57859627pfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2016 06:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=4zTE1K73i1MmsrY9PkDFImgI7veA0WHiLXU/KQFhBIY=;
	b=UY9CFXeEIgpbjk9x0unaqqBkCyUCMMjJ68NGpQoYzvA7p6g3blWCeew5tcP5Oi7AAR
	tRBKC7fi0mPW0V49KdtNNLL5TZpETwzEaojBZSBcSmgFn/DMOUUWSEh5BdxKs5eBVcvZ
	LbJFp9/fplluApioGXz0ri6lWXF5WDuYDUnKVTzi7yr5ySWNLX/2fYBrdZJg7i9b8g2d
	EwoAiM0kpsVf9t4lRbfVDD5xviKBTaouV1J5pimxSkUyibsk6Ncutjf6UrCgMkfM9jEF
	5kxyRHyvZBMXYOcrQ31FFk1eqikcq1GwOzuhE0F44u2QJnEtY5/rtZ31hPjQtqcgJKE3
	8+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=4zTE1K73i1MmsrY9PkDFImgI7veA0WHiLXU/KQFhBIY=;
	b=ZW3/vtnYdIpPUCbUwA+XmkfYj8Jzz350JhtoKXz0ei4D6+N4JaUW+ZpBleIL3s6s2F
	8RY+H49WgAbdZaRafV4wHd9S1R7q/+DbyeBzOtdpAmVO69EeIprmOwFZ8HvK+cLPDsKY
	iXEj6Ti6ej5ChQNnEj4JvGaCe90x13g4BXtStbuupaW5TQd2cCHZA7X2diWVM0LnXqNO
	VyGaAC1l3QCbUYSBTGx2MffI9QzFpGsOtprRLlmQx9cQU+zxHa1WqOcDFcq/y5L/KJUt
	7zIMsV9LnPg140u5QXCNob5ceCsurdYQZAnRQ6dlfwNQ8zOwg8ljXU9OGnFa4kAZNOZo
	iB/A==
X-Gm-Message-State: AG10YOT4Dv+kgXvDbD08qZ251gi1ykV0CUCRa5XGo+EFRMvHBYZuzVD8IWk+C7u2epiz1A==
X-Received: by 10.98.42.213 with SMTP id q204mr22625928pfq.141.1454163228329; 
	Sat, 30 Jan 2016 06:13:48 -0800 (PST)
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com.
	[209.85.192.175]) by smtp.gmail.com with ESMTPSA id
	u69sm30860554pfa.61.2016.01.30.06.13.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Jan 2016 06:13:46 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f175.google.com with SMTP id o185so53136980pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2016 06:13:46 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.31.84 with SMTP id f81mr22377233pff.98.1454163226025;
	Sat, 30 Jan 2016 06:13:46 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Sat, 30 Jan 2016 06:13:45 -0800 (PST)
In-Reply-To: <1453906715-6881-1-git-send-email-manuel.bachmann@iot.bzh>
References: <1453906715-6881-1-git-send-email-manuel.bachmann@iot.bzh>
Date: Sat, 30 Jan 2016 12:13:45 -0200
X-Gmail-Original-Message-ID: <CAP9ODKopO2VAkJV_7-X0YpEaZfUSFLGxhHFvsqeXrUvAEWaPsA@mail.gmail.com>
Message-ID: <CAP9ODKopO2VAkJV_7-X0YpEaZfUSFLGxhHFvsqeXrUvAEWaPsA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Manuel Bachmann <mbc@iot.bzh>
Subject: Re: [meta-qt5][PATCH] qtwebengine: build examples by default
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
X-List-Received-Date: Sat, 30 Jan 2016 14:13:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 27, 2016 at 12:58 PM, Manuel Bachmann
<manuel.bachmann@iot.bzh> wrote:
> From: Manuel Bachmann <mbc@iot.bzh>
>
> Just as we do for qtwebkit, let us have a patch to build
> qtwebengine examples by default.
>
> Otherwise, the "qtwebengine-examples" package will be
> empty, and attempting to add it with "IMAGE_INSTALL_append"
> will result in an error message.
>
> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>

This should be a distro option and not enabled for everyone.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

