Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 111E560173
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 07:48:21 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id r10so6828333igi.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 00:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=F8Jzw6KpkP/zbSL3zWIDBMqGT7u2Z8RJgc0MwF0CxGA=;
	b=WDUC12hUW7saKhXlu4+xY+qr7UcqCNfw9IJothL+JXux5b+czJqn2Cei7rfLgDydZB
	8suRoQP2ERugQ9nkmpPgJu4YHhG883begPgW74vWrREQ0DUJY87MeWxK8wSsvEfugLVp
	pcFAjj4VW0wuDmGuKDrv3JwhlSj5DA8teGD/Cp2uTtofwILDV/nI5lPFQCknTcl+p6+x
	PrZIhmap4/akWJ1PU5hbs8eFfJMVwHR9haR6iJaaklZQnnc1WTKWe/gOEMCTDExjfTr7
	wagj5HPuQQSexgjJhPnuPwpqwFfce3ouDUUk/1mL69i8w1ZVughOKEDaR0Dy/34WoxiO
	we1g==
X-Received: by 10.50.49.109 with SMTP id t13mr40573235ign.2.1399448902669;
	Wed, 07 May 2014 00:48:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Wed, 7 May 2014 00:47:52 -0700 (PDT)
In-Reply-To: <1399445635-29373-1-git-send-email-koen.kooi@linaro.org>
References: <1399445635-29373-1-git-send-email-koen.kooi@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 May 2014 00:47:52 -0700
Message-ID: <CAMKF1so17ynGToCMO_i8mw+UpUdnZC3NL_797JJbbrbMOd=_-w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCH] openldap: fix build against gnutls3
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
X-List-Received-Date: Wed, 07 May 2014 07:48:27 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 6, 2014 at 11:53 PM, Koen Kooi <koen.kooi@linaro.org> wrote:
> ++                              TLS_LIBS="-lgnutls -lgcrypt"

Does this mean we need something more in DEPENDS or DEPENDS part of
PACKAGECONFIG too ?

