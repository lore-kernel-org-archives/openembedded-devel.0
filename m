Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id C39FF7DDA5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 13:54:41 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id g13so33582776qtj.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=68DS8GZXhvzYcBStCimSbx1iMbOzdVOdEGQPwCci+AI=;
	b=sSfTy/L3NzJcbr6PV6FgYbleCM+Ie+xjlkTuIWV4eLaTYve7kx3z7Rq/1fwHVAxzrD
	ulalCu3jG/geWY55vYYo3k0j8BoyhaNoop6xfSeXOW8Yq1gDSg7QOGZq7VECYC4zewl/
	xqR4/x/a7Xoa0w/547bzBgEOiCf7B3LBjgM8/bnZhqRs+Bq8h3OWBipyGH1TtjiyprXY
	ec81X4DWtLYUOlHnPZyxyz4U2O7n+P3kepBN9JAr40+Tr4N9iGzq+zs2xo9FuOAN7gVj
	BdqWtP/V1m9/eT42FGWGIEvi+ES0QHNRc+C56tToffZCvE4NwpKzAesalZa1JHHML9GE
	Bd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=68DS8GZXhvzYcBStCimSbx1iMbOzdVOdEGQPwCci+AI=;
	b=gRi3eIkjm+CjcxyrdQZeoxQn98lcmykX61VXtlTWeq0vAQTnlFQMH6uBX8IByBR3xA
	tVEy0LZPXGDFlOL6NeCliExoptoBVzQnKuAG+HkCTetDtFslJnfAUKdwN0j+avHCb3hO
	TMCy4/i+tis1nZfpPdHqDm1ydcrwy1IIotWBvtGlPJvlIZ7LI3J5Us0ssJ1RPrnMVb1c
	5/4D80p2aYkeELyOMWA9CDFaMK8pS2pJ6eGEKCdvYZrh7Zm7sdBDdCzcKW+eRzD7wrLY
	hMX+h7jckaRLdqoz3efcsB93acCfk+63K3G54COjiPLwHLYoWe7inuvQBTB0+W8j58X5
	69rw==
X-Gm-Message-State: APjAAAXLFUu8g/9Wfy0aOE9n3vcc4BZBS/0+nfhd86I18ATQArHKJt4F
	aPLtXBH7w7AZXiqEuaDyyiYb9ZJjo5ZHB7dyQl0=
X-Google-Smtp-Source: APXvYqymZuPjzuTBwKzFq5rcdwkfffhpLQ3VSd97/a2yzzTNUiO2vIhhul5LMQ0xPo+HBPeqqg0orq8pWHSNbaGKTWs=
X-Received: by 2002:ac8:1103:: with SMTP id c3mr3098492qtj.88.1568382882433;
	Fri, 13 Sep 2019 06:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <1568379265-22706-1-git-send-email-trevor.gamblin@windriver.com>
In-Reply-To: <1568379265-22706-1-git-send-email-trevor.gamblin@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Sep 2019 06:54:16 -0700
Message-ID: <CAMKF1so4CM9VfcCK_1nnSTZM54n0PzD4_vWEkP_az-k3sDD=sg@mail.gmail.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] openjpeg: upgrade 2.3.0 -> 2.3.1
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
X-List-Received-Date: Fri, 13 Sep 2019 13:54:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 13, 2019 at 5:54 AM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> Upgrading fixes CVE-2018-21010 and incorporates other bug fixes
> from upstream.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../recipes-graphics/openjpeg/{openjpeg_2.3.0.bb => openjpeg_2.3.1.bb}    | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.3.0.bb => openjpeg_2.3.1.bb} (100%)
>
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
> similarity index 100%
> rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
> rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb

a simple rename does not help since its uses a git based fetcher, I am
sure it will have to also update SRCREV, otherwise effectively it
builds 2.3.0 in guise of 2.3.1

> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

