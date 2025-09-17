Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8525FCAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 23:40:57 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.1444.1758152454312453116
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 16:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UVoWsyyz;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: festevam@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-35e5eda335dso2454611fa.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 16:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758152452; x=1758757252; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2NFsM1468Ok2vGmcIKvLA11DTYIHJR+E1oYRTVfCg8=;
        b=UVoWsyyzWJ9Gbf0nW0QQdzGS1gWy/Ugs2ErUlkuwBsmDmdYwNDm9nZpcqOL3kceLY7
         aelkGB5sNPaiCWd0usCsEogLavYCjh6yi5SJiewxeacRvilaCKdbNnXcBdHl61ceJ4jw
         vjKUkwrV8wzs03GyuykcJGz18eId6JSxRh+b8C5N71GWhfG7PwubOAzaJchONPSUFvQs
         +W04oP8eBV58+4H8+aKQS/vZ042ZkBELRCJDrkvIex0yap0E0QFfYhwngk/2xbjg39Rt
         dt6drcwHEe3Og+p+SOAkmSffue7nr7+LdDqQdiHzorpmqLRMBxUUBJUxkoa3fXTHIxCy
         7ZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758152452; x=1758757252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2NFsM1468Ok2vGmcIKvLA11DTYIHJR+E1oYRTVfCg8=;
        b=S06MYWx7wj9PY0fId5CpXPTQqBWkWVr48OnHRaVYgPGLNaKfYqF3rr2c1UP/60Gj/k
         lFl1cMA0cH7LwzyyzePOmVGtBuasEVolRaRi1xBauky0fP/f4+iCWnr8SVjHhYxW9SCZ
         itRmF7QQino7AKd+KBRE80OsOfgg0kn4hPohbVebOwFnOZ2/r2oQu64l9Lp3Q6Xd6ABm
         cywtnkVDulM/r6PB5CDIjfgdNwJIFrXHofU7kbO1BcbsxemSWCpQnX4yOYZ45Kofuoi3
         XCNKTqCcUQqh+8NP1ze+yWtmxgO0zUFN9ku4wHFUd8uxGoqOVxtotBxjwWYAbWvxGdZ3
         eHtg==
X-Forwarded-Encrypted: i=1; AJvYcCU2dd0eqMnnLwSv1rAu1CF9ETQy0vV+5S6tYVD9Ry+iqL1gFjTBMzCiQSEXomN553LcJWWURgltAMDyOGrvJ5CQfuM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyIdXeR/160uHCfKUIznD+7PWvb/wVTKjE0B9ay+4KyyY7gnE6V
	RlS82QY18IyHR8MjKY88GeNzOOQVT8r/EfGyiorwo/9VGvIJbzCbJ9Cyl0nwYrr0dNPEPZxIVQQ
	RVVWWMlHhKPxTZlqiKEi2NIzsI5+cIjs=
X-Gm-Gg: ASbGncs+iOnODNsw56ZFVuv7bY7zKMhdl5xMoW1nLA3bqbOaO286HawEQtG3llmLtML
	q1LBGxVto6xfq7vnXPDNkyBhowzYm/YDsaBsA+kf1Y8vAsaDd/zvvskCE35D07cN+577hO9YwyY
	HGDyIJdF+/8I0XvVH5eu1PhmaI7cftouq+z5f1aGGVuQYZBACP8i1lh0AmJDxVX6mX1YGQOc/u0
	BGB+NURf8iiHtfepGxiFaSc2WTF7M/jV4wNonL0pR8RyWNxIAC7s6Hd5G0joqaFrpxZ
X-Google-Smtp-Source: AGHT+IEjSsKSJDVADaZv4k6gRZl0JQjShBjc2PsgJddQja4FwWfzELuBGyEqeQrZz8ZHCtOPAbhryczZzEYho7jpkNQ=
X-Received: by 2002:a2e:a545:0:b0:336:8809:676b with SMTP id
 38308e7fff4ca-35f5fe9d7ebmr10872731fa.4.1758152452026; Wed, 17 Sep 2025
 16:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5CSQZG5=+urHZb9yPK5cV8S=c1EmqecPNQgPjA5qWNwpw@mail.gmail.com>
 <CAMKF1sp6CDY46z+FsgMyZ5feuike_pJeR9S8zLo8+ESBXfcLZw@mail.gmail.com>
In-Reply-To: <CAMKF1sp6CDY46z+FsgMyZ5feuike_pJeR9S8zLo8+ESBXfcLZw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 17 Sep 2025 20:40:40 -0300
X-Gm-Features: AS18NWA1j8BW8rCBlRpheiZ5QVNr_y2uFMwsT2XzKuisotiFfO9vpyV54b_T_Lw
Message-ID: <CAOMZO5ASQmTjr8Om3ZTaN5Q2VLaC9ymxEAAdrATOtHN3n9JsWw@mail.gmail.com>
Subject: Re: crucible: Recipe update with go module fecher
To: Khem Raj <raj.khem@gmail.com>
Cc: christian.lindeberg@axis.com, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 23:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119490

Hi Khem,

On Wed, Sep 17, 2025 at 3:51=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> I am not sure devtool support for go mod fetcher is there and working.
> You can do

Yes, devtool does not support updating via go mod fetcher, but
recipetool did the trick.

I have submitted the update; thank you.

