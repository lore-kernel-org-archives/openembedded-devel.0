Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A97C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 13:35:24 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.22055.1644240923791785700
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 05:35:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=c3rd4oLt;
 spf=pass (domain: burtonini.com, ip: 209.85.221.44,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f44.google.com with SMTP id i15so2431300wrb.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 05:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JgMbL+8NTM7aFqShIe3JTgDFC5MGMkymxvVVdAdGHUU=;
        b=c3rd4oLtJmIg5tOmtMuilsLBkF1WntfD9DllK7FTlqYZOYujqxzn9lOi7bRHqwwRFN
         Ekukk5+Liw3u2sI0+xfjVInY1UXeixMipZPZzKbLmnOxTBjEAvmWcDQzv1ajZQCyFCF3
         6vXyNy2uFHIE8lr44124o0YnkImkyzv5Chk/cGp/nmnWUemchpUqRK0qP/CJ9AsMfK0T
         pUM+hYOtyTT6dWK6GiaxCthSwgjOx8lSttRaRPnQVLsxlmn/xE3SWgc4XdOD9MxDYhak
         Gh05pqsDMcCLBsa78Mm4iEVcR3s3Pc+4WbRcJYB7jU7tEPF/BUBfD95WGJQnhCQpzGHg
         Kw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JgMbL+8NTM7aFqShIe3JTgDFC5MGMkymxvVVdAdGHUU=;
        b=wKUk+Ad8rXOjw1Xz6jGjsRmPUkQSbXik1OQvvMWwN8hNFPrelTO40lS/lo+l525g4X
         YXZBP7Vc7kXuaeLz7jm63PEekfoxYaKVDR4uO+UHIexSaPqwh0tkoPPy+4FxIcVIEq9L
         +EPNefxiRgNchNaJMV4KmVH0UZRsQv1Lz7xZt2N/szKnbjL2iCRZuONHb209yAdfxcmn
         BfJYqFOe53ay7BlKAC+EAqYL8geeUPGhpgGFhyF084QkZDzTjR3V4re6m1bfAQhM67sk
         gVli352zDXDA2x41e7V09KoA0GMpQXOn+bgIiTN0gljCkmHk5UIhXa5jOvejOsxV+1XM
         ebBg==
X-Gm-Message-State: AOAM530pJ05D2JoXvSrLMLLJby31swzX6P6neXSFk9SZtjEqkKa/DI/Z
	g3WjNKnUWdaYeYHkPjAnXgGO1Mq+8YxP2kutRjYknw==
X-Google-Smtp-Source: 
 ABdhPJzsjxDIpXvzWAwz5zvXwSC3Ip/obK2LSWX1GCvSZcu5CwBsIAtrrZjBsSkydkr3MksD0A1094pPq5QjcRWWgSc=
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr6864007wrs.620.1644240922104;
 Mon, 07 Feb 2022 05:35:22 -0800 (PST)
MIME-Version: 1.0
References: <20220207114114.5580-1-matthias@extraklein.de>
In-Reply-To: <20220207114114.5580-1-matthias@extraklein.de>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 7 Feb 2022 13:35:11 +0000
Message-ID: 
 <CAAnfSTtQWB=MoijxEHwfX1iDBfiOeXjZsC_hGk441--5xCYO5Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH V3] gpsd-machine-conf: set precise
 BSD-2-Clause license
To: Matthias Klein <matthias@extraklein.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Feb 2022 13:35:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95241

On Mon, 7 Feb 2022 at 11:41, Matthias Klein <matthias@extraklein.de> wrote:
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD;md5=3775480a712fc46a69647678acb234cb"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f"

Are you the sole copyright holder so able to unilaterally relicense this?

Or should you keep it as BSD-3-Clause.

Ross

