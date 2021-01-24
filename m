Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.19928.1611489972543926483
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jan 2021 04:06:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hG5wc7e7;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id 11so6768093pfu.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Jan 2021 04:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qJt1YzyW1w34zp0F2IeJHkHyhCX4QbhsJf/CxWC7WVA=;
        b=hG5wc7e7w5oWXh2vPcl6lFvuo3ekDWWOIN3QW4qcTA7SZh5+f9gsegjNw4DJQ/nC4V
         7eeXoH3FqHh/qncLXZVlORQq4//xOg4dATrMZ5dUSBenVQlqAl8h4pXOyKBQ9JTXKjrq
         14XZfdnyf2Ov9aBoJMv42TT/1AwGYKTh6ApEDLi8cDQPiLSXHJw4y2I3Iemueg/WlJbj
         rZRwKjNwYJ1oZh5o1FqtWmZ4LU3qa5pZpeVlAZJBJVLlSImdJWHOh8ntX6qGZJPdNWPq
         XBabKBiXVszF5ita2g5dAc5F1kFmZ+8/wZvLsafZ8Tl2DtcvbY4TKnhr4BHLTFAS7sDz
         VnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qJt1YzyW1w34zp0F2IeJHkHyhCX4QbhsJf/CxWC7WVA=;
        b=Y/wI+IYHdk8FBZlrdOwZeX75ZulczLvS/s9jactg+kGfI58u2N9OP7ixFxA4GXj2ZC
         QSFo5mbF9Sgi4RMuc6YQEAIarIZd+J+iWgSdvyl2dLcbotu4rQ7fb6ITEa2wWODFJuOo
         6XqbmRG5P+KIWErknfsDo2fNMKFBKmxadZJXJRaUivLRhMKlmdWcL3IQD5X6G2oDDrmw
         7YCoM1DUHRpj/Yk/LIz6g7g+/Ut4nrQPSxQ/sWVqvW7eDo8oIx4ORkjOz43LIxJPXzAo
         Ggf2lX8pwspUUcowPiHo9nGaTKx4K3qZVs4QC2NAN501wT5GU6kMubdOhnpO/86lgS/G
         06TQ==
X-Gm-Message-State: AOAM532Q6Ua7uXouYmjnBj6I2x2OwkE0zBU8zj3GrL3zg8cWxBv2SFU+
	8i+w3imUS/vtkbIATST+zMcMHmtTqFevjjJDECA=
X-Google-Smtp-Source: ABdhPJzkirzciZ5YPv0Vtwg9PxIjLUeeoXKP17MkerJJxAeMTjgBDEbHChtsx52Z9Oc1vDioe38jp8SVrdRliraGpWA=
X-Received: by 2002:a63:fd01:: with SMTP id d1mr5113888pgh.319.1611489971836;
 Sun, 24 Jan 2021 04:06:11 -0800 (PST)
MIME-Version: 1.0
References: <20210123192513.2663547-1-schnitzeltony@gmail.com>
 <20210123192513.2663547-2-schnitzeltony@gmail.com> <CAMKF1sqbUbU9+rCmp1cRw7GB6U9_8PcZf1T6VcdsBMfnyisZbA@mail.gmail.com>
In-Reply-To: <CAMKF1sqbUbU9+rCmp1cRw7GB6U9_8PcZf1T6VcdsBMfnyisZbA@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sun, 24 Jan 2021 13:06:00 +0100
Message-ID: <CALbNGRQQKUOH5KExy98dry5XUKnrp5mx=dNd2n7P-C4TOG=r9g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-mypy: initial add 0.800
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 23, 2021 at 9:51 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Someone should delete it from these layers too after it=E2=80=99s applied=
 to meta-python
Once applied here, I'll send out patches to those layer that have a
getesgarth branch.

Andreas
