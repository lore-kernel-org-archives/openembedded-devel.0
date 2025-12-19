Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F36E6688C
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 20:28:12 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25695.1766176088291215080
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Dec 2025 12:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=ZajJlOXY;
 spf=neutral (domain: theyoctojester.info, ip: 209.85.215.171, mailfrom: jester@theyoctojester.info)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso2135505a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Dec 2025 12:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1766176088; x=1766780888; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9IohO/d/MCiS5OV8zDl8qt3/TQNn7a+prGsv2SqaJA=;
        b=ZajJlOXYAiYlQDEK1FlGkTxxEJbqArRsvXS4bGijz10GFZyJiL8Zy69YGssYLv8WZJ
         q9/O+buTxns67Abe97L4QD8KIaFNex5Ppr3BjzN+4pSZSsBIsqfTFC1E5pnPB4ZTUE40
         EMel6drAMHXcSmu//xaaQinc2htneFNO50WGhWN5+75N8PXqMeAK+jaTaJk37a7PuS0/
         l4bAfQWbTTJbiWon91VKt4hlbrNftHb5hN6h6w/Ex/Kw5Woz5p2lGqUwv9U9iTr47bnj
         ZaPDk04Tls79TzaLDwirtClrnTQHt5xb6/Eouu6qm7vrEQNs2cyUuW2DyCbd+Sp41pIT
         kUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766176088; x=1766780888;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t9IohO/d/MCiS5OV8zDl8qt3/TQNn7a+prGsv2SqaJA=;
        b=iuMDboZj/tj3Ffkgl6NDNVnOLCF9XaFe/GLlmtPtorBLwILy0qCZVv7tA7bU2lJ5tB
         aCfA9J3bjdvd/Eh9gjjQSucC1SPVhrMpJorT55NUuc+pZoMMFNZksGAWSWnyqQUFJOmw
         EsQpDhgBTU3e9vLiM2jXbfwY6IoxZlWdWXVtiWz1RJx9xIpTBI5YXnSfNCWTNI6U2Dit
         l5IXg0KBqUUBYlyNvgS33Pi6IRagmaKdQTqj7c3T6Zf4pBpwbzbT/u5pL2KI4p0zNiL+
         Iu5/S05G0AEvwWXOEaCrr6/ivy5ZE2sOdQCV/ZJ/gop9O+3bxLaT03UKhqTAmGfDhSFO
         VnSw==
X-Gm-Message-State: AOJu0YwtGVZE3K2yJoR58VKKaIyuGVA35xXB7OAuoZaywzuff3RBPP+5
	u7vVU/WEKZ4iwPI/nvmFLbHWCpVjh8rj/MpdHSVw7zXGeWcXKIRvlfpAA4dArQwNMPEZ8peeUxa
	x1G6+x5hAw3suNwEmy1TRwbUJi2n4lZK7p6+C/zgYfbyepZg8kNyQWqFeSA==
X-Gm-Gg: AY/fxX5oI68pDZKwPEPWh2Ddi4E3hwI8lfWno8QOA0U+KNOzUAAsGYI3LRZaULfQqeH
	eXUmjhfyFulO4VwjO0WSRuYv/2PM5v2IeRTLXRicKFR+Yo+uHGh5Mpkg1W7EKjKguqaC6suqftr
	O+HAyv35SWZui36k/0O+BJZ2cW0JU42V+mfXr8GpTK7kbTHEDdfxysgaxpYLo4DVP/Yj3GgKG7B
	waJLAbzGgx+wUvdqVRLd5KHuB6uIBJR5R7hr3cZ0a1IDBvh3gpshZ93+OJx5mrJhcxG5jfDdmAc
	PS+Yry6EebbIgRQGqalU3CUwwhJ8OA==
X-Google-Smtp-Source: AGHT+IH0NBaZ+SPOdhudZcd71R8mnsXxgC/JYGdUtPKLBv8BzFnGJTDVfzd0velj8RYbgiCr5nyvp0zzVRmLn64MC9Y=
X-Received: by 2002:a05:693c:631c:b0:2ae:5d27:ff49 with SMTP id
 5a478bee46e88-2b05ebd85femr5625387eec.7.1766176087655; Fri, 19 Dec 2025
 12:28:07 -0800 (PST)
MIME-Version: 1.0
References: <CAEt6Nwo64QB0ygUK5qCcB46-V8Twk-jWrGCbtMR1MP8EvnMSiA@mail.gmail.com>
In-Reply-To: <CAEt6Nwo64QB0ygUK5qCcB46-V8Twk-jWrGCbtMR1MP8EvnMSiA@mail.gmail.com>
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Fri, 19 Dec 2025 21:27:40 +0100
X-Gm-Features: AQt7F2qcrz-0naey-AFcm0XPBLMe4n9epYWYNWXAIRwWHSVH64UIhSrxFp5srGQ
Message-ID: <CAEt6Nwr+G+=NamM5ayu2EZ8X==HcPkmp8VvXX3pAePdX+RG2YQ@mail.gmail.com>
Subject: Re: Final stretch for the OE Workshop 2026 CFP
To: openembedded-devel@lists.openembedded.org, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	openembedded-members@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Dec 2025 20:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122774

Correction: use
https://pretalx.com/openembedded-workshop-2026-2025/cfp - unless you
are part of the organization team yourself :)

On Fri, Dec 19, 2025 at 9:22=E2=80=AFPM Josef Holzmayr
<jester@theyoctojester.info> wrote:
>
> You already know that we will host the OE Workshop 2026 on February 2
> - the Monday after FOSDEM.
>
> You already know that there will be a friendly, enthusiast crowd ready
> to take on all thing OpenEmbedded and Yocto.
>
> You already know that this is the perfect way to wrap up the weekend.
>
> And now you know: the CFP is in its final 48h. That one things which
> you always wanted to talk about, now is the time to submit it at
> https://pretalx.com/orga/event/openembedded-workshop-2026-2025/
>
> Looking forward to read your ideas :-)
>
> Greetz,
> Josef
> (OpenEmbedded social media dude, event conspirator and occasional timekee=
per)

