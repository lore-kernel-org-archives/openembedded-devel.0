Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322B0C54E58
	for <webhook@archiver.kernel.org>; Sun, 24 Mar 2024 01:23:02 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.21667.1711243379262494242
 for <Openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 18:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aIK9Swuf;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6114c9b4d83so2727927b3.3
        for <Openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 18:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711243378; x=1711848178; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xQX/Zq8KDQWmgQ1gXc+CbhG9rlJe+b3bnGAXC5nbz4s=;
        b=aIK9SwufbJI2gnSLn7xlTxeQaeIKxW5dXPa+5xrYpo292vkiM0VhkFMncVTw5GYwJY
         ycQJxPNANgws/DSHpesoWpqwhv6X5LTCiAxL4qlGbIp2E7qnG0iL2SMLtG2tNIbAfgpP
         +TwyXi37GJACpFIZz0IWqN9775n4Oqictjb7dxflQu2oiY3agrE+4Q0UF9m3aa6pwP7e
         2F57bW/3+kPJhtvg/6ywugN0yEVT6A2A1nIIOcRmxL6ZzNQYw0imzp2A/0LGv3vMXSTy
         KQX2D4gE3q7EC7JEwoiMoqIkP6JNQ34NPsRiN4WW+xrD8rWO+eB6QIMrl0zNVkEuBRaj
         jCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711243378; x=1711848178;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQX/Zq8KDQWmgQ1gXc+CbhG9rlJe+b3bnGAXC5nbz4s=;
        b=Fh44enCdysAQccX5tjqJOQ2fsfRd7YigQR1IwW8vdqlTGwStKmJxtI4y8Se8y5qVGo
         OCb60rF0QxEah/lUaUaKUAMmeG6sfBzSaapDKp5OoS3ooHpxeXRThEWgpenPizHhP8Le
         ql6q9TJi00aL/f/yTjx+C5tTDC5uKqvhRHNQmkL8e1HY9OjD3+oq0gq0qcMFZn/UTsi6
         SZoGB4g87NkRPUOyAJHoOViUCv2EvHzsWYEcq2eg8RoRw85miZlQZ/g8VYoAejweHx9Y
         p3MtvaEGOYWstNLnnqpaY+pzMDtdAdtCLZQbFdhyrqBqObLvO7XJ+J2tRvR35rgTMi3n
         /oTw==
X-Gm-Message-State: AOJu0YxuNmeULszsXVBjS/DD+yYGUbM30tB3fGNlprWCAJclM4hHQZJu
	a2Fkdnj8D04crSTivLgEpFhC6c3CPLesbSw7vlkc0O4vH9CzldJA/TNubhsZE+zifObJ1ovme3L
	ED/yG7etftPqjOrGvRyJJrbMOrZ2QDqTA
X-Google-Smtp-Source: AGHT+IGEBzKl0qvid6HGPHQeBG894Jya8MnVHDumJnSBKKzXrU7301l6H3RY/R3Sq493fOQK15exFu+bQV0Z1Nx7LF8=
X-Received: by 2002:a0d:d7cf:0:b0:611:c12:635f with SMTP id
 z198-20020a0dd7cf000000b006110c12635fmr2721353ywd.1.1711243377899; Sat, 23
 Mar 2024 18:22:57 -0700 (PDT)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 23 Mar 2024 18:22:47 -0700
Message-ID: <CANx9H-Bp1_5rkXv0LqsnSgsL8dTYa7MwEM+j83BqXivtQxw00A@mail.gmail.com>
Subject: [meta-java] Call to Action: rebase your old patches and resend
To: "openembedded-devel@lists.openembedded.org" <Openembedded-devel@lists.openembedded.org>, 
	"Yocto (yocto@lists.yoctoproject.org)" <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000aa038e06145de572"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Mar 2024 01:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109557

--000000000000aa038e06145de572
Content-Type: text/plain; charset="UTF-8"

Many of you may have sent patches to one or more mailing lists. Please
rebase your patches and resend them (or send as a GitHub pull request, or
less preferred Gitlab merge-request). We have several years worth of
patches and fixes to catch up on and it is not even slightly clear which
patches apply nor to which branches.

If you care strongly about a given stable release, make certain the patch
has been applied to master (assuming it applies) and then highlight the
need for a backport.

Provide as much information as you can (what host distro and version are
you using? what machine target are you building for? etc.) and proof it
passes build and runtime testing and reproducer for the issue you are
trying to fix. If you send patches that do not apply to master, they will
be rejected (unless they are particularly applicable to a stable branch for
some reason). If your patches fail basic parsing, building and run-time
testing, they will be rejected. Do not waste our time with poor quality
patches. Thank you.

Cheers.

--Tim

--000000000000aa038e06145de572
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Many of you may have sent patches to one or more mailing l=
ists. Please rebase your patches and resend them (or send as a GitHub pull =
request, or less preferred Gitlab merge-request). We have several years wor=
th of patches and fixes to catch up on and it is not even slightly clear wh=
ich patches apply nor to which branches.<div><br></div><div>If you care str=
ongly about a given stable release, make certain the patch has been applied=
 to master (assuming it applies) and then highlight the need for a backport=
.</div><div><br></div><div>Provide as much information as you can (what hos=
t distro and version are you using? what machine target are you building fo=
r? etc.) and proof it passes build and runtime testing and reproducer for t=
he issue you are trying to fix. If you send patches that do not apply to ma=
ster, they will be rejected (unless they are particularly applicable to a s=
table branch for some reason). If your patches fail basic parsing, building=
 and run-time testing, they will be rejected. Do not waste our time with po=
or quality patches. Thank you.</div><div><br></div><div>Cheers.</div><div><=
br></div><div>--Tim</div></div>

--000000000000aa038e06145de572--

