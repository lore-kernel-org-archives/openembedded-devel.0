Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239EFCD8C8C
	for <webhook@archiver.kernel.org>; Sun,  7 Jun 2026 21:05:02 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40817.1780866292409528338
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2026 14:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iX+ncLkl;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66077c46c5cso3012578d50.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jun 2026 14:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780866291; cv=none;
        d=google.com; s=arc-20240605;
        b=A1NNrMab5eCPlnx16TOaIJE754tDtJiBhLnar2ZmP0OLPNnF1KdyYbZAIHy+rY+xlY
         Avt847iutyDJOcchcv29fkPc4WPAfdu+Gp6AqAO9rn8ojwrKo4KwFUHBtielk1j9/8u9
         abzvVEsxPrNxQwOizD28uXjyZUGleQ0fglzKb3enrua9acUvSONey7yB+eCEM+ohzMbh
         qEOJH8cz1F21DeAm2lyS9KxStxdn6Bx6rol9syrYQ3pfVWP8qEKbPhzIj6MQKxV30GSU
         LLVYtr1lpsbw3xlz/sXT+lqvDBjJ9GOYzr6KD95bI6zOEB44s1tYDMSf75FIa/E7rcKL
         R4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jlsxHtaj64j9t62iL7/njT6Am9r3SVoLkqAERh+RLXQ=;
        fh=34tNiY3oIlS96EvASWbqAsHFR6qFLNrgvz+0+CQ+Mm8=;
        b=HK1F2RMxlDPEPNvrfbngbfIZyy6i3+788WB/Fxlm38GR9fLZosQM1ZAYmHjW6s0M3l
         LaOiP2rzb3n6Uy/gb+UxCpLN2lbo6SzY+u+fNMQFsMOg0OzIwhQWb3D4okOsJhLetGiw
         qFykp4hopHfc7v8HkxTVdz5qGL++XVGxLy8mTNsK91NJby0sM/L5qFKIcvqJimBCX0rA
         Kw+YlW5KsNaG9/PmzYGhWeUonROWEYwR9RSCLLKjL2mFzPRtw28YlZCzHjObnaV9Do8g
         9GKYzdkUbfXR4QeKHbx030RFYzPRZUEFyMhTE3pSeSfX4gQdFfJguYZcT+AWsEixjm6D
         cEww==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780866291; x=1781471091; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jlsxHtaj64j9t62iL7/njT6Am9r3SVoLkqAERh+RLXQ=;
        b=iX+ncLklfftlRg8fnZ2n3gNWxcSLczb0UdqN9rAab8VdEqH3hBKklsMIVhjJOxkFQz
         UfJfYQ7G3RO/XU7+PfydBUuqNVk9cAWCkcYZzGJeDFOGmIXDHEE5anOcK41lImEsYtVK
         tNVWGs/5rkdGFbaiNXkRjDu90jmkYmuuvRxz5TEHKz8LlmESyv6+5xoxrIJCkuuX2pC+
         8FEdx0Cg3u/y0uR2XrUMBg8HJlnhM080K1XgGRHi9q4qGk/qF5/kCoZwXobMyeEbtRSH
         Xu8BaiYQbxhwnm1aACDaudAPN3Rihjyasfumy2W3DNJHpEhd/FKGRDC7G4p1gGC/WKXq
         jqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780866291; x=1781471091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlsxHtaj64j9t62iL7/njT6Am9r3SVoLkqAERh+RLXQ=;
        b=Hebb95jqgwmUSQJHGGsCoZfobU5pXJm65fLFP/dFM9gSofIRPJvdymUWdFnrpVXIIt
         zDmotHqz799eN1ae0INSNtpkOfnTzPv2y7I8mL40C0FSa+OW2bqC7MioeJQ/Yo58lNU8
         tP3j1n5VFqjM3hLmDHF2z1rcE1Ss6f/5nil7uG6ZbKwcCcz86FX9mopu5ok6so1UyffV
         ErNh/9g+6wEY6nfg2HNOY4TfWz5WXg4ft753p4/YTglv83Lq6tsRbBCS1TSQKBJpJZwa
         SjwzbbMRyxVLMTHVIKYBhnAjzWdeofI+TDlmngJ5YJJzqYf9cWMvl440MqQt9SnbJ1dk
         ulvA==
X-Forwarded-Encrypted: i=1; AFNElJ9eId2aH6qENww4oAgJAIaVdiir6MKWxt4MvJz6Ljo3DCRcAJ4rv02hgnmX4Ru92cIBhpxsZ3dhshh2xkStG767/hc=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz1CM2lWG7YUP2DyGqXJWdsZ9LnGgXdAiW67/lYBenlBGHYnj1L
	Ku42BLW3C9CdolKSIvNf0kN0JXoGQMOkPien7qnhSByJ/IXh1dwarbqK2hh1O7ZFyiSlbm2njP+
	c2gX9KBpsQCqoat6SKf6Z7WEU5yjKLvM=
X-Gm-Gg: Acq92OGs195KdfDrS82KKN5HW9nTbTGbJg8FcjFGneNCn/o9wcOvi+oA1+etASr2wnc
	MFgmK06zhQGnhHqxlNMkxmOM1PlNxDjFT+u/iqWt8G/bGkyxgkJLcSg33yzHKkoLNeSm3W5ZOYr
	88rNzQH31DLa+v8o72r40FUmoc6qdFI/SVRtb+V2e41peehqpsDz+J50mwraJhOLXCiJvnHReTy
	azj/GT5lW5YJfY/t4S4C3KM0SCEysPtoT/30mJ9B2BWQKNnp9C175wEtV9azbJVRUD9UzKBTw1s
	tBzC2aobOG1wlGQqUy2nNfu5p5lQjv1X3o8arSqCTJd6DBw/rjZR59LujhN0qYmDqBaGa3PmTy4
	ZQiCLibWvz1FNbikuUjcpumWCbI9oU2q/ENuz6/5o1Qj+wZV5YZ6i9//UXOn1wH/z16PGgtzh3O
	kZ8jNjJVb2VNF4UpY=
X-Received: by 2002:a05:690e:1697:b0:660:31bd:3c5d with SMTP id
 956f58d0204a3-66106e8752emr12071162d50.29.1780866291409; Sun, 07 Jun 2026
 14:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260530081837.2192126-1-f_l_k@t-online.de> <cdc55fbc-4ea9-452d-93cc-2eec2fd1a8c7@myspectrum.nl>
 <4651ae38-19f8-4b7e-95da-19cbaf3b7bf7@myspectrum.nl> <RUR1GT.7FBB4YSJA2AH1@t-online.de>
 <194e3c6b-3c34-4cdb-a0dd-f168374888e9@myspectrum.nl>
In-Reply-To: <194e3c6b-3c34-4cdb-a0dd-f168374888e9@myspectrum.nl>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Jun 2026 14:04:24 -0700
X-Gm-Features: AVVi8CcsMFWxwImHZLEd-58HGSkcPpsScJs0qzdY0K-TTzhqEDo97tAo6CfJmIo
Message-ID: <CAMKF1srL-CgP594CTzd-h1TPGVQx3bjgayOxvhxP67D9rNnpBw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gd: fix build with gcc 16
To: jeroen@myspectrum.nl
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b1257b0653b03e41"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Jun 2026 21:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127413

--000000000000b1257b0653b03e41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yeah, I think if upstream is not taking this patch lets disable the warning
temporarily and see what lands as right fix.

On Wed, Jun 3, 2026 at 5:00=E2=80=AFAM Jeroen Hofstee via lists.openembedde=
d.org
<jeroen=3Dmyspectrum.nl@lists.openembedded.org> wrote:

> Hi Markus,
>
> On 6/3/26 10:35, Markus Volk wrote:
>
> However, 'Rejected' seemed like a somewhat inappropriate upstream status
> as well, since this was just an issue,
> not a pull request, and the solution was even suggested by the maintainer
> himself. He just hasn't been able
> to reproduce the problem yet, so more feedback is needed to convince him
> that people have an issue here.
>
> Who's to blame is a different story :)
>
> That's why I chose 'Pending', but if necessary I can of course make this
> 'Rejected'.
>
>
> Don't get me wrong btw, I don't really mind the patch, I mind the warning=
.
>
> Since it flags there "might" be an issue there.
> Maintainer looks at it, euuh no, there is now issue -> closes issue.
> But that warnings is still there, so OE gets patched and marked as pendin=
g,
> that is asking for that patch to pending for a long time.
>
> That makes the "pending" state a bit doubtful. And I agree with you that
> rejected is at the opposite end.
>
> As said, I don't really mind, I just don't like a "possible" issue taking
> time
> of several people.
>
> For what it is worth btw, char a[1000] =3D {0}; will initialize the whole
> array.
>
> I doubt it matters in this case, but it likely does cost you runtime
> performance,
> just to get rid of a likely useless warning.
>
> Regards,
> Jeroen
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127380):
> https://lists.openembedded.org/g/openembedded-devel/message/127380
> Mute This Topic: https://lists.openembedded.org/mt/119559653/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b1257b0653b03e41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">yeah, I think if upstream is not taking this patch lets di=
sable the warning temporarily and see what lands as right fix.</div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Wed, Jun 3, 2026 at 5:00=E2=80=AFAM Jeroen Hofstee via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;jeroen=3D=
<a href=3D"mailto:myspectrum.nl@lists.openembedded.org">myspectrum.nl@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    <p>Hi Markus,<br>
      <br>
      On 6/3/26 10:35, Markus Volk wrote:</p>
    <blockquote type=3D"cite">
     =20
      <div id=3D"m_135078491430797798geary-body" dir=3D"auto">
        <div>
          <div>However, &#39;Rejected&#39; seemed like a somewhat inappropr=
iate
            upstream status as well, since this was just an issue,=C2=A0</d=
iv>
          <div>not a pull request, and the solution was even suggested
            by the maintainer himself. He just hasn&#39;t been able</div>
          <div>to reproduce the problem yet, so more feedback is needed
            to convince him that people have an issue here.</div>
          <div><br>
          </div>
          <div>Who&#39;s to blame is a different story :)</div>
          <div><br>
          </div>
          <div>That&#39;s why I chose &#39;Pending&#39;, but if necessary I=
 can of
            course make this &#39;Rejected&#39;.</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Don&#39;t get me wrong btw, I don&#39;t really mind the patch, I min=
d the
      warning.<br>
      <br>
      Since it flags there &quot;might&quot; be an issue there.<br>
      Maintainer looks at it, euuh no, there is now issue -&gt; closes
      issue.<br>
      But that warnings is still there, so OE gets patched and marked as
      pending,<br>
      that is asking for that patch to pending for a long time.</p>
    <p>That makes the &quot;pending&quot; state a bit doubtful. And I agree=
 with
      you that<br>
      rejected is at the opposite end.</p>
    <p>As said, I don&#39;t really mind, I just don&#39;t like a &quot;poss=
ible&quot;
      issue taking time<br>
      of several people.<br>
      <br>
      For what it is worth btw, char a[1000] =3D {0}; will initialize the
      whole array.<br>
      <br>
      I doubt it matters in this case, but it likely does cost you
      runtime performance,<br>
      just to get rid of a likely useless warning.<br>
      <br>
      Regards,<br>
      Jeroen</p>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127380): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127380" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127380</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119559653/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119559653/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b1257b0653b03e41--

