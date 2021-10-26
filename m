Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C930AC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 05:37:24 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.8378.1635226643418840776
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 22:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WWkGr8iv;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id w16so884018plg.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 22:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ATW39yrSQpqh0Hy0+L92ATPCBln9qvsATZlkkx7kG9U=;
        b=WWkGr8ivTeaSqyu3Fpzz9qMfbQyMIAJKLJw1r+ddvDsHFJ1J7H1Gi7m9wMJ1lo7bPH
         m0updMPU57qARc/VJY7DoDaIPCyOCDYx8tG1AsIp2U+aIuTqQwb1fNfyT5wluyHggPxi
         epbvTJcXuEK58ltxr14yVM7zCBOkEWSj+pmZk3du3VtLfsXvBMdUuovpuUjNT8O6SXKA
         3Dow9+3j1qAGJWYaQWSUAldlReA16dUOL0e2RZ/pGYZNZOSBRRvN7x1ihmkZtWGfxrhf
         +b5vWHU34R3J8n23vQx+yMrqEvej+OaeshBE0gpzujABkO9OpXAQ133gM3NEtO0LSNc8
         6iAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ATW39yrSQpqh0Hy0+L92ATPCBln9qvsATZlkkx7kG9U=;
        b=uShNF95oChobGQKlJht9aD+nrUGGMWuQ0/Q9CiV9SdEpRf0NHazYhbk9p8DfKEY2Ph
         lueJI/z1DNF61vM63tbfm3yuSTZzEZpE3nnU1o5ai/l9Iie+PxJuW+eLrtoRPWM4DOtX
         8KFpLX4Jc8uNefTj9bgoJrgG1jhlF7c1P8XZcudsGHdIxBh0RoUdk/2vWkcH0VRYd0Sj
         fzANOqN7A0O3HGyx2ZNexRZCbzDtStokF6sZto4UIQpEW6T4DedxLodrf68HJaJ77zIH
         i9ZAzoT4zPei6htCZulQ3Ti7X5TBbXv6Tk621NGtxV5HtEP9QaVGxotsWt7dU6k+IaPp
         OTRw==
X-Gm-Message-State: AOAM530qN5FPUsi3D3NODKuxxUI0aR1vJEUOc1mjQaBzT14C371RREAi
	F9uBXP9Opwy9zxy/6LITe12X4itzBTWRRtO0Lus=
X-Google-Smtp-Source: 
 ABdhPJyscVezYk6Ktg2/CaOBQ89WUC6vVHL5R72lwg87rvvWZBEI3GtzNjptiHe2XoanzitbXhleyI1KiiHLw/6e7ak=
X-Received: by 2002:a17:903:1252:b0:13d:f3f6:2e1c with SMTP id
 u18-20020a170903125200b0013df3f62e1cmr20525658plh.73.1635226642898; Mon, 25
 Oct 2021 22:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-6-alex@linutronix.de>
 <CALbNGRQKOSPK55jDHOVON3ct+dCgAN0j8D-EJ=Oayf0qHepJZQ@mail.gmail.com>
 <CAMKF1soHevhCSrKZM6qifuVHkAZ_CDmNkqpkDndRqB4GoygG_A@mail.gmail.com>
 <CANNYZj_j5Jm4GK8y-YB4J7Dgcwy10skHt1ba0v=XyBpLB-i09A@mail.gmail.com>
 <CAMKF1spN9551JXDzDdumeQzRovNVXTJ+w3Z1mW_G252we46zWQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spN9551JXDzDdumeQzRovNVXTJ+w3Z1mW_G252we46zWQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 26 Oct 2021 07:37:11 +0200
Message-ID: 
 <CALbNGRSE348L4+rGuMs+p_MVbWnWsbTt=yi2GTR4q8UNrV8poQ@mail.gmail.com>
Subject: Re: [PATCH 06/24] mozjs: update 60.9.0 -> 91.1.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Changqing Li <changqing.li@windriver.com>,
	Hongxu Jia <hongxu.jia@windriver.com>, Lei Maohui <leimaohui@cn.fujitsu.com>,
	Maciej Borzecki <maciej.borzecki@open-rnd.pl>,
 Mingli Yu <Mingli.Yu@windriver.com>,
	Ricardo Salveti <ricardo@foundries.io>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 05:37:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93584

On Mon, Oct 25, 2021 at 10:25 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Mon, Oct 25, 2021 at 12:55 PM Alexander Kanavin <alex.kanavin@gmail.co=
m> wrote:
>>
>> What prompted me to update mozjs was that without this upgrade, anything=
 less than mozjs-91 would itself become broken with the python 3.10 update =
(and thus, polkit would break as well). I test meta-oe builds with
>> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/=
config.json#n906
>> Getting that to pass is where I drew the line for 'things I need to fix'=
, especially considering that getting new mozjs itself to build was not eas=
y, with transition to rust and all (appreciation from Andreas confirms that=
 ;).
>
>
>
> Yes it is definitely good stuff however I would have liked to stage it a =
bit longer I did not predict the slew of follow ups that it would need
>
> Meta-gnome is not part of test job tested on yocto auto builder there are=
 few other layers from meta-openembedded which are excluded eg meta-xfce so=
 you don=E2=80=99t get all the failures there
>>
As long as nobody comes up with a solution, kick out meta-gnome from
world. In the long run I think we need multiple versions of mozjs as
others do. This was on my list but I am still not convinced that
efforts here are a just waste of time.

Andreas

