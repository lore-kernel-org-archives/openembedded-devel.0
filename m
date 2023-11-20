Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FE7C5B562
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:05 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.43631.1700452257798604323
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B2tAFVZB;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5caa401f151so2604627b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452257; x=1701057057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chd8XshX0FQlc1UQXAJvF+FaGC7XFFGJnLVqkCXxFpI=;
        b=B2tAFVZBoog6WLRt4205fsXyZMeFsH8eQttR7dCAaA5BZcpgTvhQAeaj7wszHQxloq
         aYuuvfZagAuWQp+p546eqkgQgFMf9vJgkTcskmUDn/kBy6uBn+G0Bnq+LYbz4duFmML4
         uWJ/L+pXQS/6R/p+bIs7VMAM2Fsp6WUioNzqcBNvjWOzjfsrjgibNY3UPz2jS9Ko9UCX
         gMOrOx88KB0BULzojmh20cnGoit6GGufOdyymSLkr9Z0+kLiPRBifY+4uKA4zybEcnBX
         QZ6/Dh9c9S/dKHhIkZf/N4K8BfRY8qDe3HkJRKstyb7l7+u6xWEsaCB+lQbc6wA9hG0R
         qd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452257; x=1701057057;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chd8XshX0FQlc1UQXAJvF+FaGC7XFFGJnLVqkCXxFpI=;
        b=VUjtTM7/ryRqJrCw/hf01Uek/F861PgIoXSTJQ6sK7kjoToZ5DPqqatO830/Wkq+yO
         A+dLx1rC6j7iA7ZMhpI1xHb50uDEABsoy5OGZE6ZyH0f2Gxm+tsNWxh7zT6r2bnbmJtT
         vrYYDRc7CS7nyKp4fDxXHOMezd0S6lPQmjVvNehD1ZVlmRV1Rtk2y//mYuALQ57Pl7Ig
         wJ4XK3MTOCwc9C51lBv+zTkorekjz7Zr5jxuN5aRsuGArrAyRIJ5jrpm2WCxTFfuSEbY
         adXSfdrtG2L6dGdyDX+6rEYBYI6CJX1gpVdKsZMOeXdeMq99CSSHZpre00S73XcjSiJo
         5eDA==
X-Gm-Message-State: AOJu0Ywm2Z6bvm4to2Iae8F+Hh6KC4ufUlDu5xTEp07Tt/LWW2OJ8P/y
	3mLQNiVVcdjgxIUpQIoc384=
X-Google-Smtp-Source: AGHT+IGpldV2hvKmBQXc9Z0awgYrEhAy+rps6RR1C17Zgc4oNQ29+ICTdpiTgmEpVIV5oTUsOvvDlA==
X-Received: by 2002:a25:41d3:0:b0:d9d:39af:2feb with SMTP id o202-20020a2541d3000000b00d9d39af2febmr5042938yba.50.1700452256856;
        Sun, 19 Nov 2023 19:50:56 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700122714-22172-1-git-send-email-wangmy@fujitsu.com>
References: <1700122714-22172-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-mypy: upgrade 1.6.1 ->
 1.7.0
Message-Id: <170045225602.1416826.405023263546086327.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:56 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106914


On Thu, 16 Nov 2023 16:18:34 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  https://github.com/python/mypy/blob/master/CHANGELOG.md
> 
> 

Applied, thanks!

[1/1] python3-mypy: upgrade 1.6.1 -> 1.7.0
      commit: 9b36130c3cae2f403a29608998747cc44f05ddac

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


