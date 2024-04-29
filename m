Return-Path: <jacoba@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0DCC4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:27:17 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.18443.1714390034063082972
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=Gw8IbDad;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.208.171, mailfrom: jacoba@thehoodiefirm.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e0b2ddc5d1so4245061fa.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 04:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714390032; x=1714994832; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1LyYippK7Rb+g2Yi0imGRGCZruYZtKQ7fIyqKRGYLF4=;
        b=Gw8IbDadUOi4FgMjAhEjJ0PHuroh9/uoNdiURQ1GFWnZnFPso3FngZHRb2WVRkJU1O
         8+F5uNu6o59vPpi29YFAk4rRjgizqCPntSm72Y1Lya5+l3ytRkrqkKbdstUYJEgp3r0M
         zX45yedm1UOhf9XcyyGWey9sgeKDW/SiSuhPxgB39CE8+q7yxXovHU210Ye6AtVhuleP
         XcTL9LGUN4wKEBpFr5QykPMCyZrVeoovVuvpYwDX8pl75212Qq+J94c9xpSBKO3h+Lv6
         pqbxmT/tqIINbMjVST4FaKBCyFTFRpqL+Q5K8ZD4mqwDBQOSlRbf4H7Gn6rFJ7hM895z
         4qwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714390032; x=1714994832;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1LyYippK7Rb+g2Yi0imGRGCZruYZtKQ7fIyqKRGYLF4=;
        b=tiYsqxJCf5xUlefo3LKuOzYmMyLgOlrsfB2S9hLOpKwXquAlqdworYFF+hhGyhwa8k
         +dyNpREhV49+xPufRFIuNhgf5smlEU4z1kNUR3EViYLuyiBRFqO5oQmxplRW8v87xNL9
         lRfr7NM0wqGMbzehhMR/YUpWmnrjc3wwlDxFjH36JzIL9DIfqwauda0sdxTe0M/4DcFz
         RHpi7I7CwQN2+NwjLOV8BoyB+7KHXIA6OeKeeB4k10KOkpWCyt+iUyZcq0U+iP4hJraM
         4mkOZrmhFGFsNhiCcjuJNcjxfK9Ge/7ddLYpyrJEVREkRW141dcN4sKWRd4aO+fYOcIA
         a27A==
X-Gm-Message-State: AOJu0YxKilp2jr7xurkofJQpDd3RF9GOmKwmQyg/2DdoAbauwB2gJqkw
	bliUWa2Ne1NFWscR1uCtBZ+2S+2W/GSDYzbMuFkeI73/GMh7VGFNJhRgW7g/H2/8HDrQWpWTid1
	WOZ1xy8h8e00q7UDhzm0FdPNVS3IzncqmznWP0HbV8sCcd5jAOIewZA==
X-Google-Smtp-Source: AGHT+IGejT3Fn5P9idzcnxwYhpVtwJCoGqWgd9xhc47L8oTDbgyyNpzbeaWIrLyxoDQ49Qot1/py51xU6dYOlDZveKE=
X-Received: by 2002:a2e:95da:0:b0:2d8:dd28:8748 with SMTP id
 y26-20020a2e95da000000b002d8dd288748mr5449899ljh.1.1714390032255; Mon, 29 Apr
 2024 04:27:12 -0700 (PDT)
MIME-Version: 1.0
From: Jacoba Brandner <jacoba@thehoodiefirm.com>
Date: Mon, 29 Apr 2024 13:27:01 +0200
Message-ID: <CANgaEnLwGDPzZ8xswSz6a4Lz41s53peydkOPrK7i+EJ4dS6B+Q@mail.gmail.com>
Subject: Report for CVE Triage 41-80
To: openembedded-devel@lists.openembedded.org
Cc: Engineering <engineering@neighbourhood.ie>
Content-Type: multipart/alternative; boundary="000000000000e127f706173a888a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 11:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110178

--000000000000e127f706173a888a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OpenEmbedded contributors,

This email contains a review of the next 40 CVEs from the status list:
https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/cve-statu=
s-master.txt
This work is done as part of "Milestone 2. Triage CVEs 41-80" as stated in
the Scope of Work with Sovereign Tech Fund (STF) (
https://www.sovereigntechfund.de/).

The report is saved as HTML file here:
https://clients.neighbourhood.ie/yocto/41-80.html
We can also provide this in any other format that might be convenient for
you. Please let us know.

The report contains a review of 40 CVEs including the following:
- Package versions affected
- Current package version on 'meta-openembedded'
- Notes on how the CVE can be addressed

Please note that for the CVEs marked as 'invalid', separate patch status
updates have been sent to this mailing-list:
openembedded-devel@lists.openembedded.org.

Thanks,
Neighbourhoodie team


--=20
The Neighbourhoodie Software GmbH
Harzer Stra=C3=9Fe 39, 12059 Berlin
neighbourhood.ie

Handelsregister HRB 157851 B Amtsgericht Charlottenburg
Gesch=C3=A4ftsf=C3=BChrung: Jan Lehnardt, Simone Haas

--000000000000e127f706173a888a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear OpenEmbedded contributors,<br style=3D"font-family:Ro=
boto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif"><br style=3D"fo=
nt-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">Thi=
s email contains a review of the next 40 CVEs from the status list:=C2=A0<a=
 href=3D"https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/=
cve-status-master.txt" target=3D"_blank" style=3D"font-family:Roboto,&quot;=
Helvetica Neue&quot;,Helvetica,Arial,sans-serif">https://autobuilder.yocto.=
io/pub/non-release/patchmetrics-meta-oe/cve-status-master.txt</a><br style=
=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-seri=
f">This work is done as part of &quot;Milestone 2. Triage CVEs 41-80&quot; =
as stated in the Scope of Work with Sovereign Tech Fund (STF) (<a href=3D"h=
ttps://www.sovereigntechfund.de/" target=3D"_blank" style=3D"font-family:Ro=
boto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">https://www.sov=
ereigntechfund.de/</a>).<br style=3D"font-family:Roboto,&quot;Helvetica Neu=
e&quot;,Helvetica,Arial,sans-serif"><br style=3D"font-family:Roboto,&quot;H=
elvetica Neue&quot;,Helvetica,Arial,sans-serif">The report is saved as HTML=
 file here:=C2=A0<a href=3D"https://clients.neighbourhood.ie/yocto/41-80.ht=
ml" target=3D"_blank" style=3D"font-family:Roboto,&quot;Helvetica Neue&quot=
;,Helvetica,Arial,sans-serif">https://clients.neighbourhood.ie/yocto/41-80.=
html</a><br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetic=
a,Arial,sans-serif">We can also provide this in any other format that might=
 be convenient for you. Please let us know.<br style=3D"font-family:Roboto,=
&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif"><br style=3D"font-fa=
mily:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">The repo=
rt contains a review of 40 CVEs including the following:<br style=3D"font-f=
amily:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">- Packa=
ge versions affected<br style=3D"font-family:Roboto,&quot;Helvetica Neue&qu=
ot;,Helvetica,Arial,sans-serif">- Current package version on &#39;meta-open=
embedded&#39;<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Hel=
vetica,Arial,sans-serif">- Notes on how the CVE can be addressed<br style=
=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-seri=
f"><br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Ari=
al,sans-serif">Please note that for the CVEs marked as &#39;invalid&#39;, s=
eparate patch status updates have been sent to this mailing-list:=C2=A0<a h=
ref=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"_blank" =
style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans=
-serif">openembedded-devel@lists.openembedded.org</a>.<br style=3D"font-fam=
ily:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif"><br style=
=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-seri=
f">Thanks,<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvet=
ica,Arial,sans-serif">Neighbourhoodie team<div class=3D"gmail-yj6qo" style=
=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-seri=
f"></div><div class=3D"gmail-adL" style=3D"font-family:Roboto,&quot;Helveti=
ca Neue&quot;,Helvetica,Arial,sans-serif"><br></div><div><br></div><span cl=
ass=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmai=
l_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div>The Neighbourhoodie Software GmbH</d=
iv><div>Harzer Stra=C3=9Fe 39,=C2=A0<span style=3D"color:rgb(0,0,0)">12059 =
Berlin</span></div><div><a href=3D"http://neighbourhood.ie" target=3D"_blan=
k">neighbourhood.ie</a></div><div><br></div><div>Handelsregister HRB 157851=
 B Amtsgericht Charlottenburg</div><div>Gesch=C3=A4ftsf=C3=BChrung: Jan Leh=
nardt, Simone Haas</div></div></div></div></div></div></div></div>

--000000000000e127f706173a888a--

