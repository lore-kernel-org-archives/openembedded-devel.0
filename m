Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id F220A7D644
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 20:48:45 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id x7so6157165ioh.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2019 13:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5i3NvkLDSRza75lVLUt+oIiWYv5QKaWz3dFh7Eoun00=;
	b=Z9GysbPwrfHbLzRNcOOs0Do+/v4SXPeB2LnPYNweBzrAMV9GGHK+dgGuBhKZ8dPD4V
	FwbieUrnSQMUhHS4fOrP45o9JZCZZAJBM854nZe/t2ooxZLtc4azJXdIXK4ZOxStuvEL
	sih5ZgowgTxxlkfRg4AR4kke5mnAHRBXeLWI+xn5FaLcIX5+FZYY1f97R+Uxiq5Tx9WM
	kLgYGO40ae5UC9Iz1J/1o6tHVx+ORprtp++rzEcwMVEtU/yeOqPqFwbj5YXZsn26yqAH
	MYCR4yEjwL8st84jz5mu4emI/C4YCQmk1utWEHGNAx1G2eHiApd+RLIZPOvqys+Pwyql
	70jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5i3NvkLDSRza75lVLUt+oIiWYv5QKaWz3dFh7Eoun00=;
	b=r4cUzTf+bBShSfsLcBfPu3zJAI0ukNIgE1R69ISUrrVn1WJMFcrzHaq1KFclBABecA
	npRzt8YjDuAMl9bzg5/H5S+EEEGUi5mjNV6pPcxZAMrld65IC04tquDoDRKIQVxywttK
	dmChCConSrrXNlPASvwjWjbOEFqrPqEcneL1Ni0vvmvvWj0lOG/tGhKKEvMxQ4KNisDu
	VlPKdydhvWqMx6uBTVVpbC3BqMa78uxtVPBcNWFhAYEScAPm57AuIY/jQ3lN6ujX+EmL
	sCxwQrjk/T2ielHdtMlRbykD9bm5zBjaVW5TVjDgriihFog0bL3Njftx0dhXCOiZ5jCY
	YesA==
X-Gm-Message-State: APjAAAVsGXOX1afAJkypb/yMobSQoakzWmiVlgfGkA+p8rGDAEpueBsk
	/OmmDqxTerVuVYUKA3KX3TjL9+Cz465Gjiziugg=
X-Google-Smtp-Source: APXvYqyeCQql5NagGKfAFiUB56swA9MHxfznRg8Z5Ts9ECdh4CgojNk3Qq15kmcCQMMV3hX7OFWNiJbYqVXpC9Q+AAs=
X-Received: by 2002:a6b:e50d:: with SMTP id y13mr9904188ioc.142.1554497327070; 
	Fri, 05 Apr 2019 13:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190403234608.20046-1-schnitzeltony@gmail.com>
	<CAMKF1sqZteXU-r2Fm9z=cKBcDg8hreVtHoN_46uRnShEEq2STw@mail.gmail.com>
In-Reply-To: <CAMKF1sqZteXU-r2Fm9z=cKBcDg8hreVtHoN_46uRnShEEq2STw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 5 Apr 2019 22:48:35 +0200
Message-ID: <CALbNGRQAne9FYqNN+bYtK4sDMU4Rr=Z-Q8UKsOSrj=c9vBXhXw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gnome-desktop3: remove gconf from DEPENDS
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
X-List-Received-Date: Fri, 05 Apr 2019 20:48:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 5, 2019 at 10:39 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Andreas
>
> I am seeing this
>
> https://errors.yoctoproject.org/Errors/Details/235565/
>
> Maybe turning libseccomp into packageconfig and disabling it by
> default would be right thing here
>
Thanks - will check

Andreas

