Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7849B606B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 07:55:48 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id y207-v6so5889993oie.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 00:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=JQWZZjZ+v5zBHHygOnlGkIK6d+68/QjyDsFRIeRU3JE=;
	b=n+0hZFUoxgbrue0gGyLRt3juWPH374R7KYqrgkUNqMpuECnsiYyfL4XJKgWd+O5NMJ
	rqk+iOpTQM8G+rP7xH36flfJGJMOkhYYefzBMFy8Bt9ZYByNVNeuQ7DSzM/JLSCnaKIP
	tqHgThz1vZ+wA3ftRJSd4cXumrmn9Xd3zbm/BbiHibvCuEakAeyTwCcj77SrzjHKzZuo
	vbAeHwBEbC2Wi2x4XsF8D8K2Tqz0HEY5xwM9z26nvHrA/Gfz5beiJDTiXmXE6E6BeQNz
	yS7XhyKl+flc0GmNZZaz6+mw3S5vlv8CpunjjuCsqLhbDbggwxELx6YoipitI7HNlyZ9
	ymNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=JQWZZjZ+v5zBHHygOnlGkIK6d+68/QjyDsFRIeRU3JE=;
	b=OrvQcsHYvDmbLhqnk+dXpVX0kvkKII0mV4WmwX7yyoa8mYOj8Gi304H4fp6r7iRL4R
	ld8GJmBI8EnbROrRZSTs1G3OEmOdoUR6UyXgR91aOfQNTwWwWIYL4FPkiECv7HHTM0Vt
	ChezumXPKM8rN7lcZde3PLKKJjYbeyTE/L7ZyHNXJfASnxuuZ63UWbdInri9OUaVz66e
	NX7cW2Z88aeb/Xi6UdmBS0XzxCbW1JMqce0mFLJspduhOBxaMH+R0u4q2WX+HwnTua6h
	lkcB4fFsBVHY2qsaF/TwV6p8BMQ5JOo5g3axGjjUAaZZb091yJl9QpiJZpurUH0Zq3p+
	QMuQ==
X-Gm-Message-State: AOUpUlHp8+DUj+v8ayUJJ1Cu4nN/iteDUiHxMUtbLLOUBQ2xILPJBN09
	GHShM55U51ZU1jFhZGviu7wCVMc+Oo6C/g==
X-Google-Smtp-Source: AAOMgpdLIS/UJhQL+sryjcHTbcz322JBcHf2WfmxzS7of8JhuaQCa0wuSaZ9m3+xOPePasqghntF4Q==
X-Received: by 2002:aca:51c3:: with SMTP id
	f186-v6mr1994362oib.59.1532418948964; 
	Tue, 24 Jul 2018 00:55:48 -0700 (PDT)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com.
	[209.85.218.41]) by smtp.gmail.com with ESMTPSA id
	m62-v6sm29140836oik.30.2018.07.24.00.55.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jul 2018 00:55:47 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f41.google.com with SMTP id d189-v6so5915135oib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 00:55:47 -0700 (PDT)
X-Received: by 2002:aca:f516:: with SMTP id
	t22-v6mr2277253oih.56.1532418946685; 
	Tue, 24 Jul 2018 00:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <a0731f9a-83e2-9ea2-a04e-191ef3793e74@skidata.com>
In-Reply-To: <a0731f9a-83e2-9ea2-a04e-191ef3793e74@skidata.com>
Date: Tue, 24 Jul 2018 08:55:34 +0100
X-Gmail-Original-Message-ID: <CAP9ODKqDEZ8ND4K3SEELY2mTjALCX5rzWLxjD0Vht7RFTVZ6cw@mail.gmail.com>
Message-ID: <CAP9ODKqDEZ8ND4K3SEELY2mTjALCX5rzWLxjD0Vht7RFTVZ6cw@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] bug-tracker
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
X-List-Received-Date: Tue, 24 Jul 2018 07:55:48 -0000
Content-Type: text/plain; charset="UTF-8"

Em ter, 24 de jul de 2018 08:33, Richard Leitner <
richard.leitner@skidata.com> escreveu:

> Hi,
> finally I have another question regarding the meta-java layer :-)
>
> Do we have some kind of bug-tracker?
>
> If no: I would really love to see one for meta-java.
> What are our possibilities here? YP Bugzilla? GitHub? others?
>
> What do you think?
>

We recently passed the review process of meta-qt5 to github and it has been
much better this using the patchwork.

Maybe we could consider the possibility of moving meta-java there and make
the yp.org a mirror so we use the issues, PR and all resources it offers
(Travis as well).

>
> regards;Richard.L
>

