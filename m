Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 24E16786DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2018 09:03:38 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k16-v6so2337953wro.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2018 02:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QMH9SDHXyclkhi7vdAEk7JtjETkjaxvwy1JgwiMZJ3A=;
	b=ZaMaP/ER2lb06RZkcB8v/ZATeAKcRMS6ory3xpqpfYxplz3/b7wsz1OVrlNmtiJ34/
	dTdrlIwCCM5jOxVtvzmqaymNtaJ6eOYlTpmAfNUyhCsNtBewK4x8NkbVHnP1AjDHTF+9
	ypod59EPC3VIPweFDsDlbCc63v7XbTPilJmlO7pPtKHwPS8wE+B5Ubc06knYk53Rmj/Y
	P6FMdOXDAIV0Rq/Fk/zatgEf4iuvCZpCYY/m+A6IiMMHAIIa6YPnWpjmv1Qn2qb9M2J9
	zka9TcpSPJTs3RoM8JIWASA2wJAKYP4yg+ZN7ufl04IFEBaART0JuG5sKQDMGZizb45X
	cbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QMH9SDHXyclkhi7vdAEk7JtjETkjaxvwy1JgwiMZJ3A=;
	b=Ha4a4SiDLWeCQzytZv3ecc9G552e57JXDnaXRk4dNwTr4Uk3K2xedV6auUVzlThsNJ
	XxrhuDgGrgq0F5OYp6Q3i6EeFYMd7PXuZhDeV3ak6QdjaX6UMo2isiFv8nTfXK+ljOUY
	brIc+RvNGn+E5jh6dXHvpd4Cw4qyptztT0nqPGpQNTdW0d8HNxCQrXSAzAS77VlN8kC6
	FMtmz5hlKvgxHvp1XtQvM8Vl+Jy0HMB4HnjpvVusAucoonO9muJKub9uMSatsM5v8lW7
	Ob8DV1+ACoD0nF6Tc3cMXx1ySnaQ3CFL4dL16wYCze90PikMupsZwCVJa7QzUdt7LJho
	IdIQ==
X-Gm-Message-State: APt69E3o58GXwevTQyQkLY268nLc7lXqXBR1wPP/3XIfju3T/eukHhaM
	wwwpNkBJpTc9NGGjUfaWnalP+CstYfgdxrSvzMY=
X-Google-Smtp-Source: ADUXVKI9K18smI6Q6ak8o5CvQ24UQOvjk2NQkBXKI4ajbpFh5Jglumo2gSDOQfsGBdDEYWUOnuSF+Jf6L8zoWJZ/oxU=
X-Received: by 2002:a5d:408f:: with SMTP id
	o15-v6mr18905323wrp.133.1529571818818; 
	Thu, 21 Jun 2018 02:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20180529092556.25053-1-samuli.piippo@qt.io>
	<69a631ae-09ec-a7c0-5965-f5372ef463c7@zonque.org>
	<CA+chaQfXaWZvyUqWSE-Zq=nSW13Jwt=GVPhXTj0dVbzVGpebww@mail.gmail.com>
	<d2df5115-8f79-fb79-e761-919fed4cd50f@zonque.org>
	<20180620112953.GA3257@jama>
	<CABXoSoU8YpM1XNNDW7r=9vjhNtuJGwsT9Z+BCHvv7pBA=dy7wg@mail.gmail.com>
	<20180620121927.GB3257@jama>
	<CABXoSoWCCG9CmvyjfCk0BmS2uj3AHVymsBnNjFFk3=g0cA8+ow@mail.gmail.com>
In-Reply-To: <CABXoSoWCCG9CmvyjfCk0BmS2uj3AHVymsBnNjFFk3=g0cA8+ow@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 21 Jun 2018 11:03:27 +0200
Message-ID: <CA+chaQdjza7HgT3W48Jz7kPcfzBgvn912TTmrX_LaPXpbZnURQ@mail.gmail.com>
To: Samuli Piippo <samuli.piippo@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5: Update to Qt 5.11.0
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
X-List-Received-Date: Thu, 21 Jun 2018 09:03:38 -0000
Content-Type: text/plain; charset="UTF-8"

And how is it going to test latest revison in e.g. 5.10.1 branch which
you've removed in upstream?

On Thu, Jun 21, 2018 at 7:14 AM Samuli Piippo <samuli.piippo@gmail.com>
wrote:

> On 20 June 2018 at 15:19, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Wed, Jun 20, 2018 at 02:57:39PM +0300, Samuli Piippo wrote:
> >> On 20 June 2018 at 14:29, Martin Jansa <martin.jansa@gmail.com> wrote:
> >> > 3) we cannot use nobranch=1, because that breaks AUTOREV
> >>
> >> How does it break AUTOREV?
> >> We are using nobranch=1 when testing non-released Qt versions and
> >> haven't seen issues with it.
> >
> > And are you using AUTOREV? How is it supposed to know which branch to
> > track?
>
> Had to test this myself and I still don't see problem here.
> As long as there still is "branch=${QT_MODULE_BRANCH}" in the URI,
> nobranch=1 doesn't seem to make difference for AUTOREV.
> It only stops the SHA1 validation, when you do have SHA1 in SRCREV.
>

