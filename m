Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4B5C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 03:58:57 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.1992.1642564737186183004
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 19:58:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=JfFhKrqs;
 spf=pass (domain: google.com, ip: 209.85.167.47, mailfrom: wak@google.com)
Received: by mail-lf1-f47.google.com with SMTP id d3so3772611lfv.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 19:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OyjD/2UegU+rCG9YlQQDy7ynPxvsfCatXdBE1iIjzGk=;
        b=JfFhKrqsQ1BJX0IFs5iHGoN2OrktHnHgM1n0aERjY3oNc0OczDE9R+IYHzYI4luJ9j
         2lAsd4SvP/N0CacIAAVfomfhumDgJgUEr4W97qeOX4F6uFM6V34vi4DrQKWP5IgIHGxF
         VX026q5sNRM+LMpLzM/iOfTbD2CLTwB1CSqgj1Bmz40nc+/00oVqsfKfjVXuvc8YrXzF
         SI3Zno4PUnXDm6SCIiHpsXY1kS1hxofjpSFUlWUZ2dThLI+oc+cm8F5mdm3cEQ1sRWYW
         zPmfJIGQMYx/h05MqW3l6g6IIXl1oIxVsTr+vY9WOUAhtbOG4zrwspbiwvNXAHHNo27U
         mv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OyjD/2UegU+rCG9YlQQDy7ynPxvsfCatXdBE1iIjzGk=;
        b=hedu/8w69XM6vlqkhX3IC8DWVYDiTXRATpaWOZquFol+uS7mIEk81Zid84BsCf8p8f
         KS9MoqL9O9c57GVptX9WVRwOlBPYamTxUr0M62BggPcK1vWH9isg4PvcOrOT/oggUWdS
         nQcyme1pK/V+KJFaRk50/PeyF2/qJ+54nApA31xYnjDGdLDO01d84aJedXw6/wnwo+i3
         FcQ/NJjzCfZxVNe9mMCBDBT3KU8Gyre55mgYjKYzO4akyF0rVI78HPBMRaFPu+u+Onw4
         lgOZ7rHFBFeO662ued0lb1LfRVxxk5px6mp3PjKZhcD+nPuhz+YptSWYLhCZuSZqBKzV
         nXCA==
X-Gm-Message-State: AOAM531x19PbCbSfkbORJ463icZVzzEk+0Z/AKuXG+X540bfiZ99NpJe
	eh0lvRI76Z/ANEgl7UAJjpM6o9NT5KRuFN9HTCtyEA==
X-Google-Smtp-Source: 
 ABdhPJx6JZbpS2tcoHmdFHQmlJLIPhB+9Tn5VyMFd3onRsjmVfbjYjf9mkZdZlOxjkkoWc3caAhBq++kIotly07g4SI=
X-Received: by 2002:a2e:6e02:: with SMTP id j2mr19511469ljc.216.1642564734906;
 Tue, 18 Jan 2022 19:58:54 -0800 (PST)
MIME-Version: 1.0
References: <20220118230000.834968-1-wak@google.com>
 <CAMKF1squ8UE63R6EWWL6Zy8q_AUtV8Hs2GNfbrMXSq6g6ytQaQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1squ8UE63R6EWWL6Zy8q_AUtV8Hs2GNfbrMXSq6g6ytQaQ@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Tue, 18 Jan 2022 19:58:43 -0800
Message-ID: 
 <CAPnigKnO=YM7Fw4ZpS-RR=YXSsyRyzytPHdKSQCUXhv0MwP9AA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] jq: upgrade 1.6 -> 2021-10-24 git
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008c237705d5e7673e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 03:58:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94932

--0000000000008c237705d5e7673e
Content-Type: text/plain; charset="UTF-8"

This was an error in translation as I cherry-picked this change into a
working tree and fixed the hash there without fixing the original commit.
Otherwise this was tested on some machines here.

--0000000000008c237705d5e7673e
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">This was an error in translation as I cherry-picked this change into a working tree and fixed the hash there without fixing the original commit. Otherwise this was tested on some machines here.</div>

--0000000000008c237705d5e7673e--

