Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6406C43A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2018 20:18:19 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id q1so50817741qkf.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2018 12:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=phZitALG9jSTL6NrPiAmKUkvkOV1hBRZDQ9fStaWYxY=;
	b=A7SzTGyQ0qvcwHgQsm5Be5/ZCYNlN5Xlqmv8DJKuu5TFr8Fa28V9KNuywvjwPXTeiw
	MvlraMOH3SsEhX0nR6sNc0uAQheOanrGHBelmhVOKl9nVlgeiQMA5rw19uqJ3OkXYdQ9
	QM1s/1kWbIciWf+MGa3f9GwSlXYjihjJI1VdFEN9bp32Dgpm7jFQSBAzw8EUWLRL5t9f
	yiBNEmmkLxHqulJ1kRlYPc+hDO4CiwCqcILjcVvMhDkLTt+a8WKvlWOTnrDnT+4d+824
	8ACkWeFP/TWXyWdILJUiAE1v594XdvTfRptOmMTIuuAffYU14jLcaDjDc7APkdfAJzw+
	puJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=phZitALG9jSTL6NrPiAmKUkvkOV1hBRZDQ9fStaWYxY=;
	b=hAFShJGaXECPI3HFlx9BC3qIzcKpsiFQNLXTcT5tC1eG/Gu166xZrU3NCRLuE1lPlA
	/Z+f0I1CkvJXoIV2JxupyAtD9+gUeld7UqxkCTRKSK0ZT/kpuNEia/QlJH/tzWaasD83
	CILM1VhXVP9FBOFiHoju44kP4gEcC3uVsLbhMwVwQmGntzZirQYEug9c+5sURK59Te7+
	kHJcEwnesAC07k/7yh1Zush/AU6uBnV9VYT+xjcYQ17qgojw5kuA2fJsjOGPQk//aJSz
	qCfe7ILrCEBsrjwbJy+CngVoCIQJi5mdyjsII5WbhPLd4LzIvEC/vEK18nsNsif1Ay0M
	XYzw==
X-Gm-Message-State: AGRZ1gKGqg9T5Bqeh3UJY9tm1Pen2+mee+cFRusuo5WnQCF9k0nNjXS9
	+ZvhXLY85YUIR7oXRZbdVA2xB/mXS2+Db4BmIuA=
X-Google-Smtp-Source: AJdET5dUk/GWv2HQxRNuRS6TKlaWHPqJWrSaM19hGPDEx8ANzAN4YLd2qRAClMPfuotTj8M7Ol39BMDGOVDORSMxE40=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr21920141qtn.254.1542658700337;
	Mon, 19 Nov 2018 12:18:20 -0800 (PST)
MIME-Version: 1.0
References: <1542148831-30197-1-git-send-email-akuster808@gmail.com>
	<CA+chaQfCoBFsOzLj6Vdf2tFX4hebD4bpqdXOMU4JstMScnJrBQ@mail.gmail.com>
	<9c0a4188-2393-aa18-6139-d6600d2507f7@gmail.com>
	<20181114151723.GA1417@jama>
	<e9b230a1-7544-f54c-c74c-02900bd15ac3@gmail.com>
	<CADfgfoZt=B2-3JMCdUvNvQdGvtOQYsPvypNB4TU0VXPxQ6sSaQ@mail.gmail.com>
In-Reply-To: <CADfgfoZt=B2-3JMCdUvNvQdGvtOQYsPvypNB4TU0VXPxQ6sSaQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Nov 2018 12:18:09 -0800
Message-ID: <CAMKF1srPp_W_e6ospFUzjNN1d5L6OKUExCZtxV07hU1jqO=7Vw@mail.gmail.com>
To: Michael Halstead <mhalstead@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meta-oe: add selftest for sources.oe.org
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
X-List-Received-Date: Mon, 19 Nov 2018 20:18:20 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Michael for taking care of it

On Mon, Nov 19, 2018 at 12:02 PM Michael Halstead <
mhalstead@linuxfoundation.org> wrote:

> The rsync target on on the world build machine was offline following a
> reboot causing the sync to sources.oe.org to fail. The rsync target is now
> configured to be available following reboots and the sync has run. Please
> let me know if this test still fails.
>
> On Wed, Nov 14, 2018 at 8:19 AM akuster808 <akuster808@gmail.com> wrote:
>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

