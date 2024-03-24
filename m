Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36038CD11BF
	for <webhook@archiver.kernel.org>; Sun, 24 Mar 2024 01:06:52 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.21462.1711242402286814365
 for <Openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 18:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U1WbUHYI;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-60a0599f6e5so30407627b3.3
        for <Openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 18:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711242401; x=1711847201; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7NJx3dCe5jWCBVwpk+i83zvYajJNUbQDm85D1MYHqeM=;
        b=U1WbUHYIS7UFi66WfBg5UW+d+GKraPicJyOGBlPPBrkpmTVWKZltuXx8y+E22CSv2m
         AV2UwPHzgZNltzv1GnkgH4kSZb1QQQt965No0wILU3U7SVZGVQ4q4l4cewszEyx5OZcC
         jcYRs29/7cFmAdeKVIEoNEYv+99IFiRjCSrTb+MJxwty4DksyEcOse3ecnC9psq9eB/l
         Cuolm2Vs2gMLYrOfwXAt0DndqbzxY10g9vfNE+41jQ4oURy0W5JZZ6024UZcY5TMtPVu
         zTxUaD79nsPBTDFygBLbLNbK43kEoqRT4S0MOjAm5ORrTqVnW3tw+swaj3eBzttt3Us2
         B8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711242401; x=1711847201;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7NJx3dCe5jWCBVwpk+i83zvYajJNUbQDm85D1MYHqeM=;
        b=EScGc0VPLWTgU+NmrgY/V6NTc7/KIclVkHZmbn+SBcY0hJ6EQ0o0OR8XErlMenJsmu
         vjkvJCejc1CJbjerSV66IHvv2keavetGr0hejv4lXdAyYHyunHTF0V5CsoQ4X4K7LSkr
         B0UZqBhMwWYoFYF1aHe0+gcwdCFyBN4H4lU80aFrdb2uwcRFNwvS681Gg6aHhispfFUH
         AQUPhuTGmVoDyi6ql+TrJjL0V7rZVIaWTxqWamceZuD57njeiHbOkjwnfgfWwFM2PkhO
         3+5gjfYlu4bW9FifZIDfasc1CdZEtggtKfuZ4FRexlhEtSygqDqxIHzQpB2xJ8sTXluG
         h+5g==
X-Gm-Message-State: AOJu0YzeftDpJLOr725BPq349NqucxwZZfCF9FKv7p8JORyOCCwWTe6f
	EMIvj06vozayQfSZQd+UvQlyYEwjJW7LYk/O8afA60Wc9HzZrTQEtdVwmyfFkMdJmALWyEMkdxm
	FyrD46tFxiNx9F0/79d+gEF34i8wv4RituOA=
X-Google-Smtp-Source: AGHT+IEYcTdhNMVJNEFM4XQOgVphwECBSq29ABkCWe4bLa6TRzZAm8bM20k2q5nllrrZbuvDbwScFY7UGwa57Pt8vp8=
X-Received: by 2002:a0d:cc06:0:b0:611:1861:1f7 with SMTP id
 o6-20020a0dcc06000000b00611186101f7mr3330483ywd.18.1711242401197; Sat, 23 Mar
 2024 18:06:41 -0700 (PDT)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 23 Mar 2024 18:06:30 -0700
Message-ID: <CANx9H-Czy0x0vFPQTJE0crAZu8zEJqdM97fgYQJCf-usxFzTJg@mail.gmail.com>
Subject: [meta-java] Call for Action: Unpatched CVEs
To: "openembedded-devel@lists.openembedded.org" <Openembedded-devel@lists.openembedded.org>, 
	"Yocto (yocto@lists.yoctoproject.org)" <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000072b9a906145dabdc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Mar 2024 01:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109556

--00000000000072b9a906145dabdc
Content-Type: text/plain; charset="UTF-8"

There are a number of unpatched CVEs for meta-java for which we need help
from the community.

https://github.com/meta-java/meta-java/issues/36

Please take a look and submit patches to the mailing list or pull-requests
on GitHub. Merge requests on GitLab are also ok, but likely to be noticed
later than the other two methods of communication.

Please help this layer be healthier and safer.

--Tim

--00000000000072b9a906145dabdc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There are a number of unpatched CVEs for meta-java for whi=
ch we need help from the community.<div><br></div><div><a href=3D"https://g=
ithub.com/meta-java/meta-java/issues/36">https://github.com/meta-java/meta-=
java/issues/36</a><br></div><div><br></div><div>Please take a look and subm=
it patches to the mailing list or pull-requests on GitHub. Merge requests o=
n GitLab are also ok, but likely to be noticed later than the other two met=
hods of communication.</div><div><br></div><div>Please help this layer be h=
ealthier and safer.</div><div><br></div><div>--Tim</div></div>

--00000000000072b9a906145dabdc--

