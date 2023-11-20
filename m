Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C59C5AD4C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:36 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.43651.1700452292524590937
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IncWkZtj;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1ef36a04931so2492536fac.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452292; x=1701057092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/H+RknLB1Uug98Ti3hZsP+Rhi4/Io512NFbv0j7DK38=;
        b=IncWkZtjnsnBIOW4AAUpcuVfpvxA043mxN0bRpK7rAaFB2gtDGtUY9vzjW3PP9pbxg
         9Ve+vvVPRFsnmeuYk/lDq++YR46lB8RJH+RMPRLJOMRU7R/RRsCtWe0z7NMchHGLhqH8
         Mt3kuDnJ9JQzP0DJWv2i5y3XwADocRlXq5Cqw5BvONBv/CAxGI9AAWiPjHnFiu5FkVCn
         qPU1+MlLXlen4bvU+uLWI01UJoPjS6V1VcfxX4HY/h/LwnwRcOw6bv04M0PhZstA//6K
         PRtVK+w0hbmHXK3hz7z5dVwD31qghSyN028FczaTfc+7y9LRHZ/KlbBPZpZObWXJdXEb
         Wj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452292; x=1701057092;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/H+RknLB1Uug98Ti3hZsP+Rhi4/Io512NFbv0j7DK38=;
        b=Z+7BvjM+oQeizQUaL0O0HNw0j42XAOBq5zZEgEJXUTm2JqTPj+/mkiE5VmPbln6NVg
         hXJWo8vDHmfX1k2IadOwW7JJrfMJy75uj0GJ9bjjQlzGMx9NT4wEVlR++cXMhaX5OZZM
         yI3uIhnLccs7JMxc1PyidLxi4BGKszpqxwNCKggWm/gWDDWqagtLBonDtKYy01NGQDAj
         YlxW0z8cE11psK+ElsKcdwaYel+R8Oe6QcjjVs3kxrievo4lic7CSaIL6LVEn+HUEj85
         esOSH2e2uERKbRtAwDiFOB15jO/Bftxr0GtYgSKZD5Ypj+Y3dD8CrJX72GNhP4k/kX8H
         IeUw==
X-Gm-Message-State: AOJu0Yy3+5paS4Pv+at9kH0luCTHIyYv031vbzC2hqJjXk+5SH/mFCB2
	rZOzLGxfJMBz/0kHy9zNV55mAgwOtaTl0Q==
X-Google-Smtp-Source: AGHT+IEKZLe2OR2EqvjPN3OvSl/C3Az/BzEgMwnOtCCyLZGyhVggbNGclVUoSl41jOtkQA52CZzxkw==
X-Received: by 2002:a05:6871:580d:b0:1f5:b43:eb65 with SMTP id oj13-20020a056871580d00b001f50b43eb65mr8032992oac.2.1700452291819;
        Sun, 19 Nov 2023 19:51:31 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231116194922.1478988-1-alperyasinak1@gmail.com>
References: <20231116194922.1478988-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] luaposix: upgrade 35.1 -> 36.2.1
Message-Id: <170045229095.1416826.1366478178470383937.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:30 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106947


On Thu, 16 Nov 2023 22:49:22 +0300, alperak wrote:
> License-Update: Copyright years changed
> 
> Changelog: https://github.com/luaposix/luaposix/blob/v36.2.1/NEWS.md
> 
> 

Applied, thanks!

[1/1] luaposix: upgrade 35.1 -> 36.2.1
      commit: d8bd619184e6b0c11043d06d66d03dd19fd67a20

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


