Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0ADAC19774
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:50 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.30710.1702451265989197498
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BPiMT04j;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ceb27ec331so4230695b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451265; x=1703056065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9IBUcKFu+FKK770tDFvB48IvFvM+TMkufO+wBLUpb0=;
        b=BPiMT04jWRY6jyRGUALDFV5jNzdEC/bzq4zuIBdaXX+oL9zjyCWI+61ZrZDdR31cJq
         XkFNLE6s9fkh17IypOi6KOmKlf9YXHoFQjSkzoB3q7nEM6EbSCh8FsMouD/2y3QNYr2a
         iRrFKIuFqBTriBJ+40KN7a2FEO+tCxEn3aVWqLvBMRua/M2wK48BbkTuj5I0J+LXa10P
         jXYoL8xKB4TXkH2CQpb6Xw55pwIUnJntCptX/ixxr2RF85WgJr4tTox4E4XO1kN9AzVf
         Y8trDyjYUnM/rispc+FlxUobMl7Cqs32q6VuctNE8sx+BWUy8vthlLVzvE+FQpu7mfW5
         /7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451265; x=1703056065;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9IBUcKFu+FKK770tDFvB48IvFvM+TMkufO+wBLUpb0=;
        b=Pq32OZSes4NQIXcHiyv//uQBLMthtNuXSuQ6TsG/ev4Abbr9eYRZn2cKmjYL89lUrJ
         SPKLtvUUDJ07hJfYCO+eb8nIld+bumy+Yc37s9OgPD2BWjrrBDNdfREj21XLYRVoBBuk
         lJdVmhK7xKtRE9/QlKE6zSCQnwcLZPtyp5cN8xGUCJhMyrY04iKFwVg9D3uk6UEYq022
         76wAmJmmjjQfAJUVBIdEF+UwAHcqSDQUu4P4J89EmVFmKErZyJIhxadot5fYQbc2wtPn
         x2hBDCfLR/gBDz108WsRxJUG6ZMj5ZPkAisc5+HKMiFxyO1hWjY/pEZs8I659esM/ZpD
         ItBA==
X-Gm-Message-State: AOJu0YxE/pMiROEINw1gLxVkuurqGydykuBkF7vZEvtFaTmid8yxQ/OI
	9EoRaNxNR9qGABbIKMl9HQ1HVTUfFIw=
X-Google-Smtp-Source: AGHT+IEXgopgtgqU4RygIehOOJ8VEzyE3IV0u21mJVXENrZ6dhXlnyV4l78TQCCT58qPs5rrua0EYA==
X-Received: by 2002:a05:6a00:1951:b0:6ce:450e:4e66 with SMTP id s17-20020a056a00195100b006ce450e4e66mr4426032pfk.10.1702451265242;
        Tue, 12 Dec 2023 23:07:45 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231212203509.902175-1-alperyasinak1@gmail.com>
References: <20231212203509.902175-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH 1/4] libbytesize: Removed unnecessary setting
 of B
Message-Id: <170245126464.133993.16106815020460671573.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:44 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107384


On Tue, 12 Dec 2023 23:35:06 +0300, alperak wrote:
> Supports out of tree builds
> 
> 

Applied, thanks!

[1/4] libbytesize: Removed unnecessary setting of B
      commit: b145fdac545f772afa571661a2067e71ecfb3dd5
[2/4] libmxml: use autotools-brokensep instead of setting B
      commit: bfda5e7c70dabc93bbcc18138adab900537d4a0a
[3/4] libsombok3: use autotools-brokensep instead of setting B
      commit: 763fd809cf8f1bbe82d3a3496e4cc30ceefef4b4
[4/4] pgpool2: use autotools-brokensep instead of setting B
      commit: 0a0ea87b8dda01a2887a525cef78eb6c3f4c2c32

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


