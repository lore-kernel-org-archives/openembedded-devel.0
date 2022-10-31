Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EACFA3740
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 07:40:29 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web08.6625.1667202021941508537
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 00:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=E9xFC2fB;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id c25so2140985ljr.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 00:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hAmNcdrk4oeU79NqpUQOEBuEwQcQpKEPTF07+IkY+zY=;
        b=E9xFC2fBE3DlxLk7Q4yRROAoO2qjrz23eL8CFFENvrVnm+hkC1GZciXrAzZNg3+Aef
         yq4UWVn5pdm0E+Trzj1AvZ7j62/YpqvzJuDmqswZsoiuU6QV1f4ukbCMF1sXJWhz8Yo9
         IorEvqPR4z2m4twn0Vdda9NPnsUw/KFyuADcskhWgxAjPGY7xKW0mUOhcjm0BNE42/Tk
         8ion26ANyObMU6jXCPKsy+wfbEFzVyAkd4LYrPZDqA357WIMyNuNwXbZBqZsvEUDNohe
         QrHADfcyj4BpK3ORLUbgAWHG2PGvtolbLtJGoYQyKL97ktooHhM9/qnHNE9uOH6lDWew
         DOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAmNcdrk4oeU79NqpUQOEBuEwQcQpKEPTF07+IkY+zY=;
        b=ycVISBj7Lbd0BW3UtJQxSXF9kTvnPcxUpntceti1zgU4SHtRjRFktnvczyDYf8ohul
         wEg+2P0GD8or9HKY61sYTxrEK2l1sJ4CndDUIqMNNW5H13XCiTsQHRuiPr7NexvcikdG
         Lw/V7NZPHVUmd/wxhNCbqbIg3heSBSzwNbG/rWHpSRdG4gQwEScGwgr/WBkmNEfthnL+
         I0JYOBWizJaegUfgIEoDia0rSIA2KqBT2lS5zdF7Rf5kTHLOKcQElcfJz8ZkFyEx340E
         iR9tnH3d4hn2Uz0xAYay3fcLQtr3zKRqjuEdMzo6ldmHpYo0gXYXOAqfhwbYeJ7phTnn
         qv5Q==
X-Gm-Message-State: ACrzQf2JhnUGTmtTWQprXJIdFE+fxTZh6/UkVsyEyUVzyIttVDl+UnMZ
	LB8qYjFlwJ/SHYv+rrgsOrDskg==
X-Google-Smtp-Source: AMsMyM5DsG2ZDv9yvb9frhMSXRdrBq/s4jtJQTnlreuma1/BlfThjL7FbAPF7VTFY+g3bsnivmsshQ==
X-Received: by 2002:a05:651c:88e:b0:26d:dd92:73e7 with SMTP id d14-20020a05651c088e00b0026ddd9273e7mr4548285ljq.503.1667202020098;
        Mon, 31 Oct 2022 00:40:20 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id s14-20020a056512214e00b004979df1c1fasm1164202lfr.61.2022.10.31.00.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 00:40:19 -0700 (PDT)
Date: Mon, 31 Oct 2022 09:40:16 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][master][kirkstone][PATCH] fwupd: fix
 ${datadir}/polkit-1/rules.d permissions
Message-ID: <Y1974EasaBgIjTu0@nuoska>
References: <20221028131037.3600179-1-mikko.rapeli@linaro.org>
 <10504D27-26A9-4910-B890-FC283926F906@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10504D27-26A9-4910-B890-FC283926F906@arm.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 07:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99363

Hi,

On Fri, Oct 28, 2022 at 02:57:50PM +0000, Ross Burton wrote:
> 
> > On 28 Oct 2022, at 14:10, Mikko Rapeli via lists.openembedded.org <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> > +        if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; then
> > +                if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
> 
> No point to have the double check here: just check if the directory exists.

This is direct copy paste from systemd recipe. I think it should stay
like that. I think there are still some configurations where this will
break again though. I'm hoping that polkit would imply also systemd.

Cheers,

-Mikko

