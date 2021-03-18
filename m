Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.7226.1616064462218502140
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 03:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=VK4x5hzd;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.44, mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f44.google.com with SMTP id u5so3157732ejn.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Mar 2021 03:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=+z0OpITxImwji671Nskh0y6QJd9MkPAmgX+ajLwFdXE=;
        b=VK4x5hzdRLZwJMh/Teiyr9S7cxPmhSKmMIPwr/i48T8WfNaE/4PZrMF2grHmjPLFAg
         ZwMx6PdrGySGklDS4ImjY7cu0O+6lpOkHq39lqpTI+og2N+PN4sqvpo6H5bBPq3A8RQn
         HbC1dJLKFN1flW+NWqySZ46E3NVKKKzNqouahc2lreULs9ZdflVbAoodqK8Wn43ICkwH
         +EhtTlWJbLCxiUGdeMhNFz+8Rz/JNGIIIqpWT0PE5Xl3tTrR+ZkDqBqz02cu6W7d6cvN
         aZWeKhaM7ZWorDg2yu5m2jISDgNwE5e/eHM2QNASQNDhXvZuXJ0XWbH1yvQSsQjtZCF+
         lL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=+z0OpITxImwji671Nskh0y6QJd9MkPAmgX+ajLwFdXE=;
        b=c0iW9lQrmEe6KyMRhR3FqwAadmuiAYVORAY65iYUdIkONDKlMa9aMoYymr5YGHW0zr
         rpXahmVAIyDkCuK9q/cQiVelbhCalC4JkcOpn56qzt7O3DZBTvpIS+NxE2ZxJY4yPwvs
         lJP5lQNL7BdRFgSUfynEWKtfspRJJC7Dnja8/jeventBUrrSDERWFuknyz1XCJea0R7L
         M7ET7h/ph+MWhbH9rov438nMlQKNcnTJA8BBx4sT6/p1t7wQ80tml8/6aXvV02rt0HOp
         WItTc80iVaJwx8Xztv9QnAhXM2PEgGbBK6SBLAPQnU24enoeIL6DQHwTIpXBZt9S5EGo
         WlzA==
X-Gm-Message-State: AOAM533pfTMrpyzEZu1WwPzQKyZbeAqQCAuvMyyRBf4oNilGUPotX1bl
	+5nfav3UX2vpVD8Hj2f8TzLb+YtFRfnKM7Li6He/Vjwehn8HHQ==
X-Google-Smtp-Source: ABdhPJwkVcBtQKs6v+HQfT+mQG7q7Y29yQSSvqfE0I+vtrcV+OGH0P5lD7R2esAl/D+BhaYX4TjoMGNZZ3vxC3cdHNg=
X-Received: by 2002:a17:906:4bce:: with SMTP id x14mr39815245ejv.383.1616064460533;
 Thu, 18 Mar 2021 03:47:40 -0700 (PDT)
MIME-Version: 1.0
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Thu, 18 Mar 2021 11:47:30 +0100
Message-ID: <CAMRc=McUB0dbu=GoQz_mrt0=V3=iYawp=WJi6Z5-_fW3i4dLPQ@mail.gmail.com>
Subject: [meta-oe] mpv can't find x11 components
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Trevor Woerner <twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"

I'm trying to add mpv to an image using the minimal-x-session. The
build fails with the following error at do_configure():

| Checking for X11
     : no ('x11 >= 1.0.0 xscrnsaver >= 1.0.0 xext >= 1.0.0 xinerama >=
1.0.0 xrandr >= 1.2.0' not found)
| You manually enabled the feature 'x11', but the autodetection check failed.

If I build the core-image-x11 image, mpv builds just fine so I assume
I'm missing something in my custom image (or rather some dependency
isn't pulled in by the recipe).

Any idea on what could be missing?

Bart
