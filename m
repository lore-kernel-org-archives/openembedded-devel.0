Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86173E67A6D
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:28:55 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12476.1772519325314929407
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:28:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P4zD56JL;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so1399122f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 22:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772519324; x=1773124124; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cXgsmXhErC05v2atDzIV02YYnCSKR9Ok0lHTMFkzvX0=;
        b=P4zD56JLmQT1vwM5jydomaxre4jbweHnsaW6rZXM4rxHFdEL38FtSnErSR1vuG6Smo
         H3/Xzxz7yvoFjKNjJEv+JV/dMComa+iqf+gTDzU0ICv5DJhOpOB9H04LMBnM1ShMBeU8
         sL3KdL+9qdhdnLTdNelQYgKmQ9Ldhsf/1jvcTt1WV5VVwBuhTF7iZeP6p3jiqDrU1MTK
         kRedY1ukSbFvDQXs6vaggkeMHsd9XBpp67O7vQg7iV2qKr9EdNtEkDXoMjQ32EtXSp8R
         1UQXAN7p9xhNFD0ZWGdVi3KQoBq6LXrCEYru3ZzbpkFWH0Q2kRsShR/0+uqKveI0qO8F
         HrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772519324; x=1773124124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXgsmXhErC05v2atDzIV02YYnCSKR9Ok0lHTMFkzvX0=;
        b=UkWB3ElWdW99iZVyenYaFJf3SsK2MnezSa465ZzVnNZrmyeko/DdINex8/2LiCfkLY
         JB2icayuj89wz+qm7vc7Qh5ufWp3gBkXCgPDystpLuzbZ5YpzDVISfHbEzxcABPu1mJa
         iXY00m+M7vVCSXvLVdQlcGb202ei0schs4qy/+KU341lOc7qXkVadb470Vpr1NnQ7Gj7
         RE4qOo6yDsqh275vC4w/yyef4qm4wYL2Qtx6Exk4rt6R7XBmS2DTmToFWl3OOFTVpFGM
         UjtHeHuYrpHu9sy65Co+465S7gINwozQv/7hFPJqbqW2UD1l4Y8cErbfWiSztrhuDBR0
         yb6w==
X-Forwarded-Encrypted: i=1; AJvYcCVBOQJN9dlr6pDPuYECh5a/PoIPrl8w6AHgA0jFnQOTVw5Ph+ckVYwC8a3BGroarcAgFG4KIckgJ5EBbpeGjSe3qTE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzWV0nj4JDoV2rOKsgPgxh7wYLl91K4OR7Jb5XCJR2pX1spzqRg
	3YDQ5TbZEg/2xZ+cdT8HMwnJf5ymNwLkvTzpcMEBSuzjjOlQhx1WfT+A8OyKIg==
X-Gm-Gg: ATEYQzxGoRr/d/wDx2hGtmH/VGEMYlVElKxGynpAwdfkiIBfywxFdlUKa1gr4RcZTLA
	n3Ry1iIT/QLz5y+5EEgtYdwBG9VFBnntk914LGT2A5JxGG2z9HWqKPaPOiZJzHdeCRW0wSbC0M5
	OtCGxVhUwjutu8aiGfk2+mwf5im5ATyMdOKhIwTcgNnoU4s35Xlv+WDOHr5v2FdN5aoWzaZdId+
	xwaVgswa8EGscPUjc/RN/TbeBRsbBPuMQY6Yyl6s8tba8t4w+VIv9jUgoZFgynxrGw/HWxBKdjc
	pDMqxno6O7+6bjrVZShB3G/MSGrLavBaLPjZ27d8UJb2OdVbk2eyzy8/7zcSfiYz0K5vEpBp3Ue
	s4oEf7HRq0sD8Qf67RVNinQJmReWAAVSLTYdyM2yZtDcypvPXybVIlXuWBhLSTIEMrkIu57oM8s
	pLfBEUFFv59FV9YOwVW9iZ9MpvkBCL6i4=
X-Received: by 2002:a05:600c:c4a6:b0:483:71f7:2782 with SMTP id 5b1f17b1804b1-483c9bc18acmr247749005e9.12.1772518860341;
        Mon, 02 Mar 2026 22:21:00 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm340694505e9.6.2026.03.02.22.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 22:20:59 -0800 (PST)
Message-ID: <a19a9a63-5ac2-4da1-838e-b06e861c7bd7@gmail.com>
Date: Tue, 3 Mar 2026 07:20:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [RFC_V2] [meta-oe]: Improving ext* sparse image generation:
 migrating from img2simg to ext2simg_android for ext* filesystem
To: ashishkumar.mishra@bmwtechworks.in,
 openembedded-devel@lists.openembedded.org
References: <rGsP.1771488393837852960.eVnE@lists.openembedded.org>
 <a11b45eb-1ee0-4274-9780-5a86105a7a1f@gmail.com>
 <1030996.1771825388005282969@lists.openembedded.org>
 <1127752.1772426743792609011@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1127752.1772426743792609011@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 06:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124826


On 3/2/26 05:45, AshishKumar Mishra via lists.openembedded.org wrote:
> Hi Gyorgy Sarvari , 
>
> w.r.t "What happens if you add "-Wl,-rpath=../${baselib}
> -Wl,-rpath=../../${baselib}" (or similar) to LDFLAGS?"
>
> Added below in
> meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse_1.0.bb
> as suggested
> BUILD_LDFLAGS += "-Wl,-rpath,../${baselib} -Wl,-rpath,../../${baselib}"
> TARGET_LDFLAGS += "-Wl,-rpath,../${baselib} -Wl,-rpath,../../${baselib}"
>

...and what happened? Did it work? Afterwards it came to my mind that
maybe it needs also $ORIGIN at the start, but that was just a passing
thought.

> Can i push the patch now in master for this functionality?
> or Is there any other process / feedback that i need to work?
>  

It is not necessary to ask for permission to send your patches. Just
send them, and if anything needs to be changed, it will be pointed out.

> Based on additional feedback, can work on the current implementation
> and share the patches again 
>  
> Thanks,
> Ashish Kumar Mishra
>  
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124798): https://lists.openembedded.org/g/openembedded-devel/message/124798
> Mute This Topic: https://lists.openembedded.org/mt/117889188/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


