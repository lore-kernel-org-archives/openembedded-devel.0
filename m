Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web11.11114.1598353309304134281
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 04:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J+aQJi2/;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id a1so6092634vsp.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2020 04:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yKxfRjqMInRbAAAsYGsPnfll/5npb4jq7vyvIXqjA2Q=;
        b=J+aQJi2/iIXAZIcFfwTapIWd1/be1ZEeho/PGySNUdJQTVO/h3jKMCz+BFm1gL0YpZ
         dD+Afw3tgvpkczz7sVGxsheutZYxl9J1P0dRy5vnIF7xZWxS+MGPRuc1T84cZkb/ijNB
         LPFx3t+FWeON1pKZAwZDs47EESsbSo/PqND3Mq2aIkvwLvpGP3Bj4hoOchZ6YtifsNI+
         ayLyg8R84zYAp0yeZU0C0UDy8VnmQY3OJbJM2bOPJ4+b9aY07dwasBjVY4Ee/KJzS1iM
         6eUaUqCWhOuTff/EBX0tNTFd/zH0Ezyf15t0VDEs9InaH7T3ojVEdqbILjR/I9uQDBvv
         9eOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yKxfRjqMInRbAAAsYGsPnfll/5npb4jq7vyvIXqjA2Q=;
        b=ZiBmll1tAK413vRiEJ2dCEHHKB2VdZyY1+keGXR2uXYKxuZKBsscYK2Ml/llmTSuJ7
         dA3A/IZu1CdY8uo3cZM7m1OhpeXOG9web/I4so1Dhuf9UcRnrBpseT7Vyiz7yZLL6WZE
         BtTcjNroyfJkihzk0bzQMTE4rjdJaibe7ZVw/uYOtJt7VV36R3gYIDmkPnT/UXlMRCh9
         tAEDiMJbSOnV2CaKByuz8fzWXTiNNa25VTvedPzDfFn7vdZHEb0Ts2jh3dvRjYJlkAXd
         W9jCnWWRh0IndLH+o419mmtdNfw3oP/+yd467cWe6Xim5HNFy1h3jHW932TXxOseJyPn
         aQgw==
X-Gm-Message-State: AOAM530zMoRbyPqeVRJ9DZfN2xWb4tKYSetSvqSdPnsOif3knuKgMFW2
	Po3DlInG1bqD1FO/lMBwwc2NrIrjh/59obqHTgw=
X-Google-Smtp-Source: ABdhPJyvXgco8/nr7gW9jcuxEGFKJbanqCbMeS6VkptXmXH9Tk68ewPm9l6NzPV+knjo1JFaZp7k3q9ICnopbxFOPm8=
X-Received: by 2002:a67:fd0a:: with SMTP id f10mr4530678vsr.35.1598353308434;
 Tue, 25 Aug 2020 04:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200824062225.GD65616@pcleri> <30416287-890a-4fd1-2262-21b2a9b68ffd@gmail.com>
 <20200824083345.GG65616@pcleri> <CANNYZj9BA_nPnJCHDAUcxtzz9Lz3zn8WSPh7jeKJY9omCTHRaA@mail.gmail.com>
 <20200824091401.GB2286@pcleri> <CANNYZj_+KTOwyvBhrDQ7NuecOBFe=Poh8Khc_ntDU4M5iGL=Gg@mail.gmail.com>
 <20200824093831.GC2286@pcleri> <CANNYZj_LT1m2gSbhL+Di1PaFGzSYGmPVYsEus0YnSx19sOZ8jw@mail.gmail.com>
 <162E2BC2BA50B6B6.12673@lists.openembedded.org> <CANNYZj8fWMk1Ya+G-HbC2VVbC4HWV6x=4T=ni_cdW5-qNG1YnA@mail.gmail.com>
 <20200825055800.GA37583@pcleri>
In-Reply-To: <20200825055800.GA37583@pcleri>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 25 Aug 2020 13:01:36 +0200
Message-ID: <CANNYZj-n4T1bkX4k36B5LgG+7nJANO+sVKGXbyf1mFZTMx-t1Q@mail.gmail.com>
Subject: Re: [oe] [meta-java] Changes from master-next merged to master
To: Richard Leitner <richard.leitner@skidata.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002cc42d05adb1a15b"

--0000000000002cc42d05adb1a15b
Content-Type: text/plain; charset="UTF-8"

Yes - I ran this in our internal CI, and there was no problem. Now just the
stable backports are missing.

Alex

On Tue, 25 Aug 2020 at 07:58, Richard Leitner <richard.leitner@skidata.com>
wrote:

> On Mon, Aug 24, 2020 at 09:36:42PM +0200, Alexander Kanavin wrote:
> > I think the site and the downloads are now properly back.
>
> Thanks for the info and sorry for my misunderstanding regarding the
> java.net site.
>
> So you are able to build 8u265 with the current master?
>
> regards;rl
> >
> > Alex
> >
>

--0000000000002cc42d05adb1a15b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes - I ran this in our internal CI, and there was no=
 problem. Now just the stable backports are missing.</div><div><br></div><d=
iv>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, 25 Aug 2020 at 07:58, Richard Leitner &lt;<a href=
=3D"mailto:richard.leitner@skidata.com">richard.leitner@skidata.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, =
Aug 24, 2020 at 09:36:42PM +0200, Alexander Kanavin wrote:<br>
&gt; I think the site and the downloads are now properly back.<br>
<br>
Thanks for the info and sorry for my misunderstanding regarding the<br>
<a href=3D"http://java.net" rel=3D"noreferrer" target=3D"_blank">java.net</=
a> site.<br>
<br>
So you are able to build 8u265 with the current master?<br>
<br>
regards;rl<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
</blockquote></div>

--0000000000002cc42d05adb1a15b--
