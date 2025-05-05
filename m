Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22336C3ABBF
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 12:21:27 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.46328.1746436440005025874
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 02:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U6RlxTbx;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22928d629faso37787555ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 02:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746436439; x=1747041239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x8Vb6Q8tEOhxeaWFEOD98sqH6apE9layOtVVEf5R2Dw=;
        b=U6RlxTbxw6ceTrH552oKdgRj+aDTmcO6LF8wkcUsXTvH0JkWTQPMQJK6ysu46XV7PZ
         HyMrBJ/nt6NlGse8nBXf+tCz+Y1nF+MEq9NaEpfMGvDiB8UVcY3pmNxOSxrgBW6A8gSn
         sp7361k8Hb+QxljiroAnGC8PhBPDIy3RQeB0uOxpol4mth316NnZh1/pv/VKagdBOUEl
         ktg0O/9bJGS5H0Vt/4kdLIXWwx5U16c+gPJJic7BWM0Cbk2ZoAnzHBe9m0QbmzuzmRvp
         eP9IA9McLf34BcgxeJ5UyWhwg6mjKbibq2FUxx9uJdtbBL0vSIg7hCzL0OQH/vi1Hxvu
         Ikqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746436439; x=1747041239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8Vb6Q8tEOhxeaWFEOD98sqH6apE9layOtVVEf5R2Dw=;
        b=K/nKlZH5+H5dQScjl983gYH9LHTak/F7ZLx2AyhvUoeQN+gqK6tWIqrziPBbxAG7/V
         xPTCEP2gYLQRyff2mzYRDTCvsrZgDJ7EXAGptjmrVwVT3wxGRBSuj5Fez1DDw674kNgq
         rmiTOo3IO45nPfiAGO/FPqYT9Jun56Cb4aLZjOSqhOBbKVmd6b4fObpk1NuVOaCS97bl
         bFZ3BSllz/xHQxeIkekIIepFIp5x7pz+qiPLJ7KSup2FsenP67HVQFoX69iUdTguk7pt
         VXJTx3nlrMj17RMdZJXmrmfToD9GXIDS2TE9bMPEHxDJv0gP4L8KMkLA7slzEUsh7sot
         pvJQ==
X-Gm-Message-State: AOJu0YwuXCKWsT1107W/I00g0LbPD+xBzfcCa/+oAjFPfuF9buRl2476
	r2LMD3ji8FuBg7qK4Sj4xTOsB4IH6PrAR0Bo81CXjD8Wn8wfD/OzFbJbSQ==
X-Gm-Gg: ASbGnct214DarwDB92OYKq43IFYSPqHJHQEIcZYJYFN+p3D7mU0IOMu283cev/DrMxD
	3sShlJkmI86qBVTOul7L4ockJ0KpazcynWskLeW8fwj73b0VqNw1zQr/cSiF5o7w4RYpqo3VRbJ
	pXKXTcJmvgi/w9t+Z6QgZ/pNTnDxec4bF+1WtrSzHMmsWGsr2mtQ0N+Ohzn8XyJB+eqYaTA6Xkq
	eorOYy1P20xBXnUWIGKRCmdmkvRO6J+mkrhjgmPH069A4wT6veTLfrb0b0A/h9MWitRzGZiRI7X
	iPuACj0h9AhlQINv0GkYsJIy2olfLw1sSQhp51IzoBLr1zNfQzHk
X-Google-Smtp-Source: AGHT+IFMMxBBZHC5uhBVuC4N/4fDPFQY8bn8q5jX6tPe29HUtoT56SMdrAl1xFBEatpfGeOcayQjGw==
X-Received: by 2002:a17:902:d4c7:b0:220:c4e8:3b9d with SMTP id d9443c01a7336-22e1ea61bd2mr85864405ad.37.1746436439077;
        Mon, 05 May 2025 02:13:59 -0700 (PDT)
Received: from MVIN00210.. ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e9eb3sm49863955ad.91.2025.05.05.02.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:13:58 -0700 (PDT)
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-java][PATCH 0/4] Fixes SRC_URI for meta-java recipe
Date: Mon,  5 May 2025 14:43:00 +0530
Message-ID: <20250505091304.819905-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 12:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117309

Below patches fixes the link's used as SRC_URI

- The recipes are failing to feth the compressed tar from the link
  mentioned in the recipe of scarthgap branch.
- These patches fixes the path & tested on qemuarm

Ashish Mishra (4):
  Updates the SRC_URI for xalan-j recipe
  Updates the SRC_URI for xml-commons-resolver recipe
  Updates the SRC_URI for avalon-framework-api recipe
  Updates the SRC_URI for fastjar recipe

 recipes-core/fastjar/fastjar.inc                        | 2 +-
 recipes-core/jakarta-libs/avalon-framework-api_4.3.bb   | 2 +-
 recipes-core/xalan-j/xalan-j_2.7.1.bb                   | 2 +-
 recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)


