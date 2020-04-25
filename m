Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web11.2080.1587794044029674446
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2020 22:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dMI88XnW;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id s10so11415587iln.11
        for <Openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2020 22:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=6pVm0zU1PuO+lOFh3hi4OiOZ7LzljNOTYjlPfO+OuYw=;
        b=dMI88XnWcZfxmG0ag7KD3RMFhoJaR1d8JRhiCVgkclf6gmOKrd3KTK99QJ44Zg+DGX
         Bjj/jSBHANJGszzXteLPfF4REZEI3GDAAMPNIrOwj3J2Vvzx43gJfGKqFsn7ofz6H2B4
         IuXrTy4FdHkeShw8zQJt0dP+9gkSDqkBmXvXEmJKXaszGrkh76Yhyuyc0IcrDM/wPqrv
         uFu4p2Z9VmX8cwfRIEwCnsnBMDYHjUX+cR5ABMLmeg2PYFVHW7xi4RrAEp2n3X0vvpPM
         rBACkSRpCHLkk5e3lzbpibYtdNvEZE4j7FEBkwhKTIemEBFplfFFpOD/uNDmXJ0/B2/w
         azmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=6pVm0zU1PuO+lOFh3hi4OiOZ7LzljNOTYjlPfO+OuYw=;
        b=Hwhn1GGZEjo/Zmrvg361Lf11hadjWxz31lm7+BZXfdJ8+NZfENkY/4cgUDz3X0RRAl
         WymjTwWcPVRpHWggHknGTBzyPbwzZ9SQt8wMMgMwwer1Ky8BC12lnn+urKiiKQh4wenE
         I49OSsYslDNVA6grcQczCHIkX/Vzgu9VIUGTNvsX1yGNqtgq1Yq3NDhD/5e/wVDly9mO
         SRWkU8bwRnDyO5H3SGRn8Usa/ByP2a4wsL20LpZUTjTHGvRQ00pWzUOcZ4dc3c6ODYhQ
         Qv9dUeRAV/PtBSn4HuIq6a8wteRyZxogG99cgJJL2q11w0J5HWeBfnFOWqzg9X9p123y
         NKdQ==
X-Gm-Message-State: AGi0Pub9BUYLOsADCFR+ZHZj8tUwUFztxuoVp7yqICVD1AqMPwPyMBOx
	01Zc5qd0qJmplCoz8kDS4CLyxpl5QgtxzMFngWEoX92w
X-Google-Smtp-Source: APiQypIyNxgcBuiilEXjNGTE3SSsuQA3QiRWHel2rdSKc+NPBfRwTYljG6tH8wXZ9g2nIBLPy/KeXAJL0NoJOFcr62E=
X-Received: by 2002:a92:1b91:: with SMTP id f17mr12024957ill.142.1587794043245;
 Fri, 24 Apr 2020 22:54:03 -0700 (PDT)
MIME-Version: 1.0
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 24 Apr 2020 22:53:52 -0700
Message-ID: <CANx9H-DP=9gYudOCC5LOFantGWGDwyGUQZtATUeDZ2WJLrbXGg@mail.gmail.com>
Subject: [meta-python2] Final python2 release
To: "openembedded-devel@lists.openembedded.org" <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ec9bef05a4171b71"

--000000000000ec9bef05a4171b71
Content-Type: text/plain; charset="UTF-8"

The final, last, terminal, dead, deceased, never-any-more,
move-to-python3-now release of python2 2.7.18 was released on April 19. I
have posted a patch to upgrade meta-python2 to 2.7.18. Please test. If you
care, test a lot.

I intend to also apply this release to the "dunfell" branch. Since it is
the first Yocto Project LTS release and this 2.7 release is close enough
for horse-shoes and tiddly-winks.

After this month (April 2020), I have no motivation to continue supporting
python2. I do not use python2 and have not since bitbake was upgraded to
use python3. My employer does not use python2. The meta-python2 layer will
be best-effort only support unless other maintainers step up.

If you want recipe upgrades, now is the time to send patches. Dead men tell
no tales.

--Tim

--000000000000ec9bef05a4171b71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The final, last, terminal, dead, deceased, never-any-=
more, move-to-python3-now release of python2 2.7.18 was released on April 1=
9. I have posted a patch to upgrade meta-python2 to 2.7.18. Please test. If=
 you care, test a lot.<br></div><div><br></div><div>I intend to also apply =
this release to the &quot;dunfell&quot; branch. Since it is the first Yocto=
 Project LTS release and this 2.7 release is close enough for horse-shoes a=
nd tiddly-winks.<br></div><div><br></div><div>After this month (April 2020)=
, I have no motivation to continue supporting python2. I do not use python2=
 and have not since bitbake was upgraded to use python3. My employer does n=
ot use python2. The meta-python2 layer will be best-effort only support unl=
ess other maintainers step up.</div><div><br></div><div>If you want recipe =
upgrades, now is the time to send patches. Dead men tell no tales.</div><di=
v><br></div><div>--Tim<br></div></div>

--000000000000ec9bef05a4171b71--
