Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78403CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 19:00:41 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.53069.1760382032197423733
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 12:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=tMz8W3XM;
 spf=neutral (domain: theyoctojester.info, ip: 209.85.214.180, mailfrom: jester@theyoctojester.info)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-273a0aeed57so67854565ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1760382031; x=1760986831; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B406qVbW/Di84q48SP0jRnMNywVBf6H98g8cIAf0inY=;
        b=tMz8W3XMxcsJFRiql8fs7yvLSUQOzLZRUyRr3GD9c0e8iEhJK2EL1PwwEADgXM6Yzt
         mTJebClenY+NCnvr4+JgI9YTMAYS+eADMuQRfvKIvErEt/9Lu7rOYSgyibNbaW3sYWaV
         XpWRbcdDHOVYLb/VcL8sfsXeQd8rowPkIiORPgnVUadYA5I5jJsbxcMnXW+WiP7S/kGs
         4drQbcfv0PiNK6ONoX3qGtdqdUdlw5qsP9B+iS6TIxcKjJ7fjqj4BH4kIqJlbjI7teJs
         fa+/IEm3xSnOrQ7NPmi4xtWkZarH6noDl3Rle6KGg+d9D7dssoXYi9ZXd5OaP+RnZH+6
         DzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760382031; x=1760986831;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B406qVbW/Di84q48SP0jRnMNywVBf6H98g8cIAf0inY=;
        b=r5mmj1ZymRXFoDIs2Jd/XWZ4Xi3YHEpJB7PR98xGB0LuwZaNIxrIacKza6/0kPsum8
         G58uViSmfzpntD0YIS4WGr2hwPWiagKTeCAnZgAZrFxFFKPN0nJ2wme0NJXJfxrJ2jnk
         l+oyYSVg5DHobCWfP8ztXYgJCt2UI76CS19BlHEaaj98F2Q0kh4dS7GZ8QYomatV3/4Q
         mHFrYDY0FGQXV3w8FirGydd7QpLOALe1/UeS/CRQ5ypr0ReCxCTcKcC5OWdnPxma8xN6
         vBJ5mIpRh7Qj1pvRYSYQIdLVVpKBsC8LJPq+O4pZ9GJobUpQz8EDUtTubkE0BFReFvDs
         Rf+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSeJV06SXHDPjZkqvD8Xs4DGjHooseS4nLDcL9rKbbt1+BPC8OgzhVhGRZgFK4L6KPW+BYoDzGWe5Yc4K4oV+xOw4=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw+DOtEG5Ot/vqf83ddaFrFlyObx3ULmeVG80eE6Rc3MozduhF/
	rRlBN39LX54PqIzfj+r/AAqEPUbgT2Y5ytpgHZmTmAwPCSkQQu+Afnca0u98WWQX9XinN7a0Bbg
	IC7Sa2zuDiMcdocC/tb4JEpeZO7CWIRDcD1sYMqT7zA==
X-Gm-Gg: ASbGncsE2llQHE0XBX+CbSLgu16LlXU9Qe6RbEszthK7h43cQ5IZ2aJmP0iMOkAR/9k
	xcMaZyLKYStjTgnKszL5R1d2oW1VE8f3hpg5EgCAgt97XaHvk9SsnGUzpfnjfmOeFnwGu00jTFf
	fOQMr4lJB10m+wB0gkE8n+6cyadtLSg1awPuPq4/NGhv5k/J/Txi01GIk/0gPi4s0LbwgQzqJav
	e9bxsdGPc+DPcJqCq7b9uN7vb9iG25ApmwWIJryDHlzDUif5RHLqIyZCo7nVVMBdi1q3w==
X-Google-Smtp-Source: AGHT+IGwpr5HxxsMDrw1kRLbewyUoegpFAtLdTBgykRSSjhQg9uayI9WJtj2geYJH0B6YxelyQQ3+45qlZw23tKEvMk=
X-Received: by 2002:a17:903:3d10:b0:283:f19a:bffe with SMTP id
 d9443c01a7336-29027e734acmr282414455ad.7.1760382030293; Mon, 13 Oct 2025
 12:00:30 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Mon, 13 Oct 2025 21:00:04 +0200
X-Gm-Features: AS18NWCMdN3SjIn28o2bWZF1tkG4xMEYQ8uLxmGTdFKLREWp3JU3fZUWiR4kg4w
Message-ID: <CAEt6Nwq7EGH06tGA8q=+4RLBLfOuuidDh-LRrE3g4MXoPxwuqQ@mail.gmail.com>
Subject: OE Workshop Brussels 2026
To: members@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 19:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120548

Some people don't like them Mondays. But we say, the Monday after
FOSDEM is the best time to gather for a day full of networking and
discussions around OpenEmbedded.

So here it is, the CFP and registration for the OE Workshop 2026, on
February 2nd in Brussels.
https://pretalx.com/openembedded-workshop-2026-2025/

We will spare you the rambling about all the nice people, cool
presentations, ways to convince your boss... in the end its easy: sign
up, show up, and if you have something to share then please submit.

See you there!

Josef
on behalf of the usual suspects who run all the events.

