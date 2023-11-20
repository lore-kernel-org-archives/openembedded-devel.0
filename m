Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FE9C5B55F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:46 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.43654.1700452297807844179
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e8LELFok;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5c184b3bbc4so3073033a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452297; x=1701057097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgJknG3ThC6Cnk6I2F1sYVAstTapSTYuH/pwQ7BVsw8=;
        b=e8LELFoktKHAI1hlFLlF91OkIx6mkXIOiJbUX6PPHakUcqYHCkySPJrfNF78ZtDT9t
         9g0vMjWZjTKqiY6nZrQL/lWEWkQ11mDuUyZ8hQEupMbF0CFrWQFe6D+4H9NLxjkTP4mS
         i3OlwRlMpaUvxoBCxBzdaRznrqlO1TvBu+xf6kHS57rx+8cWlyqKnpjHfz/9JZnRP4Nw
         X0VIr31CwuU48mfAiFmou9BJMp+uD4Wd8NMilM+IV4QIipf65zbT9X/d5/+Fo1LNTBTS
         LTUw3YZ4mAW97vAEnwRy4TBQ3quLN6tvPYy2z8RhJHQ+1Svc3XDONft3hzMQlzM+2T6e
         qi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452297; x=1701057097;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgJknG3ThC6Cnk6I2F1sYVAstTapSTYuH/pwQ7BVsw8=;
        b=VmPfWJacnMXvVyM0jyVNL5Kr8uDWj9dP7OynbxfeO/ny/lpYfhiiYsd34gI8moS2Tm
         0B+/A6oA1VLrCqdSmkGOY37CmEi4cLkrOySRQ8Cfk+KcE29nJ4rHwTCAy+9+WxP72kq5
         2kxd2619I5HLt6OiI8vPkF/MSnmIRr6/acRz/7Tq6Z/kZJ6XeVGIeOT0wkOcVPXpBMOj
         zAFV35oVgjMyktEcuHzcWwIZTYdVtTqmpx5acmx3d3Ll7ZZ8fd1UYe/o/bdOE17Ffzf6
         76IuhqWhcr9MdI/qmb0AM64IXjV5Wq/C/byG1NTyJK6vlcGcBzlpM0+tBi4CV6wtlnhN
         QitQ==
X-Gm-Message-State: AOJu0YzbVeVJCfDKQPuGGPIbvgbbl5WUCVLsglxuWImOROibMgIdOqYp
	kZQhLfTdctm9xrm2j3rWpCo=
X-Google-Smtp-Source: AGHT+IFCF27cRwicuUvcnc5qzoGov2TEao3+LD/iHhY/2jlGgRX/4UEnIsnXi0a+5s9h2ZFN1Crm3A==
X-Received: by 2002:a05:6a20:9189:b0:184:26d8:db7e with SMTP id v9-20020a056a20918900b0018426d8db7emr8199361pzd.14.1700452297105;
        Sun, 19 Nov 2023 19:51:37 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700203751-30723-1-git-send-email-wangmy@fujitsu.com>
References: <1700203751-30723-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] imlib2: delete non-existent file
Message-Id: <170045229618.1416826.13669971404575255940.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:36 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106952


On Fri, 17 Nov 2023 14:49:11 +0800, wangmy@fujitsu.com wrote:
> /usr/bin/imlib2-config was deleted from upstream, so delete it from bb
> file.
> 
> 

Applied, thanks!

[1/1] imlib2: delete non-existent file
      commit: 9d7b61e96b0f72b55bbb891cd3cbd7150427297e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


