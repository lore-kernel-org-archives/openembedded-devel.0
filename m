Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3680C433EF
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 19:28:32 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.19929.1658690902738123354
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 12:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jyzkOYBb;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id e15so11602214edj.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 12:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d9aXFBoiYFl1U2XeacSWWeVlBMhgc61st0GcQM+Gubc=;
        b=jyzkOYBbCYhg1BmRS3/tyU+2GOkz6XaMBYKHUytJQOEFllRxl3ysY6yWlWRw7cboc0
         t/hjDjeDdhmC1d0nXGreWZ0pgpM2/ELR0bxPMDiY4C1gnp60A1x9iZVWQf2nE18lTS1N
         68HSAWLBMa7yzgeUHDo9OS3VWjF6b7r8z/jhBVCvLYfMy2eV7czV+uGATBB9sD4RzIqy
         Bt0Sps6YGS4VHMGnKz+wbGyhUQwI8SC6nMK2aRLFFIpZPqgUEsEaXpFXIHtmLfQ+UWgV
         ShKZXGxkkGT+MWsp6pWYwdr3pevI7CYqi7yGrE4GRlVFIhNIXaAQZ1tP9J7TzS/OeLJ9
         MDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d9aXFBoiYFl1U2XeacSWWeVlBMhgc61st0GcQM+Gubc=;
        b=7C0oPusbJZ6cv7RGd67Ss41OX7/mq7ckGaJGqntpbI0Sd89h5GLslCQw1kmF3zA99x
         5cdcYFCJnPFAx++Vz2qzUhMBHs4Iy61vOyD9to4an9gZiZb0K8HlATjSgIHxkNj4kUhk
         TBPBOk4kFv3U0CDz2jSBP8Uzo9oJejysirgr0SINzpPEJupexNzgN7cRGAGVXByYYBBC
         8FIDTyzjSMYSy6HVkw5vbyBu1BHLTNBXNRf5oRVikInb8KFlF+xPbsCfBb4l50dibGA6
         W1gp4wT7YNSqKEBLkC1L9GyEEOSH5pNL/+YhZBQ6SN8dplJ/tXElG9chYnyYY50APLpn
         UDYw==
X-Gm-Message-State: AJIora8e0PNUq7yZ/nlb+PcaWIY4Fkt/TZgQfCbx+Rm0zZUaT9pnXqGd
	65u5NN555dMRR+3HF56N3BtYos22TbbU7TtkIG8=
X-Google-Smtp-Source: 
 AGRyM1tkYVS/wRPbWwT8XieXJ/O1xQM/BVO85Q+mw3BWZPnX9A7vtTVe0LCJHu+kgttJM6ET4UKfjUQmXhYr4sBw3N8=
X-Received: by 2002:a05:6402:520a:b0:43c:4ec:e809 with SMTP id
 s10-20020a056402520a00b0043c04ece809mr1403053edd.198.1658690901053; Sun, 24
 Jul 2022 12:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <e36a1a4b-9d1b-e6d8-e865-c4bcfb57a515@gmail.com>
In-Reply-To: <e36a1a4b-9d1b-e6d8-e865-c4bcfb57a515@gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sun, 24 Jul 2022 21:28:06 +0200
Message-ID: 
 <CABF_=yhozs5iJ5GwrDYYcNmEr7yMYo3fNVB9-QUdCpxKOj8O_w@mail.gmail.com>
Subject: Re: [oe] sources.openembedded.org status
To: Armin Kuster <akuster808@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f3159005e49211fb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Jul 2022 19:28:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97962

--000000000000f3159005e49211fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks to your email I just found out it does exist.

This makes it a bit easier to synchronize with the Internet for those who
have to work with an air gapped network.
It's kind of the same as Xilinx does with e.g.
https://petalinux.xilinx.com/sswreleases/rel-v2022/downloads/
So, if possible, I  would suggest keeping it and have a structure for every
release and the master/main.
The master because some have to work with the
latest-what-should-be-the-greatest.

Just my 2 cents.

Br


On Sun, Jul 24, 2022 at 7:13 PM Armin Kuster <akuster808@gmail.com> wrote:

> Hello,
>
> I was looking at the content of sources.openembedded.org and it appears
> the last update was done  back in 2019.  Is sources.openembedded.org
> still a thing? if not, should we shut it down? If we think is has value,
> should we get it updated?
>
> -armin
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97961):
> https://lists.openembedded.org/g/openembedded-devel/message/97961
> Mute This Topic: https://lists.openembedded.org/mt/92588380/2167232
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> jan.vermaete@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

--000000000000f3159005e49211fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Thanks to your email=C2=A0I just fo=
und out it does exist.</div><div><br></div><div>This makes it a bit easier =
to synchronize with the Internet for those who have to work with an air gap=
ped network.</div><div>It&#39;s kind of the same as Xilinx does with e.g. <=
a href=3D"https://petalinux.xilinx.com/sswreleases/rel-v2022/downloads/">ht=
tps://petalinux.xilinx.com/sswreleases/rel-v2022/downloads/</a></div><div>S=
o, if possible, I=C2=A0 would suggest=C2=A0keeping it and have a structure =
for every release and the master/main.</div><div>The master because some ha=
ve to work with the latest-what-should-be-the-greatest.</div><div><br></div=
><div>Just=C2=A0my 2 cents.</div><div><br></div><div>Br</div><div>=C2=A0=C2=
=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Sun, Jul 24, 2022 at 7:13 PM Armin Kuster &lt;<a href=3D"mailto=
:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
I was looking at the content of <a href=3D"http://sources.openembedded.org"=
 rel=3D"noreferrer" target=3D"_blank">sources.openembedded.org</a> and it a=
ppears <br>
the last update was done=C2=A0 back in 2019.=C2=A0 Is <a href=3D"http://sou=
rces.openembedded.org" rel=3D"noreferrer" target=3D"_blank">sources.openemb=
edded.org</a> <br>
still a thing? if not, should we shut it down? If we think is has value, <b=
r>
should we get it updated?<br>
<br>
-armin<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#97961): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/97961" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/97961</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92588380/2167=
232" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92588380/2167232</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:jan.vermaete@gmail.com" =
target=3D"_blank">jan.vermaete@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Jan Vermaete<br>=E2=80=9CSuccess is a self-corre=
cting phenomenom.=E2=80=9D -- Gary Hamel</div>

--000000000000f3159005e49211fb--

