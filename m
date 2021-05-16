Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.3976.1621155728391343918
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 May 2021 02:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qvDCxi5x;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id b13-20020a17090a8c8db029015cd97baea9so3177581pjo.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 May 2021 02:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VFClBVfDuX8AkhiG9CkeySgYJUMbOHtTAc6+tBnneTw=;
        b=qvDCxi5x592tmZ+c3U3nbALiHXOBW56paJupAXQplsU55ApD86fWSACxArzj2SBcxn
         rGTFOWm6e0jqDh5hZ86xxX5B2q069218RS5vNk4P3iyqKf5LVEf3pn3dCUmZAzcmbJyd
         +d12Tb0LsJDEn/6ejEfqtonTrMcE6xbydqt1ZGJ53iEeskV4Z7TR2v92yng5Hhf2wgMK
         A6Uak4JVpbPBlhTG/jVeU1WBU39F518ePhkUW1Aayyje4Ksh7hKUMlD5KI7TSMMaQ/bq
         MAj2DmSdJfGQqBNYGp+jPaAiYaBEwpzoJjEsF6Cw5jPRyT+EZfd50ZZnngAbM8cC7t5n
         2mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VFClBVfDuX8AkhiG9CkeySgYJUMbOHtTAc6+tBnneTw=;
        b=OJzcLN6nkv1efuwuBn/9lSHu+ORq/CMOgWqnv0EbtcZQZbhn1NnHeBvBtkvuEGLlX9
         DqIo+uKXmFWdD8I//2OVpXfTMS7qSUCgsHQrsprUw5P/Ov3mzhNdQLZvpTsZNapumVAo
         tW55ewRfDztLSJVEcKuuNTFglMjkNTTHY8NytTym42p+od6pE2Kr+XXRlj/RPz1w6i4k
         zWc84dPHClbcIl9qwpK7vhyHhLMAj4rt0QToCq513daUSnu5z9CV1nNoPMldpSTrBtVu
         2p+2vJDNfNudvkbKJ4FOgyzl/vI0Or4LC9lqoNrEpxv58hhk9DRIt5N/HKOFq3wXRzdi
         cYew==
X-Gm-Message-State: AOAM533Fn+oW6ZojERVWlqB8YEvi/wum5jWc2tAgz7gZMalwUfbNyzev
	jDVEBK6J4kRd4Ktbsb/TCVenLJeBWl2n9uE4uQk=
X-Google-Smtp-Source: ABdhPJzaisbOnkTGXqyyFZPCbYXzfksFsrDjuKxKOe7NeLsxfMS4SwI4PFGYZmfz4pL8FpmMWUoquuDnuDMKI6TyT0M=
X-Received: by 2002:a17:90b:2397:: with SMTP id mr23mr28340656pjb.77.1621155727846;
 Sun, 16 May 2021 02:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210515233853.583490-1-schnitzeltony@gmail.com> <CANNYZj8mfJ0txH337fGheaxdGJ-JCWR3Uc-Z2vokAKcJBmuTdQ@mail.gmail.com>
In-Reply-To: <CANNYZj8mfJ0txH337fGheaxdGJ-JCWR3Uc-Z2vokAKcJBmuTdQ@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sun, 16 May 2021 11:01:56 +0200
Message-ID: <CALbNGRQ9aipfPB3_XdC_iQXmy+OJLsEkYVH8ejrF6yx4ZFoGqw@mail.gmail.com>
Subject: Re: [oe] [PATCH 01/20] tracker: upgrade 2.3.6 -> 3.0.4
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 16, 2021 at 10:46 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Thanks, just want to note that the new gnome version scheme doesn't use the odd-even semantics anymore, so upstream-version-is-even should be dropped from 40.x versions.

Ahh - I thought you had sent an adjustment to
upstream-version-is-even.bbclass but it seems my read was not precise
enough. Interestingly there were no faults in my builds. Anyway will
send follow ups for 40.x recipes.

Cheers

Andreas
