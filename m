Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9181C5AE5B
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:25 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.43617.1700452283396473164
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LwhhQx+y;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6b20a48522fso3124728b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452283; x=1701057083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLUDZgDNQVwdKfTupOVPkqaMyQ/EEhqVQIPADiIuVr8=;
        b=LwhhQx+ybewJa5MpYOCCFUxfbLuWRgfOuJk9aRYeRCeMD/cTZ94DXpLQJL7D89bBSG
         g0JQc/HIQcjbejuvy3VBYpIzynj5oqUBiLR72Qq1DKx7vLTFD0DWy+2bOFucjWa49uiE
         PURMdyo3f8ATBcjs2kvBEBl86hPPkzEhAs3yF45ONHk5t4uN+C4QqtCj8b/7yuZ/jWax
         QX9zX0Lecg9uEXy3iOgVSKdWBwVhx+rSrqZpEswDP+NQqfwjZSnNKV1daJjRvWWzdqxJ
         cTAf7cFb8bcgz6QjKKBVpy2C9JNzjuRoZmUN/E2NdxvX0sqravFHsMf3N1eulxUqr5aN
         USJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452283; x=1701057083;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLUDZgDNQVwdKfTupOVPkqaMyQ/EEhqVQIPADiIuVr8=;
        b=Rv34coJqim4CznH5aW8uvXxlpR+Lj0Wvq+UiskVSKVoq/oQIx7JY7lCEhWpZ34CMRj
         RpJfMoSJabOmkkGSRV52Sz09IAeTocTptIR5c8ncc2vzQS6a+8ZuBWccixMj9N8T+UW9
         0bHAxvvmeMz5RHGKzSvBDAILoZVFxNf+GlzqhC+kQpVoTVM5rGh7KZd3N2TEBISFtZfb
         Cprk9RTyoSxd0HOrnWLe3Eb5VUO3DnjPE00w2uiM5nZR11MDmFXqxjwNO4PkdeIp1g/L
         e6/2pFt6C9t9+V1552X5I3Tzj4EBj//CbGaTMBv0O706DSbOg2VQuR4o77fatQXuj2XM
         +fPw==
X-Gm-Message-State: AOJu0YzGcfcgBL1OcCrI/9BQI4k2C5zzCNfpF7r3vzu10S6uE5oah/Xy
	4Xop6lwPPzsGRMNXN+eFyRY=
X-Google-Smtp-Source: AGHT+IG+JVMrVf1wKXAxyXIKEcYWRBC/VwvtuXTNwTkEDgkvhfIfrT79Tcv6D5PXGt8vpyzGzynOEw==
X-Received: by 2002:a05:6a00:194c:b0:6c4:ac49:89a3 with SMTP id s12-20020a056a00194c00b006c4ac4989a3mr5424483pfk.14.1700452282604;
        Sun, 19 Nov 2023 19:51:22 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231116163524.1095372-1-alperyasinak1@gmail.com>
References: <20231116163524.1095372-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] capnproto: upgrade 0.10.4 -> 1.0.1
Message-Id: <170045228196.1416826.15716150756699960100.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:21 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106938


On Thu, 16 Nov 2023 19:35:24 +0300, alperak wrote:
> 


Applied, thanks!

[1/1] capnproto: upgrade 0.10.4 -> 1.0.1
      commit: dbee6afc11686501e9f9866d623d24e3ff440006

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


