Return-Path: <jbrunet@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3239C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 18:11:03 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.11012.1637172662167141299
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:11:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=1lkGvQhG;
 spf=pass (domain: baylibre.com, ip: 209.85.221.47,
 mailfrom: jbrunet@baylibre.com)
Received: by mail-wr1-f47.google.com with SMTP id d27so6366878wrb.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=6WHdB73v92ymdErqflp32A60hdP0nI1KpNk0vncaPOs=;
        b=1lkGvQhGlc+q4Om3UJlNBAiXgCBZgGasEqzVS2yM85oSZmH+mSyMVoBBEpv/ZK0Sm9
         fc47TIJ90FQzUhxia23FtqlLkHzcTbrFROSghr86Z9H3Ns9S+U/dKkEMymaYcgZ98CqA
         0T36HtckTeMYaFUGwi5cibWIAw1GpEWQ8hGJeTWren4lDvZApTroTrkd+hvTaq+n/A4f
         b3v3TTCb9B1CY0vEET0RRlko9Aot5l1RNWeP/TGmrdtKmgymOP/RuLrH0UXRMBbM72fh
         Gzh1+iRDaex+twsx4zy3z2R4A9KGWXE3iLgtojzyqpWoMPYjLC98M8XHm7lloHucLp8N
         7CPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=6WHdB73v92ymdErqflp32A60hdP0nI1KpNk0vncaPOs=;
        b=HrytQEGGd6xYydjc8OLyTfVCkzKE9Vbu+94YauPO+SRUNMhdZwcEgAxGpYgw8fr18L
         DeNJTWiJrR41EbJz7E4mRkNzJcE3fmS8cgeLQTlDdzILO84nSRIE7DpHhXJfJTBupMGV
         1pMWMB6Vqne70AI8Orza0HvAMG7FwPJRdeezjCq3wVBamhboaQZWiF4O6SZhVTLPNS1P
         tTNXNJPPHXr4askX7Kfilr+qDo3+LEInr0oelXsNUuOtjf5vmm46ccYt43fkQloI1hKY
         3D6JlB/3Gmji5Y8+lUGXVphLApDx4KWI3FjE3dvD8bo7EVc9IeLJ5kfLPPJWNdDGnlTF
         oXgw==
X-Gm-Message-State: AOAM530QxUj97f5gZIamvLP6bUI3Djim6WgeClwHc89y9HZbTPy3j+fW
	q1QkQepPCxg/8CpekSyS8dvYLg==
X-Google-Smtp-Source: 
 ABdhPJzd9uA9uMeLI1PrR0tcAmHkMV1R96eNqVkKujzMJTaY2sSzoHDx3+MaVesWJ/zCQ8S4F2C1lw==
X-Received: by 2002:a05:6000:168f:: with SMTP id
 y15mr22431926wrd.61.1637172660175;
        Wed, 17 Nov 2021 10:11:00 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id
 o12sm1065447wrc.85.2021.11.17.10.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 10:10:59 -0800 (PST)
References: <20211022151212.268140-1-jbrunet@baylibre.com>
 <YZUsu/w5bRkoZdG4@ltleri2> <1jilwqpuzu.fsf@starbuckisacylon.baylibre.com>
 <YZU4gC8iJXFaNrTd@ltleri2>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCH] openjdk-build-helper: fix arm64 build
Date: Wed, 17 Nov 2021 19:10:35 +0100
In-reply-to: <YZU4gC8iJXFaNrTd@ltleri2>
Message-ID: <1jh7ca1wlp.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 18:11:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94009


On Wed 17 Nov 2021 at 17:14, Richard Leitner - SKIDATA <Richard.Leitner@skidata.com> wrote:

> On Wed, Nov 17, 2021 at 06:10:02PM +0100, Jerome Brunet wrote:
>> 
>> On Wed 17 Nov 2021 at 16:24, Richard Leitner - SKIDATA <Richard.Leitner@skidata.com> wrote:
>> 
>> > Hi Jerome,
>> >
>> > thanks for the patch! I've just applied it to master-next and if everything
>> > goes well it will be merged to master after some testing.
>> > If you want to see it backported to other branches please let me know!
>> 
>> It would be great to have an hardknott branch and have it on it.
>> Having an hardknott branch would help with override syntax change coming
>> with honister
>
> I've just created a hardknott branch with the same head as master. As
> soon I've tested master-next I'll also add it to hardknott.
>
> regards;rl

Awesome !

Thanks a lot

