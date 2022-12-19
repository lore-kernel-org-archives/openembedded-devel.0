Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546A6C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 14:19:56 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.23049.1671459588713407610
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 06:19:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GQ/WhQpZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id q71so6242736pgq.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 06:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yVpJkH6TsRaq8E9qQt0oXYwn+w5xtSZp4Sf5h5b4VDU=;
        b=GQ/WhQpZOoGit0tB6aApZXcSy/4DmPvmTGOLUSwkgn7eA5+lTRGOdgCbEubeyO22fN
         1ez26JR/QMLCaKMJWWWjnHDXZGW3sE72wMF8twdeSjZ7/4WRoTxYC3Hs0V8sU1+iltZl
         smqi9y+ayLlsRRo9xKd2NrBqb48XjleRW+AyTiTjbmMjAP/K7uL/N5yWWawV0M3JtGTO
         Bv4jPKc9i3GcPAfYatyp0uDjyNVdKok1j414UuC737qkLOtgD/yC90oJggVoFzm1IM27
         LRLHdPOm3AvUckIc3x0dHUShVzm28KwJz8G34wnel1kvvzSHMm5gal2QDHe/lC2/gTBC
         dsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVpJkH6TsRaq8E9qQt0oXYwn+w5xtSZp4Sf5h5b4VDU=;
        b=45up7FUpj5yDiARE3Gey8e9lW3GY7pKkRF7eVV7ifbwWTFD4adVt0Zd/VyVietlapZ
         lAdyvg0Du2L9fCFjL9WhqUd3pyaj2y9T876crry75t8A8qYS0VwjFRlWfa32hjlnNGN3
         B00YQ60xaV9/EQACEJWCXCOkqKswvbThklEiy4QRMrAnoicMoj4xXSdQWbXnOZUtq44J
         Rf256Aa1OS0C/JZu8+nWcRHTJkdo8nYp6IaoOARr5a+tSclxsp4PLjlilJFUWTABzxZ1
         xKoauL09tovpVfHQ0ehs4yudTuLJttS9DJxvOJsEXaqy8QN6RXxJL8fqNfI3MRckvETD
         0Ttw==
X-Gm-Message-State: ANoB5pm+DOvfyHg+RfJ/Sxr6pHdChrt6IJ5aAUa9QvjAjJgqW+3LtqgB
	72bnuk89QWmAUDeYmwDzlcG0h1x/w26ZrKYbXfY=
X-Google-Smtp-Source: AA0mqf7VxV/1P56rdhAowoy1HfHkNJwl5V9R6ogtdyy8Ska8JthMHLx09UWOacz7GBdMMUBn5pW64+9e+s3PvhIAE74=
X-Received: by 2002:a63:1b17:0:b0:477:de14:988b with SMTP id
 b23-20020a631b17000000b00477de14988bmr59470244pgb.131.1671459588106; Mon, 19
 Dec 2022 06:19:48 -0800 (PST)
MIME-Version: 1.0
References: <20221219131041.452949-1-f_l_k@t-online.de> <20221219131041.452949-9-f_l_k@t-online.de>
In-Reply-To: <20221219131041.452949-9-f_l_k@t-online.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 Dec 2022 11:19:37 -0300
Message-ID: <CAOMZO5B4t8_R4yiiR2=ts7rrPwykFmit-_4O+Ardfea_tmQ-fg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 09/10] libxmlb: allow to build native
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 14:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100106

On Mon, Dec 19, 2022 at 10:12 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> This will be needed for gnome-software
> ---

Missed your Signed-off-by tag.

