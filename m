Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id F3A907841F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 18:22:53 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id q189so1751513vke.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yUYHHzYppCLFbR5PPfLD9AvytaSN73z/EFwvo0Z1wHg=;
	b=IvL5++PFJgnUqk6NRgGsruMcmcFIrbs/l1pOJJiRfUJDcX5WDAnwyevvXrWg1VY4E3
	hMzRiuFc4sacQ9p+KIOIX9psMslJRUlQ3gQ/VL4ufBDDTUXpVZatT8Km9ZNlpYCLJQ2Z
	QsbqwX0w9Ar9uM2C8VJ6mpaR9suSa7kbf/6zBQEF+XbcGmq9Yhst3TWjohGYj7/JIn+o
	YuhM9lmvrHp2cVOiPZziqoxeD+g6JQezvMo6c2RLsMZQA8zXv82dhuB9cjG9FrpZQ6fP
	NX/C8WJiKW4+Q6WCwiGlOPCO+VZtjyLbk9Kx61pcKsPpDr2z6xXO915zVnvoI0O3+l8Y
	6dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yUYHHzYppCLFbR5PPfLD9AvytaSN73z/EFwvo0Z1wHg=;
	b=g3tkEvsxcoBWgOjP7DKq7iNr5p5ErddIkJ9GUcy3AFCf+bF+KrZgNZsTbVQh4pbaZZ
	xKV20D6sOwEvYFvIjnJlHj62+qBNjwJ0qxaiGCrhVrZgf2Ta5MXahkPvZxl2u0f+MlYN
	20y8fZF9xaxEZNhjppr3MPEfad8K6chIeFRh9paG1psB9cjwUtcWQsSMmzTkfjLrYB7V
	J05lSHJzvEEBKGxD5eNfTSCUGJi+092HPvuB5Bo2zaBO+JFFyxTqH6ZxeC4W13dAO5+0
	nIcW8T5yJdN64CkG3GaQBADuUzIVtsU0Nz2nAzzSFSNBHdEGziIFcKTxqYdWCiqDQBEL
	h45g==
X-Gm-Message-State: AHYfb5gau/lNcH04mJ6lJkir5z0uKW2ojScYv/FjmwrsJna/SH0+4NR7
	gKf1J/l3dvOF52HHqUnJcsAtQVNysw==
X-Received: by 10.31.156.135 with SMTP id f129mr7714934vke.90.1503685375134;
	Fri, 25 Aug 2017 11:22:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.50.144 with HTTP; Fri, 25 Aug 2017 11:22:54 -0700 (PDT)
In-Reply-To: <CAMKF1srQvTMq5Z5B=4gE62LRPMQi+1Azc5dZyn2+hiT1nSdCXQ@mail.gmail.com>
References: <20170821210259.20276-1-Martin.Jansa@gmail.com>
	<20170821210259.20276-5-Martin.Jansa@gmail.com>
	<CAMKF1sor29cpSkBMq4wm_OECGZvMLK5J1QWNu6Smqf9KqPBetA@mail.gmail.com>
	<CA+chaQdw5eRR40rkOsq8VMkLVyvG_mf=3jGgppeZ8SCQ0jxy=Q@mail.gmail.com>
	<CAMKF1srQvTMq5Z5B=4gE62LRPMQi+1Azc5dZyn2+hiT1nSdCXQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 25 Aug 2017 20:22:54 +0200
Message-ID: <CA+chaQfyYC4M0B4YZx8qfGQSqHem=3JsKoeMYfGCgUZcGtuYGw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCHv2 5/7] qt: upgrade to latest revision in 5.9 branch
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
X-List-Received-Date: Fri, 25 Aug 2017 18:22:55 -0000
Content-Type: text/plain; charset="UTF-8"

It's here on ML or in jansa/master-5.9-rebase branch

On Fri, Aug 25, 2017 at 8:14 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Aug 25, 2017 at 10:28 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > It looks like you're building 5.9.0 not 5.9.2 from the patch where you're
> > replying, can you try if you can reproduce it with 5.9.2 as well? Maybe
> it
> > was already fixed upstream.
>
> is 5.9.2 in master-next ? if yes then I am on master-next as of today
>

