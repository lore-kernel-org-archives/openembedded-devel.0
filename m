Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 153A979FFE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Nov 2018 00:59:57 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id q5so3206179otl.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Nov 2018 17:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=38BwH/RHn9j0WT6iI3mQEfYwsTqSXGHOpIBximegMCM=;
	b=YRW+HKEs6tRr4o6nDhKEFdEEnGLF23ns+4isNd/9D2rqjymlahXwgbM7WjtuqVMaBr
	8YqF7IFXsNmyX0UiBTe6Ue/YcyEQudhDyHW+NBBG+GXPSzxzSXciumXTuG1BfoGvMH3R
	9tvrQtIowMD0Nc6wD+gUr5nBqUjh8JD5+N6EOS/0RKhvypH8BgGR0wrgT+jhAU+hfTWI
	z9vhd2UQw8JOvMyv30muPnN0NOjmxlDhEdkjAlTk2d8rl/C5jj2KW7RCXs2KSF0eXBJH
	LPwZ9Beb4bCzAZE4KThZTc/51IrU35Ycn7aqbVZeK5usJnx0cKCrzVso4xnfh2Dqj3is
	2fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=38BwH/RHn9j0WT6iI3mQEfYwsTqSXGHOpIBximegMCM=;
	b=M1NP6+4fpu/n5w7QMCoSQMdOCmJ7zYFiBEwUorJkN/his9mXvzpN4ASgMshGBmfRZF
	nC91mj4sx+xIy18VUtXvhkE54Ub6qiM5LCKdWxM+7TA2kOInjrYVKTagrJ0c4o5daXfJ
	zISQsIABzJmVbZUB+RyxSYx+8s1O/5V+IYTB0EK4Sl82qasoLJ5oZ2y1MIctLW4mnPup
	9mrLoW3k5nEtXQnbhTDIKdXodFKRHPJrst0Rb4tuo5t9V11Qe/VJ45rSUWQS3/FZZCgp
	NDsbDI2hKEiw7hnUq6awy4MFLnyQ2bhsxzUkkzsacSIu2zuqhKb5hbbDf9tZ2VhAYMd8
	qDAA==
X-Gm-Message-State: AGRZ1gIErHV5GTNzOUnv7y9Lp7ZXOdcQRpqnP7XSRQCVuc926cwD2nvd
	kyVMw9Ft44VAxazrbt8JhO9JEMWdztv84fFRGEI=
X-Google-Smtp-Source: AJdET5c0tmwcDpcM2AGkoWvgI6k+ZUOGoUEt0e7dA7c5BKZZE485B6bklQmuXS2OEdkl6vv5sa7kVQgAZ+yk2vlfidI=
X-Received: by 2002:a9d:644c:: with SMTP id m12mr8939975otl.3.1541206798906;
	Fri, 02 Nov 2018 17:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20181029094042.14402-1-schnitzeltony@gmail.com>
	<20181029094042.14402-2-schnitzeltony@gmail.com>
	<CAMKF1socj9gmSzX6xMU=_nhZGm_Q2c91F3QpKeLhE6-X8Eo+yw@mail.gmail.com>
In-Reply-To: <CAMKF1socj9gmSzX6xMU=_nhZGm_Q2c91F3QpKeLhE6-X8Eo+yw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 3 Nov 2018 01:59:45 +0100
Message-ID: <CALbNGRSDVQe3vkX=fsQQ0qFyr1EAqxk+gr0wmdKmH48OKh3WwQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] networkmanager: upgrade 1.10.10 -> 1.14.4
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
X-List-Received-Date: Sat, 03 Nov 2018 00:59:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 2, 2018 at 8:53 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> it fails to build with musl as seen here
> http://errors.yoctoproject.org/Errors/Details/198239/
>
> I will see if this can be fixed.
Aargh - Yet another 'Not-Tested=Not-Working' case...

Let me know the result of your musl activities  - really would like to
see this merged.

Andreas

