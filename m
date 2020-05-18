Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.3789.1589833592212704310
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 13:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l29FPMzj;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: david.banks.engineer@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id d24so1734089eds.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 13:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=CV5X/Afv7rZzr6uSouXZVs8svTYr+i70ZpDy0iFb7cQ=;
        b=l29FPMzjjSNdHCaFsEB7Ir9KdGtc+TEvEwHPPvE0vJ+dqNL38RBKGk2D/dDjT54G9B
         Ym85cr95ItfkD1N6JgfM5aWy875/a6k5o2Mkx+non/DUlCsPqUANBenNR+8b7P34c3Z5
         dxSEwO6dk/Dk6EJKBbpDLVKl1UlRUwbcVFc9BB69rARXHIhliCr8I6hQ95J+v75A7l54
         EPUgyiEjBkMj5FJD728hgCOpEgyiaeAWWOlxdbDHyGR26tZ/LwR31bRyDJYYkA4/l25s
         XovBwBuepoLqC4OdreGAmVhYq5d9QVGqBTivkSD5bugK5K29IdtZLRLwu/boD93Y6ouB
         hRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=CV5X/Afv7rZzr6uSouXZVs8svTYr+i70ZpDy0iFb7cQ=;
        b=sGJWHwA4jO3RXo5vvibuhHUNamxzWi+lHu77TEAPaOGxT5YxB/CVjAW1dVberaM68U
         RPpmt4cExdh/29ddNdO2KVUDlZLZH/Sj/1OsXDwH/BpJfby6bXzDzgpVhVsZpL+7AZIy
         ylr2fOcxqolkEvQS1SReDPZQrO4fXaWEQx200Y3KvZcg8mdhXWQsIKfryQurSkH7MkIS
         RCOaHonxAcXbNsbMpR68rLbr/vYvLLXFG8WU/MNqT0z2J7mHvpIbNxx0uKpic056Kmjd
         sXfKe5CaQkLUGCV36t7uGw09WMInV68prvs3VgauYbGS+vbPkBoKleI3IUw+6Itxyljs
         9cnQ==
X-Gm-Message-State: AOAM532Q55z7+/2gnrpPHDYMwnSPd/Zxx6/ohx2XtN6awo7fOCzihR2k
	8NpVMGAhwQQ9d7PxNv38NkH9DUye/8E5jz2GNzKcckM0
X-Google-Smtp-Source: ABdhPJxvUoDiFvUU2+hbOLsDPYDN0XRAAj/FjF1WQLmsIkivM0E/rvGQqYbWwHbSvz+/PaVE3VCKZlcTw5oNMOMa0rI=
X-Received: by 2002:a50:ee15:: with SMTP id g21mr14702367eds.170.1589833590195;
 Mon, 18 May 2020 13:26:30 -0700 (PDT)
MIME-Version: 1.0
From: david.banks.engineer@gmail.com
Date: Mon, 18 May 2020 16:26:19 -0400
Message-ID: <CAB=WuyaS00Sp1KdA-O-2OMQdwPcx=6p-f03+ZAXVkh-MA9nO2w@mail.gmail.com>
Subject: Should meta-python2 include python-numpy?
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006547f905a5f1faac"

--0000000000006547f905a5f1faac
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a layer the requires python-numpy (specifically python2's numpy).
When upgrading to zeus, it no longer works because oe-core no longer
provides the python2 version of numpy. For now I just added numpy to my
broken layer, but I am wondering if it makes sense to add python2 numpy to
meta-python2.

Thanks,
David

--0000000000006547f905a5f1faac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I have a layer the requi=
res python-numpy (specifically python2&#39;s numpy). When upgrading to zeus=
, it no longer works because oe-core no longer provides the python2 version=
 of numpy. For now I just added numpy to my broken layer, but I am wonderin=
g if it makes sense to add python2 numpy to meta-python2.</div><div><br></d=
iv><div>Thanks,</div><div>David<br></div></div>

--0000000000006547f905a5f1faac--
