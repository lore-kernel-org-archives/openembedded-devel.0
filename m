Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id A43FB7D412
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 16:05:44 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id y5so1533397qkc.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 09:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ygZlgXZFQWb7/L08krDa5gsw9SFaF+ND/Zfyjxbya3U=;
	b=oq17keh+KIO6eyMv/XmWMKkGPrayLWw12JrjC1hexQYNWXU7dua1joOmD/0c10kWYX
	xQUPtRg9NsJLlCUGee+DD9uuRdh0nyrEDhNNI/jb8dVw0TafpgDh82Ut9SvnSRu2blUM
	M8c4E3lWd8Vnq4ISIugsb/vEjMvMAJFKb/u8HXT8dMagLHNR+GQ7/JC1futGDDeJpWcn
	ovJE91aTdZikhLPtvvyDbprON0IjlDZVbwheXsXfrbWhp8WJfQLKjg92lOBbYTwvuK6o
	j24LCY7uUC96ExLDIKwsCVlud+BzE+Xei6yW7mGyRw09i7eZlW4qRnrgfbSnXMjX1s8Q
	kBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ygZlgXZFQWb7/L08krDa5gsw9SFaF+ND/Zfyjxbya3U=;
	b=UPssHzQh7xZ5nCEt09UNmSSFdqea55jZGPMVoIEWnXKECrbjGG9rc9Pg1N54JWxxQR
	hC7+x/4ojOUHGjdu+3Sjm8wQ5V4WNeMIZPNBELZBw647OLGsyMZIZoefRhulsXNUuNYK
	GliKN1yHbZaN+FxVYyjBRDoIVuvk3nXJ3U3Wm49x55/ZUUf2/joxBNKrWUx68/ZEKshk
	2rGHm1pCB47i439j7FzX1pZA7dhtbrqCOgKHOxQGvx+7N5GeLNwHgkueDpO2Xp7QY5EW
	jsznWyalX6ZyKvBMs/P7YWgDUDDl2TFdYal0dU5XtmlvjcIpOuMbBYvlhThDP8n3nuel
	y4mw==
X-Gm-Message-State: APjAAAVf9IHB+TPBWjnr6xyZ2wAyn+lbvhbo+DiTExZzCxmmJIvcgg9Z
	vDEMAZKeDrtiG0xFx4vaU/fNQ4oIvzh7eAiq1Xd0MbCE
X-Google-Smtp-Source: APXvYqyUnk//PKEhs7Ga/6ymObkKcbzD8r/4vBh9JmS8xDBIl+4dhY+sOW/cKYiHxZZIUkbLKfjMC7+MgI+Ro4+kaMo=
X-Received: by 2002:a37:7b02:: with SMTP id w2mr33299169qkc.225.1554912345359; 
	Wed, 10 Apr 2019 09:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <d5eb2bd0-173b-79b5-922c-a1f0fa097552@balister.org>
In-Reply-To: <d5eb2bd0-173b-79b5-922c-a1f0fa097552@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Apr 2019 09:05:19 -0700
Message-ID: <CAMKF1srN+kBat8eKj_tw_7y_pv3zWWjAu92L0abCYQFSnfGXcA@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Scipy, this never ending thread must end
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
X-List-Received-Date: Wed, 10 Apr 2019 16:05:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 10, 2019 at 8:27 AM Philip Balister <philip@balister.org> wrote:
>
> Over and over people ask about Scipy.
>
> I've built lapack and created an image I could natively build scipy with
> before. Since FORTRAN isn't normally built, adding this recipe to an
> existing layer isn't a good idea.
>
> I'm going to create a layer meta-fortran for this recipe and then start
> collecting the wisdom of the community to create a scipy recipe.
>
> Does anyone have a better approach then this for creating a scipy
> recipe? I know people have been really close before.
>

I think this is a good idea.

> Philip
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

