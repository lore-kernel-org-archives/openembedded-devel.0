Return-Path: <marek.bykowski@gmail.com>
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0B29D7F665
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 14:10:55 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id q64so2695849ljb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 07:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7U7Yfe5CIhgtIUwu2Tk2Zgfa0Kk2VXgDurAvpRecJMw=;
	b=G+B5F9vGs8moBxWDfq44G2efexs9nknlpTMZjccGnCjfNG3QMmN59SZtGsf1UfYrkO
	lvfc4OlYHN0yTmQ0qIPaW5Sb8muIsLXs9nggGNvATYQnoAM+13VshT3T2CZ9oSuhEuZ3
	CgJuV8YI1sp7WasvNC0/dkmmosBDpghKTH/+ernqQRn4S9aHytKn6mcgoiuvQOe8hhmT
	ORWdu08DkkDqPlzu3/0qVjuZISLpC3H61ToBfsSJ9gq2rZDL8dxkWtwKP5JsdpMzS0hI
	7doyn+KRzFSdTi8TmLYDLs4g947o/aBoc/UGxZdz47AOr5FwEqthme1PQ6NMDOWkWPwe
	Wurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7U7Yfe5CIhgtIUwu2Tk2Zgfa0Kk2VXgDurAvpRecJMw=;
	b=Q+GgqBc1+ImfpPxm/b7zjOk3xt9PI+syJUGBrh7ilNl1QUr9yC1JxnCXR61Zcjbsg3
	LbOkYbdCbQ+94syW3+S4E0l36yYNWanSlGdQBn4l8Q2Gh2iP4Rh7Q6s605nTOeyaOQhM
	yqzido/h+jRgyJux2fIwm9oFsmDLb6hcmlb/MLcQ6k5TNvSev5reRphYJjVqgg1CG9kX
	496aJudroYpb1jKWH4eqBq2hh7gn33ZerMmGlyihwqJ5wYL9tLL/XBpzTmAlFA6krU4N
	st91JLncxsAMre9fARAiyR6tKcw3Sf0/xRo9CksP180FOIovyqiMs+hJPNEZXweIJHvc
	FKqw==
X-Gm-Message-State: APjAAAW944wxoDtZRNkPAVf5lDEGhvZeZxLI8JbteatEnLjEDx43cVte
	sK3nmjcSPpex1AuFDKYOZWw=
X-Google-Smtp-Source: APXvYqxXwT9yowajZcJ9K/nBCY5YPisgi6FJKlJWfX6yENKlOxjwHFvyt2PcaBGfwI+75uW6jP8wVA==
X-Received: by 2002:a05:651c:20b:: with SMTP id
	y11mr2732491ljn.161.1571321456477; 
	Thu, 17 Oct 2019 07:10:56 -0700 (PDT)
Received: from localhost ([78.133.233.210]) by smtp.gmail.com with ESMTPSA id
	g10sm1039496lfb.76.2019.10.17.07.10.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Oct 2019 07:10:56 -0700 (PDT)
Date: Thu, 17 Oct 2019 16:10:34 +0200
From: "marek.bykowski@gmail.com" <marek.bykowski@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191017161034.7126719c@gmail.com>
In-Reply-To: <CAMKF1srjpre+zbi6Q2==McOEvV8njBdzqOf8nGxor9NN5tMoig@mail.gmail.com>
References: <1571141621-20235-1-git-send-email-marek.bykowski@gmail.com>
	<20191016104557.GA7998@localhost>
	<20191016142112.10a645d2@gmail.com>
	<CAMKF1srjpre+zbi6Q2==McOEvV8njBdzqOf8nGxor9NN5tMoig@mail.gmail.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-oe] [PATCHv2] lmbench: Fix/clean-up the build for lmbench
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
X-List-Received-Date: Thu, 17 Oct 2019 14:10:56 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> fails to compile
> https://errors.yoctoproject.org/Errors/Details/273942/

Thanks! I built for x86 and it went just fine. I have an aarch64/and mcpu=cortex-a53
toolchain as well, so will test against it and will resend after corrections.

