Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6A1C54E71
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 20:18:39 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.27248.1710706712228224526
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 13:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BArOK9Ck;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-29c71c6e20cso3112672a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 13:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710706711; x=1711311511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4C/uNnhko0hPyPuoT849WezEcHLsCy1SmuqVeuvYB8=;
        b=BArOK9CkDjka5j0sTMfp0EFGU64pngHWrqvHxxt/glf4HRtFuqJkKT9IR9HPVKuNYx
         m4KsPbC4Kc1hmwq4wWP710frAPMM7D75635V6KkvHa7hLAm01rKorFecUz6KOKL8Unxn
         HqCYImn1jvbUMkUHJ4ctUkC/qu1gqIvTmoy6J5CYgOwKATu8A/WFDAnONovRQyM0hGW2
         KI1+7nbtOzKJsB0M5WQZ8wF6Q29RhNXX2zWuEiak534v30rREpx0WiEdyMUNxx0vUP8C
         Qz/adAw5aDudqrggIVIhyKK+u7MIUlgWcVfwqyB35GoB+5rRem2ujMv7aEeQvXnwKvns
         GhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710706711; x=1711311511;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4C/uNnhko0hPyPuoT849WezEcHLsCy1SmuqVeuvYB8=;
        b=KqpPSpBF8BFzJ2hYucVxbwOi0BEkPBFrLvdzF7lKw5mLxH3mHjIx0J6VifP4fqO7ih
         cJsxZ4ZLTGYAUhZM52tHGegbBUMDvRrvl+YSh/wqO/t1ShH+8Ig3iOqC2E3NgJVSxUA+
         jx82uLb5FDWVPkwEmadp5zB3qeBcoACgZavYy1WSXuEAEnCnpfcdvVgaMjSzTfGzjcVh
         Bh7lqOGRawrrW+8MWLI12yhOARYi8qJAE1jO9lH35yF3wNjFir/xFnDmJCOkBUI6UmYS
         avezDW3DL9FBFM5nqTV075VCsBa/d33C/x3+YJyssBCSRXI+8HWDf9vI/UIbIK0lQBl6
         cAJA==
X-Gm-Message-State: AOJu0YzwwlhHEKX2dMHSMG5TOoWI5ehVWYqiYlmgxUozfZED6ybuKLeL
	06YyQ2I0egaXAHigIC/pNqxekU/jylFGeRD29dc7Kyvc3NrQMgz99znboE9h
X-Google-Smtp-Source: AGHT+IHy7J3OJ/9ZywZouvM4DuvM+uES2edMnr/BaTOdjluBFnQ7bKIoi6oH92AlJHb9nzdg6zInag==
X-Received: by 2002:a05:6a20:c505:b0:1a0:adbc:7a96 with SMTP id gm5-20020a056a20c50500b001a0adbc7a96mr6226021pzb.36.1710706711389;
        Sun, 17 Mar 2024 13:18:31 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::68dc])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001db717d2dbbsm1465604pla.210.2024.03.17.13.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 13:18:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <20240315171651.3850535-1-richard.purdie@linuxfoundation.org>
References: <20240315171651.3850535-1-richard.purdie@linuxfoundation.org>
Subject: Re: [meta-openembedded] [PATCH 1/2] imagemagick/lcms/fftw: Allow
 nativesdk versions to exist
Message-Id: <171070671075.939783.13852084190218855667.b4-ty@gmail.com>
Date: Sun, 17 Mar 2024 13:18:30 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 20:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109389


On Fri, 15 Mar 2024 17:16:50 +0000, Richard Purdie wrote:
> These allow the use of imagemagick in SDKs where it is useful to perform
> image analysis such as on the autobuilder for screenshot processing
> during QA testing.
> 
> 

Applied, thanks!

[1/2] imagemagick/lcms/fftw: Allow nativesdk versions to exist
      commit: ee2001b3037a6767ad0f46721b3b8fcef140c12f
[2/2] buildtools-imagemagick: Add new recipe
      commit: 2e3a4b155cd997dca51ff4be42233ada0e54eec6

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


