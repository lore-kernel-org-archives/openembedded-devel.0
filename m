Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.1418.1627927646384155539
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Aug 2021 11:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j0sr1Nwi;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: b.hutchman@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id u16so12040865ple.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Aug 2021 11:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=LaVDZ5V/h05vjyP0qfD5ZMK5l/frZoEmoD48lqiMj1Q=;
        b=j0sr1NwiRIKOqzAxCxKB6BgLIEeexByi60LJ1nwAXJzZug5B7HuFNBwj4m4E5HZRi5
         MJX5PzuO69nrN/z6fnIcKsGR/9VkFqYfU2QdwSs3y2oYEonBUjNPkbY+ATPYnxg9lCyE
         3aDF1yvbhBtbCkwMU3A8gtfN8F08dagjAHV0HKUqcs/4/KBk7CxzEcjdIfVjwBYYW4xb
         VOelH8HLmv0uf7ZyarWE0lVN0MruD6tZn4nozTp+SiC5H1WDsYa81z7q9qcRQE6t1Ff8
         4lgkqrfBGhLMMRAO/FCMEA0Dg+LLR6Zm3TZDKYaLnBmLuM1sWnkVoUTVTWEw7MVeoTaw
         TePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=LaVDZ5V/h05vjyP0qfD5ZMK5l/frZoEmoD48lqiMj1Q=;
        b=njA61XXQgbkVyXpq8xHtHjiez5DaAJ/+3z/CqMIQVzbBJGcF7yN5IYIUIXxPDJ+0Zx
         w/fhKfR6tHrgcL9sa9VrnLm3i/hO0xypB2BcOslKirv2CpcDdTKO+OLyuyZyrcE1AZ7u
         ZsOwxHy8IwGIbV8SwY9zbcQXzrkMB035e+IRu8WQIjGSyo2tzC/4UXkGfE8Cjqva/w9c
         C5OM+HpqJNE+nAEAEYCakE31VW6YqytTA58d+RX5WR1OnYpSc887wUFzDiN3f814QQxa
         EBb22RhTJziGugrIdUdWWwF72Lyrxj1hBkWVISUloFpX8hZUU7I3GpryfmnOrb3pwiU1
         BPNg==
X-Gm-Message-State: AOAM5313nCiyMZAEmdIYvuU5fL11DyEkjSz94C0K+SCwTEtFyQhQNv9J
	1657uozj51VsA0H+vvOrri1gPcrDfLSnBaf64IMtVkky
X-Google-Smtp-Source: ABdhPJyxTy9DqUAiYi+EGjgH6ksvW4KPsm5+vWRfXbP+m5WFzR5jHvl151yDndoh1NYiZHRiVo9LDY9OnKrDWOJSbXk=
X-Received: by 2002:a65:4307:: with SMTP id j7mr2222407pgq.387.1627927645516;
 Mon, 02 Aug 2021 11:07:25 -0700 (PDT)
MIME-Version: 1.0
From: "Brian Hutchinson" <b.hutchman@gmail.com>
Date: Mon, 2 Aug 2021 14:07:15 -0400
Message-ID: <CAFZh4h8HhO5EMV8k4y6a8pMFOMO9Wv68zAO+Zy6KJSEUFePRFw@mail.gmail.com>
Subject: Any way to make cryptsetup smaller? I have a small 32M NOR flash and 11M SquashFS rootfs.
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000007f5e005c8977100"

--00000000000007f5e005c8977100
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a 32M NOR that I boot from and it uses a 11M SquashFS rootfs made
from core-image-minimal.  I'd like to add cryptsetup but doing so blows my
SquashFS up to 35M.

I've looked at the recipe and package config and I see things like
--enable-static and other settings that look doubtful that I can build
cryptsetup package and get it to fit my size constraints.

All I'm wanting to do is encrypt a filesytem and mount it as ext4.

Regards,

Brian

--00000000000007f5e005c8977100
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div style=3D"font-family:sans-serif;font-size:12.8px" di=
r=3D"auto">Hi,<br></div><div style=3D"font-family:sans-serif;font-size:12.8=
px" dir=3D"auto"><br></div><div style=3D"font-family:sans-serif;font-size:1=
2.8px" dir=3D"auto">I have a 32M NOR that I boot from and it uses a 11M Squ=
ashFS rootfs made from core-image-minimal.=C2=A0 I&#39;d like to add crypts=
etup but doing so blows my SquashFS up to 35M.</div><div style=3D"font-fami=
ly:sans-serif;font-size:12.8px" dir=3D"auto"><br></div><div style=3D"font-f=
amily:sans-serif;font-size:12.8px" dir=3D"auto">I&#39;ve looked at the reci=
pe and package config and I see things like --enable-static and other setti=
ngs that look doubtful that I can build cryptsetup package and get it to fi=
t my size constraints.</div><div style=3D"font-family:sans-serif;font-size:=
12.8px" dir=3D"auto"><br></div><div style=3D"font-family:sans-serif;font-si=
ze:12.8px" dir=3D"auto">All I&#39;m wanting to do is encrypt a filesytem an=
d mount it as ext4.</div><div style=3D"font-family:sans-serif;font-size:12.=
8px" dir=3D"auto"><br></div><div style=3D"font-family:sans-serif;font-size:=
12.8px" dir=3D"auto">Regards,</div><div style=3D"font-family:sans-serif;fon=
t-size:12.8px" dir=3D"auto"><br></div><div style=3D"font-family:sans-serif;=
font-size:12.8px" dir=3D"auto">Brian</div></div>

--00000000000007f5e005c8977100--
