Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5789C46CA3
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:19 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.30694.1702451238636708945
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PINtwgK0;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5906988ab8dso2779879eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451238; x=1703056038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hq93xxSTbQGnJWUfTlQ+amhpm6/cSWQNVWubjURL1nM=;
        b=PINtwgK0fHK40mppovElGpjI44TpWv3H62ZvXDYk9l5iz4TAXabC1kfqCx8dyhx7G6
         F/djek1ba2if/uHnHWFjpGooDBjJ+OUGn9FNUoeO+Paj5k2F3C4Vt2Jva4qwYs+s2sxr
         zrTcdXRTsL87YyAic2GG8PcVfp/5LWE+Wiyt5axQZDFDycYWBEbXjMR8HqV2ujz1PXbe
         OPrf4faOrb+VbOgLvqr1f/70+kdGlqGnCjzVI5NHY55DyziZiNZXg6hyzMqhrQwkMkKQ
         +5GgqaqgaDEUNqNHIJAjtkG103pBo44JB1JnKaM6JWtw16vjU9GiJwPnHlYLcxNiRmfu
         FjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451238; x=1703056038;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hq93xxSTbQGnJWUfTlQ+amhpm6/cSWQNVWubjURL1nM=;
        b=SDipivTFL0xxv5TOLMjEUD6sbB/6SGOymCcSpxiKmpaF7zrAv8AEil2qGmF6ssiqz9
         23dBEjOHBUeOOci6fYcDdbqDjxK2TOkqAd40giXWnfzLU+6Ejdm0xco5VGxIHPd54mQW
         jxnCAj1IBIpt3Gge6G58kbuU/MHXAeKlNdlxMMbO9AWyGu3PH9YjFHfDvUVb/aTq4IsA
         8z6KkmMsG/Wbz6u8dviy1OdEOCAar5ANy0+liRrhXzbEIfSPPhULN4/3fs2ou43BdORb
         ltj6/Jp9ANRGb2+rvZYByDaByAP7WAvih8uqa7Ag+BliBGnZJd2H9mkkU9TEqk/gHwIg
         LE3A==
X-Gm-Message-State: AOJu0YzUcweFj35A6ksjDsKnUiVqXzfTHbR/CnFyhkS8UMQIp0nDMPZf
	JLy+mANbmuAaWeTEiBw2o0b3uv6vxOM=
X-Google-Smtp-Source: AGHT+IGpCepHJG7WgS8/iLPPETpOmaEJ5m9LDgKWnpmqbfksSj3mg8EELhxGLT+SUBcPJy5+iAfkdA==
X-Received: by 2002:a05:6870:9692:b0:203:163d:270f with SMTP id o18-20020a056870969200b00203163d270fmr857626oaq.49.1702451237768;
        Tue, 12 Dec 2023 23:07:17 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231206130309.299460-1-alperyasinak1@gmail.com>
References: <20231206130309.299460-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCHv2] xcursorgen: upgrade 1.0.7 -> 1.0.8
Message-Id: <170245123701.133993.14665229482644532709.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:17 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107354


On Wed, 06 Dec 2023 16:03:09 +0300, alperak wrote:
> Changelog:
> 
> * Resolve -Wsign-conversion warnings from clang
> * Handle -Wimplicit-int-conversion warnings from clang
> * premultiply_data(): Mark png argument unused
> * gitlab CI: stop requiring Signed-off-by in commits
> * Build xz tarballs instead of bzip2
> * gitlab CI: add a basic build test
> 
> [...]

Applied, thanks!

[1/1] xcursorgen: upgrade 1.0.7 -> 1.0.8
      commit: 952f79330eb2396583547ca81cb76b841ab0e932

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


