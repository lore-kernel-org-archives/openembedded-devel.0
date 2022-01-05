Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB8CC433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 16:36:42 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.2855.1641400601453022878
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 08:36:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=0G6uWxsj;
 spf=pass (domain: burtonini.com, ip: 209.85.221.45,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f45.google.com with SMTP id d9so84298098wrb.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 08:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sbtMRSvbwp7UeNO0bVZI8TrtFPinabxzeNqn9Y0bjf8=;
        b=0G6uWxsj1nXErpJiMKyHRMgJ9QmmqIq138YS1o7zjkhq4UVUG/NeGhwbQyvhGy/jk7
         vHOLOI3Wmq5iZnuickpkI9CzYqxjjPn5Db+g3hbh6HjKm0PfR+8X8SBWKMhTdCWLTotg
         tImy6nypE7AYQtj4HS5nI0YucHnsb0y8AzJ7iIJFuMC+/Q1ufwKgWd7HBwezmo8S9gy/
         9tXsojO7QvOQTjjtcMx0cVq2+sCHCqNCagZJc/LS54CdTVnu4Kjz5g/JzA1iQp7Z6MWs
         M1TPaZljA4SVC/WlvMJSyJMK01S86iuuHg3oN7UVtynfdtSq3QWlYGC59z6REzpLa0xR
         uDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sbtMRSvbwp7UeNO0bVZI8TrtFPinabxzeNqn9Y0bjf8=;
        b=O7lhDUw9C6c0bynkmbVyRO7YNPCuqXmJdq8/FoBAI2GbiyBhk8iCnhPN/Yq/dVMGjg
         VrQEf7maxoGGIAdkcwrhF4FNBBRjp0NeKLzIM8OwaDa68/rW6vxx2yDgyTBMxIUUq6/Z
         RaQLzzGvUAQ3fm8iGwy9cZzm6zY5mXf4k0xPg2WffZqueB4Jt9Iav0UAIfKBzf0NMb+M
         IsrpYVyBHLzo1E8i9HhDEqoxJaDPMwwI4G9J53FowPJnqq1nErkqGntg6GcyEo84oNf2
         lduz/k6uvMgCTO2ZxnyqqKVA5pDvtNFfgPzVya8hc5i8PkOd/ORwqeJixntJhhdV4LHu
         wKMg==
X-Gm-Message-State: AOAM530Muwjf3E23h6lR8g8VW2/cLC3CBtfrfmMb4XIzBHCpoUHI6itk
	VJWEUEZ+2EvT6owBVXwFCgui7se9wAs45y6NHK9l4Q==
X-Google-Smtp-Source: 
 ABdhPJwihsTAyK31avskjWEZBisxAL0pFlohJlo6wdhP/dpftDvYFTSkW0rYlF3yu2KolWVnqdt+xfD8FYt8nZJo3kk=
X-Received: by 2002:a05:6000:3c3:: with SMTP id
 b3mr46174268wrg.451.1641400599615;
 Wed, 05 Jan 2022 08:36:39 -0800 (PST)
MIME-Version: 1.0
References: <20220103163754.32439-1-alexk@zuma.ai>
 <CAAnfSTvy_xKboMuVNqodt5PduOtdj+tNM+qPc84X-Z=vKtSRWw@mail.gmail.com>
 <CAP9ODKpSjs7_g-aHDf=WjNDbwLDrru8h8Xu9K2zAuDGAN=beRQ@mail.gmail.com>
 <CAO5Uq5TMppqwskcZOHPUE=5fDUN5Q1QP_vRPegfFoi4jmG8M=w@mail.gmail.com>
In-Reply-To: 
 <CAO5Uq5TMppqwskcZOHPUE=5fDUN5Q1QP_vRPegfFoi4jmG8M=w@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 5 Jan 2022 16:36:28 +0000
Message-ID: 
 <CAAnfSTu04cesHKxFYYA1DGDDHnXHXOEvs6tr9TzbhdBko0R1Vg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] ifupdown-ng: Add recipe
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Alex Kiernan <alexk@zuma.ai>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jan 2022 16:36:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94662

On Wed, 5 Jan 2022 at 12:51, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> Smaller if anything (though I've just realised I've not dealt the
> ALTERNATIVES paths correctly):

There's a case to be made for just conflicting with ifupdown and not
bothering with alternatives.

Ross

