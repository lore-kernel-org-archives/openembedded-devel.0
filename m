Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id C2E3379C55
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 18:07:49 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id i10-v6so7956457oik.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 11:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pAUUZcegPytE50UiiOMdWPUmFYADe8XEGGD9olXOhFs=;
	b=odllte5FiPmQhEHpu9wJ1A5IjuYNLX5tddwm3MLnw13ine94tK9mFPAAlDkErubQwS
	zxy4Q9mzEiHhpjt7+o5uX7+7H8aNVlLWIOaVYrHf9enPfCXrtKa6o6DYkK3811+Jbwa7
	3S3W93OFaie7/wjbtb9WPS5cekj18f21eoaKFGupqy3h6jLxq5wVly3ARI5KHrGBVJEg
	uVasrr8ymwPfoyHTA+/b1XVbn0EfsJan50dU303GyN23/yo/qRPFtd+bwFSDUbAXPt6S
	BOMYrNoWQJlJQaNCeCZvIHQ9j87Ch1oOE6ejAMD7HCjJglGG9NGHAnDxwuTptUObSPrV
	Z8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pAUUZcegPytE50UiiOMdWPUmFYADe8XEGGD9olXOhFs=;
	b=P/75/620tytirae8Oi5F4ihl1VahOLc9ybed3KD4WFf7SFlUcVHBdviUvgHrNgcgGC
	KU+gxy/Msy4Nkk2379hl/5aF61yJKH1GJcJG7kSppRs7u5vkZ7NzLiHdGd72qrvxtvSr
	KTziGppKEo9W2VSb/Je15may+7eQ/cB5vd1k3SB82Yd6s/efxcYm/vqKzuDi43iBu2aD
	F2MNxLlV8EhQo3Kh/tBIIu1EW1Qd4/XI5a3klyDpnilz6YCKfSAn40qIBV8dZ82Wc0ul
	fDfsCkh/WoxQOC/VioDcUqpbgchOWiVgnalyKM9hYplaqJwoYrY6iEtX0Ro3vbYRcfNZ
	nECQ==
X-Gm-Message-State: AGRZ1gLlzYKvl3noBMYWGdI/zW+Dq/ZiSMTC99jAIa5WITEzFcpDebfU
	PlRAMXzZoEebhzH20mbTkFSD4K8XmOklJRBNtarSaQ==
X-Google-Smtp-Source: AJdET5cardmUOiwvXw3LcM8lS/jXuerspx0/FbUKJKIWV6z9wm8eJrkZgtrOCKSSz4zZ0avBREy1pGjmYLcFKzkN+Dw=
X-Received: by 2002:aca:895:: with SMTP id
	143-v6mr9306354oii.309.1540836470694; 
	Mon, 29 Oct 2018 11:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<b40eac3600551dd8e597cbf1cbdec7b78c038711.1540830650.git.brendank310@gmail.com>
In-Reply-To: <b40eac3600551dd8e597cbf1cbdec7b78c038711.1540830650.git.brendank310@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Oct 2018 18:07:39 +0000
Message-ID: <CAJTo0LbQzmQ4d2ybPT9vLoPPRzNFkJWTiVecUJH_ovt_RSN_zw@mail.gmail.com>
To: brendank310@gmail.com
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 03/16] gjs: add a recipe for gjs (Gnome JavaScript engine)
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
X-List-Received-Date: Mon, 29 Oct 2018 18:07:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Oct 2018 at 16:42, brendank310 <brendank310@gmail.com> wrote:

> +do_configure_prepend() {
> +       export GI_DATADIR="${RECIPE_SYSROOT_NATIVE}${datadir}/gobject-introspection-1.0"
> +       sed -i 's#mozjs-17#mozjs-52#g' ${S}/configure.ac
> +}

Personally I prefer patches to sed in do_configure, as nobody will
notice when the sed isn't required anymore and the point of the change
isn't always obvious.

Ross

