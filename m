Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218FCC4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 20:16:48 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.32927.1671481004116615145
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 12:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O9wxmck+;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1447c7aa004so12933033fac.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 12:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hJIL99SVXFZuLpRg1Jfx+UUYUBluF9DrKzjaL4FNauc=;
        b=O9wxmck+9O0Toeaxk1GPj0UuOIk7iWjgDRN1ldfG0RDGqnpKwzjN6E2/acBaBl81An
         MNQVOsIQAynBtpkedVJUargRVvfqSZz6gnv3sMahW4Hueq/qBs5d8At0WLDcJwNX2c+8
         +rcXMykTKHF/Z+TeSVhx6Hx1VOD1j6pqAZm1y13TOjta6rqRnsA+DCzCV4d8sdf0u8M+
         9+G8+bqkpD5tYhXXbrtrR9ur5dblr3+wb3XOZD/FmUf1U7ifp3v+TnyF09gBUiHDTSQh
         Q5FRNhpE9jfI4L8fFKMhqq05wQmVGhavzWuwyczI4pSajFsf47jIj+qWNrFfNSWKJ5OK
         qdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJIL99SVXFZuLpRg1Jfx+UUYUBluF9DrKzjaL4FNauc=;
        b=v008bpKapqaOc5//eWFP3wT5P1459GFhRsxyTCupGEU7ZT/GyRs9xiwisg5BTnship
         BYRZYPZoAJ6K+4AcTZ+Za6cK5DjcnAqwL0RRT1DJkuC40SeU2P7uo3dbKbRixK3zNsjt
         A8yv5eKHDd/ifMcf2cYJPAffZxnT1TYJXJ9w+Ryz51OAEiU3aZUoEAdrBfWJkUVKBmL2
         U2y9MYFNxk5/rDL6KDGqY4Bsw2m4In+WSazPMS8BYkNd9/36G3PmkJkq8inWVU1BozQ1
         i87l2Ho2ozXU0YJXp/4inVuijZEYloiAG3gLxBxKUFYttL9XnJ0oyyOzJgZl3+GwoSB+
         V4KQ==
X-Gm-Message-State: AFqh2krTQglgwhb0dDX74uec7Ep7RCpDwm8HtNWPnwXzmPpoFnn98AnT
	+JY9GqK8Voz4uOuYxmU9wMAK5EnPrwqg8oIPe1Q+Fp8L
X-Google-Smtp-Source: AMrXdXvhHjJdQnUH2N3BjcFcmsNju5duw1KcClVLHwKKr4HRQgYdmRjriVbyUfpN+FakiycizJMZvb7A+tNnVKejyQ0=
X-Received: by 2002:a05:6870:98b1:b0:13b:1e05:a73d with SMTP id
 eg49-20020a05687098b100b0013b1e05a73dmr1143473oab.55.1671481003387; Mon, 19
 Dec 2022 12:16:43 -0800 (PST)
MIME-Version: 1.0
References: <20221219131041.452949-1-f_l_k@t-online.de> <20221219131041.452949-6-f_l_k@t-online.de>
 <CAMKF1sq4hns=rdZSKpXFocsXOGOaN9MShn151gsrbi8ZfLE58w@mail.gmail.com> <GOM5NR.851622OSHAZ42@t-online.de>
In-Reply-To: <GOM5NR.851622OSHAZ42@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Dec 2022 12:16:17 -0800
Message-ID: <CAMKF1so5suJGs0KOwzpwrGoriT1itTN-ugpof+sOPDDq9QGBPQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 06/10] xdg-desktop-portal: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 20:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100114

On Mon, Dec 19, 2022 at 12:10 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> Am Mo, 19. Dez 2022 um 11:25:16 -0800 schrieb Khem Raj <raj.khem@gmail.com>:
>
> 10:01:38 ERROR: Nothing PROVIDES 'bubblewrap-native' (but /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
>
>
> I'll try to send a patch for meta-security

Adding bubblewrap recipe to meta-oe might be better perhaps, I see it
being needed in webkit as well.

