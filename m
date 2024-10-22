Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EFED2CE18
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:20 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.21765.1729612075654339473
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NgQDBu2X;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e35bf59cf6so63572097b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612075; x=1730216875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hl+OLrP6+USK+1TOajknZdG3fd0U66WmKXPKE8DtMfI=;
        b=NgQDBu2XaFCv+Fus2H7Z3onLM0Hx7rmC8l0xCFYtc1x0dd1CUGRBQArayGA35ijOPr
         gsBXXYATnu3WKVqAkcihtVG+RzWP2ZtS3OyBfRHSE3YRc30LqwtkLyCSi1xzsIjL6lzY
         TRDeJLT3rhkh9zsK32KVT9soVdN5+I4u2hBJqUdqjUHjHNKhy0mVrIR3hE8eVrpkL/zO
         irev5Y0G6O0tDJ+inqPUaCVifnZbsHOaEDDWm2IeReaNmKeom8iz3hpVIr7HMVCaxZFj
         z7qm5thzlTpu/SgZpppZ5KlUFWOQmb28T7Nxng3SgIvsPNmWWz88MyFMm0iGC8zjCyqd
         j4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612075; x=1730216875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hl+OLrP6+USK+1TOajknZdG3fd0U66WmKXPKE8DtMfI=;
        b=J6vuhXpa01iwBIN344+AOttcil4bQNAHPRqkYrPXK0dVhwxPzqx3X1UwEolbBFMDFq
         amRBSJfWDLBNyJ2Mddp1M4N/RdORsO0pzr+nTXMWH5kskIWXE3LaoWg3fPbzkfA5Ey1D
         Ztc/hii/HhjLeJz4N2fy7YGnvBmkPADYFliXmrBY4IeceKOOaP6T7ZRrEc5NYuJhbabQ
         nANwL+3bXscU8J9lSg0MV3ojCPqtXG5Tzvo7TKbofwSF+Z5OUYRh26T/cwdtNAVbDP69
         PozjGBRb0v6pX2jQKh0sTA3cLltCwjZYBZrsBUyKYI4Ylwgm1wpLZdjSuVUzGdISkFSj
         PrCg==
X-Gm-Message-State: AOJu0Ywrdq6RBLKKFJ42WMB7eNYAJbRF6B47z19iN9KiYbctKKtd02AN
	XnaDtr9xrGsENt336ZzBM0czGY4FbFboBslq2v2+DzFpVnZGZualQpznHA==
X-Google-Smtp-Source: AGHT+IEjvRhAUWYgozLMLygFUXtombsZPG94+w9WT8fACKuII5a/7LZ3yWDWzvffX/HgGutCfhEw+g==
X-Received: by 2002:a05:690c:6e0c:b0:6e5:b054:2385 with SMTP id 00721157ae682-6e7d48f701dmr30508127b3.14.1729612074262;
        Tue, 22 Oct 2024 08:47:54 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.47.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:47:54 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 0/46]
Date: Tue, 22 Oct 2024 11:44:18 -0400
Message-ID: <20241022154729.20331-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113091

Following the note in section 5.5 found here :
  https://docs.yoctoproject.org/dev-manual/new-recipe.html?highlight=md5sum#fetching-code
drop the use of the SRC_URI[md5sum] where SRC_URI[sha256sum] is already being used.


