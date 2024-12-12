Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FBCE7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 20:13:38 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.745.1734034416795190641
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 12:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LkqkuwoB;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-71e0351311eso232030a34.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 12:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734034416; x=1734639216; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9zwjwR/jAipErx3kOgxnRbs27yBTKdGoODLLZcTnLk=;
        b=LkqkuwoBrIZXe9mt+2FpZA45T82ZBQJSd61Clb9kbGwbyrO3HSs6T5ReJY7Qr9lU54
         ETxB2mBC7r0eeDu24k4xGpaCC9bfDRgVQQ+YspShCJ/vO9K3uxIs3Ar6hQLJdSNQsBUq
         2Dibe8cz+XEmsolKwxG5za3vzDzapYmt9xajIDC9xmcFOKRwSG/BOH0T9JQzjBvcGj9c
         99HjM+YrDYbUHjPpAxfHB2HnLWl3Vu54GyETpRNCbonaw7DjTna6UZ5n4bNNOfPz4r/r
         Nl5An+4I+0UOwmzo+nwIqyuAho6sMojNnK6IphQAboY+q+RHU2+fOfYsMJNtkfp2Z2Xr
         cWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734034416; x=1734639216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u9zwjwR/jAipErx3kOgxnRbs27yBTKdGoODLLZcTnLk=;
        b=kQ5+ZHaXiDC08mtwpx2loaEGWBjpOqY7YDGwTALkZfhXt6Y0rZ/vdetT/5EGFGf2FX
         LEkiTDSESfSP7D8VAaCErW5tbMX9i5bq5JhdIBoTAld5IzNrGzwlXw1aQYzZ9RW4reTw
         TZVu0qbetvj1n/0wTHBGsjt+liHxD0sRc1Nzf+0e43uC4VUdXxCp+fbQ+1aA2zBFxYmk
         oEmfhg0KgYUV1KfIABmicjBx/8aPg8YZ1WChtRKZ2K34Y2Ee0q9RhN0SnvumWsdrdMXf
         WB3doW6cXUyrGoRsqPRsAYwaIqT0C0KpxPKIf9AYF4cJGj3CaYTn3Cf94aovDjifiaht
         VHZQ==
X-Gm-Message-State: AOJu0YyqPQOb2E26Gz4FK0Hf4tk90LnOf4tQIL18SordpRSQfYghT7UA
	JP6syAvDfr+oC2QGdp4tpQaWg3rh3Z7HMmqJYneqZpOwB5YprG4vrFCywgX9Gu2QjYCZCRmwtPl
	8KNTxK9PMYknqEQYeZtqdtlVsyS+sUQ+0
X-Gm-Gg: ASbGnctmxVbq03FQTS3CZuMS1cO2P5VX5u7Ql3bOFkUUtitAFC/FOkET62cyi05cwpF
	m67TSU4kDaJji/MU1sr8AbZowbgKf3sQzH4r9
X-Google-Smtp-Source: AGHT+IHe8QY2mNbX+QVf8Po32qt9iIjNAGmRBibMb0kjRMwGbrV5WhqTvCtM5fuIqJfIm3uJyT4fIOsWEyVvX9mQ/gM=
X-Received: by 2002:a05:6870:e30f:b0:29e:4c80:422c with SMTP id
 586e51a60fabf-2a3ac835bd7mr33973fac.34.1734034415999; Thu, 12 Dec 2024
 12:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20241209213948.2377-1-mail@michael-fitzmayer.de>
 <CAMKF1sratBWEuCCTzv8zp_EQSdSnrVcDbauWLHH2ijUiMiL5Cw@mail.gmail.com> <000c01db4cd0$1ca84560$55f8d020$@michael-fitzmayer.de>
In-Reply-To: <000c01db4cd0$1ca84560$55f8d020$@michael-fitzmayer.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Dec 2024 12:13:09 -0800
Message-ID: <CAMKF1spsr16bepG1kByGR5BPAxhTp_+bmsWtDQiQQYLdihgWoQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] canopenterm: fix number of arguments check
 in API function
To: mail@michael-fitzmayer.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 20:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114300

On Thu, Dec 12, 2024 at 11:57=E2=80=AFAM Michael Fitzmayer via
lists.openembedded.org
<mail=3Dmichael-fitzmayer.de@lists.openembedded.org> wrote:
>
> The patch is upstream, and I'm actively working on the next version, expe=
cted in 2-4 weeks. This change is a minor fix for a non-critical bug notice=
d after I released the last tagged version.
>
> I will have a look at it. But in hindsight, it would probably make more s=
ense for me to finish the next release first.

Ok thats fine. I will drop this one for now.

>
> Hopefully, I=E2=80=99ll have understood and integrated Ptest by then.

Even better.

>
> -----Original Message-----
> From: Khem Raj <raj.khem@gmail.com>
> Sent: 10 December 2024 22:43
> To: mail@michael-fitzmayer.de
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] canopenterm: fix number of arguments c=
heck in API function
>
> the patch needs some tags added e.g. Upstream-Status, see https://valkyri=
e.yoctoproject.org/#/builders/81/builds/199/steps/14/logs/errors
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114299): https://lists.openembedded.org/g/openembedde=
d-devel/message/114299
> Mute This Topic: https://lists.openembedded.org/mt/110015092/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

