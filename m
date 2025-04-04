Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 778A6C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 09:11:12 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.7066.1743757862744533547
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 02:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mekMpY7A;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5fcd61e9bcdso843145eaf.0
        for <Openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 02:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743757862; x=1744362662; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FqPW/tH8Yy60GymVL3N/TDD9ZCxeT5Trs94y0jvE+P4=;
        b=mekMpY7AtY2QWSq9ez7AJOvty0N51F0EvUvZldAalHc4tpe+ew7JIrim6Dyno0saQS
         cYjbm4B6Zgs4yWbgQ1e/usTg3e3u1gVH/bRiW+y6F01adEG8C1l7K8WsUZdEK+KnRzK0
         OgKppFmdXSMGMmWBvpxc2Fg1LpAVjLZg5dfNeaNTc9MquaHZJ1cg2pk5ZXh6AYRKRG+x
         muLpL3RN1OekIJ2fohUjqMIaxSCfX0Q5TAdy8e7fp71Kv9q4R6c1c6jJMlAhuFE9nvAw
         TpJl9wHXCRYVAUtNo2OVEoL4pskNPACFJeLFZdNBAQQdmBQbkSvYQBWxQw6rCr878BpA
         Gwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743757862; x=1744362662;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FqPW/tH8Yy60GymVL3N/TDD9ZCxeT5Trs94y0jvE+P4=;
        b=fMmMKZzVC7G212MOZGnM+trVzLz5cCnX5+I4nne+kNX3w+wbCgdBXXiWSKJ1888qHJ
         wcTnixaZgkFPoYPSwsmhbqXHFdiiaXNVEZhj2bt1gz2M6VOGOF778cRq6m3Ch1aOg2zr
         J04PiKzd+jAV0SI5r1/eL+XoEb0zzyHOLbfCQqEVZNe3lF9sdXy+N2tUC3n/gnmv6sYK
         RsEsVDZ8g3IUrCeR/CczKqoF8gTWxGrOD6f+EsKZ+ftsNW66jNlA3/1Q/6yJw6+Qzr1A
         bj5Br1GRa59IYVNgCMf65FAqsw7tyx0L9Cy+OFjkAjcmPDjuGLZ62EXWMzZri0SruVd1
         6qTA==
X-Gm-Message-State: AOJu0Yx+O34deB7qPCcqGvNFvyn5SPqeNDYG7F3IsxyczBiRd0UUnwRc
	UJSJ9mWb4kxxCQTvQXtTFM3N8SEgSGyRvLqTO2KZbhUxw7QFD81dQPffn88QSwNL20wFmmqnPXj
	kzIFUmX4xQ3oa3ZU5iNkyuGnAfWcIGGnf
X-Gm-Gg: ASbGncuJfFGRObc8vDhXeuz6KuarVhhthyVKB5PMScnS6RVotJykLu6K/uIL6aMhGVe
	1Sc5fGqtHyZDbeIQR1B2Sas1ij6jIevYVm+6lFbKFuyPpfw4awcfKxC062x4mV071M2zCIkBxio
	tAmGYIugjAMnDr4rTNM4QBDN37a/Qvwu8EZ9VD
X-Google-Smtp-Source: AGHT+IFO5emzQhde4nBsDBZDhOC4jz0xyvcoJTFaFnr09c2KKkf3AwTLxAtzz1X6G37VCNQ2vuME4T5V+QZORz396eg=
X-Received: by 2002:a05:6820:1b88:b0:603:f777:97fe with SMTP id
 006d021491bc7-604154da83fmr1143403eaf.0.1743757861672; Fri, 04 Apr 2025
 02:11:01 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Apr 2025 02:10:35 -0700
X-Gm-Features: AQ5f1JqRvfyzPeZ4e1Vy67oOZRrA0yovfjeKJKKS-PY8lzH_Z0C0BGvtEiMXk98
Message-ID: <CAMKF1sprHpSPU=s2EdhLEKoZxgOGWkxJOLsE-OzHVcxrn3A8dg@mail.gmail.com>
Subject: `Walnascar` (5.2) release branch for meta-openembedded layers is available
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 09:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116572

Hello All,

We now have 'walnascar' branch available for meta-openembedded. Please add it to
your release testing. We plan to keep it in sync with the master for
perhaps a week or so.
after which we will merge the breaking changes into master and
walnascar will diverge

Armin has volunteered to maintain the walnascar branch for the
community along with other
stable releases that he is currently maintaining.

As usual prefix the patch subject with [walnascar] if you intent
changes for this release.

Thank you
-Khem

