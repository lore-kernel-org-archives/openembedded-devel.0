Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0C564601A5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 08:57:29 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id l24so18077671uaa.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Sep 2017 01:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OZU7ySv8exhY2oXhr/WXgI539r9rdUqXM63q0FRW/vM=;
	b=B07EUE76E8/imIxCMGhvoB0l/V2u2JogyE7ztz/lj9J3PJbzzp11f2KycXmq+eqs17
	jtdWMLzheYHLLnifODYEtR9NWjzkxxh+JgUSMDc2/S9/nlgs7027zI5eix3sqywrEWhI
	QDmGDd1q3g0h3RW4tfncsXjS40MGhb6NFx8b6mxOFPJ6E6qp4HL7z7iIJd2vEtTE7yXm
	mHUstAw910x1+GX0+pVG/SlBsvqFOOrbtXY8ue95uAA4HJydm7ydMjEn1EPtDtW0IKzd
	I+d1QR6anFUKULRL6tP1xupg1tOlz06f3HiJh+J9Oty6WwFZM+1ScCCIFGvk0fd4vc0Y
	R7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OZU7ySv8exhY2oXhr/WXgI539r9rdUqXM63q0FRW/vM=;
	b=ADXeDyPWD1dhklVV0KzZZNWOKQnhdgn+LCRX5+pVuyBEuhQHszCEP+yAPXyVFC6YbV
	G4pCzmlfFS1YqahnNgtKch8HzQPgbKUy4DNXVRC6f/ZwSUvTprbiE1zg2GPxOGy39iPf
	lU0XMBdFrTEesE/0vUladi61hAJTajkGvLC4zm7aMmUYLgegtcYakU3zil5E/bBuKFSs
	5+X1Za+BjVn1Nv1RPDBz7mlsC6Sp90Ok2e5QEFb6n4SRzDGyZnoRrElFpHhUTLDvWMCA
	mIT8iXDLq3Qt1yGBEmjCxxRiauSDULriaDOZDnnEWTHLzWbky+QslRnD/wV0QYh5RGZE
	8FYQ==
X-Gm-Message-State: AHPjjUg2XQeqlbgk5IvAvp1RwdPrKdfIlTUIZ2oDVO7uTex+lQ3AFWP9
	CzfdG/7dpQYXqPZF7YZbOizkH7tteA==
X-Google-Smtp-Source: ADKCNb6za3eFGVar0+qtzbvF1+bGCz3og77z/Ct3uO7EAn7UXGNxrLNL39SP3Kt8+zh4Q3kEln4/Ac2k4VV95Hc6Gjg=
X-Received: by 10.176.2.5 with SMTP id 5mr1396699uas.160.1504774650827; Thu,
	07 Sep 2017 01:57:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Thu, 7 Sep 2017 01:57:30 -0700 (PDT)
In-Reply-To: <1504725809-12825-23-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
	<1504725809-12825-23-git-send-email-mark.hatle@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 7 Sep 2017 10:57:30 +0200
Message-ID: <CALbNGRTYz=c+_jSJDrUkp5Sa4H76xH3N7G7+7qv3+vRnMNnsgA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 22/31] vim: Remove xfce vim bbappend
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
X-List-Received-Date: Thu, 07 Sep 2017 08:57:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 6, 2017 at 9:23 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> Changing the behavior of a recipe by including a layer is not allowed
> by the yocto-compat-layer script.
I have a question on this: What is the yocto target for this matter?
Will there be times that a layer cannot change recipe's behavior
anymore? Background: Personally I don't care much (yet) for
yocto-compat-layer script - am busy enough to keep my images building
and running with the functionality I am interested in. But if this
will be forbidden by design in the future I have to expect further
activities. Not to be misunderstood: I understand why this is part of
requirements and only want to know what I need to put on my personal
TODO.

Andreas

