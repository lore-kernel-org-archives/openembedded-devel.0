Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214A7C4707B
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:49 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.97661.1703665303554389109
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dlcijaPM;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-28c179bf45cso2791285a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665303; x=1704270103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1iQVEeC06Pe2Os7i/DSJ7bR1wzSFra2tNYWWHEATM8=;
        b=dlcijaPMQ0oO30ljyB7QezbzCSitbwxs8R3eDExpzyJvxm+wDilEFk8knC9zfgfV4m
         1D2NrNQNqqpHIDOP04gLUxlW3SosChBLXmDXfhTRXnUpHlGv6k1VH6Uy3+PBpAK5v4pN
         08mCabF9T6ge4jZMb7iM3q/pXigFxXRInqN6D7Mu4xeilIYJBDe+SmgwbrRcC+fNhZqN
         M2lMoMKsLMkyRNmnycWZZBqvzj7t/yzvVvxl+IfMSaN5+rrmYtNsIZHqTuimV/RAKGAO
         OYWiyfqm6oamRzwahMSD4x9ZF2S+9ZxIfTIUBW6GCx1yGCUxNaumAWWuWXf0UHZFwdEM
         CIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665303; x=1704270103;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1iQVEeC06Pe2Os7i/DSJ7bR1wzSFra2tNYWWHEATM8=;
        b=vWfOvr4jvYDOne3Gj98hQt5c3d9ayqQAI7SZ+VkH2HppxBAfPbProlq2aqLSXIm3xs
         tf8JTrJVlQ6vJU+51QFzYtVSX8OKnklbXPWOvULDGXk/oMketrRKZ/yTsvRdHtjnBNq1
         WKCW9fClKEpRnInIkh1k55X20ZcvtBNbXkaz9dNZgTgBqUD0UC/NgGUl/CLBZf+VzBbf
         CwcLYOXtsG4q3Gc9KUG3Yb1n7vaFU/YEETdJAiBQ0kKt/pMi4adPOJGngEBNVBze1/m4
         JJtdkrqLjBkzqn+mz81tzOWbkNqYtNz/KdkNDg0OaRGCvzvcc+PREinUBN3VIjXg+q5y
         Pvfw==
X-Gm-Message-State: AOJu0YwxbsaE2qJZjIti1pou5T3Njwa4a1h9YYITB2u5jprzj0CR6Rjc
	aDa8WVHvt2HJ5mk1FXmAHLAhZQPaYzk=
X-Google-Smtp-Source: AGHT+IGKJxTuH4Im1yw32Kny1HT4k3MTtP8gYPMcCEsjtr64/jT2ll9neevgM85T/bqw+/orV70XUA==
X-Received: by 2002:a17:90a:77c8:b0:28b:f7ad:f1e with SMTP id e8-20020a17090a77c800b0028bf7ad0f1emr3774137pjs.57.1703665302959;
        Wed, 27 Dec 2023 00:21:42 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221180609.3902636-1-derek@asterius.io>
References: <20231221180609.3902636-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] gyp: update to the latest commit
Message-Id: <170366530228.1947762.1460789117322111683.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:42 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107849


On Thu, 21 Dec 2023 18:06:09 +0000, Derek Straka wrote:
> NOTE: gyp is now idle, and support will be removed in future releases
> https://chromium.googlesource.com/external/gyp/+/d6c5dd51dc3a60bf4ff32a5256713690a1a10376
> 
> 

Applied, thanks!

[1/1] gyp: update to the latest commit
      commit: 1a1deabbf0e420fa93e136cdacddc85f9d3f42fe

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


