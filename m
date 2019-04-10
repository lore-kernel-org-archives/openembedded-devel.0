Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id 204C57D935
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 15:57:30 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id k130so1541775qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 08:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t+3BcAf2eubNAnW4r3y4v5XBP+aGKcZjyk4xMw+lPJM=;
	b=LbgaB7WbMJdnNw/iPEmQgXpLHcqJhGQApgAqfbMU7VkHkFwpW0CHx/zTnSBtnvQ7jz
	2KKAMljAD/ZyQOQh/wn3CF9ZWipyUWCwHS1YRMx/pQsNDE9y2bwYiqLGhTk42Ek+n6oW
	To1ypQX+LjooCCstlhd/TKwk0UpHpGMCkgU2SshfPtB+MQWTZVtULG2qJ556q4RkI0YG
	2Y2EnncNmYoT2rjgu6YtxlCyR1zaLy1EjhTKjAa9S4gFWf/APQVomnmpe2WA3JBKkYXs
	NROwdNG4x7uHrmBDBk3EpNnc76vo0ksZs85fjeSh7oKt65tYfVqI+tzfO3vl845hHoYb
	14NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t+3BcAf2eubNAnW4r3y4v5XBP+aGKcZjyk4xMw+lPJM=;
	b=dQ0Yb1erTxI6YjhY7sIKjYjDUopDreUtK7Te6VdQyw3Rx9aC+uUCrTUNiQUmxZSVBd
	sHwjbc6CeNkefid1zm6H2Mm1oCUSh4qR7vo4ElkJ+5ZkJBMYvNtlalNWjLaq4CcUbAH5
	yuExHMuQexvwGNrdeydxPZvLjNjJHLbGjnuv5OjXcpWg2KHbSsdIz2eIMuZCKSFxkPCo
	22tQp7I1Irme+Adx9phvSbXobG33DzSOzjs5qf87/QyKu+ImTR9Cmmo2x5sqOAKgCE7z
	OwSJi7CeITR8Fb0ZaQITeLZ5ulFe1oTJDOOZnG/8Qe8+s4GkiyeQ0b4dM1aG6MZ0oR0K
	+IFQ==
X-Gm-Message-State: APjAAAV9wtYwPGYQd5s2mh7SuMtNKyIT1tkdvtRlwB+YEJN4ojaxY/lB
	YMOLsK/o5tZsaHSFeLDrQTkH2179jqc4jwXtqGQ=
X-Google-Smtp-Source: APXvYqzAF3OEkSYfwJeN5U0u8aRH6amLtHoJz1s+vXXF+sWxDMW8hduLgTRTKKsflPSGWsnafQPyarfn11fnHRyzu8A=
X-Received: by 2002:a37:9d84:: with SMTP id g126mr32449787qke.22.1554911851743;
	Wed, 10 Apr 2019 08:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAMSkS0hfFUKN4Z3hQvindomzUeTnTJpmQeNVmTMOSG2+jstr8Q@mail.gmail.com>
In-Reply-To: <CAMSkS0hfFUKN4Z3hQvindomzUeTnTJpmQeNVmTMOSG2+jstr8Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Apr 2019 08:57:05 -0700
Message-ID: <CAMKF1soBXtA5KpXprtEydJ-qC6tNSymvnNczFDLL1+eRzuDegA@mail.gmail.com>
To: Ram Subramanian <ram@meraki.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Will a commit currently on master make it to a specific future release branch
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
X-List-Received-Date: Wed, 10 Apr 2019 15:57:31 -0000
Content-Type: text/plain; charset="UTF-8"

we have not yet branched warrior and it will be in warrior.

On Tue, Apr 9, 2019 at 10:29 PM Ram Subramanian <ram@meraki.com> wrote:
>
> Hi oe-devel,
>
> I was wondering if the following commit that is currently on the master
> branch is slated to be cherry-picked to either the (upcoming) warrior or
> zeus branch(es) (or both)? I noticed that new branches aren't always
> created at the HEAD of origin/master.
>
> b42de097d - Pascal Bach - squid: upgrade 3.5.27 -> 3.5.28 (4 weeks ago)
>
> Currently neither of those branches exist in the upstream repo, and knowing
> this information will make it easier to plan for it accordingly; especially
> since we're close to the next release going by the yocto releases page.
>
> Thank you,
> Ram
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

