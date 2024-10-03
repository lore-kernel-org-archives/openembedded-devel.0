Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C626CF8574
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 10:16:33 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.7988.1727950584912222094
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Oct 2024 03:16:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=VvXKFhcA;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.218.53, mailfrom: jester@theyoctojester.info)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8ce5db8668so126605766b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 03:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1727950583; x=1728555383; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xa7myngY5ia7Aom0nIYiUDi0MDBoghZ7Xp2Y71IwXoI=;
        b=VvXKFhcANBIAtNwtxOWwpLc8r5o+zPO5WAG46BDcx61Xf3HBvSqbfGZ9PCAcXTWAEC
         9fh+aKoNE3CiYhCHDm84CtFe9WDxqBHaAO03CDstlvjXQ2Vz3Z0qNKUPLxNZa2048r7R
         yB8wY0dNLJLM6QDpp8uOo8LEU1d7SQ3OeEH+VAnvT3mOAuOgDueEReXPn3jfSVbtRZdZ
         8fVU/RqKfO72Tz9lSxCmpvtZ/TZjYypOiqQrug0lEn//YE60tslTPZxljnquxbK1cyyp
         eKlTJhqfwYQ2AtOlRcj1Jo3jGXVmkYxGtUJwfqazvhXvAmD0DAo+1TiOXkgkRk55PVAB
         +GCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727950583; x=1728555383;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xa7myngY5ia7Aom0nIYiUDi0MDBoghZ7Xp2Y71IwXoI=;
        b=jOj2oPad2aSca1NTKvlFL08vxRYUdkxvCPz/I8gT6mpChB5KdFqjHlLGGg6CI5y8Es
         8W8HxDmEsn7i0Sl4z73RWq1PLyfh08JuT+TOaaCki3HEqdmivkT23I0KgOb1U/+KN1fi
         Lkk27KYrs30tSyTHW/yegtvL2wjzbvaddlgk+8R/hYJnlDiDZRPrd1MAHqRd6d2Qf++o
         8oyfLKvx2DTO3WwqbNwK9SjE1ILK1wtNHzVsQEkGIo7sEele6EfJH93nc8lX+lVcIjVO
         W+PkAzcC4GvNrpAFsRID0QMrkR3JJZgXkt7jGQmo346iU3eJVf2OKqIhe7azL8PXe/BJ
         Gi+g==
X-Forwarded-Encrypted: i=1; AJvYcCVApP5PZlI84CMpT6GONzm2suPHcWoPyd/uPCA+QIza9q5X56LD1+JLuNwZ+ogLcYeXqifBSgish0ihbWEW+uA+PDY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxInxbkPA1NmKJdKP5M92+fWfW2z4X0DOjzzSeJXyLnVp2Vzgno
	Bd4Y1Dn06NKQLVALjiTGgcoywmtw3VjqtVt9JQfUYJPHUjD/tHA++J9lTKlYm3xy0vqK84jxar5
	nabpFcPXiK1aaXuWfY1GOd17g4d+DGfxlN2oTTA==
X-Google-Smtp-Source: AGHT+IFC8/UFcG7W81wKZAuiOQRSHyZqHl0lpDmaSF7EVkaS2mLqn616SCqxPdJ0EQWYDOJ3F0QdNMK6boTe9OuiShc=
X-Received: by 2002:a17:907:928c:b0:a80:7193:bd93 with SMTP id
 a640c23a62f3a-a98f823d542mr683342466b.25.1727950583084; Thu, 03 Oct 2024
 03:16:23 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Thu, 3 Oct 2024 12:16:12 +0200
Message-ID: <CAEt6NwpF3MEwCs0k41Bk1Sn+Vt52J+Jk255-EjHOcMuaRSRW=g@mail.gmail.com>
Subject: CFP for Yocto Project Summit 2024.12 is open
To: Yocto Project Events <events@yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000b1da9406238fd87e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 10:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112646

--000000000000b1da9406238fd87e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Submit your talk now!

-->
https://pretalx.com/yocto-project-summit-2024-12/cfp
 <--

The Yocto Project=C2=AE *Virtual* Summit 2024.12 is a virtual technical
conference for engineers, open source technologists, students and academia
in the OSS space.
Event Schedule

   - Tuesday, Dec 3nd - Thursday, Dec 5th, 2024
   - 12:00 PM =E2=80=93 6:00 PM (UTC)

CFP Schedule

   - CFP Closes: Monday, Oct 25th, 2024
   - CFP Notifications: Monday, Nov 1st, 2024
   - Slides Due Date: Friday, Nov 25th, 2024

List of suggested topics:

   - Layer quality: e.g. creating robust layers, safely using existing
   layers
   - Productivity tricks, Best Practices
   - Developer toolbox
   - Security
   - Reproducibility
   - Supporting the Application Developer Workflow
   - DevOps, CI/CD
   - Containers, VMs
   - Working with/creating BSPs
   - Practical use of the Yocto Project
   - Product showcase

Presentation formats

Slots for talks vary from 15-45 minutes, with training sessions starting at
60 minutes or longer.
Submit at
https://pretalx.com/yocto-project-summit-2024-12/cfp

Questions?
Ping me (jester@theyoctojester.info) or events@yoctoproject.org

Josef
on behalf of the YP events team

--000000000000b1da9406238fd87e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><p style=3D"margin-top:0px;margin-bottom:1rem;font-f=
amily:muli,&quot;open sans&quot;,opensans,&quot;helvetica neue&quot;,helvet=
ica,arial,sans-serif;font-size:16px;font-style:normal;font-weight:400;lette=
r-spacing:normal;text-align:left;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;text-decoration:none;color:rgba(0,0,0,0.87)">=
<div style=3D"font-family:muli,&quot;open sans&quot;,opensans,&quot;helveti=
ca neue&quot;,helvetica,arial,sans-serif"><h1 style=3D"margin-top:0px;margi=
n-bottom:0.5rem;font-weight:500;line-height:1.2;font-size:2.5rem;font-famil=
y:&quot;titillium web&quot;,&quot;open sans&quot;,opensans,&quot;helvetica =
neue&quot;,helvetica,arial,sans-serif;font-style:normal;letter-spacing:norm=
al;text-align:left;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;text-decoration:none;color:rgba(0,0,0,0.87)">Submit your ta=
lk now!</h1><div dir=3D"auto" style=3D"font-family:muli,&quot;open sans&quo=
t;,opensans,&quot;helvetica neue&quot;,helvetica,arial,sans-serif"><br></di=
v><div dir=3D"auto" style=3D"font-family:muli,&quot;open sans&quot;,opensan=
s,&quot;helvetica neue&quot;,helvetica,arial,sans-serif">--&gt; <div style=
=3D"font-family:muli,&quot;open sans&quot;,opensans,&quot;helvetica neue&qu=
ot;,helvetica,arial,sans-serif"><a href=3D"https://pretalx.com/yocto-projec=
t-summit-2024-12/cfp" style=3D"font-family:muli,&quot;open sans&quot;,opens=
ans,&quot;helvetica neue&quot;,helvetica,arial,sans-serif">https://pretalx.=
com/yocto-project-summit-2024-12/cfp</a></div>=C2=A0&lt;--</div></div></p><=
p style=3D"margin-top:0px;margin-bottom:1rem;font-family:muli,&quot;open sa=
ns&quot;,opensans,&quot;helvetica neue&quot;,helvetica,arial,sans-serif;fon=
t-size:16px;font-style:normal;font-weight:400;letter-spacing:normal;text-al=
ign:left;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;text-decoration:none;color:rgba(0,0,0,0.87)">The Yocto Project=C2=AE=
=C2=A0<em style=3D"font-family:muli,&quot;open sans&quot;,opensans,&quot;he=
lvetica neue&quot;,helvetica,arial,sans-serif">Virtual</em>=C2=A0Summit 202=
4.12 is a virtual technical conference for engineers, open source technolog=
ists, students and academia in the OSS space.=C2=A0</p><h1 style=3D"margin-=
top:0px;margin-bottom:0.5rem;font-weight:500;line-height:1.2;font-size:2.5r=
em;font-family:&quot;titillium web&quot;,&quot;open sans&quot;,opensans,&qu=
ot;helvetica neue&quot;,helvetica,arial,sans-serif;font-style:normal;letter=
-spacing:normal;text-align:left;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;text-decoration:none;color:rgba(0,0,0,0.87)">E=
vent Schedule</h1><ul style=3D"margin-top:0px;margin-bottom:1rem;font-famil=
y:muli,&quot;open sans&quot;,opensans,&quot;helvetica neue&quot;,helvetica,=
arial,sans-serif;font-size:16px;font-style:normal;font-weight:400;letter-sp=
acing:normal;text-align:left;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;text-decoration:none;color:rgba(0,0,0,0.87)"><li =
style=3D"font-family:muli,&quot;open sans&quot;,opensans,&quot;helvetica ne=
ue&quot;,helvetica,arial,sans-serif">Tuesday, Dec 3nd - Thursday, Dec 5th, =
2024</li><li style=3D"font-family:muli,&quot;open sans&quot;,opensans,&quot=
;helvetica neue&quot;,helvetica,arial,sans-serif">12:00 PM =E2=80=93 6:00 P=
M (UTC)</li></ul><h1 style=3D"margin-top:0px;margin-bottom:0.5rem;font-weig=
ht:500;line-height:1.2;font-size:2.5rem;font-family:&quot;titillium web&quo=
t;,&quot;open sans&quot;,opensans,&quot;helvetica neue&quot;,helvetica,aria=
l,sans-serif;font-style:normal;letter-spacing:normal;text-align:left;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-deco=
ration:none;color:rgba(0,0,0,0.87)">CFP Schedule</h1><ul style=3D"margin-to=
p:0px;margin-bottom:1rem;font-family:muli,&quot;open sans&quot;,opensans,&q=
uot;helvetica neue&quot;,helvetica,arial,sans-serif;font-size:16px;font-sty=
le:normal;font-weight:400;letter-spacing:normal;text-align:left;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;text-decoratio=
n:none;color:rgba(0,0,0,0.87)"><li style=3D"font-family:muli,&quot;open san=
s&quot;,opensans,&quot;helvetica neue&quot;,helvetica,arial,sans-serif">CFP=
 Closes: Monday, Oct 25th, 2024</li><li style=3D"font-family:muli,&quot;ope=
n sans&quot;,opensans,&quot;helvetica neue&quot;,helvetica,arial,sans-serif=
">CFP Notifications: Monday, Nov 1st, 2024</li><li style=3D"font-family:mul=
i,&quot;open sans&quot;,opensans,&quot;helvetica neue&quot;,helvetica,arial=
,sans-serif">Slides Due Date: Friday, Nov 25th, 2024</li></ul><h1 style=3D"=
margin-top:0px;margin-bottom:0.5rem;font-weight:500;line-height:1.2;font-si=
ze:2.5rem;font-family:&quot;titillium web&quot;,&quot;open sans&quot;,opens=
ans,&quot;helvetica neue&quot;,helvetica,arial,sans-serif;font-style:normal=
;letter-spacing:normal;text-align:left;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;text-decoration:none;color:rgba(0,0,0,0=
.87)">List of suggested topics:</h1><ul style=3D"margin-top:0px;margin-bott=
om:1rem;font-family:muli,&quot;open sans&quot;,opensans,&quot;helvetica neu=
e&quot;,helvetica,arial,sans-serif;font-size:16px;font-style:normal;font-we=
ight:400;letter-spacing:normal;text-align:left;text-indent:0px;text-transfo=
rm:none;white-space:normal;word-spacing:0px;text-decoration:none;color:rgba=
(0,0,0,0.87)"><li style=3D"font-family:muli,&quot;open sans&quot;,opensans,=
&quot;helvetica neue&quot;,helvetica,arial,sans-serif">Layer quality: e.g. =
creating robust layers, safely using existing layers</li><li style=3D"font-=
family:muli,&quot;open sans&quot;,opensans,&quot;helvetica neue&quot;,helve=
tica,arial,sans-serif">Productivity tricks, Best Practices</li><li style=3D=
"font-family:muli,&quot;open sans&quot;,opensans,&quot;helvetica neue&quot;=
,helvetica,arial,sans-serif">Developer toolbox</li><li style=3D"font-family=
:muli,&quot;open sans&quot;,opensans,&quot;helvetica neue&quot;,helvetica,a=
rial,sans-serif">Security</li><li style=3D"font-family:muli,&quot;open sans=
&quot;,opensans,&quot;helvetica neue&quot;,helvetica,arial,sans-serif">Repr=
oducibility</li><li style=3D"font-family:muli,&quot;open sans&quot;,opensan=
s,&quot;helvetica neue&quot;,helvetica,arial,sans-serif">Supporting the App=
lication Developer Workflow</li><li style=3D"font-family:muli,&quot;open sa=
ns&quot;,opensans,&quot;helvetica neue&quot;,helvetica,arial,sans-serif">De=
vOps, CI/CD</li><li style=3D"font-family:muli,&quot;open sans&quot;,opensan=
s,&quot;helvetica neue&quot;,helvetica,arial,sans-serif">Containers, VMs</l=
i><li style=3D"font-family:muli,&quot;open sans&quot;,opensans,&quot;helvet=
ica neue&quot;,helvetica,arial,sans-serif">Working with/creating BSPs</li><=
li style=3D"font-family:muli,&quot;open sans&quot;,opensans,&quot;helvetica=
 neue&quot;,helvetica,arial,sans-serif">Practical use of the Yocto Project<=
/li><li style=3D"font-family:muli,&quot;open sans&quot;,opensans,&quot;helv=
etica neue&quot;,helvetica,arial,sans-serif">Product showcase</li></ul><h1 =
style=3D"margin-top:0px;margin-bottom:0.5rem;font-weight:500;line-height:1.=
2;font-size:2.5rem;font-family:&quot;titillium web&quot;,&quot;open sans&qu=
ot;,opensans,&quot;helvetica neue&quot;,helvetica,arial,sans-serif;font-sty=
le:normal;letter-spacing:normal;text-align:left;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;text-decoration:none;color:rgb=
a(0,0,0,0.87)">Presentation formats</h1><p style=3D"margin-top:0px;margin-b=
ottom:1rem;font-family:muli,&quot;open sans&quot;,opensans,&quot;helvetica =
neue&quot;,helvetica,arial,sans-serif;font-size:16px;font-style:normal;font=
-weight:400;letter-spacing:normal;text-align:left;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;text-decoration:none;color:r=
gba(0,0,0,0.87)">Slots for talks vary from 15-45 minutes, with training ses=
sions starting at 60 minutes or longer.</p></div></div><div dir=3D"auto">Su=
bmit at=C2=A0<div><a href=3D"https://pretalx.com/yocto-project-summit-2024-=
12/cfp">https://pretalx.com/yocto-project-summit-2024-12/cfp</a></div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div><h1 style=3D"font-style:norma=
l;letter-spacing:normal;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;text-decoration:none;margin-top:0px;margin-bottom:0.5r=
em;font-weight:500;line-height:1.2;font-size:2.5rem;font-family:&quot;titil=
lium web&quot;,&quot;open sans&quot;,opensans,&quot;helvetica neue&quot;,he=
lvetica,arial,sans-serif;text-align:left;background-color:rgba(0,0,0,0);bor=
der-color:rgba(0,0,0,0.87);color:rgba(0,0,0,0.87)" dir=3D"auto">Questions?<=
/h1></div>Ping me (<a href=3D"mailto:jester@theyoctojester.info">jester@the=
yoctojester.info</a>) or <a href=3D"mailto:events@yoctoproject.org">events@=
yoctoproject.org</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">Jos=
ef</div><div dir=3D"auto">on behalf of the YP events team</div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div></d=
iv>

--000000000000b1da9406238fd87e--

