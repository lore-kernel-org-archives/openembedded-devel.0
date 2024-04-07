Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A08CD129C
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 15:43:16 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.82099.1712504590915863724
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 08:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a9VtrHVo;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5a4f608432bso2723190eaf.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 08:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712504590; x=1713109390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah2YWnH7q+lkR1erJ0U7WuZkE9kUKVjhW8s5TeH8oj8=;
        b=a9VtrHVoTfFalowC2hP6nn7EaEI2kl2BRoWMtpR31bcaFXxrLf48orWSvE5BEnZyau
         UerhwN/mZcdDxnGr+eqlq0tEXNSd19wq/rfQ8cdsDRKiMxqNRlzzk7N0JaIAzlUF7eR4
         +18OIs9b1y00pu3JJi1mDY6Ta12NUZRLHz+7YsZ14wd4veQ0II7mfnkFNH1vKhynQaKj
         B1zz00rBpmyb1i6NeTR3NQth2YS1QzvK0T0pF6S9STq7AsfFSyvAOsg7JrGWKkLpJw+4
         40TWr3MmtQvq3ptWM5q16yznqjspHovgDTF6ytAnG4pTY1l70V9p6if9ERvFKGXarGi9
         G6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712504590; x=1713109390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ah2YWnH7q+lkR1erJ0U7WuZkE9kUKVjhW8s5TeH8oj8=;
        b=u2gXs6SIFwxuA0MBXeXe+J6/OpfR3ZAQ8Ty/Q99BRhqxEDdUGxdLHr7iKtzzHRc+XW
         oG21V/0aVeYX9lzsqK/tw0eBlzvNFstEXncRkpXA9DOt8nLbpctzSwHmnp71GPHzYTU3
         HRT8UgiBHq/tx7hU90W/UmOmgLU/lKe7N8C1U5LWTbIurqCMNC4EJ9xeWcBBv602R3oy
         975E8PRqRWKhqGBtTajnSbhU0MWnDIuM9b38FH5/VeBFk58bAg7W/clE4TvVoV8MEKoH
         kePjj6JlvgxKqT6TNWdav3No+qcObhCRNl89EI659js2C+Ruva2BtnE7W09L6xnZPxQG
         fDQA==
X-Gm-Message-State: AOJu0YxTX51eUErEqaScGj4/2QMtrlm5O9hvuwLx0ReRKN4rfmwhEUe+
	DHD6EzYdnIqOhJ+aVQ3+fhbTVLZO5YejqfmiND1Vtl5V/wZC9Q9kMxYZo59l
X-Google-Smtp-Source: AGHT+IG78vNjjJ9dcukbl/VunV60VebDENGQJk8MIHY1IZHBQxt+aL+gSJo6DrqEUxuUieAANzUVeQ==
X-Received: by 2002:a05:6359:5148:b0:183:fb11:adeb with SMTP id oc8-20020a056359514800b00183fb11adebmr7031369rwb.21.1712504589868;
        Sun, 07 Apr 2024 08:43:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8384])
        by smtp.gmail.com with ESMTPSA id a23-20020a62e217000000b006e71aec34a8sm4760473pfi.167.2024.04.07.08.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 08:43:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Beniamin Sandu <beniaminsandu@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-oe][PATCH] libtorrent: remove CVE mention
Date: Sun,  7 Apr 2024 08:42:56 -0700
Message-ID: <171250415788.900727.6749515569891043462.b4-ty@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405151335.55698-1-beniaminsandu@gmail.com>
References: <20240405151335.55698-1-beniaminsandu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 15:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109847


On Fri, 05 Apr 2024 16:13:35 +0100, Beniamin Sandu wrote:
> The CVE mentioned in the recipe applies to a different libtorrent
> library, from:
> https://github.com/arvidn/libtorrent
> 
> 

Applied, thanks!

[1/1] libtorrent: remove CVE mention
      commit: 0597c931ffbadf2a2242d8ed9cccb8567953d489

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>

