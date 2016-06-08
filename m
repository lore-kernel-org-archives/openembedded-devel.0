Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 49C4B6AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 20:56:39 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m124so5850691wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2016 13:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ezSxnYcLiGwBuwslyIe0YEKjUWmHfhnqJaHpIm8zGWw=;
	b=lppuGMdQAcFVWCDpbyfg4tB3acmg7bZws3QuO/ZfWjUmJh+7UzugKmlVaak49K+uYx
	JHbJU1dLkFEJ+dYgslQJVD8RjRhS3eSbCfWO73qXZ7MyWgRCEnTkFe1Afi1dQztbC3iF
	/7iNuNwbycaxQa3jZJg9grWbFhBcWjAZ5VKYI4l1lncKz6i43JD014qZC+n4TmHcW9x8
	0RebZjR9PH6voC75ULDxEBqY209+IwkExXs5Gm79ExywkHkDpsIarrmNw50wRmHcRQHE
	Iz3x1HhGM8WnX65hN3s1WZEUwHaTjyayZxbbNKMDKgcH8PTQzrzJ8LnXmBRPPVMOqUUG
	H9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ezSxnYcLiGwBuwslyIe0YEKjUWmHfhnqJaHpIm8zGWw=;
	b=BSf1NNad/g+Ng7JhherIAhXpO+o4mnbyaTvrI2wj65yKsoa1KHT7QicyupELwb76uJ
	OM5T0x4NqDtE6HXeIudpFDJsQ6Zy1K357NKPjpnvBjqRTOsErTmJuZM5pjI9j/1uZSEW
	uftv6iVcgrzaXPIDidZhhtnol0dbqfgXzOeslPETrs+QgA5sWhp8lpAAiTSauKYHHw47
	e7Bzw/Px4uhw7cgStNqEraSFGPicMn03fyni74zsBsAnq+6D7MCpympG+If2WOgYYU3t
	1sMipfPLGSKcJr/UNP3yuqV7S6cp1o659jD2EUTg6JlilX+TCxjz4BpyXqqcaBHtqlz3
	eshw==
X-Gm-Message-State: ALyK8tLtOm4v83polfD4FzR7U2PXvPOysYyTWuUCHLnBpIVVmTn0v0eRUbOv7GL2KeYSu+hrJ0Ga/g7D4ZHeyw==
X-Received: by 10.194.142.231 with SMTP id rz7mr5842385wjb.99.1465419399589;
	Wed, 08 Jun 2016 13:56:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.60.111 with HTTP; Wed, 8 Jun 2016 13:56:38 -0700 (PDT)
In-Reply-To: <nj9u25$rs5$1@ger.gmane.org>
References: <1465288732-2288-1-git-send-email-koen.kooi@linaro.org>
	<5756B2B0.4020804@mlbassoc.com> <nj9u25$rs5$1@ger.gmane.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 8 Jun 2016 22:56:38 +0200
Message-ID: <CA+chaQf_10Sfow=5+TJRCErKUPtU30MopAenRJ7oRgWoBYUwSA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-gnome][PATCH 1/2] gnome-vfs 2.24.4: drop useless print
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
X-List-Received-Date: Wed, 08 Jun 2016 20:56:40 -0000
Content-Type: text/plain; charset=UTF-8

You need to search for gnone-vfs, but I've fixed that typo when
cherry-picking to master-next :).

On Wed, Jun 8, 2016 at 10:09 PM, Koen Kooi <koen@dominion.thruhere.net>
wrote:

> Op 07-06-16 om 13:40 schreef Gary Thomas:
> > On 2016-06-07 10:38, Koen Kooi wrote:
> >> This fixes the python3 traceback.
> >
> > RP already sent patches for this and the other python3 related issue.
>
> They didn't show up in patchwork nor in thunderbird search :/
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

