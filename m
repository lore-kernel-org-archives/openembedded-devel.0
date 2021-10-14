Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2535C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 21:32:43 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.1237.1634247133672751781
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 14:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pwimNdgC;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: geoffhp@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso5764394pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 14:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=VGLesYvyaW9T8Tajs2WjXZwQLnWmPn/hP8X8iF2YS4A=;
        b=pwimNdgCVAdcqDbSyQko5fMmCBG1uZNY60MUOr7BuXzIR7ia9i7pAwAWuIxYL3sSol
         ffoKwrYzuFuMnputhauxCVA0HaOrSLVOPct/EgUxvlxxqJQw7RtXDs0D0YgVLFfxTPoK
         lLS7LCJyadGqz1SV5mCndGb+0b7kf4LzHXGiQgHGyl/J0JC9qLiVOCfWfjPzbJ0z4qLd
         Ft3+ivGJ18nUGje/Px6vmjiRiArkJngL4AqSQBzVp+hkfFg/2NmQTwvpOOuwrIuljryi
         I3U6gFzAPf1eM+fHgqn7poha+YtLkCn8jX8qJVWSoWy8BJ1VxmeFgGPxDwnJq1JgWLJd
         cA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=VGLesYvyaW9T8Tajs2WjXZwQLnWmPn/hP8X8iF2YS4A=;
        b=0To/zS6uLp/ulfI6OlCkP83TZ8Ii41lFiO9gzWP6boE6Dmt/qenPLR/wgzqWKh4iOm
         YkUUGfDIg0CxGosAlHPeSwMs/UKxCsG00lZcQT6+6PvbGHG/3UY8ttYiU5LpgsGko5S/
         +KiqN0iRI43IrrYV3yWoNClRleGdj4/Iyef/OOwsAX0oNjYRrjWAYpkrGDoDF2/xy2WJ
         8/MGh4xdCGy11IWL997Q827yEkCxgV2dumM09c41mcdKFIid6X1fSwbZLL49ETj7k/0k
         yRtciWDdNpucn48oj8rqJcL+hHrSpskZ6KhUkFRIA50h9JeIXpWY1EcwzmCOOx9r2/x6
         X/1Q==
X-Gm-Message-State: AOAM531jdWv6wxy5ysMMm+63R4q3uuFuZ1htQZh5R2wOyPMgVC1aRENC
	9CtVBr6nRc/1C6PdULwOkGaZT4HnbuynmRk5ymOZZb7nUqQ=
X-Google-Smtp-Source: 
 ABdhPJz9i6vmrh3gkeSxzsgdA6K5PUmOd7yVjqkRTMT4SZhB+hOh+4Rs1yUO2fqWiHZoA/sOwy/RKYohTvA0QkP7+iM=
X-Received: by 2002:a17:90a:4e43:: with SMTP id
 t3mr23320134pjl.163.1634247132850;
 Thu, 14 Oct 2021 14:32:12 -0700 (PDT)
MIME-Version: 1.0
From: Geoff Parker <geoffhp@gmail.com>
Date: Thu, 14 Oct 2021 14:32:02 -0700
Message-ID: 
 <CAHNuFGLJZ_y2PfoWPBW-sQt+92KoeT74eC7geYzCUJoeQD4eLw@mail.gmail.com>
Subject: [meta-java] Request to pull honister branch and override syntax
 commits from master-next to master branch
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 21:32:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93304

Request that these commits that have been in meta-next for a while get
merged into master of meta-java  so that builds using meta-java can be
built with master or honister core layers.

147677c layer.conf: Update to new honister release name
a1eb2b9 all: manual fixes for new override syntax
b71a986 all: run convert-overrides (0.9.3) script to convert to new
override format

