Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.812.1586895130467558981
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 13:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BSgd1Y7V;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id m67so14763111qke.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 13:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=asOcYfFMQXRXL/MnwGDzMoc+Z8SAZ4rlxOFSqEaLfJc=;
        b=BSgd1Y7VOU9e2pVUjJ9Ntn/sLxvX5XgMjgHgC+XJUBXi9bLIRD0NBzxi1+tHAZnj/s
         L2T/xyMEWJAeb+CYSnXaBY7fUHErgvH3IdmLocTs0vPYHlFE9Cq5QHdngXh6Kuws37a4
         ECgMAiM2NyZUZ9i1lCj2vCQI7IbeF6g/LB+32UU5TDUl98CvC7+F+KUs6E2mUep8Hgx1
         3HxWG9yipnulKu+uZix2CCLk6OmrYhjPNfLkjM1EZN+27AYRaHKLeWuRIRuPaIwnCqJk
         CQC4tOWKzwBi0n2gTPY7uAVuj+BRaWmaJESGHDhxX9C5C5S1Xee7BbRoZ9CYx9wDMyJg
         QOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=asOcYfFMQXRXL/MnwGDzMoc+Z8SAZ4rlxOFSqEaLfJc=;
        b=Xx2mQtz/lCgrLxfDubyvRmh8m9BDnillRIN/bGjoNx8eQcSDOKHYrOcECxyr7I1+CB
         ezPTFleBmijKUbymdWqxHqOYuCla5SvS1huaDgbbNsJF0wYWtMKsGGjMy6rolb1J2lLP
         0xZWE+Fyg75FkZO40SVRLtV8iUGDEBHiK3Roz1IxIgpUuHbSI0A3Sjhz6mFq1NZ1Mo5E
         aGzADz3YgiFxJVDzGGoHHwxujJ8+3o0mddBhy9DizWB24vy+4angV6vr5YVpT2QUYFkg
         0cmv1CkdveS9BeAthuNDh4PlA/YfQVfjLvtGnnqK+vTABlslWEI1FCrz1EtUjTr16k67
         tZCA==
X-Gm-Message-State: AGi0PuYN0d6T1ko+tQSA1/pSkGxa+uOH6f8vU2L1OD9UVTHbfvsO6L14
	9mL8lxeEXBz9tGvMJ9xuMijhiBsCvoiqJNjbSpE=
X-Google-Smtp-Source: APiQypJsHtRHAExMqf0xDwaIKoVfb6DRXspun7nMHmQQo0cCipo8vWvYaJbFe/Qgz3SuZaj3mR32Zn8HY0yzvVeAaO0=
X-Received: by 2002:a05:620a:1eb:: with SMTP id x11mr22927416qkn.225.1586895129444;
 Tue, 14 Apr 2020 13:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sq7uOSsk5OeSeGjHZmZ_4d9ZPQKNgWK8V=YZsBEy=Em6g@mail.gmail.com>
 <5211.1586894072828649821@lists.openembedded.org>
In-Reply-To: <5211.1586894072828649821@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 14 Apr 2020 13:11:42 -0700
Message-ID: <CAMKF1soyubA9fNDuFyUQ+J7JdkAHvgviOGMNQqOXdBoM=muBoA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2 2/2] python3-pykwalify: Add recipe for v1.7.0
To: abhishek.shah@broadcom.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 14, 2020 at 12:54 PM Abhishek Shah via
lists.openembedded.org
<abhishek.shah=broadcom.com@lists.openembedded.org> wrote:
>
> ModuleNotFoundError: No module named '_sysconfigdata'
>
> Was this error not seen with v1? Is this related to removing DEPEND?
> I don't see error in local build.

v1 also has this error.

> 
