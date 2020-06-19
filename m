Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web10.4398.1592565424876068154
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 04:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LYs5y+pb;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id o5so10737837iow.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 04:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bpIeUaoGD170jrv6NPKrmnbXygDuykYGGWr3U+rZwoQ=;
        b=LYs5y+pboi3dT+NQa6R3A5CFkBsnn5VU0S5O1ShexYE1ifyRRW/nWcNAr91ZbAj5n2
         ZOt46rlKCR9LbzeBaOpBoqLGxE7QxwsYivGuXzp7154uCRY8B+G5WC9fmM2lqXRgEYdK
         MwnYA5pnX4kvkZsZF+9IS9lBlLkfRp4/W6x5o/LlpAD6S1l3GgT3Zb+BzO+YapL4dgtt
         t0b2/EyQ0nq6GBotXbBJHWdEyWNtiNyHtizOzOJgRF17u1oboJ7yMxlQ7Zvy4tv23Bni
         sBZnUSlaYDHhmO6aTH0jpILamrlNmDRcq95DCYitQnrNvDwB+/Vj+lQ2goouTmrpJs99
         DhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bpIeUaoGD170jrv6NPKrmnbXygDuykYGGWr3U+rZwoQ=;
        b=rFO7C0b22aeAv3dFVMcfHRkWfZh2znomeF2eUiwjRgcV6vGNMq8q2xC8/mXfaWyeZH
         s2vQx81hr/nFT3Dh0Txxu87BfhZe/cN2FwdjYGDsTLfzYk66X248Zn1GFYD1pblMoV8n
         4WCVFE1CzSCwt7Eb+lY/ItoTJIpH/MPmHvye3PYnqe2fxxbkkBY2rFgJRjgZVV9zesO8
         uTC5glMywwXugNmeu3mmAIoP/dBTe7SOD78poIo6JFoQy2mTaecnW/0gTVNG3nbq+PNU
         SgwYklU+VkvRqdjfU6yuCu8WEFJtr8Z3m2aYotTg00THqVIXusUh9cFH50qxLS8QCy1P
         6Pcg==
X-Gm-Message-State: AOAM532y7eHkdEXbE46kxlRvZotGFcn0QLU5/S4gWOoYR9xSQNnQ1Urw
	RkGKBqigK6OiPYVPAfWpNQbFKsAh4UcRGUMvCeE=
X-Google-Smtp-Source: ABdhPJw3XoSx3M9YaRl2edwS9T2gqfX4LynZ0bPaBRXGP6PQTEA+46hWyhO+qMiawIr0pulka/jZLtZMfCP5pbRT/lI=
X-Received: by 2002:a05:6638:d52:: with SMTP id d18mr3388572jak.21.1592565424202;
 Fri, 19 Jun 2020 04:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <1591295308-26420-1-git-send-email-rahulk@mvista.com>
In-Reply-To: <1591295308-26420-1-git-send-email-rahulk@mvista.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Fri, 19 Jun 2020 13:16:52 +0200
Message-ID: <CALbNGRRKvq7rd0PSPGvuAaVqg0W1nMO-_9LNQ4M8kXR+Cq3OTQ@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][zeus][PATCH] tremor: update SRC_URI as project moved to gitlab
To: Rahul Kumar <rahulk@mvista.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 4, 2020 at 8:28 PM Rahul Kumar <rahulk@mvista.com> wrote:
>
> From: Armin Kuster <akuster808@gmail.com>
>
> It appears Xiph.Org is now on gitlab
> https://gitlab.xiph.org/xiph
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit cc6e59fdff71e47ef5b9b40aab3bcd9438960ea4)
> Signed-off-by: Rahul Kumar <rahulk@mvista.com>
Ping - we have the first 'victims' [1]

[1] https://github.com/openembedded/meta-openembedded/issues/247
