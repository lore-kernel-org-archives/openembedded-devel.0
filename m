Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E0BC19774
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:40 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web11.30701.1702451252304652660
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B20jT17n;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-35d77fb7d94so26754615ab.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451251; x=1703056051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5xPtBXGhhNl/qkGs5ozP8bzMBFDZ1VNX5cdtc+2OrE=;
        b=B20jT17nA7eIykqGyE5nn+0+jiOWxLEMIdrBTLgG6zg3MerHf50FcjM0aNIheRllir
         KW1f5bjWByJs0xjBEi0ZRO8bQ4LQe23k1WzU13ECwhUOsUvieQ9xeQXEIPbUN61SR7hb
         5rL9cbdzzkGe7Szu1nNkjbYzHqtN5Z/u/r2ujPQULdYiW0lQ5OEds8vz/4umKs2Jsp/0
         DDGZqxfAFe2r+AeE28eHfvs3XsMfXlPZi2fZKIahksQmhRaaJ8auchj9n6BIVJAl6OsB
         zOruPGHti+gpIWxKDoEP9Xpezxvy321AIQdf2oeWr8eUBmkDAD87DvQH+vUHACsFEUQW
         m30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451251; x=1703056051;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5xPtBXGhhNl/qkGs5ozP8bzMBFDZ1VNX5cdtc+2OrE=;
        b=Hby52sK0M4leyyNUUud3vNBbCYk4oF03NZWgADYrWCQ6G9/Yjf0etKe7E4FhIHg5pM
         V/JZ6ZPYUk7yOufU5U3E0oLRtRi3SAXCT5qi5xcopQ5db+Mgmvh9QMsIHoaO9ss5yPql
         4I7JxbiRMiY2R5Imn8oUeNneT3p2IOMQZcX0XRbm96NnGunXXJ4F3FVMMigEDzOrNplz
         PwbcuvF8jhLlkiBCZ2S/JVQY47kv8VTBiPgI2DLQt83wtMneook9YVGMy9V/QlRi2gLh
         sFWw9/t0Hh0ZGAIVcn1rF5qyJu3XhQHHJEgIuM8i1lSwcfAyKY+5+bVjWBVZVuK/hWl3
         NwRQ==
X-Gm-Message-State: AOJu0Ywcei7PU1yOKlDmZSKMkuqwf26r5XFFt7Xd4AAmTbtCcyUHZH45
	1EOShNVXzbaqa3lUZLBo91QMZktCdGM=
X-Google-Smtp-Source: AGHT+IGv0/73rxptaErX5NH6S5vJBiZqYBOFZWuMIACg0b3e7gR0J1TrV9ecTnGv+jl+8ff60jNLfA==
X-Received: by 2002:a05:6e02:b46:b0:35d:4efa:e8eb with SMTP id f6-20020a056e020b4600b0035d4efae8ebmr12092285ilu.7.1702451251349;
        Tue, 12 Dec 2023 23:07:31 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231207122506.1351408-1-alperyasinak1@gmail.com>
References: <20231207122506.1351408-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] xf86-input-void: upgrade 1.4.1 -> 1.4.2
Message-Id: <170245125069.133993.13852229156052977694.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:30 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107370


On Thu, 07 Dec 2023 15:25:06 +0300, alperak wrote:
> Changelog:
> 
> * InitValuatorAxisStruct: Add missing line breaks
> * InputDriverRec: Resolve -Wmissing-field-initializers warning
> * gitlab CI: stop requiring Signed-off-by in commits
> * gitlab CI: add a basic build test
> * Build xz tarballs instead of bzip2
> * Update configure.ac bug URL for gitlab migration
> * Update README for gitlab migration
> * autogen: add default patch prefix
> * autogen.sh: use quoted string variables
> * autogen.sh: use exec instead of waiting for configure to finish
> 
> [...]

Applied, thanks!

[1/1] xf86-input-void: upgrade 1.4.1 -> 1.4.2
      commit: 0cbede2b252919f75b4b657427f969e8a11d5699

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


