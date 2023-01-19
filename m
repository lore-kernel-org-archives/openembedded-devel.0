Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4510C46467
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 11:32:50 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.43243.1674127967878913540
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jan 2023 03:32:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20210112.gappssmtp.com header.s=20210112 header.b=IZYHummI;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.218.44, mailfrom: jester@theyoctojester.info)
Received: by mail-ej1-f44.google.com with SMTP id ud5so4890317ejc.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 03:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Q1qLZU/1P8aMrjJsx9Mc0UOehxA+nbFVTMBhFjCKdI=;
        b=IZYHummI6uOaOv7aV1+V2/n0YwEOQMAqiJIt7wsQ4TY8o9BcsyYiV+hRPx7h6SXJPw
         ZLCibSc18CzmmJx3tPEbaP5q1At2ADnvl3tsm0OtFq40E/+0lKZQE8r/YLJbaVh07Qdk
         aNOKM+eGRDcnOivAMsO7fthzKub7uQL3IN5SnW7XemciNQQDbgKNTCk3PZyWZjbdI9Z5
         ZB1A/+u/R6IllLC1K5sCsksYIzNkiEouNUSnQ5QrY6RJSiI+U179zX5faTjLEix0iH8V
         D4rkLwGGisMEPEZnQgU7SFXApOs5ClgEECItSTPnGWl7l1jkSr7rM572LdBYNv4cgpEV
         nbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Q1qLZU/1P8aMrjJsx9Mc0UOehxA+nbFVTMBhFjCKdI=;
        b=QdwYJawvv1KQRG6GFpDukQjS3vfXYsGsBffpyAeCSx8FPRV/qUe9LUSrtDscxLF3Sz
         Lv5FYXBvRNnaATfyXzglOf7ANXdms5Jh+d/q+rd25Aj80CP3ZzB249kE/zBZyMua/CpW
         oVv+25wgSaYPRN5Ly7HnlvjOwhlz3X61hvWUkLl9YJ3NtsTUb4AU9RB0iGlw0s42OaYZ
         lXk3Xa7klErpexXgq0nsWd5+0Pxbnqu+KvnTxFPk0qNwnymP17+EbNupQuANg4ki8IDK
         9agrlu2KBNB0mMWRVMkkFSuwWHzZxVD4rzWC516iIMg/Db6yvk2OqQA8+aBt+9R2LymU
         CICA==
X-Gm-Message-State: AFqh2kpHOJO6T4tQfmY2zdYLSh2V/S9XfRpQyZ1HeprmA2JCBXIGdmrD
	7UwBRY1Mms87TkUkoaOwy2tyqGqCDLmfZeNPZCwcFw==
X-Google-Smtp-Source: AMrXdXuy9HYbmPkGQ1muA9Wm3pDNCER0O580nf+KgnU97VhKHX1pnB/sFIJA4TpuRtQ37fFrYvmVx3ve3a1xwbF9PJg=
X-Received: by 2002:a17:906:25c5:b0:86d:fa64:2941 with SMTP id
 n5-20020a17090625c500b0086dfa642941mr972122ejb.72.1674127966100; Thu, 19 Jan
 2023 03:32:46 -0800 (PST)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Thu, 19 Jan 2023 12:32:20 +0100
Message-ID: <CAEt6Nwp1jn_pB-XVJEAHyT6_9LoCugmQi1vRZKd_ne4W3Uj8Lg@mail.gmail.com>
Subject: OE Workshop in Brussels, February 6th - gentle reminder
To: openembedded-members@lists.openembedded.org, 
	openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org, 
	Yocto discussion list <yocto@yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000ba7a9105f29c4a1c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 11:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100655

--000000000000ba7a9105f29c4a1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all you Open, Embedded, and even OpenEmbedded people out there!

This is your gentle reminder that we are hosting an OE Workshop in Brussels
on Monday, February 6th - the day after FOSDEM at Avenue Louise 523, 1050
Brussels, Belgium.

Find a preliminary schedule at
https://pretalx.com/openembedded-workshop-2023/featured/ and if you are
around by then, don't forget to register:
https://pretix.eu/OpenEmbedded/workshop-2023/

Greetz,
Josef on behalf of the OE board

PS: lunch will be provided =F0=9F=8D=BD=EF=B8=8F

--000000000000ba7a9105f29c4a1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all you Open, Embedded, and even OpenEmbedded people=
 out there!<div><br></div><div>This is your gentle reminder that we are hos=
ting an OE Workshop in Brussels on Monday, February 6th - the day after FOS=
DEM at=C2=A0Avenue Louise 523, 1050 Brussels, Belgium. </div><div><br></div=
><div>Find a preliminary schedule at=C2=A0<a href=3D"https://pretalx.com/op=
enembedded-workshop-2023/featured/">https://pretalx.com/openembedded-worksh=
op-2023/featured/</a> and if you are around by then, don&#39;t forget to re=
gister:=C2=A0<a href=3D"https://pretix.eu/OpenEmbedded/workshop-2023/">http=
s://pretix.eu/OpenEmbedded/workshop-2023/</a></div><div><br></div><div>Gree=
tz,</div><div>Josef on behalf of the OE board</div><div><br></div><div>PS: =
lunch will be provided =F0=9F=8D=BD=EF=B8=8F</div></div>

--000000000000ba7a9105f29c4a1c--

