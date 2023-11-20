Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CB1C5AE5B
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:36 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.43652.1700452293576766165
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=biaJq6cI;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-daef74513e1so3583397276.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452293; x=1701057093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTTPF33veo5IK+5B0de+uXQTDMQ0CYu+x/OxcttYdag=;
        b=biaJq6cIiKVzeT07wTWeGWvtQAeBVeXuIQxF4rBlr6r4sWwS+Ha0+OAaA+EjfrrATx
         00WgW6vy1HruJ7Iwxqzl/mhHTPia9NTEojFdEhmX0PNkVxjfGlDQtE9Fho0GhRzfbYrN
         hSvRFJKrNwS3qZdDYBPd2Z3DyitaM08SsT2l2eqaLTb7XB0KHBuIkY69oxD+ix5dLtGz
         B1UqQNmsp7tt3VXpfbh+j+zPyCGWQjQboYRe2trE4aM56ielJg/9WKbxFy4vWGWWNV11
         k+bQtoZs1ykq1re6zkkhVMg8uT8nqKTl6+Yr35N13uq5VFEqrsguMGKbmN4uvpoQdxTq
         dmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452293; x=1701057093;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTTPF33veo5IK+5B0de+uXQTDMQ0CYu+x/OxcttYdag=;
        b=YVJ3TJHm7NkTyrR+5ScCFLtTWRWgCW/C2KpYYKXiWgjAbvPSjIJAMoZ6DsoB7x07n0
         XioXK0Byyqw84P79vrG+uU8dWZZLsWAPJJ/uVJm+IHR/G/XurZ1OY9FH3xKNHd9I/BbW
         dG4+kMHxbe4eaZfKb1qfh7sY6GGKhtTLIoQ9TnicNMi0AdQku6cBGJCEPORefzOnt6xj
         XhUP0b13bw/9yDiIyDoMzKz9hi2XQEzoHJmD/NFBgnLIGvv0fzqWF0QFDOI2WtLuYkmb
         Xx0fNdPXHlgF93ykTIzpTjF+0ocSYPEv/o5h7FjT35ja5q7+aK0kyc5dYg741i9ZdEjY
         6tSw==
X-Gm-Message-State: AOJu0Yx3Hth77ZT9tN0jDl6UscAoBgYYypC0h3WPI30OWsKDTZrw0wfO
	OSs95b+cvp9Ee/2Aqu/rDV66zp1a+R6AZg==
X-Google-Smtp-Source: AGHT+IGXE+gW5dAaVs3+ZHfhkGF3oGbmhKmQQoPq7cHMClRbi9erdHsc5PfXCRKJY3SpZXlZAzD7gw==
X-Received: by 2002:a25:dfc1:0:b0:daf:8527:9503 with SMTP id w184-20020a25dfc1000000b00daf85279503mr6130325ybg.13.1700452292665;
        Sun, 19 Nov 2023 19:51:32 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231116200815.1489369-1-alperyasinak1@gmail.com>
References: <20231116200815.1489369-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] mercurial: upgrade 6.1 -> 6.5
Message-Id: <170045229192.1416826.13618372220874806800.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:31 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106948


On Thu, 16 Nov 2023 23:08:15 +0300, alperak wrote:
> Changelog: https://wiki.mercurial-scm.org/WhatsNew
> 
> 

Applied, thanks!

[1/1] mercurial: upgrade 6.1 -> 6.5
      commit: c2773fdafcd8f7bd56d7fc749306ff1ff1ed56b6

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


