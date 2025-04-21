Return-Path: <ariel.dalessandro@collabora.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A57C369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 14:21:57 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
 by mx.groups.io with SMTP id smtpd.web11.16133.1745245313158502297
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 07:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=ariel.dalessandro@collabora.com header.s=zohomail header.b=I/PB3KYB;
 spf=pass (domain: collabora.com, ip: 136.143.188.12, mailfrom: ariel.dalessandro@collabora.com)
ARC-Seal: i=1; a=rsa-sha256; t=1745245310; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n0nod2lGNQJj6sf6NPGU+f9YuDlhA2C4DyFZYYGbA9BW/mAH2vq3517vFsDAyb5TZu577L5wFjq0CUTNUwWdibovfZn/gVKTxofYW97dXWOGQVoLb9FUC+L9bQvNfeF5rK+PZT33X145ea6eIJRZvT0e3mveotntFD5Bva9adtQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745245310; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=J1jFgfog2DUROX7/o8Xv7KTnS0bkbGP3Onhc+d2cuyQ=; 
	b=D74Z4gUV71HZyGcrscW1gL17E2O7Qnzqmk5UGW96kpDbNIH4GFbexhK9rQpnyN1EONj1ole72Q1hq/aNIlHccROLO7fcqKZ4BXsOz70n7KBj/MEwPWfy+zE3pidNwLflc5CA8yT8CsNy6a9zD4wSGFEwD52CMISx4ZtLP2Z8QMw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745245310;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=J1jFgfog2DUROX7/o8Xv7KTnS0bkbGP3Onhc+d2cuyQ=;
	b=I/PB3KYBNOKph3DKMApiCuncgwBFzZkvhBZgIV9xE9JTyJK7Yi9VbtuVqwvC52iM
	R4iD03hm697gHum644nR8NVutk2N1MCqbR/jgjJRxV8B8N97mAr+gAJBBT6SZU3+A8i
	kwUS0Sq9pP2xi41/OOcBI12WByAyQ+mOd3Ia0RPc=
Received: by mx.zohomail.com with SMTPS id 174524530795852.86719163603959;
	Mon, 21 Apr 2025 07:21:47 -0700 (PDT)
Message-ID: <ad394b95-4f2d-46e9-9a09-fd8837f2fefc@collabora.com>
Date: Mon, 21 Apr 2025 11:21:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-multimedia] pipewire: Install missing ALSA config
 files
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Cc: raj.khem@gmail.com, schnitzeltony@gmail.com
References: <1831E745EF300249.1841@lists.openembedded.org>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <1831E745EF300249.1841@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 14:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117007

Armin,

Could you take a look at this?

Thanks,

On 3/31/25 10:46 AM, Ariel D'Alessandro via lists.openembedded.org wrote:
> Hi,
> 
> This is a request to backport commit [0] to previous releases, mainly to 
> scarthgap.
> 
> Details can be found in the related commit log and pull request [1]. 
> This fixes issue [2].
> 
> Thanks in advance!
> 
> [0] https://github.com/openembedded/meta-openembedded/ 
> commit/134978803ec5f4e4ae5c1d3311896ccd52827851
> [1] https://github.com/openembedded/meta-openembedded/pull/949
> [2] https://github.com/openembedded/meta-openembedded/issues/704
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116432): https://lists.openembedded.org/g/openembedded-devel/message/116432
> Mute This Topic: https://lists.openembedded.org/mt/112004143/9033375
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ariel.dalessandro@collabora.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


