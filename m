Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39695CCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 10:26:56 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web01.19789.1761820010760243455
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 03:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lut/wsJA;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee130237a8so578895f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 03:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761820009; x=1762424809; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n8TS9Jzsq4vQfUPuwZ3E2fm2I3TJseT5hWKCo9uI0FA=;
        b=lut/wsJAO8/5OWIH4dikodgBfVlM1Z+PThVQ/1Od80z6NK6u4gB+GZ5+rI2lpTYqOA
         PULubE3r04dZKHou6jxW3RaEZRQLGPgWEY7qAxY+gHPtxvG3hAI6XLTgxvKykhDLZ4nb
         PYkdfpc357cf1ZVZY+xR7nWP5ogfRTegL7QBpAPjqw0SfqtIOt8cHd+kThb0UyjtzcwV
         JGfvC24BHR5bo31pnlEbqA/tWBWjFUUM7huGo5eQCe1YliwazI5776xvTaDRirmwXnz7
         Ng6na93elsteq+3vH73XLFkayTSBej+W/xgVaSyEAYWJgW+8WkRStqi4+LrR8dRDnyZ3
         68QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761820009; x=1762424809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8TS9Jzsq4vQfUPuwZ3E2fm2I3TJseT5hWKCo9uI0FA=;
        b=Y/TWgV+jkhnAmOaL7TbQVN3+8/iHY0Wz7VPqktVzo4e6mhpHcyPnz1zQOmW5muxK88
         I6WbSjulQDktbg4qVIcTv/Anqn0QZ4EU8rdObZI6UqG4641ehdVy6cmtEkqpotwxI7tj
         GOgPtqad5CgsqC7ZinL+3CPlbpQ2v6YluHupthsZHHXstRwMFRqjUcnU9Vfv18Qq6HpN
         JnNQOOQjujEcoOhihRDZ4ajBTOjy6uTtg8lyxIbtShH+aJH4vElHh2bpRaXUantVKj+R
         SWZK226S9h5pl0PGJAoLylKMj0p2bdUi/0SLAAaAySbjuxqVaVvp0b/r+VGvj8t2N+rG
         jbUw==
X-Forwarded-Encrypted: i=1; AJvYcCXylzXt/rNg68QCR0kkqy0Tr9z6D5W9H8zkHg44Mb/iDhlB7e5IveF09fqGuFv18fyN7PLUWTaHSAHWf4FV1ukkRjM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxD5WqUPNqlBzc4qf1PNOOMApOiFUV+zVbEoZbqjF8bmR7krsz4
	9Hao0xJ0FwLIZ3yZU3s1JeCzSmAI3ZIyEFgdRTN+BerfVABKn74FNyjx
X-Gm-Gg: ASbGncumi5x1AgX3fbUR4gaWxOuum6uT3QP1KnTArq85/ws8OiTqqFraENoa6RHuWGk
	URXJgs+zL8FIxf3Rb6yMFm4zCLltvIDhSlWmtzFBAl94nsfl4CPU1c2z907cD9E/qLB7UNfUDUj
	VXsnmY4u09MolrclY5+EekfWhrH57o9NLW7JBO9uikrVTwPXXRWF6tpAbt+1Ej5CUGqgM3efvuh
	v86t9c4sqhHYHhkF4zwhW4OGugnTa+IAoA+v22x9X7vP2WU1DcDSzShUGmCY8nMHxKYIcQzSmJE
	250nLG6bPF36uG4i3h/TJrcTtd5mhB93Lp0kePIlAjFxHqsxaeJdx/c9Hc7dDYtk7y6HnXwdU4F
	ZRy75vqgqXQKk6aJQWpF5wlXSNz7V1Dbs1LayQWxEDwrvBnFnTuJn4di3XTRfzXDnHnvXMxaMk5
	XIz6v9wSWokZZ9zupsUVk=
X-Google-Smtp-Source: AGHT+IGk2Bgnah/QNy2h8yxSTrGdBxuwK+MYaYMSj+TukzZY4Vs+RwSiDYcbcZS/mIlIfDnmptBpzQ==
X-Received: by 2002:a5d:5f02:0:b0:429:bb40:eecd with SMTP id ffacd0b85a97d-429bb40f0b5mr291940f8f.52.1761820008773;
        Thu, 30 Oct 2025 03:26:48 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7a7csm31571255f8f.8.2025.10.30.03.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:26:48 -0700 (PDT)
Message-ID: <fd48d5f5-e6ba-4257-a96c-ccd9fdc0ba73@gmail.com>
Date: Thu, 30 Oct 2025 11:26:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] Whats the standard macro for "${WORKDIR}/sources" in master
 branch
To: ashishkumar.mishra@bmwtechworks.in,
 openembedded-devel@lists.openembedded.org
References: <aylY.1761819752207315631.fowC@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <aylY.1761819752207315631.fowC@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 10:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121205

I think you are looking for ${UNPACKDIR} [1]

[1]:
https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n410

On 10/30/25 11:22, AshishKumar Mishra via lists.openembedded.org wrote:
> Hi Team , 
>  
> We used to have the file added via SRC_URI in well known macro
> relative to ${WORKDIR} & have standard macro's 
> But in master the files are placed under *"${WORKDIR}/sources"*
> Example for imagemagick:
> P="imagemagick-7.1.2-5"
> S="/mnt/addon-drive/00-upstream/master/build/tmp/work/x86-64-v3-poky-linux/imagemagick/7.1.2-5/sources/imagemagick-7.1.2-5"
> WORKDIR="/mnt/addon-drive/00-upstream/master/build/tmp/work/x86-64-v3-poky-linux/imagemagick/7.1.2-5"
>  
> 00-upstream/master/build : ls -al
> 00-upstream/master/build/tmp/work/x86-64-v3-poky-linux*/imagemagick/7.1.2-5/sources/*
> total 20
> drwxr-xr-x  3 bti-001003 domain users 4096 Oct 30 15:08 .
> drwxr-xr-x 20 bti-001003 domain users 4096 Oct 30 15:29 ..
> drwxr-xr-x 22 bti-001003 domain users 4096 Oct 30 15:08
> *imagemagick-7.1.2-5*
> -rwxr-xr-x  1 bti-001003 domain users 3679 Oct 30
> 15:07*imagemagick-ptest.sh*
> -rw-r--r--  1 bti-001003 domain users  962 Oct 29 17:50 *run-ptest*
>  
> so in recipe we have to make use either of :
> - ${S}/*..*/run-ptest
> - ${WORKDIR}/*sources*/run-ptest
>  
> i am naturally aligned for approach (b) from above
> a) But wanted to check what's the preferred way from community ?
> b) Or if we have any standard macro for ${WORKDIR}/sources to be  used
> in recipe 
> c) Or if members are expecting a new macro to be created ?
>  
> Thanks ,
> Ashish Kumar Mishra 
>  
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121204): https://lists.openembedded.org/g/openembedded-devel/message/121204
> Mute This Topic: https://lists.openembedded.org/mt/116027483/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


