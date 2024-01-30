Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2C6C46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 18:18:56 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.3717.1706638736061986788
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jan 2024 10:18:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FZrBE+BF;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cf206e4d56so47488541fa.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 10:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706638734; x=1707243534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sJ92HX4iR33lCjlOVhJExIz3LAZParSX7V7FxNqlP0s=;
        b=FZrBE+BFyjvg1/ErNMgj34Q63WnX6eiToiMtNJqtAU64yCIWTQmXEtOk3rO/tsrVuN
         243p4IoatXwaApN7gW5cPPVJs/cvDZzN8abmhgjf+1UZxRhyGOISqV5bzKxqH/4WBZ5W
         RI321/J1Ge+i3cpctnIeT4mqOLwt+9BzN1QrXFZWbmKgdo2/VS3O42AsAfCg/slgdiP/
         hU+att7tgyOd9dVXI2OKa4WySX+Nh3oByqRBlyJgq6PTzbm8HP/hemSIuKUc8/DbOa4+
         ojRodk697QL71vBCdDslH+xtxkb+9kCde+1Dbz9Wy274eH2UNK6giVb6ywiYdw36NFVI
         pShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706638734; x=1707243534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJ92HX4iR33lCjlOVhJExIz3LAZParSX7V7FxNqlP0s=;
        b=I+tkpnOG7SNO9JaVHUMpAdvjDgkOraxg7Xki4+Ok3ZHd0KeaGQGPYtdEntDHp0M7H6
         p1+GA7kYjrF8mJhppW84OSONWQl2HLpLCs0jfhRcCk+Xv7Qhdoo0VWhtiEVbjPAMmKUu
         dYSDI3TlArNr2qPjqyMpTEGYhyv9wsQWkx7pAL3P0URxihXrtk3QpHvROa1o5bpKXFio
         6okqk5LcG42sEELUKeJ+J2HKNa25lxsC0IQdxFlzhyLZioeN3oMVf6PgzywOMUiG4o4V
         K82kbha22cyfWujQ8LS7NGAsTckkSQFSjuXA28+pLmQyIAHtYkOWbBL6hdXJnNffOCrs
         eSSQ==
X-Gm-Message-State: AOJu0Yw4Ajv16LceKdmjC52+m1TdoL5muL4SjDRjRDWXlrehGt8orCo0
	nS745YBZVjmAVtBNgrzPSQ1guJhaTgP3SiF8Qe47Qr1E2qaCeNmtASOXHs6g
X-Google-Smtp-Source: AGHT+IE/mehvRv/yISXKUi5DahhDJI6gFGaiS51+csMOhfE19sFOCsrH1S2BeO4cSGrAwwcY1Wmlkw==
X-Received: by 2002:a05:651c:10d2:b0:2cd:706a:8ec8 with SMTP id l18-20020a05651c10d200b002cd706a8ec8mr5623598ljn.10.1706638733730;
        Tue, 30 Jan 2024 10:18:53 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWIy4eKuo6NY6hte8XxaTiwvUXx2rkijA1nU0lhi4TMPjvYieTYxflnLDBAM8EecsVEUpqEEdtaY4K/dCBGPT+FVNk1nKJQ
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id fi5-20020a056402550500b005583e670df7sm5094857edb.73.2024.01.30.10.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 10:18:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: wangmy@fujitsu.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv2 1/2] redis: restore Upstream-Status
Date: Tue, 30 Jan 2024 19:18:46 +0100
Message-ID: <20240130181847.3553866-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 18:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108497

* accidentally dropped in:
  https://git.openembedded.org/meta-openembedded/commit/?id=e91fa668ed1dd4a3f6b06bcb099f70dbdd2a50b4

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../lua-update-Makefile-to-use-environment-build-setting.patch   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-environment-build-setting.patch
index b562e2522c..20708eda1e 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-environment-build-setting.patch
@@ -15,6 +15,7 @@ Signed-off-by: Armin Kuster <akust808@gmail.com>
 updated to work wtih 6.2.1
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 
+Upstream-Status: Pending
 ---
  deps/Makefile         |  1 -
  deps/lua/Makefile     |  1 -
-- 
2.43.0


