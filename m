Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id D1E9377305
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 11:53:05 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id 44so6913866uak.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 03:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=iuJmP3ygKLx0ywBuPsf4EvhdB5omEDrYVfGpQMBQm88=;
	b=Dd/K52ZdKE88CaZ8Ew/zLhwhzLy5wjpDLdxgrV6uRXJiOH2Df1h6ZWKAhNcNj1l9EF
	cOjtZkV6E4iRjCqH3cm1i0A+w3gWyj1H7oDCZOKrkX2h3J7wlYduHXc2Kh40YuolTe+g
	S+2dgHxArkygpvvVOi/Uf3nF9Eqv83C2Nnef0dydE1NGw+Q3SSRymMYecEb6MYrhJDOQ
	YKiwhrCSbHkR7gvPiBpSB5Ga7n9th30TqAuXEuh9Ux/KMd4YRZaYlKp4vMUCnyyOWgwN
	HO+hRkoCDFfs2g7CC9l5nfAErfUvCHCR3yqOM9xzi980Kq4NdgkjFtcegascc3Jv8WNu
	0GcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=iuJmP3ygKLx0ywBuPsf4EvhdB5omEDrYVfGpQMBQm88=;
	b=K4ReEwDgfjk0i1M55OUcIVW2FqT3n4LT2BUWiEi1mnLUWseTwBulKBmaEwcqa7tL34
	kemBoxm04cNIF6mWOvW0Y+TrHB6DbN+6FoxUPsDVQSHB+A6fYYytrNfCyK595+693FNP
	IOLPCfbll73Gw5n5F5GUkfMhXDQoXHwDMKeP5sHf0a4WYeJDWmcT/Ohx/R6saVwrpVnE
	fyoHXiY2kNFVpA++HfSM1DBPWchRn6nGwc4l9GwhQh8dsTwDHtAYz9UpDxlacMEbwNVX
	o8Hg9UOfgaxbCoJnTfDWl+ngygtkGKX+SQNWIgPMnu3wSD90x/wYm5qohyp6LxF+3NW6
	fQ4Q==
X-Gm-Message-State: AIkVDXIYuNakn+KOYyCgLoNsAr4ueRkzhb7kPDJ0ZAnma9tAsERBi0uRp3jmwS7vt5lLMp1c87UU1MD/N/eVTg==
X-Received: by 10.159.35.19 with SMTP id 19mr8874123uae.47.1482234786545; Tue,
	20 Dec 2016 03:53:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Tue, 20 Dec 2016 03:53:05 -0800 (PST)
In-Reply-To: <15daa04b-92db-cc3f-f0f9-14ac92764641@topic.nl>
References: <15daa04b-92db-cc3f-f0f9-14ac92764641@topic.nl>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 20 Dec 2016 12:53:05 +0100
Message-ID: <CALbNGRTvDGuegSZPiV1E7WteGqjdYQkjfdHtB-dU0B=PT8xzxg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: morty branch XFCE no longer builds, missing libwnck3
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
X-List-Received-Date: Tue, 20 Dec 2016 11:53:07 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 20, 2016 at 10:54 AM, Mike Looijmans
<mike.looijmans@topic.nl> wrote:
> With current "morty" branches of OE-core and meta-openembedded, a build of
> an xfce desktop image fails:
>
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing PROVIDES 'libwnck3' (but
> /.../meta-oe/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin_0.0.2.bb
> DEPENDS on or otherwise requires it). Close matches:
>   libwnck
> NOTE: Runtime target 'xfce4-hotcorner-plugin' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['xfce4-hotcorner-plugin',
> 'libwnck3']
> NOTE: Runtime target 'packagegroup-xfce-extended' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was: ['packagegroup-xfce-extended',
> 'xfce4-hotcorner-plugin', 'libwnck3']
> NOTE: Runtime target 'desktop-image' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['desktop-image',
> 'packagegroup-xfce-extended', 'xfce4-hotcorner-plugin', 'libwnck3']
>
>
>
>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
>
So we need in morty at least

commit 5b0060bbbacf405405e292e8a8e5db9589f63325
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Tue Nov 1 17:28:21 2016 +0200

    libwnck3: add a recipe

    It is no longer needed in oe-core.

    Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


and maybe (don't know the status of gnome.bbclass in morty) - but
should not do any harm

commit 3be9eea720ba70fd3a9e4744401fd268e31731f8
Author: Khem Raj <raj.khem@gmail.com>
Date:   Mon Dec 5 18:36:21 2016 -0800

    libwnck3: Add missing dependency on gnome-common-native

    Fixes configure errors
    ../libwnck-3.20.1/configure: line 13391: syntax error near
unexpected token `maximum'
    ../libwnck-3.20.1/configure: line 13391: `GNOME_COMPILE_WARNINGS(maximum)'

    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

