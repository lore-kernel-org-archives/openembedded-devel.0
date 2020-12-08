Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web08.10578.1607443042054674940
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Dec 2020 07:57:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Kp5os7RB;
 spf=pass (domain: burtonini.com, ip: 209.85.167.66, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f66.google.com with SMTP id h19so4366144lfc.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Dec 2020 07:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eSzRT4046UdQPaPUKEKBA5S+i651Uf/K15jDlu/8wCY=;
        b=Kp5os7RBTLBAQCC1B/2FlsHP4n6Thlw81odOHbsvQdL8oFHz7oecbobZvLU5rFti5y
         ZMtPUFcXjIhT8+Pse5iKwzhlPK8PXYLE4wFnHjXAo8xgvECgRVoVsbVYdTSoVQwFTw4y
         jf/y0on/WZllVAkLhU88XlMUUvuH2FcXBwtVqYhVlCHqFQl9p+npn4o45w6eV3zCLwBw
         TmaG4xGIODoTWMJx2Ka1orlpy61USYxOif+YGPLP+BYB2jg+oXt9xcC0vSGD7nLukVUw
         ZaCWT4BhFm0gDrRy6Sn7HEMVPOz9kAyTrmQnIr+R2jwBY3hZGxFjjB4eFQoQjhgUWwSX
         +Kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eSzRT4046UdQPaPUKEKBA5S+i651Uf/K15jDlu/8wCY=;
        b=DmRm3sBrM2DlB3ppnvQW6sF03QQPyGxGNV+G/BoP9msmdZp2uKqnu9eyzWugLlKsnq
         kXlwuD15gecnu7ncJwNY/c8Zuh3AlzKtXM2Cx5cIr+coy+WJuo7+qq4ArKTl71Rre8/n
         nxDfo2Cf/QWDXrzJp7mDbI+1ohQL7xOyv3objM4beZV/N2Fay+aSG0jes2jWXjlCW3wa
         JAcVdC/TjQVM9gHkXw+RycPA1+lQNAnAlmCXCRtIk9FYESarQudw3g7D1UnVTKsjSVzO
         UjQaQY9qjHj8Lez3c8xtwuYNq2lrG9GNUTNILqnt3jkwhg9APexVnIgkkvjEaZkngVzJ
         gvyA==
X-Gm-Message-State: AOAM533WOJ66TAeyP58fMzE051GhkAUcnlBzDodg3U1aUUWTIdonOGF6
	uM0Tq0eJCTw7OPmqmi0hC9vlinCdXzaxhUTin2DuIA==
X-Google-Smtp-Source: ABdhPJwsXFlZnV2xBX3xLpA9Niu+JCqepdJkN2bYJ1Nqlba3S9wTzeAfoY31f/3C1ZjS9ZVuKDp9DZqeST1oiCfcwEc=
X-Received: by 2002:a05:6512:34d3:: with SMTP id w19mr11470236lfr.180.1607443039047;
 Tue, 08 Dec 2020 07:57:19 -0800 (PST)
MIME-Version: 1.0
References: <1607101539-25986-1-git-send-email-r.karszniewicz@phytec.de>
 <CAAnfSTvw9KrUNTRZYSF7tBztw+7FR2WRU_CJEWASOH0KoN-Qtw@mail.gmail.com> <e158ef54-c4c2-c29a-d906-3d4a4b710bd4@phytec.de>
In-Reply-To: <e158ef54-c4c2-c29a-d906-3d4a4b710bd4@phytec.de>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 8 Dec 2020 15:57:08 +0000
Message-ID: <CAAnfSTsiDvMtVvgUKpQHLJSrPCPeLMdgikGVK9rCt4YbaOqejA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] firmwared: add recipe
To: Robert Karszniewicz <r.karszniewicz@phytec.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Fair enough, thanks.  Pretty slim use case if most distributions turn
it off, and the tool is unmaintained.  I wonder if anyone is testing
that codepath...

Ross

On Tue, 8 Dec 2020 at 15:33, Robert Karszniewicz
<r.karszniewicz@phytec.de> wrote:
>
> On 12/7/20 11:49 AM, Ross Burton wrote:
> > Last touched four years ago.  Isn't this what udev does?  If this is
> > for people who don't want udev, I suggest you make that clear in the
> > summary.
>
> It's not a matter of whether they want to, but they can't. At least from
> what I
> can see, udev has removed support for loading firmware six years ago.
> Am I missing something?
>
> See this paragraph in kernel documentation
> Documentation/driver-api/firmware/fallback-mechanisms.rst:
>
>    Different implementations have been supported in userspace to take
> advantage of
>    this fallback mechanism. When firmware loading was only possible
> using the
>    sysfs mechanism the userspace component "hotplug" provided the
> functionality of
>    monitoring for kobject events. Historically this was superseded be
> systemd's
>    udev, however firmware loading support was removed from udev as of
> systemd
>    commit be2ea723b1d0 ("udev: remove userspace firmware loading support")
>    as of v217 on August, 2014. This means most Linux distributions today are
>    not using or taking advantage of the firmware fallback mechanism provided
>    by kobject uevents. This is specially exacerbated due to the fact
> that most
>    distributions today disable CONFIG_FW_LOADER_USER_HELPER_FALLBACK.
>
> Regards,
> Robert
