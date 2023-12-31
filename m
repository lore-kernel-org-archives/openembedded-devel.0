Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF849C47077
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:28 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.198906.1703983107433712081
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RpFJWCjF;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-204520717b3so4873512fac.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983106; x=1704587906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctfXDoLSNZ9lCMB+hAdTQx2nSZPQtMhQErneRKzRjio=;
        b=RpFJWCjFuQicQqlInVejaBORAY5ZNJVU8Xcc4EFmf/d7wKJE9LdQ62G3ex1xUL2O2C
         D4G6yJF9FtOYFBoUeUOAL6k34jtxwdx8dU68SwZfY+ceoRxNp+rBRe9ZGAn6TsT22T8B
         1nr3lXBrqRTu5yoSvIX+Q8A8RA7aKbk2qEu+vLa5JxF6XjElJiKlI3s+NDbpA7Ldmb7p
         4nfGDVlL3aVTXR1H5D1mDxzCieCxAUG5VFRtgwcy10kylWv/Xw9ExnfISI/V0rWaBk0Q
         ihYBjLUVg40jFSJbg+OSvpTDuwhLLnHYsHdPZV5089HkddOL7+Vk7u618MDGqpXaJKgi
         uOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983106; x=1704587906;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctfXDoLSNZ9lCMB+hAdTQx2nSZPQtMhQErneRKzRjio=;
        b=ITr8HojmQypDBSfQNJLo/MutPYXgTOdScF8YT6Ewsglm2QQc5UTM1hcQgsr6YTGjID
         p5UOfdwccFwaSCB42GHqvWOLKpk7wHuS1sdypifRqCga21BnUCNxB/+joXwNY8HBClC4
         pJKYX/FIjYswImTB+MfrGcYbtiJqANirX6szt3BRHwmpKEpcGZ9U6iOYanhhDcPp/B0x
         btccl8aCeZX5ObA5llZ7X7lgIY8YA7ad5rcl28SuIHwbzkaN8KB0vmoWzowl5Ct3yvu0
         G1FYp2ZsJ2MkMJuyg0wJJ1sCY7vSZYzg6jN4tqhulOnXcT+AiCCd2+ZF4n88N9QWArX/
         Yizg==
X-Gm-Message-State: AOJu0YyUazOPcsqgFRl7Qm/+hZ0MayKovGIi12TNwJZy99IS0dIEb5Rl
	++RqVNaGSawCrdcgeXrznNZa1KXlvmA=
X-Google-Smtp-Source: AGHT+IHm09iW3h+9BEZnoVjgKEMSylUKzXV1xtck3Xfw61dQJ+HJnchPckR0hs4XAA4XsJlOG0LtjQ==
X-Received: by 2002:a05:6870:c10d:b0:203:b44f:9036 with SMTP id f13-20020a056870c10d00b00203b44f9036mr16832421oad.60.1703983106425;
        Sat, 30 Dec 2023 16:38:26 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703573995-12702-1-git-send-email-wangmy@fujitsu.com>
References: <1703573995-12702-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20231210.0 ->
 6.0.20231224.0
Message-Id: <170398310556.873206.15637996044369064972.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:25 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107921


On Tue, 26 Dec 2023 14:59:55 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] ctags: upgrade 6.0.20231210.0 -> 6.0.20231224.0
      commit: 51648324086a34abe212c659ce3e6b70edd0e210

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


