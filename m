Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id A4D3F7FD81
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 10:09:22 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id n11so2360935iom.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 02:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6aUc1nRxRMgYWF/Ov0VqEZ+Hzc2e8c8pGlTPGJ2oadk=;
	b=meLMpNSzUwEPenlGZnRej3aPClTg6TtMVtOR2tMYJMNceimZnF3QKU2evLKG6eJeLF
	z+DOH8yjHxSNCvx6//8zM3JwZ6XHSt0pslks3jnI/xsnrlrAF5Cie5xu6yfYirqnq6E0
	AEbAapAmeNJiFgqVoLfWtGucXo/kVUV9vQXSX3TlyWPuPNvHuTx0w8JoL2Drlj0WlTZ7
	qaI7gnNONnAth1iQiaRA53LUqH2caTAfomoUzrrPm95oj2/OWbcnPPOdC2JK1etqznaX
	OphuSgjYPT6IvQAzB2lCjGV6l2fEsae/lTm+Qhqtu91KxGMz5IMBl78kCzkTBfybH5q8
	BZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6aUc1nRxRMgYWF/Ov0VqEZ+Hzc2e8c8pGlTPGJ2oadk=;
	b=qQqcxBqUhMSL5Nw8lZtR2qWSIv31HN7P361PfEHayNZy4Rb9QBhqpPTtJ53ks38MwW
	MeP4KFF6kCyePQwk/iliHt3B6fSNUm+TjH5tLlg9reLHAAQV9G64lb3OcCSxK5J316cl
	otlnBosvOOPEVqLc/lbcBTxYoLqfTd6tmyQ0RmnR6HPZahZsevLzMpDLv3I+WGWmbP09
	SCldMkvvSGQCUNYgMSaRrrrZWUuanuG8X1q9mF4Z/MCZfaZNdXn+BscwxFN1CsX1riay
	cF2zZPcoYu9ktd1Q6uenRK/CTPitfQpEgdiqP3aOLPNdLkf7GF8T7cXVIEq46j+/5OEc
	yb2A==
X-Gm-Message-State: APjAAAWl7f70eUKl/HOaz1J5p8BqNi+/srxtiN+gBgV+ygKUv6FV/ZF5
	Kk1+BMFEVzYJThchkiHygWBI5w/hG/8mpm1OPWE=
X-Google-Smtp-Source: APXvYqwGTm5ftuHSnRsSoKQzjfxNZRvzH9RKR6Trh/Waver+IkQ8yCkLrGdavnLH/WH+lbVYKKYC/ebRJ/sWCsSjDZM=
X-Received: by 2002:a02:c558:: with SMTP id g24mr2482217jaj.81.1579774163668; 
	Thu, 23 Jan 2020 02:09:23 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5TV_6f7PXF6Q_TE0ii-W9xG9xgrO8p8OP_vb48HW=DugQ@mail.gmail.com>
In-Reply-To: <CAO5Uq5TV_6f7PXF6Q_TE0ii-W9xG9xgrO8p8OP_vb48HW=DugQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 23 Jan 2020 11:09:12 +0100
Message-ID: <CALbNGRSAYNsQkWMhNAfxVqnq4bYx2=mcqMxQpxvPampLFyKazA@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: systemd failing in master with Assertion clock_gettime(map_clock_id(clock_id), &ts) failed
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
X-List-Received-Date: Thu, 23 Jan 2020 10:09:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 23, 2020 at 10:43 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On the offchance someone's tripped over this already/has pointers:
>
> Around the time python2 dropped out, I'm now seeing boot failures with:
>
> [  612.151548] systemd-journald[543]: Assertion
> 'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at
> src/basic/time-util.c:55, function now(). Aborting.
>
> I suspect it's unrelated to py2, but that's delayed me getting to the problem.
>
> The board I'm targetting is AM335x based, but without an RTC (which I
> suspect may be relevant).
>
> Anyone seen anything similar?
>
> --
> Alex Kiernan
Hi Alex,

Have not seen that one yet. Will look for it once I can build images
in current environment (python2/Qt5.14 broke loads for me). What I
have seen were problems with timedatectl <-> ntp. Changing from local
time to ntp-sync did not work: Time remained un-synced on recent
images. Machine was Raspi so no RTC either.

Don't know if this is related to your finding...

Andreas

