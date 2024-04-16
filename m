Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE9AC04FF9
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 13:55:12 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.21385.1713275707194247902
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 06:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=nAODvSoQ;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B325788261;
	Tue, 16 Apr 2024 15:55:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1713275705;
	bh=SZS6IQNIu5RaHiY6Ijee+PIvkaRJ4/aj1jHqxH3WmgY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nAODvSoQviv45DT/CTbr3Dwb2Z8jfeqAXuCZOgwVXSVzrVzmQrEFFhlDfWbvbk1tH
	 jBeBCLJ+IgaGE5qVBL+fKrYzBp8nupjhhd/71c/ZVkuzGIExb1ioZL64OmAkkdpUxr
	 cDoSdwyXZ2enTyljJRlHiuMx632aKP4egPfAP6zIlFto6Y9AT5wOoq50sDz44MjOb3
	 m/cd5Itd7cRSchodaZ1NL/KDrUTvoV2ajfs8vf/Dm0Axl8tO66Au2JsFzl5Kg9QTMM
	 RRW2DUU5BF4EKOugw1VsJOhEp3xoTAyNeav75nh3QJQb0LQ/MRxRunq1ZQQuvuyMFs
	 E8swH4Z4fmi8g==
Message-ID: <743657ad-53aa-4fad-b4e7-ae4ee204984a@denx.de>
Date: Tue, 16 Apr 2024 15:55:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT for
 scarthgap
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240415131443.7295-1-marex@denx.de>
 <CA+chaQcJXRzwTd4Hh=2gYZ7aQQDw3DAFSFq7=KH67-dhgODz1A@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CA+chaQcJXRzwTd4Hh=2gYZ7aQQDw3DAFSFq7=KH67-dhgODz1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 13:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109978

On 4/15/24 7:48 PM, Martin Jansa wrote:
> If you need it just for some experiments than feel free to use:
> https://github.com/shr-project/meta-python2/commits/jansa/master/
> which I've already updated (for built time benchmark which
> historically included qtwebengine as well
> https://github.com/shr-project/test-oe-build-time).
> 
> But for anything more serious work with your customer to switch to
> something more supported, there are still minor upgrades to meta-qt5
> (last in https://github.com/meta-qt5/meta-qt5/pull/556), but it's a
> dead end and switch to something else should have higher priority than
> switch to scarthgap (e.g. switching to meta-qt6).

I am aware of qt5 being a dead end, but I also think if making this 
stuff build with scarthgap is a one-liner change, I don't really see why 
not enable people to build it.

The security implications have to be considered by the users. Maybe this 
should also be spelled out in the README, for both the meta-python2 and 
meta-qt5. I can send such a patch ?

