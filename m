Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631FAC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 17:11:15 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web08.1940.1645031474840586378
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 09:11:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LLvDTONe;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: festevam@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id z22so5074843edd.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 09:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PwL/5c9KedwjDZDNnxeN6VLRBKbVcNwzTw7EL893O/A=;
        b=LLvDTONe5EK4qx4ntqY7a483EdaZ5FufCH83C9f+ZR/f8XOi7+e4kCxILPIMtynHAm
         XqK54qnxPcY4Prmvk2QweMXF+xqxTnUvCob7UaCMHVKRYLHwNgphC69JD6MkGMpj1abw
         rjGgqgBAAgS14ULFhP7nLqZ7MV9j9zDVoLaW7myFbfc1EPA1VpPPZNyRm2pf0nsRuqt9
         YFOLeD4SmA+6bntIIYJfIdHsOQ2uyLVeDfvJgWCdSzw/BpRbO0fLaybjzSBRRhkKZLp4
         nZ6xzHlMURRlGOGpQykY2I2Wsy972u1M/RV56YIbdQSXon1mx99snjjicq7HqXR7XR2f
         SF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PwL/5c9KedwjDZDNnxeN6VLRBKbVcNwzTw7EL893O/A=;
        b=aoV6ts0naPPdBGrsxWkPiHkkIvNBdkS4Lfypgb4RHWoMlkUl/uETaurAmJCImZ6vc7
         dNGuxB73ZBtYMj/DGH9NA5MvM9qd7E/PsVNO5ixuN4E1BanpfzMIjQuobTTdaUJjO3Hb
         XiPXV9u9Hm+ceqFLZIuR8vZpEUjouLxATwnHKEwMF9wBQUB02AsKwenLihQrPUtYRphV
         IXfp8enGVE7MwbERjNg5qCO1e++ovD+CDcLdKbbpwM6G/epPHC8q2V7HoTC10AOrc38o
         oZWvQR3L8qM24wz2c3q/A8qbp3SJFRPplT8xECUbd/J3HaQakErEvUsLmfLNm5sj1wTm
         8G2Q==
X-Gm-Message-State: AOAM533uaZVJI73tp6Myh9MeTRbGTV4qDeQnyGI4bM4E6qd3S7RRKdmM
	tziugJ3HlCcBiJenvasx2EEyDZuwQamfzW7RTFU=
X-Google-Smtp-Source: 
 ABdhPJzR5NRJVoblHKzoWPoAzastLd3cl4QTqi7pXb23f/cc5VBot+vXpbiXizelFPk4qXwnyepem94FsR9IzeHRbzg=
X-Received: by 2002:a05:6402:1e8b:b0:3da:58e6:9a09 with SMTP id
 f11-20020a0564021e8b00b003da58e69a09mr4113468edf.155.1645031473272; Wed, 16
 Feb 2022 09:11:13 -0800 (PST)
MIME-Version: 1.0
References: <20220216141405.2315276-1-festevam@gmail.com>
 <3afa37cabd804575ba26cb3918ca19f9@axis.com>
In-Reply-To: <3afa37cabd804575ba26cb3918ca19f9@axis.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 16 Feb 2022 14:11:01 -0300
Message-ID: 
 <CAOMZO5AKtZbSYPBZ+LsUNPQ3+rjbO6VT6o-8jDQt2zecGiMGsA@mail.gmail.com>
Subject: Re: [oe] [PATCH] rtc-tools: Bump the recipe
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 17:11:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95342

Hi Peter,

On Wed, Feb 16, 2022 at 1:49 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:

> I suggest changing the Git subject to:
>
> rtc-tools: Update to 2022.02
>
> as that is what the change is tagged as (also see below).

Good catch! I did as you suggested and submitted a v2.

Thanks

