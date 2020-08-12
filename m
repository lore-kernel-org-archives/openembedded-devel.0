Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.9309.1597213436711050257
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 23:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W7AB03aD;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: marek.belisko@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id t10so982163ejs.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2020 23:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Eddk8SJ/BR5gQ82UrHZ4oZcC8w6yY8NP1qbI9UuDrT0=;
        b=W7AB03aDjA2FFeBTfbrIUa17HP/t5WWDEj30n+7NAqe669W03GdVH02dUElu/72sNx
         slHo2wDi5FK5BSWzSQtnbjN7AHSgM5ZBqDpPMKWnIuCdDqO/wGFKFKYwYrWXAVhuFvU0
         vAEJPEDShBRAybl6umZogn+02GGmKCQmZhTGz6kS8Arsw85O5DKodGrFQdl6DQuKufoI
         LgwjzruoDcedPiKSrifVO/GaH885vBRcqYfYJcbKpHIHCocQVLdehzbQvK7cfNNZ3XQl
         hDiBn69e6eUwAY9gXTMXMDJd+iVnRTwBwveeDFIrE3cHpnJBnUPJVhngtwvYWJtjmjOz
         ds/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Eddk8SJ/BR5gQ82UrHZ4oZcC8w6yY8NP1qbI9UuDrT0=;
        b=F1g2jE+yDxVdAbr0EXN+zZY4SXdRcseGrXtH2GNDVr1CyS0K0S9bZ9ZnqD42FPdb5Q
         Vq6QTV1rg/1GEW2IcWd5lXsZ7B1zijPkGn8IJsejDj5eDPeBO7IO3j17UPOiUNMx1unC
         idwHdr/9Ym/6bqEqFDPFyVByPom/23mgcZpzC6gT0BJeFZOvq17IweHGTtXT/XJ3rh3w
         Fm9yN14ynIii2KO7N/HwbJHmJpf3tWlKiSgpMtR5Fu8vuasgzMi3To4AgiZjDpdL9AdZ
         52y+ZpiA/xGTSr9iYpO5Xikeb6D0t50YNK7I0B1FhHU1f5EMhqJXebe2qzXX4WmH5kdm
         QOYQ==
X-Gm-Message-State: AOAM532diPUV+8+mrLk8t1gV5KzSsSEKLPCmjwiq1GBWorlmEyr+VDS6
	3o6yI6qAgiMlP+/M4IgXBJkPIHUFcng+d/NCWj5iA2O/
X-Google-Smtp-Source: ABdhPJyfnVlmGGEuU3yZSM3r/ogRDGRB28NxAsET/+gqyQi8WOOn9UaR7viGc6tGdYpsYXB3lDYr1AHBYN+K6SrZhlQ=
X-Received: by 2002:a17:906:c187:: with SMTP id g7mr30925270ejz.108.1597213434946;
 Tue, 11 Aug 2020 23:23:54 -0700 (PDT)
MIME-Version: 1.0
From: "Marek Belisko" <marek.belisko@gmail.com>
Date: Wed, 12 Aug 2020 08:23:44 +0200
Message-ID: <CAAfyv36hiQVK386UOAfxtWGM+stjYJEco5e1hT=eiPwfsxYJXw@mail.gmail.com>
Subject: python3-pytz fails on dunfell
To: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm using dunfell branch from poky + meta-openembedded and facing
dependency issue like:

'python3-pytz', 'python3-pytest', 'python3-packaging', 'python3-pyparsing'

when including python3-pytz as dependency to one of my recipes. When
disable ptest everything is fine. I search for python3-pyparsing but
cannot find it anywhere.

Thanks abd BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
