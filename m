Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC13C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 12:43:05 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.5703.1667392974892496041
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Nov 2022 05:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112 header.b=T4/7RNo0;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.221.42, mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wr1-f42.google.com with SMTP id g12so24339817wrs.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 05:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cc7GcNgxIL+grpXM3y4VJSWFWmOO1GSHqfwP7aDVNsY=;
        b=T4/7RNo0WQSYyFZjamaN3O77mSWC1EzQJjXNiWKgip+OId36vkz2hfRePz6jHxjhZd
         3IjsEm2Y0qiTokL6SecR1//NeAMnI2FhGUUUMGBborXYSQuy91uDFnW9Xb2lUCutQLhD
         0aIBAjSatp2iCKFEdwQdulzzfUqgWhIj699Cxx/XCVA1olnk7Aims1mGBRauVX9mciWC
         6qJXOIHmmpx3+c5KPQVbH5jIhxZw7zQZSl3aKw2YxUrAFXnoi4mXOH0qBOm0OVYpeDnq
         7AbPVt6whfZefYNIAc/An0NW9SA6SKpQifWL/qDoa7z/5kQuGvH4FXJOQUn8A/TP2xIm
         jChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cc7GcNgxIL+grpXM3y4VJSWFWmOO1GSHqfwP7aDVNsY=;
        b=OfvVh6IvUdgP2od1Bwh7UcUnAheYDi8Wj1WmsG3a8oe0nY5sIya4PnscidYlk/3deI
         WmsTF/1ZVZQ+Zem8hqExcHZAM1pkA59OFNjrhZfBjRiRaZWl1fPhC0IZ2KMyz/N7BHu/
         oebYukGqDkkbbVLXiBknINdQCgLvLoZqoSztzCjAlBSWRMDkvEUuaQ416LljmW7UaWLK
         ap0ABshLn2iYU5JWthljypvO5UcsmKBc2cJWfteypxK8Qq2iNipOu+9l8u/enm7PaiLX
         LSZ2Ini3xlldav9tYqmK22gRluWw/iBoqeeSvfxtnl3aryvIB0ApeeCz1M/LJnE4VVlJ
         38sQ==
X-Gm-Message-State: ACrzQf0L5MQdOJKUZID0NYutPfwv9U1kgLRdN20/BRCD1oxGkop6nv/N
	K4OrHeW9AqM7gdpKpmmw/yHHyw==
X-Google-Smtp-Source: AMsMyM7xIRsyFQsEyfsalp223PhXUxHe1+JRCOzg9atM8uhUmdp5UF0u0LC5S+FoMEMwu8UovZd5Og==
X-Received: by 2002:adf:ea10:0:b0:236:ec3e:869d with SMTP id q16-20020adfea10000000b00236ec3e869dmr3016859wrm.33.1667392972962;
        Wed, 02 Nov 2022 05:42:52 -0700 (PDT)
Received: from WIPC21110265 (12.223.71.37.rev.sfr.net. [37.71.223.12])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c434700b003c5571c27a1sm1878021wme.32.2022.11.02.05.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 05:42:52 -0700 (PDT)
Date: Wed, 2 Nov 2022 13:42:51 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][dunfell][PATCH 2/4] mbedtls: Update to 2.16.12
 stable version
Message-ID: <Y2Jly70NGmv57JPi@WIPC21110265>
References: <20221004062843.2541778-1-mbriand@witekio.com>
 <20221004062843.2541778-2-mbriand@witekio.com>
 <9d4accb4-515f-0b72-9670-7c5aad728ef4@gmail.com>
 <Yz0/LyUoeJSfdSNQ@WIPC21110265>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yz0/LyUoeJSfdSNQ@WIPC21110265>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 12:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99419

On Wed, Oct 05, 2022 at 10:24:15AM +0200, Mathieu Dubois-Briand wrote:
> On Tue, Oct 04, 2022 at 02:16:35PM -0400, akuster808 wrote:
> > Why did the LIC_FILES_CHKSUM change?
> > 
> 
> Oh yeh, good question !
> 
> Previous LICENSE file was Apache 2.0 license, now we have three files:
> - LICENSE, who basically says "SPDX-License-Identifier: Apache-2.0 OR
>   GPL-2.0-or-later". https://github.com/Mbed-TLS/mbedtls/blob/v2.16.12/LICENSE
> - apache-2.0.txt, well the Apache 2.0 license.
> - gpl-2.0.txt, that I choose to not include in LIC_FILES_CHKSUM, as
>   LICENSE only refer to Apache.
> 
> Now, saying this, maybe I should switch LICENSE to
> "GPL-2.0-or-later|Apache-2.0" and use all three files in
> LIC_FILES_CHKSUM ?
> 
> Best regards,
> Mathieu

Any news regarding this patch set ? Do you believe I should change the
LICENSE content ?

Best regards,
Mathieu

