Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (unknown [209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id AFDF060E79
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 10:49:14 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id l6so7636212qcy.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 03:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=k4cMpunJk6qMJjTvNgkyFtBV/kZ4JAO+kvwpgPlojZc=;
	b=ilX0aOArn/0rhIbkHypFwLgEKo0Y2vpSpE28cug1w1glU4Ly2eZE65sm0BesrmF9HJ
	yIFA0owyNOijghgBv+WLNLvevo+nIPa3iOJPm7X9jcDE9aNut6+8htMCtvfTothQEJky
	MyhIUTwdvmCWHUkyBAUAsfFAPIzq6z7LNxhz/Wif74vmeMJ/Nqv3vltSiP0lbgvnStqR
	Iwrs1OJzYK+yg57US9eQ79+40IgloNrL3Nwj+F7iG5y7rdWohSj2cxRwvu9+BBh65bot
	tNvhZa7XmiXMbGUf8ZzquaycNgklE4IbJOIXAv9I/Jq+7KpZTRNUeitj6zU6HC7l8JLd
	0UuQ==
X-Gm-Message-State: ALoCoQmAl7GIvDn7Iv7XKfZphVfTRwJACCgXcmnLGRpSLntz74yZUhsXzr+u4TuK9S1nDfqs3Ibo
X-Received: by 10.140.28.3 with SMTP id 3mr35419387qgy.71.1399891755522; Mon,
	12 May 2014 03:49:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Mon, 12 May 2014 03:48:55 -0700 (PDT)
In-Reply-To: <75b920fb6189f84ff81fcfe0b89747f18079ed07.1399888012.git.Chong.Lu@windriver.com>
References: <cover.1399888012.git.Chong.Lu@windriver.com>
	<75b920fb6189f84ff81fcfe0b89747f18079ed07.1399888012.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 May 2014 11:48:55 +0100
Message-ID: <CAJTo0LaeVp=h34O9=RFU2mR54NhBsEH1fMyq=kgJHt21EPm1jA@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH V3 1/1] dbus: Update to 1.8.2 version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 May 2014 10:49:23 -0000
Content-Type: text/plain; charset=UTF-8

On 12 May 2014 10:50, Chong Lu <Chong.Lu@windriver.com> wrote:
> Upgrade dbus to 1.8.2.
> Change install-ptest rules.
> Remove unneeded patches since it's included in new version.
> Remove unrecognized option: "--with-xml"

This should go to the oe-core list instead of oe-devel.

What testing has been done with 1.8.2?  Have you tested that the
system and user buses are operation both with sysvinit and systemd?

Ross

